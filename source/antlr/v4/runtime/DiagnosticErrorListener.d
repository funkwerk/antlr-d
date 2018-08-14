/*
 * Copyright (c) 2012-2018 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 *
 */

module antlr.v4.runtime.DiagnosticErrorListener;

import antlr.v4.runtime.BaseErrorListener;
import std.format;
import std.conv;

// Singleton Template DiagnosticErrorListener
/**
 * This implementation of {@link ANTLRErrorListener} can be used to identify
 * certain potential correctness and performance problems in grammars. "Reports"
 * are made by calling {@link Parser#notifyErrorListeners} with the appropriate
 * message.
 *
 * <ul>
 * <li><b>Ambiguities</b>: These are cases where more than one path through the
 * grammar can match the input.</li>
 * <li><b>Weak context sensitivity</b>: These are cases where full-context
 * prediction resolved an SLL conflict to a unique alternative which equaled the
 * minimum alternative of the SLL conflict.</li>
 * <li><b>Strong (forced) context sensitivity</b>: These are cases where the
 * full-context prediction resolved an SLL conflict to a unique alternative,
 * <em>and</em> the minimum alternative of the SLL conflict was found to not be
 * a truly viable alternative. Two-stage parsing cannot be used for inputs where
 * this situation occurs.</li>
 * </ul>
 *
 * @author Sam Harwell
 */
class DiagnosticErrorListener(U, V) : BaseErrorListener!(U, V)
{

    /**
     * When {@code true}, only exactly known ambiguities are reported.
     */
    protected bool exactOnly;

    /**
     * The single instance of DiagnosticErrorListener.
     */
    private static __gshared DiagnosticErrorListener instance_;

    /**
     * Initializes a new instance of {@link DiagnosticErrorListener} which only
     * reports exact ambiguities.
     */
    public this()
    {
        this(true);
    }

    /**
     * Initializes a new instance of {@link DiagnosticErrorListener}, specifying
     * whether all ambiguities or only exact ambiguities are reported.
     *
     * @param exactOnly {@code true} to report only exact ambiguities, otherwise
     * {@code false} to report all ambiguities.
     */
    public this(bool exactOnly)
    {
	this.exactOnly = exactOnly;
    }

    /**
     * @uml
     * @override
     */
    public override void reportAmbiguity(Parser recognizer, DFA dfa, int startIndex, int stopIndex,
                                         bool exact, BitSet ambigAlts, ATNConfigSet configs)
    {
	if (exactOnly && !exact) {
            return;
        }

        string format = "reportAmbiguity d=%s: ambigAlts=%s, input='%s'";
        string decision = getDecisionDescription(recognizer, dfa);
        BitSet conflictingAlts = getConflictingAlts(ambigAlts, configs);
        string text = recognizer.getTokenStream().getText(Interval.of(startIndex, stopIndex));
        string message = format(format, decision, conflictingAlts, text);
        recognizer.notifyErrorListeners(message);
    }

    /**
     * @uml
     * @override
     */
    public override void reportAttemptingFullContext(Parser recognizer, DFA dfa, int startIndex,
                                                     int stopIndex, BitSet conflictingAlts, ATNConfigSet configs)
    {
	string format = "reportAttemptingFullContext d=%s, input='%s'";
        string decision = getDecisionDescription(recognizer, dfa);
        string text = recognizer.getTokenStream().getText(Interval.of(startIndex, stopIndex));
        string message = format(format, decision, text);
        recognizer.notifyErrorListeners(message);
    }

    /**
     * @uml
     * @override
     */
    public override void reportContextSensitivity(Parser recognizer, DFA dfa, int startIndex,
                                                  int stopIndex, int prediction, ATNConfigSet configs)
    {
	string format = "reportContextSensitivity d=%s, input='%s'";
        string decision = getDecisionDescription(recognizer, dfa);
        string text = recognizer.getTokenStream().getText(Interval.of(startIndex, stopIndex));
        string message = format(format, decision, text);
        recognizer.notifyErrorListeners(message);
    }

    protected string getDecisionDescription(Parser recognizer, DFA dfa)
    {
	int decision = dfa.decision;
        int ruleIndex = dfa.atnStartState.ruleIndex;

        string[] ruleNames = recognizer.getRuleNames();
        if (ruleIndex < 0 || ruleIndex >= ruleNames.length) {
            return to!string(valueOf(decision));
        }

        string ruleName = ruleNames[ruleIndex];
        if (ruleName is null || ruleName.isEmpty()) {
            return to!string(valueOf(decision));
        }

        return format("%d (%s)", decision, ruleName);

    }

    /**
     * Computes the set of conflicting or ambiguous alternatives from a
     * configuration set, if that information was not already provided by the
     * parser.
     *
     * @param reportedAlts The set of conflicting or ambiguous alternatives, as
     * reported by the parser.
     * @param configs The conflicting or ambiguous configuration set.
     * @return Returns {@code reportedAlts} if it is not {@code null}, otherwise
     * returns the set of alternatives represented in {@code configs}.
     */
    protected BitSet getConflictingAlts(BitSet reportedAlts, ATNConfigSet configs)
    {
	if (reportedAlts) {
            return reportedAlts;
        }

        BitSet result = new BitSet();
        foreach (ATNConfig config; configs.configs) {
            result.set(config.alt, true);
        }

        return result;
    }

    /**
     * Creates the single instance of DiagnosticErrorListener.
     */
    private shared static this()
    {
        instance_ = new DiagnosticErrorListener;
    }

    /**
     * Returns: A single instance of DiagnosticErrorListener.
     */
    public static DiagnosticErrorListener instance()
    {
        return instance_;
    }

}

module antlr.v4.runtime.atn.ParserATNSimulator;

import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNSimulator;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.atn.PredictionMode;
import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.dfa.DFAState;
import antlr.v4.runtime.misc.DoubleKeyMap;

// Class ParserATNSimulator
/**
 * TODO add class description
 */
class ParserATNSimulator : ATNSimulator
{

    /**
     * @uml
     * @final
     */
    public static bool debugFlag = false;

    public static bool debug_list_atn_decisions = false;

    public PredictionMode mode = PredictionMode.LL;

    /**
     * @uml
     * Each prediction operation uses a cache for merge of prediction contexts.
     * Don't keep around as it wastes huge amounts of memory. DoubleKeyMap
     * isn't synchronized but we're ok since two threads shouldn't reuse same
     * parser/atnsim object because it can only handle one input at a time.
     * This maps graphs a and b to merged result c. (a,b)&rarr;c. We can avoid
     * the merge if we ever see a and b again.  Note that (b,a)&rarr;c should
     * also be examined during cache lookup.
     */
    public DoubleKeyMap!(PredictionContext, PredictionContext, PredictionContext) mergeCache;

    protected TokenStream _input;

    protected int _startIndex;

    protected ParserRuleContext _outerContext;

    protected DFA _dfa;

    /**
     * @uml
     * Testing only!
     */
    public this(ATN atn, DFA[] decisionToDFA, PredictionContextCache sharedContextCache)
    {
        this(null, atn, decisionToDFA, sharedContextCache);
    }

    public this(Parser parser, ATN atn, DFA[] decisionToDFA, PredictionContextCache sharedContextCache)
    {
        super(atn, sharedContextCache);
        this.parser = parser;
        this.decisionToDFA = decisionToDFA;
    }

    /**
     * @uml
     * @override
     */
    public override void reset()
    {
    }

    /**
     * @uml
     * @override
     */
    public override void clearDFA()
    {
	for (int d = 0; d < decisionToDFA.length; d++) {
            decisionToDFA[d] = new DFA(atn.getDecisionState(d), d);
        }
    }

    public int adaptivePredict(TokenStream input, int decision, ParserRuleContext outerContext)
    {
	debug {
            writefln("adaptivePredict decision %1$s"~
                     " exec LA(1)==%2$s"~
                     " line %3$s:%4$s",
                     decision, getLookaheadName(input), input.LT(1).getLine,
                     input.LT(1).getCharPositionInLine());
        }

        _input = input;
        _startIndex = input.index();
        _outerContext = outerContext;
        DFA dfa = decisionToDFA[decision];
        _dfa = dfa;

        int m = input.mark();
        int index = _startIndex;

        // Now we are certain to have a specific decision's DFA
        // But, do we still need an initial state?
        try {
            DFAState s0;
            if (dfa.isPrecedenceDfa()) {
                // the start state for a precedence DFA depends on the current
                // parser precedence, and is provided by a DFA method.
                s0 = dfa.getPrecedenceStartState(parser.getPrecedence());
            }
            else {
                // the start state for a "regular" DFA is just s0
                s0 = dfa.s0;
            }

            if (s0 is null) {
                if ( outerContext is null ) outerContext = ParserRuleContext.EMPTY;
                debug {
                    writefln("predictATN decision %1$s"~
                             " exec LA(1)==%2$s"~
                             ", outerContext=%3Sc",
                             dfa.decision, getLookaheadName(input),
                             outerContext.toString(parser));
                }

                bool fullCtx = false;
                ATNConfigSet s0_closure =
                    computeStartState(dfa.atnStartState,
                                      ParserRuleContext.EMPTY,
                                      fullCtx);

                if (dfa.isPrecedenceDfa()) {
                    /* If this is a precedence DFA, we use applyPrecedenceFilter
                     * to convert the computed start state to a precedence start
                     * state. We then use DFA.setPrecedenceStartState to set the
                     * appropriate start state for the precedence level rather
                     * than simply setting DFA.s0.
                     */
                    dfa.s0.configs = s0_closure; // not used for prediction but useful to know start configs anyway
                    s0_closure = applyPrecedenceFilter(s0_closure);
                    s0 = addDFAState(dfa, new DFAState(s0_closure));
                    dfa.setPrecedenceStartState(parser.getPrecedence(), s0);
                }
                else {
                    s0 = addDFAState(dfa, new DFAState(s0_closure));
                    dfa.s0 = s0;
                }
            }

            int alt = execATN(dfa, s0, input, index, outerContext);
            debug writefln("DFA after predictATN: %1$s", dfa.toString(parser.getVocabulary()));
            return alt;
        }
        finally {
            mergeCache = null; // wack cache after each prediction
            _dfa = null;
            input.seek(index);
            input.release(m);
        }
        return -1;
    }

    /**
     * @uml
     * There are some key conditions we're looking for after computing a new
     * set of ATN configs (proposed DFA state):
     *       * if the set is empty, there is no viable alternative for current symbol
     *       * does the state uniquely predict an alternative?
     *       * does the state have a conflict that would prevent us from
     *         putting it on the work list?
     *
     * We also have some key operations to do:
     *       * add an edge from previous DFA state to potentially new DFA state, D,
     *         upon current symbol but only if adding to work list, which means in all
     *         cases except no viable alternative (and possibly non-greedy decisions?)
     *       * collecting predicates and adding semantic context to DFA accept states
     *       * adding rule context to context-sensitive DFA accept states
     *       * consuming an input symbol
     *       * reporting a conflict
     *       * reporting an ambiguity
     *       * reporting a context sensitivity
     *       * reporting insufficient predicates
     *
     * cover these cases:
     *    dead end
     *    single alt
     *    single alt + preds
     *    conflict
     *    conflict + preds
     */
    protected int execATN(DFA dfa, TokenStream input, int startIndex, ParserRuleContext outerContext)
    {
	debug {
            writefln("execATN decision %1$s"~
                     " exec LA(1)==%2$s"+ getLookaheadName(input)+
                     " line %3$s:%4$s",
                     dfa.decision, getLookaheadName(input),
                     input.LT(1).getLine, input.LT(1).getCharPositionInLine());
        }

        DFAState previousD = s0;

        debug writefln("s0 = %1$s", s0);

        int t = input.LA(1);

        while (true) { // while more work
            DFAState D = getExistingTargetState(previousD, t);
            if (D is null) {
                D = computeTargetState(dfa, previousD, t);
            }

            if (D == ERROR) {
                // if any configs in previous dipped into outer context, that
                // means that input up to t actually finished entry rule
                // at least for SLL decision. Full LL doesn't dip into outer
                // so don't need special case.
                // We will get an error no matter what so delay until after
                // decision; better error message. Also, no reachable target
                // ATN states in SLL implies LL will also get nowhere.
                // If conflict in states that dip out, choose min since we
                // will get error no matter what.
                NoViableAltException e = noViableAlt(input, outerContext, previousD.configs, startIndex);
                input.seek(startIndex);
                int alt = getSynValidOrSemInvalidAltThatFinishedDecisionEntryRule(previousD.configs, outerContext);
                if ( alt!=ATN.INVALID_ALT_NUMBER ) {
                    return alt;
                }
                throw e;
            }

            if ( D.requiresFullContext && mode != PredictionMode.SLL ) {
                // IF PREDS, MIGHT RESOLVE TO SINGLE ALT => SLL (or syntax error)
                BitSet conflictingAlts = D.configs.conflictingAlts;
                if ( D.predicates!=null ) {
                    debug writeln("DFA state has preds in DFA sim LL failover");
                    int conflictIndex = input.index();
                    if (conflictIndex != startIndex) {
                        input.seek(startIndex);
                    }

                    conflictingAlts = evalSemanticContext(D.predicates, outerContext, true);
                    if ( conflictingAlts.cardinality()==1 ) {
                        debug writeln("Full LL avoided");
                        return conflictingAlts.nextSetBit(0);
                    }

                    if (conflictIndex != startIndex) {
                        // restore the index so reporting the fallback to full
                        // context occurs with the index at the correct spot
                        input.seek(conflictIndex);
                    }
                }

                debug(dfa_debug) writefln("ctx sensitive state %1$ in %2$s",
                                         outerContext, D);
                bool fullCtx = true;
                ATNConfigSet s0_closure =
                    computeStartState(dfa.atnStartState, outerContext,
                                      fullCtx);
                reportAttemptingFullContext(dfa, conflictingAlts, D.configs, startIndex, input.index());
                int alt = execATNWithFullContext(dfa, D, s0_closure,
                                                 input, startIndex,
                                                 outerContext);
                return alt;
            }

            if ( D.isAcceptState ) {
                if (D.predicates == null) {
                    return D.prediction;
                }

                int stopIndex = input.index();
                input.seek(startIndex);
                BitSet alts = evalSemanticContext(D.predicates, outerContext, true);
                switch (alts.cardinality()) {
                case 0:
                    throw noViableAlt(input, outerContext, D.configs, startIndex);

                case 1:
                    return alts.nextSetBit(0);

                default:
                    // report ambiguity after predicate evaluation to make sure the correct
                    // set of ambig alts is reported.
                    reportAmbiguity(dfa, D, startIndex, stopIndex, false, alts, D.configs);
                    return alts.nextSetBit(0);
                }
            }

            previousD = D;

            if (t != IntStream.EOF) {
                input.consume();
                t = input.LA(1);
            }
        }
	
    }

}

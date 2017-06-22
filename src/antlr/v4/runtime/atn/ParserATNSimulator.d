/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.atn.ParserATNSimulator;

import std.bitmanip;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.IntStream;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNSimulator;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.atn.PredictionMode;
import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.dfa.DFAState;
import antlr.v4.runtime.misc.DoubleKeyMap;

// Class ParserATNSimulator
/**
 * The embodiment of the adaptive LL(*), ALL(*), parsing strategy.
 *
 * <p>
 * The basic complexity of the adaptive strategy makes it harder to understand.
 * We begin with ATN simulation to build paths in a DFA. Subsequent prediction
 * requests go through the DFA first. If they reach a state without an edge for
 * the current symbol, the algorithm fails over to the ATN simulation to
 * complete the DFA path for the current input (until it finds a conflict state
 * or uniquely predicting state).</p>
 *
 * <p>
 * All of that is done without using the outer context because we want to create
 * a DFA that is not dependent upon the rule invocation stack when we do a
 * prediction. One DFA works in all contexts. We avoid using context not
 * necessarily because it's slower, although it can be, but because of the DFA
 * caching problem. The closure routine only considers the rule invocation stack
 * created during prediction beginning in the decision rule. For example, if
 * prediction occurs without invoking another rule's ATN, there are no context
 * stacks in the configurations. When lack of context leads to a conflict, we
 * don't know if it's an ambiguity or a weakness in the strong LL(*) parsing
 * strategy (versus full LL(*)).</p>
 *
 * <p>
 * When SLL yields a configuration set with conflict, we rewind the input and
 * retry the ATN simulation, this time using full outer context without adding
 * to the DFA. Configuration context stacks will be the full invocation stacks
 * from the start rule. If we get a conflict using full context, then we can
 * definitively say we have a true ambiguity for that input sequence. If we
 * don't get a conflict, it implies that the decision is sensitive to the outer
 * context. (It is not context-sensitive in the sense of context-sensitive
 * grammars.)</p>
 *
 * <p>
 * The next time we reach this DFA state with an SLL conflict, through DFA
 * simulation, we will again retry the ATN simulation using full context mode.
 * This is slow because we can't save the results and have to "interpret" the
 * ATN each time we get that input.</p>
 *
 * <p>
 * <strong>CACHING FULL CONTEXT PREDICTIONS</strong></p>
 *
 * <p>
 * We could cache results from full context to predicted alternative easily and
 * that saves a lot of time but doesn't work in presence of predicates. The set
 * of visible predicates from the ATN start state changes depending on the
 * context, because closure can fall off the end of a rule. I tried to cache
 * tuples (stack context, semantic context, predicted alt) but it was slower
 * than interpreting and much more complicated. Also required a huge amount of
 * memory. The goal is not to create the world's fastest parser anyway. I'd like
 * to keep this algorithm simple. By launching multiple threads, we can improve
 * the speed of parsing across a large number of files.</p>
 *
 * <p>
 * There is no strict ordering between the amount of input used by SLL vs LL,
 * which makes it really hard to build a cache for full context. Let's say that
 * we have input A B C that leads to an SLL conflict with full context X. That
 * implies that using X we might only use A B but we could also use A B C D to
 * resolve conflict. Input A B C D could predict alternative 1 in one position
 * in the input and A B C E could predict alternative 2 in another position in
 * input. The conflicting SLL configurations could still be non-unique in the
 * full context prediction, which would lead us to requiring more input than the
 * original A B C.	To make a	prediction cache work, we have to track	the exact
 * input	used during the previous prediction. That amounts to a cache that maps
 * X to a specific DFA for that context.</p>
 *
 * <p>
 * Something should be done for left-recursive expression predictions. They are
 * likely LL(1) + pred eval. Easier to do the whole SLL unless error and retry
 * with full LL thing Sam does.</p>
 *
 * <p>
 * <strong>AVOIDING FULL CONTEXT PREDICTION</strong></p>
 *
 * <p>
 * We avoid doing full context retry when the outer context is empty, we did not
 * dip into the outer context by falling off the end of the decision state rule,
 * or when we force SLL mode.</p>
 *
 * <p>
 * As an example of the not dip into outer context case, consider as super
 * constructor calls versus function calls. One grammar might look like
 * this:</p>
 *
 * <pre>
 * ctorBody
 *   : '{' superCall? stat* '}'
 *   ;
 * </pre>
 *
 * <p>
 * Or, you might see something like</p>
 *
 * <pre>
 * stat
 *   : superCall ';'
 *   | expression ';'
 *   | ...
 *   ;
 * </pre>
 *
 * <p>
 * In both cases I believe that no closure operations will dip into the outer
 * context. In the first case ctorBody in the worst case will stop at the '}'.
 * In the 2nd case it should stop at the ';'. Both cases should stay within the
 * entry rule and not dip into the outer context.</p>
 *
 * <p>
 * <strong>PREDICATES</strong></p>
 *
 * <p>
 * Predicates are always evaluated if present in either SLL or LL both. SLL and
 * LL simulation deals with predicates differently. SLL collects predicates as
 * it performs closure operations like ANTLR v3 did. It delays predicate
 * evaluation until it reaches and accept state. This allows us to cache the SLL
 * ATN simulation whereas, if we had evaluated predicates on-the-fly during
 * closure, the DFA state configuration sets would be different and we couldn't
 * build up a suitable DFA.</p>
 *
 * <p>
 * When building a DFA accept state during ATN simulation, we evaluate any
 * predicates and return the sole semantically valid alternative. If there is
 * more than 1 alternative, we report an ambiguity. If there are 0 alternatives,
 * we throw an exception. Alternatives without predicates act like they have
 * true predicates. The simple way to think about it is to strip away all
 * alternatives with false predicates and choose the minimum alternative that
 * remains.</p>
 *
 * <p>
 * When we start in the DFA and reach an accept state that's predicated, we test
 * those and return the minimum semantically viable alternative. If no
 * alternatives are viable, we throw an exception.</p>
 *
 * <p>
 * During full LL ATN simulation, closure always evaluates predicates and
 * on-the-fly. This is crucial to reducing the configuration set size during
 * closure. It hits a landmine when parsing with the Java grammar, for example,
 * without this on-the-fly evaluation.</p>
 *
 * <p>
 * <strong>SHARING DFA</strong></p>
 *
 * <p>
 * All instances of the same parser share the same decision DFAs through a
 * static field. Each instance gets its own ATN simulator but they share the
 * same {@link #decisionToDFA} field. They also share a
 * {@link PredictionContextCache} object that makes sure that all
 * {@link PredictionContext} objects are shared among the DFA states. This makes
 * a big size difference.</p>
 *
 * <p>
 * <strong>THREAD SAFETY</strong></p>
 *
 * <p>
 * The {@link ParserATNSimulator} locks on the {@link #decisionToDFA} field when
 * it adds a new DFA object to that array. {@link #addDFAEdge}
 * locks on the DFA for the current decision when setting the
 * {@link DFAState#edges} field. {@link #addDFAState} locks on
 * the DFA for the current decision when looking up a DFA state to see if it
 * already exists. We must make sure that all requests to add DFA states that
 * are equivalent result in the same shared DFA object. This is because lots of
 * threads will be trying to update the DFA at once. The
 * {@link #addDFAState} method also locks inside the DFA lock
 * but this time on the shared context cache when it rebuilds the
 * configurations' {@link PredictionContext} objects using cached
 * subgraphs/nodes. No other locking occurs, even during DFA simulation. This is
 * safe as long as we can guarantee that all threads referencing
 * {@code s.edge[t]} get the same physical target {@link DFAState}, or
 * {@code null}. Once into the DFA, the DFA simulation does not reference the
 * {@link DFA#states} map. It follows the {@link DFAState#edges} field to new
 * targets. The DFA simulator will either find {@link DFAState#edges} to be
 * {@code null}, to be non-{@code null} and {@code dfa.edges[t]} null, or
 * {@code dfa.edges[t]} to be non-null. The
 * {@link #addDFAEdge} method could be racing to set the field
 * but in either case the DFA simulator works; if {@code null}, and requests ATN
 * simulation. It could also race trying to get {@code dfa.edges[t]}, but either
 * way it will work because it's not doing a test and set operation.</p>
 *
 * <p>
 * <strong>Starting with SLL then failing to combined SLL/LL (Two-Stage
 * Parsing)</strong></p>
 *
 * <p>
 * Sam pointed out that if SLL does not give a syntax error, then there is no
 * point in doing full LL, which is slower. We only have to try LL if we get a
 * syntax error. For maximum speed, Sam starts the parser set to pure SLL
 * mode with the {@link BailErrorStrategy}:</p>
 *
 * <pre>
 * parser.{@link Parser#getInterpreter() getInterpreter()}.{@link #setPredictionMode setPredictionMode}{@code (}{@link PredictionMode#SLL}{@code )};
 * parser.{@link Parser#setErrorHandler setErrorHandler}(new {@link BailErrorStrategy}());
 * </pre>
 *
 * <p>
 * If it does not get a syntax error, then we're done. If it does get a syntax
 * error, we need to retry with the combined SLL/LL strategy.</p>
 *
 * <p>
 * The reason this works is as follows. If there are no SLL conflicts, then the
 * grammar is SLL (at least for that input set). If there is an SLL conflict,
 * the full LL analysis must yield a set of viable alternatives which is a
 * subset of the alternatives reported by SLL. If the LL set is a singleton,
 * then the grammar is LL but not SLL. If the LL set is the same size as the SLL
 * set, the decision is SLL. If the LL set has size &gt; 1, then that decision
 * is truly ambiguous on the current input. If the LL set is smaller, then the
 * SLL conflict resolution might choose an alternative that the full LL would
 * rule out as a possibility based upon better context information. If that's
 * the case, then the SLL parse will definitely get an error because the full LL
 * analysis says it's not viable. If SLL conflict resolution chooses an
 * alternative within the LL set, them both SLL and LL would choose the same
 * alternative because they both choose the minimum of multiple conflicting
 * alternatives.</p>
 *
 * <p>
 * Let's say we have a set of SLL conflicting alternatives {@code {1, 2, 3}} and
 * a smaller LL set called <em>s</em>. If <em>s</em> is {@code {2, 3}}, then SLL
 * parsing will get an error because SLL will pursue alternative 1. If
 * <em>s</em> is {@code {1, 2}} or {@code {1, 3}} then both SLL and LL will
 * choose the same alternative because alternative one is the minimum of either
 * set. If <em>s</em> is {@code {2}} or {@code {3}} then SLL will get a syntax
 * error. If <em>s</em> is {@code {1}} then SLL will succeed.</p>
 *
 * <p>
 * Of course, if the input is invalid, then we will get an error for sure in
 * both SLL and LL parsing. Erroneous input will therefore require 2 passes over
 * the input.</p>
 */
class ParserATNSimulator : ATNSimulator
{

    /**
     * @uml
     * @final
     */
    public static bool debugFlag = false;

    public static bool debug_list_atn_decisions = false;

    protected Parser parser;

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

    public DFA[] decisionToDFA;

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
    protected int execATN(DFA dfa, ATNState s0, TokenStream input, int startIndex, ParserRuleContext outerContext)
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

            if (D.requiresFullContext && mode != PredictionMode.SLL) {
                // IF PREDS, MIGHT RESOLVE TO SINGLE ALT => SLL (or syntax error)
                BitArray conflictingAlts = D.configs.conflictingAlts;
                if (D.predicates != null) {
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
                BitArray alts = evalSemanticContext(D.predicates, outerContext, true);
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

    public DFAState getExistingTargetState(DFAState previousD, int t)
    {
    }

    public DFAState computeTargetState(DFA dfa, DFAState previousD, int t)
    {
    }

}

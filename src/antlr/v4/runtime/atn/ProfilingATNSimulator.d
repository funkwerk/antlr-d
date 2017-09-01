/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
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

module antlr.v4.runtime.atn.ProfilingATNSimulator;

import std.conv;
import std.datetime;
import std.algorithm;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.atn.DecisionInfo;
import antlr.v4.runtime.atn.ErrorInfo;
import antlr.v4.runtime.atn.PredicateEvalInfo;
import antlr.v4.runtime.atn.LookaheadEventInfo;
import antlr.v4.runtime.dfa.DFAState;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.atn.SemanticContext;
import antlr.v4.runtime.atn.PrecedencePredicate;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.ParserRuleContext;

// Class ProfilingATNSimulator
/**
 * TODO add class description
 */
class ProfilingATNSimulator : ParserATNSimulator
{

    protected DecisionInfo[] decisions;

    protected int currentDecision;

    protected int numDecisions;

    protected int _sllStopIndex;

    protected int _llStopIndex;

    protected DFAState currentState;

    /**
     *  we can determine whether or not a decision / input pair is context-sensitive.
     *  If LL gives a different result than SLL's predicted alternative, we have a
     *  context sensitivity for sure. The converse is not necessarily true, however.
     *  It's possible that after conflict resolution chooses minimum alternatives,
     *  SLL could get the same answer as LL. Regardless of whether or not the result indicates
     *  an ambiguity, it is not treated as a context sensitivity because LL prediction
     *  was not required in order to produce a correct prediction for this decision and input sequence.
     *  It may in fact still be a context sensitivity but we don't know by looking at the
     *  minimum alternatives for the current input.
     */
    public int conflictingAltResolvedBySLL;

    public this(Parser parser)
    {
	super(parser,
              parser.getInterpreter().atn,
              parser.getInterpreter().decisionToDFA,
              parser.getInterpreter().sharedContextCache);
        numDecisions = to!int(atn.decisionToState.length);
        decisions = new DecisionInfo[numDecisions];
        for (int i=0; i<numDecisions; i++) {
            decisions[i] = new DecisionInfo(i);
        }
    }

    /**
     * @uml
     * @override
     */
    public override int adaptivePredict(TokenStream input, int decision, ParserRuleContext outerContext)
    {
	try {
            this._sllStopIndex = -1;
            this._llStopIndex = -1;
            this.currentDecision = decision;
            auto start = MonoTime.currTime; // expensive but useful info
            int alt = super.adaptivePredict(input, decision, outerContext);
            auto stop = MonoTime.currTime;
            decisions[decision].timeInPrediction += ticksToNSecs(stop.ticks - start.ticks);
            decisions[decision].invocations++;

            int SLL_k = _sllStopIndex - _startIndex + 1;
            decisions[decision].SLL_TotalLook += SLL_k;
            decisions[decision].SLL_MinLook = decisions[decision].SLL_MinLook==0 ? SLL_k : min(decisions[decision].SLL_MinLook, SLL_k);
            if ( SLL_k > decisions[decision].SLL_MaxLook ) {
                decisions[decision].SLL_MaxLook = SLL_k;
                decisions[decision].SLL_MaxLookEvent =
                    new LookaheadEventInfo(decision, null, alt, input, _startIndex, _sllStopIndex, false);
            }

            if (_llStopIndex >= 0) {
                int LL_k = _llStopIndex - _startIndex + 1;
                decisions[decision].LL_TotalLook += LL_k;
                decisions[decision].LL_MinLook = decisions[decision].LL_MinLook==0 ? LL_k : min(decisions[decision].LL_MinLook, LL_k);
                if ( LL_k > decisions[decision].LL_MaxLook ) {
                    decisions[decision].LL_MaxLook = LL_k;
                    decisions[decision].LL_MaxLookEvent =
                        new LookaheadEventInfo(decision, null, alt, input, _startIndex, _llStopIndex, true);
                }
            }

            return alt;
        }
        finally {
            this.currentDecision = -1;
        }

    }

    /**
     * @uml
     * @override
     */
    public override DFAState getExistingTargetState(DFAState previousD, int t)
    {
	// this method is called after each time the input position advances
        // during SLL prediction
        _sllStopIndex = _input.index();

        DFAState existingTargetState = super.getExistingTargetState(previousD, t);
        if (existingTargetState !is null) {
            decisions[currentDecision].SLL_DFATransitions++; // count only if we transition over a DFA state
            if ( existingTargetState==ERROR ) {
                decisions[currentDecision].errors
                    ~= new ErrorInfo(currentDecision, previousD.configs, _input, _startIndex, _sllStopIndex, false);
            }
        }

        currentState = existingTargetState;
        return existingTargetState;

    }

    /**
     * @uml
     * @override
     */
    protected override DFAState computeTargetState(DFA dfa, DFAState previousD, int t)
    {
	DFAState state = super.computeTargetState(dfa, previousD, t);
        currentState = state;
        return state;
    }

    /**
     * @uml
     * @override
     */
    protected override ATNConfigSet computeReachSet(ATNConfigSet closure, int t, bool fullCtx)
    {
	if (fullCtx) {
            // this method is called after each time the input position advances
            // during full context prediction
            _llStopIndex = _input.index();
        }

        ATNConfigSet reachConfigs = super.computeReachSet(closure, t, fullCtx);
        if (fullCtx) {
            decisions[currentDecision].LL_ATNTransitions++; // count computation even if error
            if (reachConfigs !is null) {
            }
            else { // no reach on current lookahead symbol. ERROR.
                // TODO: does not handle delayed errors per getSynValidOrSemInvalidAltThatFinishedDecisionEntryRule()
                decisions[currentDecision].errors
                    ~= new ErrorInfo(currentDecision, closure, _input, _startIndex, _llStopIndex, true);
            }
        }
        else {
            decisions[currentDecision].SLL_ATNTransitions++;
            if (reachConfigs !is null) {
            }
            else { // no reach on current lookahead symbol. ERROR.
                decisions[currentDecision].errors
                    ~= new ErrorInfo(currentDecision, closure, _input, _startIndex, _sllStopIndex, false);
            }
        }
        return reachConfigs;

    }

    /**
     * @uml
     * @override
     */
    protected override bool evalSemanticContext(SemanticContext pred, ParserRuleContext parserCallStack,
        int alt, bool fullCtx)
    {
	bool result = super.evalSemanticContext(pred, parserCallStack, alt, fullCtx);
        if (pred.classinfo != PrecedencePredicate.classinfo) {
            bool fullContext = _llStopIndex >= 0;
            int stopIndex = fullContext ? _llStopIndex : _sllStopIndex;
            decisions[currentDecision].predicateEvals
                ~= new PredicateEvalInfo(currentDecision, _input, _startIndex, stopIndex, pred, result, alt, fullCtx);
        }
        return result;
    }

    public DecisionInfo[] getDecisionInfo()
    {
        return decisions;
    }

}

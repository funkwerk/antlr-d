/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
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

import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.atn.DecisionInfo;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.ParserRuleContext;

// Class ProfilingATNSimulator
/**
 * TODO add class description
 */
class ProfilingATNSimulator : ParserATNSimulator
{

    protected DecisionInfo[] decisions;

    protected int numDecisions;

    protected int _sllStopIndex;

    protected int _llStopIndex;

    public int conflictingAltResolvedBySLL;

    public this(Parser parser)
    {
	super(parser,
              parser.getInterpreter().atn,
              parser.getInterpreter().decisionToDFA,
              parser.getInterpreter().sharedContextCache);
        numDecisions = atn.decisionToState.size();
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
            long start = System.nanoTime(); // expensive but useful info
            int alt = super.adaptivePredict(input, decision, outerContext);
            long stop = System.nanoTime();
            decisions[decision].timeInPrediction += (stop-start);
            decisions[decision].invocations++;
            
            int SLL_k = _sllStopIndex - _startIndex + 1;
            decisions[decision].SLL_TotalLook += SLL_k;
            decisions[decision].SLL_MinLook = decisions[decision].SLL_MinLook==0 ? SLL_k : Math.min(decisions[decision].SLL_MinLook, SLL_k);
            if ( SLL_k > decisions[decision].SLL_MaxLook ) {
                decisions[decision].SLL_MaxLook = SLL_k;
                decisions[decision].SLL_MaxLookEvent =
                    new LookaheadEventInfo(decision, null, alt, input, _startIndex, _sllStopIndex, false);
            }
            
            if (_llStopIndex >= 0) {
                int LL_k = _llStopIndex - _startIndex + 1;
                decisions[decision].LL_TotalLook += LL_k;
                decisions[decision].LL_MinLook = decisions[decision].LL_MinLook==0 ? LL_k : Math.min(decisions[decision].LL_MinLook, LL_k);
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

}

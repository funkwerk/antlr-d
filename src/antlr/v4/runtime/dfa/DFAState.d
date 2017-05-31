/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
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

module antlr.v4.runtime.dfa.DFAState;

import std.conv;
import std.array;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.atn.LexerActionExecutor;
import antlr.v4.runtime.dfa.PredPrediction;

// Class DFAState
/**
 * @uml
 * A DFA state represents a set of possible ATN configurations.
 * As Aho, Sethi, Ullman p. 117 says "The DFA uses its state
 * to keep track of all possible states the ATN can be in after
 * reading each input symbol.  That is to say, after reading
 * input a1a2..an, the DFA is in a state that represents the
 * subset T of the states of the ATN that are reachable from the
 * ATN's start state along some path labeled a1a2..an."
 * In conventional NFA&rarr;DFA conversion, therefore, the subset T
 * would be a bitset representing the set of states the
 * ATN could be in.  We need to track the alt predicted by each
 * state as well, however.  More importantly, we need to maintain
 * a stack of states, tracking the closure operations as they
 * jump from rule to rule, emulating rule invocations (method calls).
 * I have to add a stack to simulate the proper lookahead sequences for
 * the underlying LL grammar from which the ATN was derived.
 *
 * <p>I use a set of ATNConfig objects not simple states.  An ATNConfig
 * is both a state (ala normal conversion) and a RuleContext describing
 * the chain of rules (if any) followed to arrive at that state.</p>
 *
 * <p>A DFA state may have multiple references to a particular state,
 * but with different ATN contexts (with same or different alts)
 * meaning that state was reached via a different set of rule invocations.</p>
 */
class DFAState
{

    public int stateNumber = -1;

    public ATNConfigSet configs;

    /**
     * @uml
     * {@code edges[symbol]} points to target of symbol. Shift up by 1 so (-1)
     * {@link Token#EOF} maps to {@code edges[0]}.
     */
    public DFAState[] edges;

    public bool isAcceptState = false;

    /**
     * @uml
     * if accept state, what ttype do we match or alt do we predict?
     * This is set to {@link ATN#INVALID_ALT_NUMBER} when {@link #predicates}{@code !=null} or
     * {@link #requiresFullContext}.
     */
    public int prediction;

    public LexerActionExecutor lexerActionExecutor;

    /**
     * @uml
     * Indicates that this state was created during SLL prediction that
     * discovered a conflict between the configurations in the state. Future
     * {@link ParserATNSimulator#execATN} invocations immediately jumped doing
     * full context prediction if this field is true.
     */
    public bool requiresFullContext;

    /**
     * @uml
     * During SLL parsing, this is a list of predicates associated with the
     * ATN configurations of the DFA state. When we have predicates,
     * {@link #requiresFullContext} is {@code false} since full context prediction evaluates predicates
     * on-the-fly. If this is not null, then {@link #prediction} is
     * {@link ATN#INVALID_ALT_NUMBER}.
     * 	 *
     * <p>We only use these for non-{@link #requiresFullContext} but conflicting states. That
     * means we know from the context (it's $ or we don't dip into outer
     * context) that it's an ambiguity not a conflict.</p>
     *
     * <p>This list is computed by {@link ParserATNSimulator#predicateDFAState}.</p>
     */
    public PredPrediction[] predicates;

    public this()
    {
    }

    public this(int stateNumber)
    {
        this.stateNumber = stateNumber;
    }

    public this(ATNConfigSet configs)
    {
        this.configs = configs;
    }

    /**
     * @uml
     * Get the set of all alts mentioned by all ATN configurations in the
     * DFA state.
     */
    public int[] getAltSet()
    {
        int[] alts;
        if (configs !is null) {
            foreach (ATNConfig c; configs) {
                alts ~= c.alt;
            }
        }
        if (alts.length == 0) return null;
        return alts;
    }

    public int hashCode()
    {
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object o)
    {
        // compare set of ATN configurations in this set with other
        if (this == o) return true;

        if (o.classinfo != DFAState.classinfo) {
            return false;
        }

        DFAState other = cast(DFAState)o;
        // TODO (sam): what to do when configs==null?
        bool sameSet = this.configs.opEquals(other.configs);
        //		System.out.println("DFAState.equals: "+configs+(sameSet?"==":"!=")+other.configs);
        return sameSet;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        auto buf = appender!string;
        buf.put(to!string(stateNumber));
        buf.append(":");
        buf.append(configs);
        if (isAcceptState) {
            buf.put("=>");
            if (predicates !is null) {
                buf.put(predicates.toString);
            }
            else {
                buf.put(prediction.toString);
            }
        }
        return buf.data;
    }

}

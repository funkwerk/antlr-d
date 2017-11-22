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

module antlr.v4.runtime.dfa.DFA;

import std.conv;
import std.algorithm.sorting;
import fluent.asserts;
import unit_threaded;
import antlr.v4.runtime.IllegalStateException;
import antlr.v4.runtime.UnsupportedOperationException;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.dfa.DFAState;
import antlr.v4.runtime.dfa.DFASerializer;
import antlr.v4.runtime.dfa.LexerDFASerializer;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.atn.DecisionState;
import antlr.v4.runtime.atn.StarLoopEntryState;

// Class DFA
/**
 * A set of DFA states
 */
class DFA
{

    /**
     * A set of all DFA states. Use {@link Map} so we can get old state back
     * ({@link Set} only allows you to see if it's there).
     */
    public DFAState[DFAState] states;

    public DFAState s0;

    public int decision;

    /**
     * From which ATN state did we create this DFA?
     */
    public DecisionState atnStartState;

    /**
     * {@code true} if this DFA is for a precedence decision; otherwise,
     *  {@code false}. This is the backing field for {@link #isPrecedenceDfa}.
     */
    public bool precedenceDfa;

    public this(DecisionState atnStartState)
    {
        this(atnStartState, 0);
    }

    public this(DecisionState atnStartState, int decision)
    {
        this.atnStartState = atnStartState;
        this.decision = decision;
        bool precedenceDfa = false;
        if (cast(StarLoopEntryState)atnStartState) {
            if ((cast(StarLoopEntryState)atnStartState).isPrecedenceDecision) {
                precedenceDfa = true;
                DFAState precedenceState = new DFAState(new ATNConfigSet());
                precedenceState.edges = new DFAState[0];
                precedenceState.isAcceptState = false;
                precedenceState.requiresFullContext = false;
                this.s0 = precedenceState;
            }
        }
        this.precedenceDfa = precedenceDfa;
    }

    /**
     * Gets whether this DFA is a precedence DFA. Precedence DFAs use a special
     * start state {@link #s0} which is not stored in {@link #states}. The
     * {@link DFAState#edges} array for this start state contains outgoing edges
     * supplying individual start states corresponding to specific precedence
     * values.
     *
     *  @return {@code true} if this is a precedence DFA; otherwise,
     *  {@code false}.
     *  @see Parser#getPrecedence()
     */
    public bool isPrecedenceDfa()
    {
        return precedenceDfa;
    }

    /**
     * Get the start state for a specific precedence value.
     *
     *  @param precedence The current precedence.
     *  @return The start state corresponding to the specified precedence, or
     *  {@code null} if no start state exists for the specified precedence.
     *
     *  @throws IllegalStateException if this is not a precedence DFA.
     *  @see #isPrecedenceDfa()
     */
    public DFAState getPrecedenceStartState(int precedence)
    {
        if (!isPrecedenceDfa()) {
            throw new IllegalStateException("Only precedence DFAs may contain a precedence start state.");
        }
        // s0.edges is never null for a precedence DFA
        if (precedence < 0 || precedence >= s0.edges.length) {
            return null;
        }
        return s0.edges[precedence];
    }

    /**
     * Set the start state for a specific precedence value.
     *
     * @param precedence The current precedence.
     * @param startState The start state corresponding to the specified
     * precedence.
     *
     * @throws IllegalStateException if this is not a precedence DFA.
     * @see #isPrecedenceDfa()
     * @uml
     * @final
     */
    public final void setPrecedenceStartState(int precedence, DFAState startState)
    {
        if (!isPrecedenceDfa()) {
            throw new IllegalStateException("Only precedence DFAs may contain a precedence start state.");
        }

        if (precedence < 0) {
            return;
        }

        // synchronization on s0 here is ok. when the DFA is turned into a
        // precedence DFA, s0 will be initialized once and not updated again
        synchronized (s0) {
            // s0.edges is never null for a precedence DFA
            if (precedence >= s0.edges.length) {
                s0.edges.length = precedence + 1;
            }
            s0.edges[precedence] = startState;
        }
    }

    /**
     * Sets whether this is a precedence DFA.
     *
     * @param precedenceDfa {@code true} if this is a precedence DFA; otherwise,
     * {@code false}
     *
     * @throws UnsupportedOperationException if {@code precedenceDfa} does not
     * match the value of {@link #isPrecedenceDfa} for the current DFA.
     *
     * @deprecated This method no longer performs any action.
     */
    public void setPrecedenceDfa(bool precedenceDfa)
    {
        if (precedenceDfa != isPrecedenceDfa()) {
            throw new UnsupportedOperationException("The precedenceDfa field cannot change after a DFA is constructed.");
        }
    }

    public DFAState[] getStates()
    {
        DFAState[] result = states.keys;
        result.sort!("a.stateNumber < b.stateNumber");
        return result;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return to!string(new VocabularyImpl(null, null, null));
    }

    public string toString(string[] tokenNames)
    {
        if (s0 is null)
            return "";
        DFASerializer serializer = new DFASerializer(this, tokenNames);
        return serializer.toString();
    }

    public string toString(Vocabulary vocabulary)
    {
        if (s0 is null) {
            return "";
        }

        DFASerializer serializer = new DFASerializer(this, vocabulary);
        return serializer.toString();
    }

    public string toLexerString()
    {
        if (s0  is null) return "";
        DFASerializer serializer = new LexerDFASerializer(this);
        return serializer.toString();
    }

}

@Tags("dfa")
@("testDFA")
unittest {
    import std.stdio;
    import antlr.v4.runtime.atn.TokensStartState;
    DecisionState startState = new TokensStartState;
    DFA dfa = new DFA(startState);
    dfa.should.not.beNull;
    dfa.toString.should.equal("antlr.v4.runtime.VocabularyImpl.VocabularyImpl");
    dfa.isPrecedenceDfa.should.equal(false);
    //writefln("dfa.getStates = %s", dfa.getStates);
}

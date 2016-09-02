/*
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
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

module antlr.v4.runtime.atn.Transition;

import std.conv;
import antlr.v4.runtime.atn.TransitionStates;
import antlr.v4.runtime.atn.EpsilonTransition;
import antlr.v4.runtime.atn.RuleTransition;
import antlr.v4.runtime.atn.PredicateTransition;
import antlr.v4.runtime.atn.RangeTransition;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.misc.IntervalSet;

// Class Transition
/**
 * TODO add class description
 * @uml
 * An ATN transition between any two ATN states.  Subclasses define
 * atom, set, epsilon, action, predicate, rule transitions.
 *
 * <p>This is a one way link.  It emanates from a state (usually via a list of
 * transitions) and has a target state.</p>
 *
 * <p>Since we never have to change the ATN transitions once we construct it,
 * we can fix these transitions as specific classes. The DFA transitions
 * on the other hand need to update the labels as it adds transitions to
 * the states. We'll use the term Edge for the DFA to distinguish them from
 * ATN transitions.</p>
 *
 * UnitTest:
 * auto tr = new Transition();
 * assert(tr.serializationNames == ["INVALID",
 *                                  "EPSILON",
 *                                  "RANGE",
 *                                  "RULE",
 *                                  "PREDICATE",
 *                                  "ATOM",
 *                                  "ACTION",
 *                                  "SET",
 *                                  "NOT_SET",
 *                                  "WILDCARD",
 *                                  "PRECEDENCE"]);
 */
abstract class Transition
{

    /**
     * @uml
     * The target of this transition.
     */
    public ATNState target;

    public static string[] serializationNames;

    public static TransitionStates[object.TypeInfo_Class] serializationTypes;

    public static this()
    {
        foreach (el; __traits(allMembers, TransitionStates)) {
            serializationNames ~= to!string(el);
        }
        serializationTypes[typeid(EpsilonTransition)] = TransitionStates.EPSILON;
        serializationTypes[typeid(RangeTransition)] = TransitionStates.RANGE;
        serializationTypes[typeid(RuleTransition)] = TransitionStates.RULE;
        serializationTypes[typeid(PredicateTransition)] = TransitionStates.PREDICATE;
    }

    private this(ATNState target)
    {
        assert(target);
        this.target = target;
    }

    /**
     * @uml
     * Only for unittest required.
     */
    public this()
    {
    }

    abstract public int getSerializationType();

    /**
     * @uml
     * Determines if the transition is an "epsilon" transition.
     *
     * <p>The default implementation returns {@code false}.</p>
     *
     *  @return {@code true} if traversing this transition in the ATN does not
     *  consume an input symbol; otherwise, {@code false} if traversing this
     *  transition consumes (matches) an input symbol.
     */
    public bool isEpsilon()
    {
        return false;
    }

    public IntervalSet label()
    {
        return null;
    }

    abstract public bool matches(int symbol, int minVocabSymbol, int maxVocabSymbol);

}

unittest
{
    auto tr = new Transition();
    assert(tr.serializationNames == ["INVALID",
                                     "EPSILON",
                                     "RANGE",
                                     "RULE",
                                     "PREDICATE",
                                     "ATOM",
                                     "ACTION",
                                     "SET",
                                     "NOT_SET",
                                     "WILDCARD",
                                     "PRECEDENCE"]);
}

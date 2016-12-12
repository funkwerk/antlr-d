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

module antlr.v4.runtime.atn.EpsilonTransition;

import antlr.v4.runtime.atn.Transition;
import antlr.v4.runtime.atn.TransitionStates;
import antlr.v4.runtime.atn.ATNState;

// Class EpsilonTransition
/**
 * TODO add class description
 */
class EpsilonTransition : Transition
{

    /**
     * @uml
     * @read
     *  @return the rule index of a precedence rule for which this transition is
     *  returning from, where the precedence value is 0; otherwise, -1.
     *
     *  @see ATNConfig#isPrecedenceFilterSuppressed()
     *  @see ParserATNSimulator#applyPrecedenceFilter(ATNConfigSet)
     *  @since 4.4.1
     */
    private int outermostPrecedenceReturn_;

    public this(ATNState target)
    {
        this(target, -1);
    }

    public this(ATNState target, int outermostPrecedenceReturn)
    {
        super(target);
        this.outermostPrecedenceReturn_ = outermostPrecedenceReturn;
    }

    /**
     * @uml
     * Only for unittest required.
     */
    public this()
    {
    }

    /**
     * @uml
     * @override
     */
    public override int getSerializationType()
    {
        return TransitionStates.EPSILON;
    }

    /**
     * @uml
     * @override
     */
    public override bool isEpsilon()
    {
        return true;
    }

    /**
     * @uml
     * @override
     */
    public override bool matches(int symbol, int minVocabSymbol, int maxVocabSymbol)
    {
        return false;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return "epsilon";
    }

    public final int outermostPrecedenceReturn()
    {
        return this.outermostPrecedenceReturn_;
    }

}

unittest
{
    auto tr = new EpsilonTransition();
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

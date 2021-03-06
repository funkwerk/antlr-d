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

module antlr.v4.runtime.atn.AtomTransition;

import std.conv;
import antlr.v4.runtime.atn.Transition;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.TransitionStates;
import antlr.v4.runtime.misc.IntervalSet;

/**
 * TODO add class description
 */
class AtomTransition : Transition
{

    /**
     * @uml
     * The token type or character value; or, signifies special label.
     */
    public int _label;

    public this(ATNState target, int label)
    {
        super(target);
        this._label = label;
    }

    /**
     * @uml
     * @override
     */
    public override int getSerializationType()
    {
        return TransitionStates.ATOM;
    }

    /**
     * @uml
     * @override
     */
    public override IntervalSet label()
    {
        return IntervalSet.of(_label);
    }

    /**
     * @uml
     * @override
     */
    public override bool matches(int symbol, int minVocabSymbol, int maxVocabSymbol)
    {
        return _label == symbol;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return to!string(_label);
    }

}

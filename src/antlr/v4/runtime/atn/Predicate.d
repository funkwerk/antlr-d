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

module antlr.v4.runtime.atn.Predicate;

import std.conv;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.misc.MurmurHash;
import antlr.v4.runtime.atn.SemanticContext;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.RuleContext;

// Class Predicate
/**
 * TODO add class description
 */
class Predicate : SemanticContext
{

    public int ruleIndex;

    public int predIndex;

    /**
     * @uml
     * e.g., $i ref in pred
     */
    public bool isCtxDependent;

    public this()
    {
        this.ruleIndex = -1;
        this.predIndex = -1;
        this.isCtxDependent = false;
    }

    public this(int ruleIndex, int predIndex, bool isCtxDependent)
    {
        this.ruleIndex = ruleIndex;
        this.predIndex = predIndex;
        this.isCtxDependent = isCtxDependent;
    }

    /**
     * @uml
     * @override
     */
    public override bool eval(Recognizer!(Token, ParserATNSimulator) parser, RuleContext parserCallStack)
    {
        RuleContext localctx = isCtxDependent ? parserCallStack : null;
        return parser.sempred(localctx, ruleIndex, predIndex);
    }

    /**
     * @uml
     * @override
     * @safe
     * @nothrow
     */
    public override size_t toHash() @safe nothrow
    {
        size_t hashCode = MurmurHash.initialize();
        hashCode = MurmurHash.update(hashCode, ruleIndex);
        hashCode = MurmurHash.update(hashCode, predIndex);
        hashCode = MurmurHash.update(hashCode, isCtxDependent ? 1 : 0);
        hashCode = MurmurHash.finish(hashCode, 3);
        return hashCode;
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object obj)
    {
        if (typeid(typeof(obj)) != typeid(Predicate*)) return false;
        if ( this is obj ) return true;
        Predicate p = cast(Predicate)obj;
        return this.ruleIndex == p.ruleIndex &&
            this.predIndex == p.predIndex &&
            this.isCtxDependent == p.isCtxDependent;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return "{" ~ to!string(ruleIndex) ~ ":" ~ to!string(predIndex) ~ "}?";
    }

}

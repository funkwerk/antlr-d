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

module antlr.v4.runtime.atn.OR;

import std.conv;
import std.algorithm.searching;
import std.algorithm.iteration;
import std.algorithm.comparison;
import antlr.v4.runtime.InterfaceRecognizer;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.atn.Operator;
import antlr.v4.runtime.atn.SemanticContext;
import antlr.v4.runtime.misc.MurmurHash;

// Class OR
/**
 * A semantic context which is true whenever at least one of the contained
 * contexts is true.
 */
class OR : Operator
{

    public SemanticContext[] opnds;

    public this(SemanticContext a, SemanticContext b)
    {
        SemanticContext[] operands;
        if (a.classinfo == OR.classinfo) operands ~= (cast(OR)a).opnds;
        else operands ~= a;
        if (b.classinfo == OR.classinfo) operands ~= (cast(OR)b).opnds;
        else operands ~= b;

        SemanticContext.PrecedencePredicate[] precedencePredicates = filterPrecedencePredicates(operands);
        if (precedencePredicates.length) {
            // interested in the transition with the highest precedence
            SemanticContext.PrecedencePredicate reduced = maxElement(precedencePredicates);
            operands ~= reduced;
        }
        this.opnds = operands;
    }

    /**
     * @uml
     * @override
     */
    public override SemanticContext[] getOperands()
    {
        return opnds;
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object obj)
    {
        return this.opnds == (cast(OR)obj).opnds;
    }

    /**
     * @uml
     * @override
     * @trusted
     */
    public override size_t toHash() @trusted
    {
        return MurmurHash.hashCode(opnds, this.toHash);
    }

    /**
     * @uml
     * @override
     */
    public override bool eval(InterfaceRecognizer parser, RuleContext parserCallStack)
    {
        foreach (SemanticContext opnd; opnds) {
            if (opnd.eval(parser, parserCallStack))
                return true;
        }
        return false;
    }

    /**
     * @uml
     * @override
     */
    public override SemanticContext evalPrecedence(InterfaceRecognizer parser, RuleContext parserCallStack)
    {
        bool differs = false;
        SemanticContext[] operands;
        foreach (SemanticContext context; opnds) {
            SemanticContext evaluated = context.evalPrecedence(parser, parserCallStack);
            differs |= (evaluated != context);
            if (evaluated == NONE) {
                // The OR context is true if any element is true
                return NONE;
            }
            else if (evaluated !is null) {
                // Reduce the result by skipping false elements
                operands ~= evaluated;
            }
        }

        if (!differs) {
            return this;
        }

        if (operands.length == 0) {
            // all elements were false, so the OR context is false
            return null;
        }

        SemanticContext result = operands[0];
        for (int i = 1; i < operands.length; i++) {
            result = SemanticContext.or(result, operands[i]);
        }
        return result;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return to!string(map!(n => n.toString)(opnds).joiner(" || "));
    }

}

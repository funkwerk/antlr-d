/*
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
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

module antlr.v4.runtime.atn.SemanticContext;

import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.atn.PrecedencePredicate;
import antlr.v4.runtime.atn.AND;
import antlr.v4.runtime.atn.OR;

// Class SemanticContext
/**
 * @uml
 * A tree structure used to record the semantic context in which
 * an ATN configuration is valid.  It's either a single predicate,
 * a conjunction {@code p1&&p2}, or a sum of products {@code p1||p2}.
 *
 * <p>I have scoped the {@link AND}, {@link OR}, and {@link Predicate} subclasses of
 * {@link SemanticContext} within the scope of this outer class.</p>
 */
abstract class SemanticContext
{

    /**
     * @uml
     * The default {@link SemanticContext}, which is semantically equivalent to
     * a predicate of the form {@code {true}?}.
     */
    public static SemanticContext NONE;

    /**
     * @uml
     * For context independent predicates, we evaluate them without a local
     * context (i.e., null context). That way, we can evaluate them without
     * having to create proper rule-specific context during prediction (as
     * opposed to the parser, which creates them naturally). In a practical
     * sense, this avoids a cast exception from RuleContext to myruleContext.
     *
     * <p>For context dependent predicates, we must pass in a local context so that
     * references such as $arg evaluate properly as _localctx.arg. We only
     * capture context dependent predicates in the context in which we begin
     * prediction, so we passed in the outer context here in case of context
     * dependent predicate evaluation.</p>
     */
    abstract public bool eval(Recognizer!(Token, ParserATNSimulator) parser, RuleContext parserCallStack);

    /**
     * @uml
     * Evaluate the precedence predicates for the context and reduce the result.
     *
     *  @param parser The parser instance.
     *  @param parserCallStack
     *  @return The simplified semantic context after precedence predicates are
     *  evaluated, which will be one of the following values.
     * <ul>
     *  <li>{@link #NONE}: if the predicate simplifies to {@code true} after
     *  precedence predicates are evaluated.</li>
     *  <li>{@code null}: if the predicate simplifies to {@code false} after
     *  precedence predicates are evaluated.</li>
     *  <li>{@code this}: if the semantic context is not changed as a result of
     *  precedence predicate evaluation.</li>
     *  <li>A non-{@code null} {@link SemanticContext}: the new simplified
     *  semantic context after precedence predicates are evaluated.</li>
     * </ul>
     */
    public SemanticContext evalPrecedence(Recognizer!(Token, ParserATNSimulator) parser, RuleContext parserCallStack)
    {
        return this;
    }

    /**
     * @uml
     * @safe
     * @nothrow
     * @override
     */
    public override size_t toHash() @safe nothrow
    {
        return 1;
    }

    public static SemanticContext and(SemanticContext a, SemanticContext b)
    {
	if (a is null || a == NONE ) return b;
        if (b is null || b == NONE ) return a;
        AND result = new AND(a, b);
        if (result.opnds.length == 1) {
            return result.opnds[0];
        }
        return result;
    }

    public static SemanticContext or(SemanticContext a, SemanticContext b)
    {
	if (a is null ) return b;
        if (b is null ) return a;
        if (a == NONE || b == NONE ) return NONE;
        OR result = new OR(a, b);
        if (result.opnds.length == 1) {
            return result.opnds[0];
        }
        return result;
    }

    public PrecedencePredicate[] filterPrecedencePredicates(SemanticContext[] collection)
    {
	PrecedencePredicate[] result;
        foreach (context; collection) {
            if (context.classinfo == PrecedencePredicate.classinfo) {
                result ~= cast(PrecedencePredicate)context;
            }
        }
        return result;
    }

}

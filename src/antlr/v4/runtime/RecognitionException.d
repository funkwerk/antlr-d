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

module antlr.v4.runtime.RecognitionException;

import antlr.v4.runtime.RuntimeException;
import antlr.v4.runtime.InterfaceRecognizer;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.IntStream;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.misc.IntervalSet;

// Class Template RecognitionException
/**
 * TODO add class description
 */
class RecognitionException(U, V) : RuntimeException
{

    public InterfaceRecognizer recognizer;

    private RuleContext ctx;

    private IntStream input;

    private Token offendingToken;

    private int offendingState = -1;

    public this(InterfaceRecognizer recognizer, IntStream input, ParserRuleContext ctx)
    {
        this.recognizer = recognizer;
        this.input = input;
        this.ctx = ctx;
        if (recognizer !is null) this.offendingState = recognizer.getState();
    }

    public this(string message, InterfaceRecognizer recognizer, IntStream input, ParserRuleContext ctx)
    {
        super(message);
        this.recognizer = recognizer;
        this.input = input;
        this.ctx = ctx;
        if (recognizer !is null) this.offendingState = recognizer.getState();
    }

    /**
     * @uml
     * Get the ATN state number the parser was in at the time the error
     * occurred. For {@link NoViableAltException} and
     * {@link LexerNoViableAltException} exceptions, this is the
     * {@link DecisionState} number. For others, it is the state whose outgoing
     * edge we couldn't match.
     *
     * <p>If the state number is not known, this method returns -1.</p>
     */
    public int getOffendingState()
    {
        return offendingState;
    }

    protected void setOffendingState(int offendingState)
    {
        this.offendingState = offendingState;
    }

    /**
     * @uml
     * Gets the set of input symbols which could potentially follow the
     * previously matched symbol at the time this exception was thrown.
     *
     * <p>If the set of expected tokens is not known and could not be computed,
     * this method returns {@code null}.</p>
     *
     *  @return The set of token types that could potentially follow the current
     * state in the ATN, or {@code null} if the information is not available.
     */
    public IntervalSet getExpectedTokens()
    {
        if (recognizer !is null) {
            return recognizer.getATN().getExpectedTokens(offendingState, ctx);
        }
        return null;
    }

    /**
     * @uml
     * Gets the {@link RuleContext} at the time this exception was thrown.
     *
     * <p>If the context is not available, this method returns {@code null}.</p>
     *
     *  @return The {@link RuleContext} at the time this exception was thrown.
     * If the context is not available, this method returns {@code null}.
     */
    public RuleContext getCtx()
    {
        return ctx;
    }

    public IntStream getInputStream()
    {
        return input;
    }

    public Token getOffendingToken()
    {
        return offendingToken;
    }

    public void setOffendingToken(Token offendingToken)
    {
        this.offendingToken = offendingToken;
    }

    /**
     * @uml
     * Gets the {@link Recognizer} where this exception occurred.
     *
     * <p>If the recognizer is not available, this method returns {@code null}.</p>
     *
     *  @return The recognizer where this exception occurred, or {@code null} if
     *  the recognizer is not available.
     */
    public InterfaceRecognizer getRecognizer()
    {
        return recognizer;
    }

}

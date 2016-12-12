/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
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

module antlr.v4.runtime.Parser;

import antlr.v4.runtime.ANTLRErrorStrategy;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.TraceListener;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNSimulator;
import antlr.v4.runtime.tree.ParseTreeListener;
import antlr.v4.runtime.misc.IntegerStack;

// Class Parser
/**
 * TODO add class description
 */
abstract class Parser : Recognizer!(Token, ATNSimulator)
{

    /**
     * @uml
     * This field maps from the serialized ATN string to the deserialized {@link ATN} with
     * bypass alternatives.
     *
     * @see ATNDeserializationOptions#isGenerateRuleBypassTransitions()
     */
    private ATN[string] bypassAltsAtnCache;

    protected ANTLRErrorStrategy!(Token, ATNSimulator) _errHandler;

    protected TokenStream _input;

    public IntegerStack _precedenceStack;

    /**
     * @uml
     * The {@link ParserRuleContext} object for the currently executing rule.
     * This is always non-null during the parsing process.
     * @read
     * @write
     */
    public ParserRuleContext ctx_;

    /**
     * @uml
     * Specifies whether or not the parser should construct a parse tree during
     * the parsing process. The default value is {@code true}.
     *
     * @see #getBuildParseTree
     * @see #setBuildParseTree
     */
    protected bool _buildParseTrees = true;

    public TraceListener _tracer;

    /**
     * @uml
     * The list of {@link ParseTreeListener} listeners registered to receive
     * events during the parse.
     *
     *  @see #addParseListener
     */
    public ParseTreeListener[] _parseListeners;

    /**
     * @uml
     * The number of syntax errors reported during parsing. This value is
     * incremented each time {@link #notifyErrorListeners} is called.
     */
    public int _syntaxErrors;

    /**
     * @uml
     * Indicates parser has match()ed EOF token. See {@link #exitRule()}.
     */
    public bool matchedEOF;

    public this()
    {
    }

    public this(TokenStream input)
    {
        setInputStream(input);
    }

    /**
     * @uml
     * reset the parser's state
     */
    public void reset()
    {
        if ( getInputStream()!=null ) getInputStream().seek(0);
        _errHandler.reset(this);
        ctx_ = null;
        _syntaxErrors = 0;
        matchedEOF = false;
        setTrace(false);
        _precedenceStack.clear();
        _precedenceStack.push(0);
        ATNSimulator interpreter = getInterpreter();
        if (interpreter != null) {
            interpreter.reset();
        }
    }

    public final ParserRuleContext ctx()
    {
        return this.ctx_;
    }

    public final void ctx(ParserRuleContext ctx)
    {
        this.ctx_ = ctx;
    }

}

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

import std.algorithm;
import antlr.v4.runtime.ANTLRErrorStrategy;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.TraceListener;
import antlr.v4.runtime.TrimToSizeListener;
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
        if (interpreter !is null) {
            interpreter.reset();
        }
    }

    /**
     * @uml
     * Match current input symbol against {@code ttype}. If the symbol type
     * matches, {@link ANTLRErrorStrategy#reportMatch} and {@link #consume} are
     * called to complete the match process.
     *
     * <p>If the symbol type does not match,
     * {@link ANTLRErrorStrategy#recoverInline} is called on the current error
     * strategy to attempt recovery. If {@link #getBuildParseTree} is
     * {@code true} and the token index of the symbol returned by
     * {@link ANTLRErrorStrategy#recoverInline} is -1, the symbol is added to
     * the parse tree by calling {@link ParserRuleContext#addErrorNode}.</p>
     *
     *  @param ttype the token type to match
     *  @return the matched symbol
     *  @throws RecognitionException if the current input symbol did not match
     *  {@code ttype} and the error strategy could not recover from the
     *  mismatched symbol
     */
    public Token match(int ttype)
    {
	Token t = getCurrentToken();
        if (t.getType() > 0) {
            _errHandler.reportMatch(this);
            consume();
        }
        else {
            t = _errHandler.recoverInline(this);
            if (_buildParseTrees && t.getTokenIndex() == -1) {
                // we must have conjured up a new token during single token insertion
                // if it's not the current symbol
                ctx_.addErrorNode(t);
            }
        }

        return t;
    }

    /**
     * @uml
     * Match current input symbol as a wildcard. If the symbol type matches
     * (i.e. has a value greater than 0), {@link ANTLRErrorStrategy#reportMatch}
     * and {@link #consume} are called to complete the match process.
     *
     * <p>If the symbol type does not match,
     * {@link ANTLRErrorStrategy#recoverInline} is called on the current error
     * strategy to attempt recovery. If {@link #getBuildParseTree} is
     * {@code true} and the token index of the symbol returned by
     * {@link ANTLRErrorStrategy#recoverInline} is -1, the symbol is added to
     * the parse tree by calling {@link ParserRuleContext#addErrorNode}.</p>
     *
     *  @return the matched symbol
     *  @throws RecognitionException if the current input symbol did not match
     *  a wildcard and the error strategy could not recover from the mismatched
     *  symbol
     */
    public Token matchWildcard()
    {
	Token t = getCurrentToken();
        if (t.getType() > 0) {
            _errHandler.reportMatch(this);
            consume();
        }
        else {
            t = _errHandler.recoverInline(this);
            if (_buildParseTrees && t.getTokenIndex() == -1) {
                // we must have conjured up a new token during single token insertion
                // if it's not the current symbol
                ctx_.addErrorNode(t);
            }
        }
        return t;
    }

    /**
     * @uml
     * Track the {@link ParserRuleContext} objects during the parse and hook
     * them up using the {@link ParserRuleContext#children} list so that it
     * forms a parse tree. The {@link ParserRuleContext} returned from the start
     * rule represents the root of the parse tree.
     *
     * <p>Note that if we are not building parse trees, rule contexts only point
     * upwards. When a rule exits, it returns the context but that gets garbage
     * collected if nobody holds a reference. It points upwards but nobody
     * points at it.</p>
     *
     * <p>When we build parse trees, we are adding all of these contexts to
     * {@link ParserRuleContext#children} list. Contexts are then not candidates
     * for garbage collection.</p>
     */
    public void setBuildParseTree(bool buildParseTrees)
    {
        this._buildParseTrees = buildParseTrees;
    }

    /**
     * @uml
     * Gets whether or not a complete parse tree will be constructed while
     * parsing. This property is {@code true} for a newly constructed parser.
     *
     *  @return {@code true} if a complete parse tree will be constructed while
     *  parsing, otherwise {@code false}
     */
    public bool getBuildParseTree()
    {
        return _buildParseTrees;
    }

    /**
     * @uml
     * Trim the internal lists of the parse tree during parsing to conserve memory.
     * This property is set to {@code false} by default for a newly constructed parser.
     *
     *  @param trimParseTrees {@code true} to trim the capacity of the {@link ParserRuleContext#children}
     *  list to its size after a rule is parsed.
     */
    public void setTrimParseTree(bool trimParseTrees)
    {
        if (trimParseTrees) {
            if (getTrimParseTree()) return;
            addParseListener(TrimToSizeListener.INSTANCE);
        }
        else {
            removeParseListener(TrimToSizeListener.INSTANCE);
        }
    }

    /**
     * @uml
     * @return {@code true} if the {@link ParserRuleContext#children} list is trimed
     *  using the default {@link Parser.TrimToSizeListener} during the parse process.
     */
    public bool getTrimParseTree()
    {
        return canFind(getParseListeners(), TrimToSizeListener.INSTANCE);
    }

    public ParseTreeListener[] getParseListeners()
    {
        ParseTreeListener[] listeners = _parseListeners;
        if (listeners is null) {
            return [];
        }

        return listeners;
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

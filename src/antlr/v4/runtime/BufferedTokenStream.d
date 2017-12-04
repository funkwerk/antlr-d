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

module antlr.v4.runtime.BufferedTokenStream;

import std.array;
import std.format;
import std.conv;
import std.algorithm: canFind;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenConstantDefinition;
import antlr.v4.runtime.WritableToken;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.IllegalStateException;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.IntStreamConstant;
import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.misc.Interval;

// Class BufferedTokenStream
/**
 * @uml
 * This implementation of {@link TokenStream} loads tokens from a
 * {@link TokenSource} on-demand, and places the tokens in a buffer to provide
 * access to any previous token by index.
 *
 * <p>
 * This token stream ignores the value of {@link Token#getChannel}. If your
 * parser requires the token stream filter tokens to only those on a particular
 * channel, such as {@link Token#DEFAULT_CHANNEL} or
 * {@link Token#HIDDEN_CHANNEL}, use a filtering token stream such a
 * {@link CommonTokenStream}.</p>
 */
class BufferedTokenStream : TokenStream
{

    /**
     * @uml
     * The {@link TokenSource} from which tokens for this stream are fetched.
     */
    protected TokenSource tokenSource;

    /**
     * @uml
     * A collection of all tokens fetched from the token source. The list is
     * considered a complete view of the input once {@link #fetchedEOF} is set
     * to {@code true}.
     */
    protected Token[] tokens;

    /**
     * @uml
     * The index into {@link #tokens} of the current token (next token to
     * {@link #consume}). {@link #tokens}{@code [}{@link #p}{@code ]} should be
     * {@link #LT LT(1)}.
     *
     * <p>This field is set to -1 when the stream is first constructed or when
     * {@link #setTokenSource} is called, indicating that the first token has
     * not yet been fetched from the token source. For additional information,
     * see the documentation of {@link IntStream} for a description of
     * Initializing Methods.</p>
     */
    protected int p = -1;

    /**
     * @uml
     * Indicates whether the {@link Token#EOF} token has been fetched from
     * {@link #tokenSource} and added to {@link #tokens}. This field improves
     * performance for the following cases:
     *
     * <ul>
     * <li>{@link #consume}: The lookahead check in {@link #consume} to prevent
     * consuming the EOF symbol is optimized by checking the values of
     * {@link #fetchedEOF} and {@link #p} instead of calling {@link #LA}.</li>
     * <li>{@link #fetch}: The check to prevent adding multiple EOF symbols into
     * {@link #tokens} is trivial with this field.</li>
     * <ul>
     */
    protected bool fetchedEOF;

    public this(TokenSource tokenSource)
    in
    {
        assert (tokenSource !is null, "tokenSource cannot be null");
    }
    body
    {
            this.tokenSource = tokenSource;
    }

    /**
     * @uml
     * @override
     */
    public override TokenSource getTokenSource()
    {
        return tokenSource;
    }

    public int index()
    {
        return p;
    }

    public int mark()
    {
        return 0;
    }

    public void release(int marker)
    {
        // no resources to release
    }

    public void reset()
    {
        seek(0);
    }

    public void seek(int index)
    {
        lazyInit();
        p = adjustSeekIndex(index);
    }

    public int size()
    {
        return to!int(tokens.length);
    }

    public void consume()
    {
        bool skipEofCheck;
        if (p >= 0) {
            if (fetchedEOF) {
                // the last token in tokens is EOF. skip check if p indexes any
                // fetched token except the last.
                skipEofCheck = p < tokens.length - 1;
            }
            else {
                // no EOF token in tokens. skip check if p indexes a fetched token.
                skipEofCheck = p < tokens.length;
            }
        }
        else {
            // not yet initialized
            skipEofCheck = false;
        }

        if (!skipEofCheck && LA(1) == IntStreamConstant.EOF) {
            throw new IllegalStateException("cannot consume EOF");
        }

        if (sync(p + 1)) {
            p = adjustSeekIndex(p + 1);
        }
    }

    protected bool sync(int i)
    in
    {
        assert (i >= 0);
    }
    body
    {
            int n = i - to!int(tokens.length) + 1; // how many more elements we need?
            debug(Lexer) {
                import std.stdio;
                writefln("sync(%s) needs %s", i, n);
            }
            if ( n > 0 ) {
                int fetched = fetch(n);
                return fetched >= n;
            }

            return true;
    }

    protected int fetch(int n)
    {
        if (fetchedEOF) {
            return 0;
        }
        for (int i = 0; i < n; i++) {
            Token t = tokenSource.nextToken();
            if (cast(WritableToken)t) {
                (cast(WritableToken)t).setTokenIndex(to!int(tokens.length));
            }
            debug(BuffertTokenStream) {
                import std.stdio;
                writefln("readToken t=%s, index=%s, tokens=%s", t, i, tokens);
            }
            tokens ~= t;
            if (t.getType == TokenConstantDefinition.EOF) {
                fetchedEOF = true;
                return i + 1;
            }
        }
        return n;
    }

    /**
     * @uml
     * @override
     */
    public override Token get(int i)
    in
    {
        assert( i >= 0 && i < tokens.length, format("token index %1$s out of range 0..%2$s", i, tokens.length-1));
    }
    body
    {
        return tokens[i];
    }

    /**
     * Get all tokens from start..stop inclusively
     */
    public Token[] get(int start, int stop)
    {
	if ( start<0 || stop<0 ) return null;
        lazyInit();
        Token[] subset;
        if (stop >= tokens.length) stop = to!int(tokens.length) - 1;
        for (int i = start; i <= stop; i++) {
            Token t = tokens[i];
            if (t.getType() == TokenConstantDefinition.EOF) break;
            subset ~= t;
        }
        return subset;
    }

    public int LA(int i)
    {
        return LT(i).getType();
    }

    public Token LB(int k)
    {
        if ( (p-k)<0 ) return null;
        return tokens[p - k];
    }

    /**
     * @uml
     * @override
     */
    public override Token LT(int k)
    {
        lazyInit();
        if (k == 0) return null;
        if (k < 0) return LB(-k);
        int i = p + k - 1;
        sync(i);
        if ( i >= tokens.length ) { // return EOF token
            // EOF must be last token
            return tokens[$-1];
        }
        //		if ( i>range ) range = i;
        return tokens[i];
    }

    /**
     * @uml
     * Allowed derived classes to modify the behavior of operations which change
     * the current stream position by adjusting the target token index of a seek
     * operation. The default implementation simply returns {@code i}. If an
     * exception is thrown in this method, the current stream index should not be
     * changed.
     *
     * <p>For example, {@link CommonTokenStream} overrides this method to ensure that
     * the seek target is always an on-channel token.</p>
     *
     *  @param i The target token index.
     *  @return The adjusted target token index.
     */
    protected int adjustSeekIndex(int i)
    {
        return i;
    }

    protected void lazyInit()
    {
        if (p == -1) {
            setup();
        }
    }

    protected void setup()
    {
        sync(0);
        p = adjustSeekIndex(0);
    }

    /**
     * @uml
     * Reset this token stream by setting its token source.
     */
    public void setTokenSource(TokenSource tokenSource)
    {
        this.tokenSource = tokenSource;
        tokens.length = 0;
        p = -1;
    }

    public Token[] getTokens()
    {
        return tokens;
    }

    public Token[] getTokens(int start, int stop)
    {
        return getTokens(start, stop, null);
    }

    /**
     * @uml
     * Given a start and stop index, return a List of all tokens in
     * the token type BitSet.  Return null if no tokens were found.  This
     * method looks at both on and off channel tokens.
     */
    public Token[] getTokens(int start, int stop, int[] types)
    in
    {
        lazyInit();
        assert(start >= 0 && stop < tokens.length &&
               stop > 0  && start < tokens.length,
               format("start %1$s or stop %2$s not in 0..%3$s", start, stop, tokens.length - 1));
    }
    body
    {
            if ( start>stop ) return null;

            // list = tokens[start:stop]:{T t, t.getType() in types}
            Token[] filteredTokens;
            for (int i=start; i<=stop; i++) {
                Token t = tokens[i];
                if (types is null || types.canFind(t.getType()) ) {
                    filteredTokens ~= t;
                }
            }
            if (filteredTokens.length == 0) {
                filteredTokens = null;
            }
            return filteredTokens;
    }

    public Token[] getTokens(int start, int stop, int ttype)
    {
        int[] s;
        s ~= ttype;
        return getTokens(start,stop, s);
    }

    /**
     * @uml
     * Given a starting index, return the index of the next token on channel.
     * Return {@code i} if {@code tokens[i]} is on channel. Return the index of
     * the EOF token if there are no tokens on channel between {@code i} and
     * EOF.
     */
    protected int nextTokenOnChannel(int i, int channel)
    {
	sync(i);
        if (i >= size()) {
            return size() - 1;
        }

        Token token = tokens[i];
        while (token.getChannel() != channel) {
            if (token.getType() == TokenConstantDefinition.EOF) {
                return i;
            }

            i++;
            sync(i);
            token = tokens[i];
        }

        return i;
    }

    /**
     * @uml
     * Given a starting index, return the index of the previous token on
     * channel. Return {@code i} if {@code tokens[i]} is on channel. Return -1
     * if there are no tokens on channel between {@code i} and 0.
     *
     * <p>
     * If {@code i} specifies an index at or after the EOF token, the EOF token
     * index is returned. This is due to the fact that the EOF token is treated
     * as though it were on every channel.</p>
     */
    protected int previousTokenOnChannel(int i, int channel)
    {
	sync(i);
        if (i >= size()) {
            // the EOF token is on every channel
            return size() - 1;
        }
        while (i >= 0) {
            Token token = tokens[i];
            if (token.getType() == TokenConstantDefinition.EOF || token.getChannel() == channel) {
                return i;
            }
            i--;
        }
        return i;
    }

    /**
     * @uml
     * Collect all tokens on specified channel to the right of
     * the current token up until we see a token on DEFAULT_TOKEN_CHANNEL or
     * EOF. If channel is -1, find any non default channel token.
     */
    public Token[] getHiddenTokensToRight(int tokenIndex, int channel)
    in
    {
        lazyInit();
        assert(tokenIndex >= 0 && tokenIndex < tokens.length, format("%1$s not in 0..%2$s", tokenIndex, tokens.length-1));
    }
    body
    {
            int nextOnChannel =
                nextTokenOnChannel(tokenIndex + 1, Lexer.DEFAULT_TOKEN_CHANNEL);
            int to;
            int from = tokenIndex+1;
            // if none onchannel to right, nextOnChannel=-1 so set to = last token
            if ( nextOnChannel == -1 ) to = size()-1;
            else to = nextOnChannel;
            return filterForChannel(from, to, channel);
    }

    /**
     * Collect all hidden tokens (any off-default channel) to the right of
     * the current token up until we see a token on DEFAULT_TOKEN_CHANNEL
     * of EOF.
     */
    public Token[] getHiddenTokensToRight(int tokenIndex)
    {
        return getHiddenTokensToRight(tokenIndex, -1);
    }

    /**
     * @uml
     * Collect all tokens on specified channel to the left of
     * the current token up until we see a token on DEFAULT_TOKEN_CHANNEL.
     * If channel is -1, find any non default channel token.
     */
    public Token[] getHiddenTokensToLeft(int tokenIndex, int channel)
    in
    {
        lazyInit();
        assert(tokenIndex >= 0 && tokenIndex < tokens.length, format("%1$s not in 0..%2$s", tokenIndex, tokens.length-1));
    }
    body
    {

            if (tokenIndex == 0) {
                // obviously no tokens can appear before the first token
                return null;
            }
            int prevOnChannel =
                previousTokenOnChannel(tokenIndex - 1, Lexer.DEFAULT_TOKEN_CHANNEL);
            if ( prevOnChannel == tokenIndex - 1 ) return null;
            // if none onchannel to left, prevOnChannel=-1 then from=0
            int from = prevOnChannel+1;
            int to = tokenIndex-1;
            return filterForChannel(from, to, channel);
    }

    /**
     * Collect all hidden tokens (any off-default channel) to the left of
     * the current token up until we see a token on DEFAULT_TOKEN_CHANNEL.
     */
    public Token[] getHiddenTokensToLeft(int tokenIndex)
    {
        return getHiddenTokensToLeft(tokenIndex, -1);
    }

    /**
     * @uml
     * Collect all hidden tokens (any off-default channel) to the left of
     * the current token up until we see a token on DEFAULT_TOKEN_CHANNEL.
     */
    public Token[] filterForChannel(int from, int to, int channel)
    {
        Token[] hidden;
        for (int i=from; i<=to; i++) {
            Token t = tokens[i];
            if (channel == -1) {
                if (t.getChannel() != Lexer.DEFAULT_TOKEN_CHANNEL) hidden ~= t;
            }
            else {
                if (t.getChannel() == channel) hidden ~= t;
            }
        }
        if (hidden.length == 0) return null;
        return hidden;
    }

    public string getSourceName()
    {
        return tokenSource.getSourceName();
    }

    /**
     * @uml
     * @override
     */
    public override string getText()
    {
        lazyInit();
        fill();
        return getText(Interval.of(0,size()-1));
    }

    /**
     * @uml
     * @override
     */
    public override string getText(Interval interval)
    {
      	int start = interval.a;
        int stop = interval.b;
        if (start < 0 || stop < 0) return "";
        lazyInit();
        if (stop >= tokens.length) stop = to!int(tokens.length) - 1;

        auto buf = appender!(string);
        for (int i = start; i <= stop; i++) {
            Token t = tokens[i];
            if (t.getType() == TokenConstantDefinition.EOF) break;
            buf.put(t.getText());
        }
        return buf.data;
    }

    /**
     * @uml
     * @override
     */
    public override string getText(RuleContext ctx)
    {
        return getText(ctx.getSourceInterval());
    }

    /**
     * @uml
     * @override
     */
    public override string getText(Token start, Token stop)
    {
        if (start !is null && stop !is null) {
            return getText(Interval.of(start.getTokenIndex(), stop.getTokenIndex()));
        }
       	return "";
    }

    /**
     * @uml
     * Get all tokens from lexer until EOF
     */
    public void fill()
    {
        lazyInit();
        const int blockSize = 1000;
        while (true) {
            int fetched = fetch(blockSize); return;
            if (fetched < blockSize) {
                return;
            }
        }
    }

}

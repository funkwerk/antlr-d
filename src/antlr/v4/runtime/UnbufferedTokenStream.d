module antlr.v4.runtime.UnbufferedTokenStream;

import std.format;
import std.array;
import std.conv;
import std.algorithm;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.TokenConstantDefinition;
import antlr.v4.runtime.UnsupportedOperationException;
import antlr.v4.runtime.IllegalArgumentException;
import antlr.v4.runtime.IllegalStateException;
import antlr.v4.runtime.WritableToken;
import antlr.v4.runtime.misc.Interval;

// Class UnbufferedTokenStream
/**
 * TODO add class description
 */
class UnbufferedTokenStream : TokenStream
{

    protected TokenSource tokenSource;

    /**
     * @uml
     * A moving window buffer of the data being scanned. While there's a marker,
     * we keep adding to buffer. Otherwise, {@link #consume consume()} resets so
     * we start filling at index 0 again.
     */
    protected Token[] tokens;

    /**
     * @uml
     * The number of tokens currently in {@link #tokens tokens}.
     *
     *  <p>This is not the buffer capacity, that's {@code tokens.length}.</p>
     */
    protected int n;

    /**
     * @uml
     * 0..n-1 index into {@link #tokens tokens} of next token.
     *
     * <p>The {@code LT(1)} token is {@code tokens[p]}. If {@code p == n}, we are
     * out of buffered tokens.</p>
     */
    protected int p = 0;

    /**
     * @uml
     * Count up with {@link #mark mark()} and down with
     * {@link #release release()}. When we {@code release()} the last mark,
     * {@code numMarkers} reaches 0 and we reset the buffer. Copy
     * {@code tokens[p]..tokens[n-1]} to {@code tokens[0]..tokens[(n-1)-p]}.
     */
    protected int numMarkers = 0;

    protected Token lastToken;

    protected Token lastTokenBufferStart;

    protected int currentTokenIndex = 0;

    public this(TokenSource tokenSource)
    {
	this(tokenSource, 256);
    }

    public this(TokenSource tokenSource, int bufferSize)
    {
	this.tokenSource = tokenSource;
        tokens = new Token[bufferSize];
        n = 0;
        fill(1); // prime the pump
    }

    public Token get(int i)
    {
	int bufferStartIndex = getBufferStartIndex();
        assert(i < bufferStartIndex || i >= bufferStartIndex + n,
               format("get(%1$s) outside buffer: %2$s..%3$s", i, bufferStartIndex,
                      bufferStartIndex+n));
        return tokens[i - bufferStartIndex];
    }

    public Token LT(int i)
    {
	if ( i==-1 ) {
            return lastToken;
        }

        sync(i);
        int index = p + i - 1;
        assert(index >= 0,  format("LT(%s) gives negative index",i));
        if ( index >= n ) {
            assert (n > 0 && tokens[n-1].getType() == TokenConstantDefinition.EOF);
            return tokens[n-1];
        }
        return tokens[index];
    }

    public int LA(int i)
    {
	return LT(i).getType();
    }

    public TokenSource getTokenSource()
    {
	return tokenSource;
    }

    public string getText()
    {
	return "";
    }

    public string getText(RuleContext ctx)
    {
	return getText(ctx.getSourceInterval());
    }

    public string getText(Token start, Token stop)
    {
        return getText(Interval.of(start.getTokenIndex(), stop.getTokenIndex()));
    }

    public void consume()
    {
	if (LA(1) == TokenConstantDefinition.EOF) {
            throw new IllegalStateException("cannot consume EOF");
        }
        // buf always has at least tokens[p==0] in this method due to ctor
        lastToken = tokens[p];   // track last token for LT(-1)
        // if we're at last token and no markers, opportunity to flush buffer
        if ( p == n-1 && numMarkers==0 ) {
            n = 0;
            p = -1; // p++ will leave this at 0
            lastTokenBufferStart = lastToken;
        }
        p++;
        currentTokenIndex++;
        sync(1);
    }

    /**
     * Make sure we have 'need' elements from current position {@link #p p}. Last valid
     *  {@code p} index is {@code tokens.length-1}.  {@code p+need-1} is the tokens index 'need' elements
     *  ahead.  If we need 1 element, {@code (p+1-1)==p} must be less than {@code tokens.length}.
     */
    protected void sync(int want)
    {
	int need = (p+want-1) - n + 1; // how many more elements we need?
        if ( need > 0 ) {
            fill(need);
        }
    }

    /**
     * Add {@code n} elements to the buffer. Returns the number of tokens
     * actually added to the buffer. If the return value is less than {@code n},
     * then EOF was reached before {@code n} tokens could be added.
     */
    protected int fill(int n)
    {
	for (int i=0; i<n; i++) {
            if (this.n > 0 && tokens[this.n-1].getType() == TokenConstantDefinition.EOF) {
                return i;
            }
            Token t = tokenSource.nextToken();
            add(t);
        }
        return n;
    }

    protected void add(Token t)
    {
	if (n >= tokens.length) {
            tokens.length = tokens.length * 2;
        }
        if (cast(WritableToken)t) {
            (cast(WritableToken)t).setTokenIndex(getBufferStartIndex() + n);
        }
        tokens[n++] = t;
    }

    /**
     * Return a marker that we can release later.
     *
     * <p>The specific marker value used for this class allows for some level of
     * protection against misuse where {@code seek()} is called on a mark or
     * {@code release()} is called in the wrong order.</p>
     */
    public int mark()
    {
	if (numMarkers == 0) {
            lastTokenBufferStart = lastToken;
        }
        int mark = -numMarkers - 1;
        numMarkers++;
        return mark;
    }

    public void release(int marker)
    {
	int expectedMark = -numMarkers;
        if ( marker!=expectedMark ) {
            throw new IllegalStateException("release() called with an invalid marker.");
        }

        numMarkers--;
        if (numMarkers == 0) { // can we release buffer?
            if (p > 0) {
                // Copy tokens[p]..tokens[n-1] to tokens[0]..tokens[(n-1)-p], reset ptrs
                // p is last valid token; move nothing if p==n as we have no valid char
                // System.arraycopy(tokens, p, tokens, 0, n - p); // shift n-p tokens from p to 0
                tokens = tokens[p..(n-p)];
                n = n - p;
                p = 0;
            }
            lastTokenBufferStart = lastToken;
        }
    }

    /**
     * @uml
     * @override
     */
    public override int index()
    {
        return currentTokenIndex;
    }

    public void seek(int index)
    {
	if (index == currentTokenIndex) {
            return;
        }

        if (index > currentTokenIndex) {
            sync(index - currentTokenIndex);
            index = min(index, getBufferStartIndex() + n - 1);
        }

        int bufferStartIndex = getBufferStartIndex();
        int i = index - bufferStartIndex;
        if ( i < 0 ) {
            throw new IllegalArgumentException("cannot seek to negative index " ~
                                               to!string(index));
        }
        else if (i >= n) {
            auto msg = format("seek to index outside buffer: %1$s not in %2$s..%3$s",
                              index, bufferStartIndex, bufferStartIndex + n);
            throw new UnsupportedOperationException(msg);
        }

        p = i;
        currentTokenIndex = index;
        if (p == 0) {
            lastToken = lastTokenBufferStart;
        }
        else {
            lastToken = tokens[p-1];
        }

    }

    public int size()
    {
        throw new UnsupportedOperationException("Unbuffered stream cannot know its size");
    }

    public string getSourceName()
    {
        return tokenSource.getSourceName();
    }

    public string getText(Interval interval)
    {
	int bufferStartIndex = getBufferStartIndex();
        int bufferStopIndex = bufferStartIndex + to!int(tokens.length) - 1;

        int start = interval.a;
        int stop = interval.b;
        if (start < bufferStartIndex || stop > bufferStopIndex) {
            auto msg = format("interval %1$s not in token buffer window: %2$s..%3$s",
                              interval, bufferStartIndex, bufferStopIndex);
            throw new UnsupportedOperationException(msg);
        }

        int a = start - bufferStartIndex;
        int b = stop - bufferStartIndex;

        auto buf = appender!string;
        for (int i = a; i <= b; i++) {
            Token t = tokens[i];
            buf.put(t.getText);
        }

        return buf.data;
    }

    protected int getBufferStartIndex()
    {
	return currentTokenIndex - p;
    }

}

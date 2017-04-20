module antlr.v4.runtime.BufferedTokenStream;

import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.TokenSource;

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

    /**
     * @uml
     * @override
     */
    public override int index()
    {
        return p;
    }

    /**
     * @uml
     * @override
     */
    public override int mark()
    {
        return 0;
    }

    /**
     * @uml
     * @override
     */
    public override void release(int marker)
    {
        // no resources to release
    }

    public void reset()
    {
        seek(0);
    }

    /**
     * @uml
     * @override
     */
    public override void seek(int index)
    {
        lazyInit();
        p = adjustSeekIndex(index);
    }

    /**
     * @uml
     * @override
     */
    public override int size()
    {
        return tokens.length;
    }

    /**
     * @uml
     * @override
     */
    public override void consume()
    {
        bool skipEofCheck;
        if (p >= 0) {
            if (fetchedEOF) {
                // the last token in tokens is EOF. skip check if p indexes any
                // fetched token except the last.
                skipEofCheck = p < tokens.size() - 1;
            }
            else {
                // no EOF token in tokens. skip check if p indexes a fetched token.
                skipEofCheck = p < tokens.size();
            }
        }
        else {
            // not yet initialized
            skipEofCheck = false;
        }

        if (!skipEofCheck && LA(1) == EOF) {
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
        int n = i - tokens.length + 1; // how many more elements we need?
        //System.out.println("sync("+i+") needs "+n);
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
            if (t.classinstance == WritableToken.classinstance) {
                (cast(WritableToken)t).setTokenIndex(tokens.size());
            }
            tokens ~= t;
            if (t.getType() == Token.EOF) {
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
    {
    }

    public Token LA(int i)
    {
    }

    public Token LB(int k)
    {
    }

    /**
     * @uml
     * @override
     */
    public override Token LT(int k)
    {
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
    public int adjustSeekIndex(int i)
    {
    }

}

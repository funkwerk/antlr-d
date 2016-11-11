module antlr.v4.runtime.UnbufferedTokenStream;

import antlr.v4.runtime.TokenStream;

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

}

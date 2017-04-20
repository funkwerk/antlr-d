module antlr.v4.runtime.ListTokenSource;

import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenFactory;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.CommonTokenFactory;
import antlr.v4.runtime.CommonToken;

// Class ListTokenSource
/**
 * TODO add class description
 * @uml
 * Provides an implementation of {@link TokenSource} as a wrapper around a list
 * of {@link Token} objects.
 *
 * <p>If the final token in the list is an {@link Token#EOF} token, it will be used
 * as the EOF token for every call to {@link #nextToken} after the end of the
 * list is reached. Otherwise, an EOF token will be created.</p>
 */
class ListTokenSource : TokenSource
{

    /**
     * @uml
     * The wrapped collection of {@link Token} objects to return.
     */
    public Token[] tokens;

    /**
     * @uml
     * The name of the input source. If this value is {@code null}, a call to
     * {@link #getSourceName} should return the source name used to create the
     * the next token in {@link #tokens} (or the previous token if the end of
     * the input has been reached).
     */
    private string sourceName;

    /**
     * @uml
     * The index into {@link #tokens} of token to return by the next call to
     * {@link #nextToken}. The end of the input is indicated by this value
     * being greater than or equal to the number of items in {@link #tokens}.
     */
    protected int i;

    /**
     * @uml
     * This field caches the EOF token for the token source.
     */
    protected Token eofToken;

    /**
     * @uml
     * This is the backing field for {@link #getTokenFactory} and
     *  {@link setTokenFactory}.
     */
    public TokenFactory!CommonToken _factory;

    /**
     * @uml
     * Constructs a new {@link ListTokenSource} instance from the specified
     * collection of {@link Token} objects.
     *
     *  @param tokens The collection of {@link Token} objects to provide as a
     *  {@link TokenSource}.
     *  @exception NullPointerException if {@code tokens} is {@code null}
     */
    public this(Token[] tokens)
    {
        this(tokens, null);
    }

    /**
     * @uml
     * Constructs a new {@link ListTokenSource} instance from the specified
     * collection of {@link Token} objects and source name.
     *
     *  @param tokens The collection of {@link Token} objects to provide as a
     * {@link TokenSource}.
     *  @param sourceName The name of the {@link TokenSource}. If this value is
     * {@code null}, {@link #getSourceName} will attempt to infer the name from
     * the next {@link Token} (or the previous token if the end of the input has
     * been reached).
     *
     *  @exception NullPointerException if {@code tokens} is {@code null}
     */
    public this(Token[] tokens, string sourceName)
    {
        _factory = CommonTokenFactory.DEFAULT;
	if (tokens is null) {
            throw new NullPointerException("tokens cannot be null");
        }
        this.tokens = tokens;
        this.sourceName = sourceName;
    }

    public int getCharPositionInLine()
    {
    }

    public Token nextToken()
    {
    }

    public int getLine()
    {
    }

    public CharStream getInputStream()
    {
    }

    public string getSourceName()
    {
    }

    public void setTokenFactory(TokenFactory!CommonToken factory)
    {
    }

    public TokenFactory!CommonToken getTokenFactory()
    {
    }

}

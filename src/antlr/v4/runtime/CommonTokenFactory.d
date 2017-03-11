module antlr.v4.runtime.CommonTokenFactory;

import antlr.v4.runtime.TokenFactory;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.TokenSource;

// Class CommonTokenFactory
/**
 * TODO add class description
 * @uml
 * This default implementation of {@link TokenFactory} creates
 * {@link CommonToken} objects.
 */
class CommonTokenFactory : TokenFactory!CommonToken
{

    /**
     * @uml
     * The default {@link CommonTokenFactory} instance.
     *
     * <p>
     * This token factory does not explicitly copy token text when constructing
     * tokens.</p>
     */
    public static TokenFactory!CommonToken DEFAULT;

    /**
     * @uml
     * Indicates whether {@link CommonToken#setText} should be called after
     * constructing tokens to explicitly set the text. This is useful for cases
     * where the input stream might not be able to provide arbitrary substrings
     * of text from the input after the lexer creates a token (e.g. the
     * implementation of {@link CharStream#getText} in
     * {@link UnbufferedCharStream} throws an
     * {@link UnsupportedOperationException}). Explicitly setting the token text
     * allows {@link Token#getText} to be called at any time regardless of the
     * input stream implementation.
     *
     * <p>
     * The default value is {@code false} to avoid the performance and memory
     * overhead of copying text for every token unless explicitly requested.</p>
     */
    protected bool copyText;

    /**
     * @uml
     * Constructs a {@link CommonTokenFactory} with the specified value for
     * {@link #copyText}.
     *
     * <p>
     * then {@code copyText} is {@code false}, the {@link #DEFAULT} instance
     * should be used instead of constructing a new instance.</p>
     *
     *  @param copyText The value for {@link #copyText}.
     */
    public this(bool copyText)
    {
    }

    /**
     * @uml
     * Constructs a {@link CommonTokenFactory} with {@link #copyText} set to
     * {@code false}.
     *
     * <p>
     * The {@link #DEFAULT} instance should be used instead of calling this
     * directly.</p>
     */
    public this()
    {
    }

    public CommonToken create(CharStream[TokenSource] source, int type, string text, int channel,
        int start, int stop, int line, int charPositionInLine)
    {
    }

    public CommonToken create(int type, string text)
    {
    }

}

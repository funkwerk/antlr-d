module antlr.v4.runtime.CommonTokenFactory;

import std.typecons;
import antlr.v4.runtime.TokenFactory;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.misc.Interval;

alias TokenFactorySourcePair = Tuple!(TokenSource, "a", CharStream, "b");

// Class CommonTokenFactory
/**
 * This default implementation of {@link TokenFactory} creates
 * {@link CommonToken} objects.
 * <p>
 * This token factory does not explicitly copy token text when constructing
 * tokens.</p>
 */
class CommonTokenFactory : TokenFactory!CommonToken
{

    /**
     * The single instance of CommonTokenFactory.
     * @uml
     * The default {@link CommonTokenFactory} instance.
     *
     * <p>
     * This token factory does not explicitly copy token text when constructing
     * tokens.</p>
     */
    private static __gshared CommonTokenFactory instance_;

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
        this.copyText = copyText;
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
        this(false);
    }

    public CommonToken create(TokenFactorySourcePair source, int type, string text, int channel,
        int start, int stop, int line, int charPositionInLine)
    {
        CommonToken t = new CommonToken(source, type, channel, start, stop);
        t.setLine(line);
        t.setCharPositionInLine(charPositionInLine);
        if (text !is null) {
            t.setText(text);
        }
        else if (copyText && source.b !is null ) {
            t.setText(source.b.getText(Interval.of(start,stop)));
        }
        return t;
    }

    public CommonToken create(int type, string text)
    {
        return new CommonToken(type, text);
    }

    /**
     * Creates the single instance of CommonTokenFactory.
     * @uml
     * @shared
     */
    private shared static this()
    {
        instance_ = new CommonTokenFactory;
    }

    /**
     * Returns: A single default instance of CommonTokenFactory.
     */
    public static CommonTokenFactory DEFAULT()
    {
        return instance_;
    }

}

module antlr.v4.runtime.Token;

import antlr.v4.runtime.IntStream;

// Class Token
/**
 * TODO add class description
 * @uml
 * A token has properties: text, type, line, character position in the line
 * (so we can ignore tabs), token channel, index, and source from which
 * we obtained this token.
 */
class Token
{

    public static immutable int INVALID_TYPE = 0;

    /**
     * @uml
     * During lookahead operations, this "token" signifies we hit rule end ATN state
     * and did not follow it despite needing to.
     */
    public static immutable int EPSILON = -2;

    public static immutable int MIN_USER_TOKEN_TYPE = 1;

    public static const int EOF = IntStream.EOF;

    /**
     * @uml
     * All tokens go to the parser (unless skip() is called in that rule)
     * on a particular "channel".  The parser tunes to a particular channel
     * so that whitespace etc... can go to the parser on a "hidden" channel.
     */
    public static immutable int DEFAULT_CHANNEL = 0;

    /**
     * @uml
     * Anything on different channel than DEFAULT_CHANNEL is not parsed
     * by parser.
     */
    public static immutable int HIDDEN_CHANNEL = 1;

    /**
     * @uml
     * This is the minimum constant value which can be assigned to a
     * ser-defined token channel.
     *
     * <p>
     * The non-negative numbers less than {@link #MIN_USER_CHANNEL_VALUE} are
     * assigned to the predefined channels {@link #DEFAULT_CHANNEL} and
     *  {@link #HIDDEN_CHANNEL}.</p>
     *
     *  @see Token#getChannel()
     */
    public static immutable int MIN_USER_CHANNEL_VALUE = 2;

    /**
     * @uml
     * Get the text of the token.
     */
    abstract public string getText();

    /**
     * @uml
     * Get the token type of the token
     */
    abstract public int getType();

    /**
     * @uml
     * The line number on which the 1st character of this token was matched,
     * line=1..n
     */
    abstract public int getLine();

    /**
     * @uml
     * The index of the first character of this token relative to the
     * beginning of the line at which it occurs, 0..n-1
     */
    abstract public int getCharPositionInLine();

    /**
     * @uml
     * Return the channel this token. Each token can arrive at the parser
     * on a different channel, but the parser only "tunes" to a single channel.
     * The parser ignores everything not on DEFAULT_CHANNEL.
     */
    abstract public int getChannel();

    /**
     * @uml
     * An index from 0..n-1 of the token object in the input stream.
     * This must be valid in order to print token streams and
     * use TokenRewriteStream.
     *
     * Return -1 to indicate that this token was conjured up since
     * it doesn't have a valid index.
     */
    abstract public int getTokenIndex();

    /**
     * @uml
     * The starting character index of the token
     * This method is optional; return -1 if not implemented.
     */
    abstract public int getStartIndex();

    /**
     * @uml
     * The last character index of the token.
     * This method is optional; return -1 if not implemented.
     */
    abstract public int getStopIndex();

    /**
     * @uml
     * Gets the {@link TokenSource} which created this token.
     */
    abstract public void getTokenSource();

    /**
     * @uml
     * Gets the {@link CharStream} from which this token was derived.
     */
    abstract public void getInputStream();

}

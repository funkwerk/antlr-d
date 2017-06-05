module antlr.v4.runtime.TokenConstants;

import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.IntStream;

// Class TokenConstants
/**
 * @uml
 * Token constant definitions
 */
class TokenConstants
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

}

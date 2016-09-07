module antlr.v4.runtime.Vocabulary;

// Interface Vocabulary
/**
 * TODO add interface description
 * @uml
 * This interface provides information about the vocabulary used by a
 * ecognizer.
 *
 *  @see Recognizer#getVocabulary()
 *  @author Sam Harwell
 */
interface Vocabulary
{

    /**
     * @uml
     * Returns the highest token type value. It can be used to iterate from
     * zero to that number, inclusively, thus querying all stored entries.
     *  @return the highest token type value
     */
    public int getMaxTokenType();

    /**
     * @uml
     * Gets the display name of a token type.
     *
     * <p>ANTLR provides a default implementation of this method, but
     * applications are free to override the behavior in any manner which makes
     * sense for the application. The default implementation returns the first
     * result from the following list which produces a non-{@code null}
     * result.</p>
     *
     * <ol>
     * <li>The result of {@link #getLiteralName}</li>
     * <li>The result of {@link #getSymbolicName}</li>
     * <li>The result of {@link Integer#toString}</li>
     * </ol>
     *
     *  @param tokenType The token type.
     *
     *  @return The display name of the token type, for use in error reporting or
     *  other user-visible messages which reference specific token types.
     */
    public string getDisplayName(int tokenType);

}

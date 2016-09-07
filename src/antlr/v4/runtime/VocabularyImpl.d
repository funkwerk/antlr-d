module antlr.v4.runtime.VocabularyImpl;

import antlr.v4.runtime.Vocabulary;
import std.conv;

// Class VocabularyImpl
/**
 * TODO add class description
 */
class VocabularyImpl : Vocabulary
{

    /**
     * @uml
     * @final
     */
    public static const string[] EMPTY_NAMES;

    public string[] literalNames;

    public string[] symbolicNames;

    public string[] displayNames;

    /**
     * @uml
     * @final
     */
    private int maxTokenType;

    public int getMaxTokenType()
    {
        return maxTokenType;
    }

    public string getDisplayName(int tokenType)
    {
        if (tokenType >= 0 && tokenType < displayNames.length) {
            string displayName = displayNames[tokenType];
            if (displayName !is null) {
                return displayName;
            }
        }

        string literalName = getLiteralName(tokenType);
        if (literalName !is null) {
            return literalName;
        }

        String symbolicName = getSymbolicName(tokenType);
        if (symbolicName != null) {
            return symbolicName;
        }

        return to!string(tokenType);
    }

}

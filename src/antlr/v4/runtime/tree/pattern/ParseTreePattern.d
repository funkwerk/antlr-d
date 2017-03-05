module antlr.v4.runtime.tree.pattern.ParseTreePattern;

// Class ParseTreePattern
/**
 * @uml
 * A pattern like {@code <ID> = <expr>;} converted to a {@link ParseTree} by
 * {@link ParseTreePatternMatcher#compile(String, int)}.
 */
class ParseTreePattern
{

    /**
     * @uml
     * This is the backing field for {@link #getPatternRuleIndex()}.
     * @final
     */
    private int patternRuleIndex;

    /**
     * @uml
     * This is the backing field for {@link #getPattern()}.
     * @final
     */
    private string pattern;

}

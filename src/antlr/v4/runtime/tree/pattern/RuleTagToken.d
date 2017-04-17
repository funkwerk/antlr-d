module antlr.v4.runtime.tree.pattern.RuleTagToken;

import antlr.v4.runtime.Token;

// Class RuleTagToken
/**
 * @uml
 * A {@link Token} object representing an entire subtree matched by a parser
 * rule; e.g., {@code <expr>}. These tokens are created for {@link TagChunk}
 * chunks where the tag corresponds to a parser rule.
 */
class RuleTagToken : Token
{

    /**
     * @uml
     * This is the backing field for {@link #getRuleName}.
     */
    private string ruleName;

    /**
     * @uml
     * The token type for the current token. This is the token type assigned to
     * the bypass alternative for the rule during ATN deserialization.
     */
    private int bypassTokenType;

    /**
     * @uml
     * This is the backing field for {@link #getLabel}.
     */
    private string label;

    /**
     * @uml
     * Constructs a new instance of {@link RuleTagToken} with the specified rule
     * name and bypass token type and no label.
     *
     *  @param ruleName The name of the parser rule this rule tag matches.
     *  @param bypassTokenType The bypass token type assigned to the parser rule.
     *
     *  @exception IllegalArgumentException if {@code ruleName} is {@code null}
     * or empty.
     */
    public this(string ruleName, int bypassTokenType)
    {
    }

    /**
     * @uml
     * Constructs a new instance of {@link RuleTagToken} with the specified rule
     *  name, bypass token type, and label.
     *
     *  @param ruleName The name of the parser rule this rule tag matches.
     *  @param bypassTokenType The bypass token type assigned to the parser rule.
     *  @param label The label associated with the rule tag, or {@code null} if
     * the rule tag is unlabeled.
     *
     *  @exception IllegalArgumentException if {@code ruleName} is {@code null}
     *  or empty.
     */
    public this(string ruleName, int bypassTokenType, string label)
    {
    }

    public string getRuleName()
    {
    }

    public string getLabel()
    {
    }

    /**
     * @uml
     * @override
     */
    public override int getChannel()
    {
    }

    /**
     * @uml
     * @override
     */
    public override string getText()
    {
    }

    /**
     * @uml
     * @override
     */
    public override int getType()
    {
    }

}

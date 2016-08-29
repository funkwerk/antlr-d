module antlr.v4.runtime.tree.Tree;

// Interface Tree
/**
 * @uml
 * The basic notion of a tree has a parent, a payload, and a list of children.
 * It is the most abstract interface for all the trees used by ANTLR.
 */
interface Tree
{

    /**
     * @uml
     * The parent of this node. If the return value is null, then this
     * node is the root of the tree.
     */
    public Tree getParent();

    /**
     * @uml
     * This method returns whatever object represents the data at this note. For
     * example, for parse trees, the payload can be a {@link Token} representing
     * a leaf node or a {@link RuleContext} object representing a rule
     * invocation. For abstract syntax trees (ASTs), this is a {@link Token}
     * object.
     */
    public Object getPayload();

    /**
     * @uml
     * If there are children, get the {@code i}th value indexed from 0.
     */
    public Tree getChild(int i);

    /**
     * @uml
     * How many children are there? If there is none, then this
     * node represents a leaf node.
     */
    public int getChildCount();

    public string toStringTree();

}

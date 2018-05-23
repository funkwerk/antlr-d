module antlr.v4.runtime.tree.ParseTreeProperty;

import antlr.v4.runtime.tree.ParseTree;

// Class Template ParseTreeProperty
/**
 * TODO add class description
 */
class ParseTreeProperty(V)
{

    public V[ParseTree] annotations;

    public V get(ParseTree node)
    {
        return annotations[node];
    }

    private void put(ParseTree node, V value)
    {
        annotations[node] = value;
    }

    public V removeFrom(ParseTree node)
    {
        auto n = annotations[node];
        if (annotations.remove(node)) {
            return n;
        }
        assert (false, "ParseTreeProperty object contains unknown element!");
    }

}

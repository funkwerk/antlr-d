module antlr.v4.runtime.tree.xpath.XPathWildcardAnywhereElement;

import antlr.v4.runtime.tree.xpath.XPath;
import antlr.v4.runtime.tree.xpath.XPathElement;
import antlr.v4.runtime.tree.ParseTree;

// Class XPathWildcardAnywhereElement
/**
 * TODO add class description
 */
class XPathWildcardAnywhereElement : XPathElement
{

    public this()
    {
        super(XPath.WILDCARD);
    }

    /**
     * @uml
     * @override
     */
    public override ParseTree[] evaluate(ParseTree t)
    {
    }

}

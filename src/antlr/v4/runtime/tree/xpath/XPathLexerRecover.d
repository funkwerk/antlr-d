module antlr.v4.runtime.tree.xpath.XPathLexerRecover;

import antlr.v4.runtime.tree.xpath.XPathLexer;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.LexerNoViableAltException;

// Class XPathLexerRecover
/**
 * TODO add class description
 */
class XPathLexerRecover : XPathLexer
{

    public this(ANTLRInputStream ins)
    {
        super(ins);
    }

    /**
     * @uml
     * @override
     */
    public override void recover(LexerNoViableAltException e)
    {
    }

}

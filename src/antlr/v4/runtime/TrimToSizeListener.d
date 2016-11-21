module antlr.v4.runtime.TrimToSizeListener;

import antlr.v4.runtime.tree.ParseTreeListener;
import antlr.v4.runtime.ParserRuleContext;

// Class TrimToSizeListener
/**
 * TODO add class description
 */
class TrimToSizeListener : ParseTreeListener
{

    public static TrimToSizeListener INSTANCE = new TrimToSizeListener();

    public void enterEveryRule(ParserRuleContext ctx)
    {
    }

    public void visitTerminal()
    {
    }

    public void visitErrorNode()
    {
    }

    /**
     * @uml
     * @override
     */
    public override void exitEveryRule(ParserRuleContext ctx)
    {
        // if (ctx.children.classinfo == ArrayList.classinfo) {
        //     ((ArrayList<?>)ctx.children).trimToSize();
        // }
    }

}

module antlr.v4.runtime.TraceListener;

import std.stdio;
import antlr.v4.runtime.tree.ParseTreeListener;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.ParserRuleContext;

// Class TraceListener
/**
 * TODO add class description
 */
class TraceListener : Parser, ParseTreeListener
{

    public void enterEveryRule(ParserRuleContext ctx)
    {
        writeln("enter   " ~ getRuleNames()[ctx.getRuleIndex()] ~
                ", LT(1)=" ~ _input.LT(1).getText());
    }

    public void visitTerminal()
    {
        writeln("consume " ~ node.getSymbol() ~ " rule " ~
                getRuleNames()[_ctx.getRuleIndex()]);
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
        writeln("exit   " ~ getRuleNames()[ctx.getRuleIndex()] ~
                ", LT(1)=" ~ _input.LT(1).getText());
    }

}

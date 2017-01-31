module antlr.v4.runtime.ParseTreeListener;

import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.TerminalNode;

// Interface ParseTreeListener
/**
 * @uml
 * This interface describes the minimal core of methods triggered
 * by {@link ParseTreeWalker}. E.g.,
 *
 * ParseTreeWalker walker = new ParseTreeWalker();
 * walker.walk(myParseTreeListener, myParseTree); <-- triggers events in your listener
 *
 * If you want to trigger events in multiple listeners during a single
 * tree walk, you can use the ParseTreeDispatcher object available at
 *
 * 	https://github.com/antlr/antlr4/issues/841
 */
interface ParseTreeListener
{

    public void visitTerminal(TerminalNode node);

    public void visitErrorNode(ErrorNode node);

    public void enterEveryRule(ParserRuleContext ctx);

    public void exitEveryRule(ParserRuleContext ctx);

}

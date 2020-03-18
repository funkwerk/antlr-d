// Generated from Expr.g4 by ANTLR 4.7.2

import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.TerminalNode;
import ExprListener;
import ExprParser: ExprParser;

/**
 * This class provides an empty implementation of {@link ExprListener},
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
public class ExprBaseListener : ExprListener {
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterProg(ExprParser.ProgContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitProg(ExprParser.ProgContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDiv(ExprParser.DivContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitDiv(ExprParser.DivContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterAdd(ExprParser.AddContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitAdd(ExprParser.AddContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterSub(ExprParser.SubContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitSub(ExprParser.SubContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterMul(ExprParser.MulContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitMul(ExprParser.MulContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterBracketExpr(ExprParser.BracketExprContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitBracketExpr(ExprParser.BracketExprContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterInt(ExprParser.IntContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitInt(ExprParser.IntContext ctx) { }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterEveryRule(ParserRuleContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitEveryRule(ParserRuleContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void visitTerminal(TerminalNode node) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void visitErrorNode(ErrorNode node) { }
}
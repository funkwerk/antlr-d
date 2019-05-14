// Generated from doc/examples/simple_expression/Expr.g4 by ANTLR 4.7.2
module PrintExprVisitor;

import ExprBaseVisitor;
import std.variant : Variant;
import ExprParser : ExprParser;

/**
 * This class provides an empty implementation of {@link ExprVisitor},
 * which can be extended to create a visitor which only needs to handle a subset
 * of the available methods.
 *
 * @param Variant The return type of the visit operation. Use {@link void} for
 * operations with no return type.
 */
public class PrintExprVisitor : ExprBaseVisitor {
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitProg(ExprParser.ProgContext ctx) {
        auto res = visit(ctx.children[0]).get!(int);
        return Variant(res);
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitDiv(ExprParser.DivContext ctx) {
        auto res = visit(ctx.children[0]).get!(int) /
            visit(ctx.children[2]).get!(int);
        return Variant(res);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitAdd(ExprParser.AddContext ctx) {
        auto res = visit(ctx.children[0]).get!(int) +
            visit(ctx.children[2]).get!(int);
        return Variant(res);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitSub(ExprParser.SubContext ctx) {
        auto res = visit(ctx.children[0]).get!(int) -
            visit(ctx.children[2]).get!(int);
        return Variant(res);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitMul(ExprParser.MulContext ctx) {
        auto res = visit(ctx.children[0]).get!(int) *
            visit(ctx.children[2]).get!(int);
        return Variant(res);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitBracketExpr(ExprParser.BracketExprContext ctx) {
        auto res = visit(ctx.children[1]).get!(int);
        return Variant(res);
    }
    /**
     * The terminal element: interger number
     */
    override public Variant visitInt(ExprParser.IntContext ctx) {
        import std.conv;
        return Variant(to!int(ctx.getText.get!(string)));
    }
}

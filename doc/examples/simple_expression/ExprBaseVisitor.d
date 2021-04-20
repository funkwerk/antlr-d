// Generated from doc/examples/simple_expression/Expr.g4 by ANTLR 4.9.2
module ExprBaseVisitor;

import antlr.v4.runtime.tree.AbstractParseTreeVisitor;
import std.variant : Variant;
import ExprParser : ExprParser;
import ExprVisitor : ExprVisitor;

/**
 * This class provides an empty implementation of {@link ExprVisitor},
 * which can be extended to create a visitor which only needs to handle a subset
 * of the available methods.
 *
 * @param Variant The return type of the visit operation. Use {@link void} for
 * operations with no return type.
 */
public class ExprBaseVisitor : AbstractParseTreeVisitor, ExprVisitor {
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitProg(ExprParser.ProgContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitDiv(ExprParser.DivContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitAdd(ExprParser.AddContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitSub(ExprParser.SubContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitMul(ExprParser.MulContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitBracketExpr(ExprParser.BracketExprContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitInt(ExprParser.IntContext ctx) { return visitChildren(ctx); }
}
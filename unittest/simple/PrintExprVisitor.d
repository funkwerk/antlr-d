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
 * @param T The return type of the visit operation. Use {@link void} for
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
        return Variant(1);
        // return visitChildren(ctx);
         }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitExpr(ExprParser.ExprContext ctx) { return visitChildren(ctx); }
}

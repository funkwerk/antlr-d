module PrintExprVisitor;

import ExprBaseVisitor : ExprBaseVisitor;
import ExprParser : ExprParser;
import std.variant : Variant;

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
        //auto res = visit(ctx.children[0]).get!(size_t);
        return Variant("334");
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitDiv(ExprParser.DivContext ctx) {
        //auto res = visit(ctx.children[0]).get!(size_t) /
            //visit(ctx.children[2]).get!(size_t);
        return Variant("123");
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitAdd(ExprParser.AddContext ctx) {
        //auto res = visit(ctx.children[0]).get!(size_t) +
            //visit(ctx.children[2]).get!(size_t);
        return Variant("xx");
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitSub(ExprParser.SubContext ctx) {
        //auto res = visit(ctx.children[0]).get!(size_t) -
            //visit(ctx.children[2]).get!(size_t);
        return Variant("23");
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitMul(ExprParser.MulContext ctx) {
        //auto res = visit(ctx.children[0]).get!(size_t) *
            //visit(ctx.children[2]).get!(size_t);
        return Variant("ee");
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    override public Variant visitBracketExpr(ExprParser.BracketExprContext ctx) {
        auto res = visit(ctx.children[1]).get!(size_t);
        return Variant("99");
    }
    /**
     * The terminal element: integer number
     */
    override public Variant visitInt(ExprParser.IntContext ctx) {
        import std.conv;
        //return Variant(to!int(ctx.getText.get!(size_t)));
        return Variant("1");
    }
}

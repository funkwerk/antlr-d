// Generated from doc/examples/simple_expression/Expr.g4 by ANTLR 4.7.2
import antlr.v4.runtime.tree.AbstractParseTreeVisitor;
import std.variant : Variant;
import ExprVisitor;
import ExprParser : ExprParser;

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
	override public Variant visitExpr(ExprParser.ExprContext ctx) { return visitChildren(ctx); }
}
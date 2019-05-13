// Generated from doc/examples/simple_expression/Expr.g4 by ANTLR 4.7.2
import antlr.v4.runtime.tree.ParseTreeVisitor;
import std.variant : Variant;
import ExprParser : ExprParser;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link ExprParser}.
 *
 * @param Variant The return type of the visit operation. Use {@link void} for
 * operations with no return type.
 */
public interface ExprVisitor : ParseTreeVisitor {
	/**
	 * Visit a parse tree produced by {@link ExprParser#prog}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	public Variant visitProg(ExprParser.ProgContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	public Variant visitExpr(ExprParser.ExprContext ctx);
}
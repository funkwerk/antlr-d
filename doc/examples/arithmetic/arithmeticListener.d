// Generated from doc/examples/arithmetic/arithmetic.g4 by ANTLR 4.7.1
import antlr.v4.runtime.tree.ParseTreeListener;
import arithmeticParser : arithmeticParser;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link arithmeticParser}.
 */
public interface arithmeticListener : ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#equation}.
	 * @param ctx the parse tree
	 */
	void enterEquation(arithmeticParser.EquationContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#equation}.
	 * @param ctx the parse tree
	 */
	void exitEquation(arithmeticParser.EquationContext ctx);
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(arithmeticParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(arithmeticParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#term}.
	 * @param ctx the parse tree
	 */
	void enterTerm(arithmeticParser.TermContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#term}.
	 * @param ctx the parse tree
	 */
	void exitTerm(arithmeticParser.TermContext ctx);
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#factor}.
	 * @param ctx the parse tree
	 */
	void enterFactor(arithmeticParser.FactorContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#factor}.
	 * @param ctx the parse tree
	 */
	void exitFactor(arithmeticParser.FactorContext ctx);
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#signedAtom}.
	 * @param ctx the parse tree
	 */
	void enterSignedAtom(arithmeticParser.SignedAtomContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#signedAtom}.
	 * @param ctx the parse tree
	 */
	void exitSignedAtom(arithmeticParser.SignedAtomContext ctx);
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterAtom(arithmeticParser.AtomContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitAtom(arithmeticParser.AtomContext ctx);
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#scientific}.
	 * @param ctx the parse tree
	 */
	void enterScientific(arithmeticParser.ScientificContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#scientific}.
	 * @param ctx the parse tree
	 */
	void exitScientific(arithmeticParser.ScientificContext ctx);
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#variable}.
	 * @param ctx the parse tree
	 */
	void enterVariable(arithmeticParser.VariableContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#variable}.
	 * @param ctx the parse tree
	 */
	void exitVariable(arithmeticParser.VariableContext ctx);
	/**
	 * Enter a parse tree produced by {@link arithmeticParser#relop}.
	 * @param ctx the parse tree
	 */
	void enterRelop(arithmeticParser.RelopContext ctx);
	/**
	 * Exit a parse tree produced by {@link arithmeticParser#relop}.
	 * @param ctx the parse tree
	 */
	void exitRelop(arithmeticParser.RelopContext ctx);
}
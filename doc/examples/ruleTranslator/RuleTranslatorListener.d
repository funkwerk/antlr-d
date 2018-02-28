// Generated from RuleTranslator.g4 by ANTLR 4.7.1
import antlr.v4.runtime.tree.ParseTreeListener;
import RuleTranslatorParser : RuleTranslatorParser;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link RuleTranslatorParser}.
 */
public interface RuleTranslatorListener : ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#file_input}.
	 * @param ctx the parse tree
	 */
	void enterFile_input(RuleTranslatorParser.File_inputContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#file_input}.
	 * @param ctx the parse tree
	 */
	void exitFile_input(RuleTranslatorParser.File_inputContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#rule_spec}.
	 * @param ctx the parse tree
	 */
	void enterRule_spec(RuleTranslatorParser.Rule_specContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#rule_spec}.
	 * @param ctx the parse tree
	 */
	void exitRule_spec(RuleTranslatorParser.Rule_specContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#rule_name}.
	 * @param ctx the parse tree
	 */
	void enterRule_name(RuleTranslatorParser.Rule_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#rule_name}.
	 * @param ctx the parse tree
	 */
	void exitRule_name(RuleTranslatorParser.Rule_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#rule_ID}.
	 * @param ctx the parse tree
	 */
	void enterRule_ID(RuleTranslatorParser.Rule_IDContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#rule_ID}.
	 * @param ctx the parse tree
	 */
	void exitRule_ID(RuleTranslatorParser.Rule_IDContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#lang}.
	 * @param ctx the parse tree
	 */
	void enterLang(RuleTranslatorParser.LangContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#lang}.
	 * @param ctx the parse tree
	 */
	void exitLang(RuleTranslatorParser.LangContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#base}.
	 * @param ctx the parse tree
	 */
	void enterBase(RuleTranslatorParser.BaseContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#base}.
	 * @param ctx the parse tree
	 */
	void exitBase(RuleTranslatorParser.BaseContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#base_rules}.
	 * @param ctx the parse tree
	 */
	void enterBase_rules(RuleTranslatorParser.Base_rulesContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#base_rules}.
	 * @param ctx the parse tree
	 */
	void exitBase_rules(RuleTranslatorParser.Base_rulesContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#funcdef}.
	 * @param ctx the parse tree
	 */
	void enterFuncdef(RuleTranslatorParser.FuncdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#funcdef}.
	 * @param ctx the parse tree
	 */
	void exitFuncdef(RuleTranslatorParser.FuncdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#parameters}.
	 * @param ctx the parse tree
	 */
	void enterParameters(RuleTranslatorParser.ParametersContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#parameters}.
	 * @param ctx the parse tree
	 */
	void exitParameters(RuleTranslatorParser.ParametersContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#typedargslist}.
	 * @param ctx the parse tree
	 */
	void enterTypedargslist(RuleTranslatorParser.TypedargslistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#typedargslist}.
	 * @param ctx the parse tree
	 */
	void exitTypedargslist(RuleTranslatorParser.TypedargslistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef(RuleTranslatorParser.TfpdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef(RuleTranslatorParser.TfpdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#varargslist}.
	 * @param ctx the parse tree
	 */
	void enterVarargslist(RuleTranslatorParser.VarargslistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#varargslist}.
	 * @param ctx the parse tree
	 */
	void exitVarargslist(RuleTranslatorParser.VarargslistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#vfpdef}.
	 * @param ctx the parse tree
	 */
	void enterVfpdef(RuleTranslatorParser.VfpdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#vfpdef}.
	 * @param ctx the parse tree
	 */
	void exitVfpdef(RuleTranslatorParser.VfpdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterStmt(RuleTranslatorParser.StmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitStmt(RuleTranslatorParser.StmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#simple_stmt}.
	 * @param ctx the parse tree
	 */
	void enterSimple_stmt(RuleTranslatorParser.Simple_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#simple_stmt}.
	 * @param ctx the parse tree
	 */
	void exitSimple_stmt(RuleTranslatorParser.Simple_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#small_stmt}.
	 * @param ctx the parse tree
	 */
	void enterSmall_stmt(RuleTranslatorParser.Small_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#small_stmt}.
	 * @param ctx the parse tree
	 */
	void exitSmall_stmt(RuleTranslatorParser.Small_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#string_stmt}.
	 * @param ctx the parse tree
	 */
	void enterString_stmt(RuleTranslatorParser.String_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#string_stmt}.
	 * @param ctx the parse tree
	 */
	void exitString_stmt(RuleTranslatorParser.String_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#funct_stmt}.
	 * @param ctx the parse tree
	 */
	void enterFunct_stmt(RuleTranslatorParser.Funct_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#funct_stmt}.
	 * @param ctx the parse tree
	 */
	void exitFunct_stmt(RuleTranslatorParser.Funct_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#expr_stmt}.
	 * @param ctx the parse tree
	 */
	void enterExpr_stmt(RuleTranslatorParser.Expr_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#expr_stmt}.
	 * @param ctx the parse tree
	 */
	void exitExpr_stmt(RuleTranslatorParser.Expr_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#annassign}.
	 * @param ctx the parse tree
	 */
	void enterAnnassign(RuleTranslatorParser.AnnassignContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#annassign}.
	 * @param ctx the parse tree
	 */
	void exitAnnassign(RuleTranslatorParser.AnnassignContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#testlist_star_expr}.
	 * @param ctx the parse tree
	 */
	void enterTestlist_star_expr(RuleTranslatorParser.Testlist_star_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#testlist_star_expr}.
	 * @param ctx the parse tree
	 */
	void exitTestlist_star_expr(RuleTranslatorParser.Testlist_star_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#flow_stmt}.
	 * @param ctx the parse tree
	 */
	void enterFlow_stmt(RuleTranslatorParser.Flow_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#flow_stmt}.
	 * @param ctx the parse tree
	 */
	void exitFlow_stmt(RuleTranslatorParser.Flow_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#break_stmt}.
	 * @param ctx the parse tree
	 */
	void enterBreak_stmt(RuleTranslatorParser.Break_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#break_stmt}.
	 * @param ctx the parse tree
	 */
	void exitBreak_stmt(RuleTranslatorParser.Break_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#continue_stmt}.
	 * @param ctx the parse tree
	 */
	void enterContinue_stmt(RuleTranslatorParser.Continue_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#continue_stmt}.
	 * @param ctx the parse tree
	 */
	void exitContinue_stmt(RuleTranslatorParser.Continue_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#return_stmt}.
	 * @param ctx the parse tree
	 */
	void enterReturn_stmt(RuleTranslatorParser.Return_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#return_stmt}.
	 * @param ctx the parse tree
	 */
	void exitReturn_stmt(RuleTranslatorParser.Return_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#dotted_as_name}.
	 * @param ctx the parse tree
	 */
	void enterDotted_as_name(RuleTranslatorParser.Dotted_as_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#dotted_as_name}.
	 * @param ctx the parse tree
	 */
	void exitDotted_as_name(RuleTranslatorParser.Dotted_as_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#dotted_as_names}.
	 * @param ctx the parse tree
	 */
	void enterDotted_as_names(RuleTranslatorParser.Dotted_as_namesContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#dotted_as_names}.
	 * @param ctx the parse tree
	 */
	void exitDotted_as_names(RuleTranslatorParser.Dotted_as_namesContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#dotted_name}.
	 * @param ctx the parse tree
	 */
	void enterDotted_name(RuleTranslatorParser.Dotted_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#dotted_name}.
	 * @param ctx the parse tree
	 */
	void exitDotted_name(RuleTranslatorParser.Dotted_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#compound_stmt}.
	 * @param ctx the parse tree
	 */
	void enterCompound_stmt(RuleTranslatorParser.Compound_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#compound_stmt}.
	 * @param ctx the parse tree
	 */
	void exitCompound_stmt(RuleTranslatorParser.Compound_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#if_stmt}.
	 * @param ctx the parse tree
	 */
	void enterIf_stmt(RuleTranslatorParser.If_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#if_stmt}.
	 * @param ctx the parse tree
	 */
	void exitIf_stmt(RuleTranslatorParser.If_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#while_stmt}.
	 * @param ctx the parse tree
	 */
	void enterWhile_stmt(RuleTranslatorParser.While_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#while_stmt}.
	 * @param ctx the parse tree
	 */
	void exitWhile_stmt(RuleTranslatorParser.While_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#for_stmt}.
	 * @param ctx the parse tree
	 */
	void enterFor_stmt(RuleTranslatorParser.For_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#for_stmt}.
	 * @param ctx the parse tree
	 */
	void exitFor_stmt(RuleTranslatorParser.For_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#with_stmt}.
	 * @param ctx the parse tree
	 */
	void enterWith_stmt(RuleTranslatorParser.With_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#with_stmt}.
	 * @param ctx the parse tree
	 */
	void exitWith_stmt(RuleTranslatorParser.With_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#with_item}.
	 * @param ctx the parse tree
	 */
	void enterWith_item(RuleTranslatorParser.With_itemContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#with_item}.
	 * @param ctx the parse tree
	 */
	void exitWith_item(RuleTranslatorParser.With_itemContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#suite}.
	 * @param ctx the parse tree
	 */
	void enterSuite(RuleTranslatorParser.SuiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#suite}.
	 * @param ctx the parse tree
	 */
	void exitSuite(RuleTranslatorParser.SuiteContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#test}.
	 * @param ctx the parse tree
	 */
	void enterTest(RuleTranslatorParser.TestContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#test}.
	 * @param ctx the parse tree
	 */
	void exitTest(RuleTranslatorParser.TestContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#test_nocond}.
	 * @param ctx the parse tree
	 */
	void enterTest_nocond(RuleTranslatorParser.Test_nocondContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#test_nocond}.
	 * @param ctx the parse tree
	 */
	void exitTest_nocond(RuleTranslatorParser.Test_nocondContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#or_test}.
	 * @param ctx the parse tree
	 */
	void enterOr_test(RuleTranslatorParser.Or_testContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#or_test}.
	 * @param ctx the parse tree
	 */
	void exitOr_test(RuleTranslatorParser.Or_testContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#and_test}.
	 * @param ctx the parse tree
	 */
	void enterAnd_test(RuleTranslatorParser.And_testContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#and_test}.
	 * @param ctx the parse tree
	 */
	void exitAnd_test(RuleTranslatorParser.And_testContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#not_test}.
	 * @param ctx the parse tree
	 */
	void enterNot_test(RuleTranslatorParser.Not_testContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#not_test}.
	 * @param ctx the parse tree
	 */
	void exitNot_test(RuleTranslatorParser.Not_testContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#comparison}.
	 * @param ctx the parse tree
	 */
	void enterComparison(RuleTranslatorParser.ComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#comparison}.
	 * @param ctx the parse tree
	 */
	void exitComparison(RuleTranslatorParser.ComparisonContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterComp_op(RuleTranslatorParser.Comp_opContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitComp_op(RuleTranslatorParser.Comp_opContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(RuleTranslatorParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(RuleTranslatorParser.ExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#xor_expr}.
	 * @param ctx the parse tree
	 */
	void enterXor_expr(RuleTranslatorParser.Xor_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#xor_expr}.
	 * @param ctx the parse tree
	 */
	void exitXor_expr(RuleTranslatorParser.Xor_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#and_expr}.
	 * @param ctx the parse tree
	 */
	void enterAnd_expr(RuleTranslatorParser.And_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#and_expr}.
	 * @param ctx the parse tree
	 */
	void exitAnd_expr(RuleTranslatorParser.And_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#shift_expr}.
	 * @param ctx the parse tree
	 */
	void enterShift_expr(RuleTranslatorParser.Shift_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#shift_expr}.
	 * @param ctx the parse tree
	 */
	void exitShift_expr(RuleTranslatorParser.Shift_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#arith_expr}.
	 * @param ctx the parse tree
	 */
	void enterArith_expr(RuleTranslatorParser.Arith_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#arith_expr}.
	 * @param ctx the parse tree
	 */
	void exitArith_expr(RuleTranslatorParser.Arith_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#term}.
	 * @param ctx the parse tree
	 */
	void enterTerm(RuleTranslatorParser.TermContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#term}.
	 * @param ctx the parse tree
	 */
	void exitTerm(RuleTranslatorParser.TermContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#factor}.
	 * @param ctx the parse tree
	 */
	void enterFactor(RuleTranslatorParser.FactorContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#factor}.
	 * @param ctx the parse tree
	 */
	void exitFactor(RuleTranslatorParser.FactorContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#power}.
	 * @param ctx the parse tree
	 */
	void enterPower(RuleTranslatorParser.PowerContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#power}.
	 * @param ctx the parse tree
	 */
	void exitPower(RuleTranslatorParser.PowerContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#atom_expr}.
	 * @param ctx the parse tree
	 */
	void enterAtom_expr(RuleTranslatorParser.Atom_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#atom_expr}.
	 * @param ctx the parse tree
	 */
	void exitAtom_expr(RuleTranslatorParser.Atom_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterAtom(RuleTranslatorParser.AtomContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitAtom(RuleTranslatorParser.AtomContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#testlist_comp}.
	 * @param ctx the parse tree
	 */
	void enterTestlist_comp(RuleTranslatorParser.Testlist_compContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#testlist_comp}.
	 * @param ctx the parse tree
	 */
	void exitTestlist_comp(RuleTranslatorParser.Testlist_compContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#trailer}.
	 * @param ctx the parse tree
	 */
	void enterTrailer(RuleTranslatorParser.TrailerContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#trailer}.
	 * @param ctx the parse tree
	 */
	void exitTrailer(RuleTranslatorParser.TrailerContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#subscriptlist}.
	 * @param ctx the parse tree
	 */
	void enterSubscriptlist(RuleTranslatorParser.SubscriptlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#subscriptlist}.
	 * @param ctx the parse tree
	 */
	void exitSubscriptlist(RuleTranslatorParser.SubscriptlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#subscript}.
	 * @param ctx the parse tree
	 */
	void enterSubscript(RuleTranslatorParser.SubscriptContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#subscript}.
	 * @param ctx the parse tree
	 */
	void exitSubscript(RuleTranslatorParser.SubscriptContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#sliceop}.
	 * @param ctx the parse tree
	 */
	void enterSliceop(RuleTranslatorParser.SliceopContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#sliceop}.
	 * @param ctx the parse tree
	 */
	void exitSliceop(RuleTranslatorParser.SliceopContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#exprlist}.
	 * @param ctx the parse tree
	 */
	void enterExprlist(RuleTranslatorParser.ExprlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#exprlist}.
	 * @param ctx the parse tree
	 */
	void exitExprlist(RuleTranslatorParser.ExprlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#testlist}.
	 * @param ctx the parse tree
	 */
	void enterTestlist(RuleTranslatorParser.TestlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#testlist}.
	 * @param ctx the parse tree
	 */
	void exitTestlist(RuleTranslatorParser.TestlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#dictorsetmaker}.
	 * @param ctx the parse tree
	 */
	void enterDictorsetmaker(RuleTranslatorParser.DictorsetmakerContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#dictorsetmaker}.
	 * @param ctx the parse tree
	 */
	void exitDictorsetmaker(RuleTranslatorParser.DictorsetmakerContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#arglist}.
	 * @param ctx the parse tree
	 */
	void enterArglist(RuleTranslatorParser.ArglistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#arglist}.
	 * @param ctx the parse tree
	 */
	void exitArglist(RuleTranslatorParser.ArglistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#argument}.
	 * @param ctx the parse tree
	 */
	void enterArgument(RuleTranslatorParser.ArgumentContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#argument}.
	 * @param ctx the parse tree
	 */
	void exitArgument(RuleTranslatorParser.ArgumentContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#comp_iter}.
	 * @param ctx the parse tree
	 */
	void enterComp_iter(RuleTranslatorParser.Comp_iterContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#comp_iter}.
	 * @param ctx the parse tree
	 */
	void exitComp_iter(RuleTranslatorParser.Comp_iterContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#comp_for}.
	 * @param ctx the parse tree
	 */
	void enterComp_for(RuleTranslatorParser.Comp_forContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#comp_for}.
	 * @param ctx the parse tree
	 */
	void exitComp_for(RuleTranslatorParser.Comp_forContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#comp_if}.
	 * @param ctx the parse tree
	 */
	void enterComp_if(RuleTranslatorParser.Comp_ifContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#comp_if}.
	 * @param ctx the parse tree
	 */
	void exitComp_if(RuleTranslatorParser.Comp_ifContext ctx);
}
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#ruledef}.
	 * @param ctx the parse tree
	 */
	void enterRuledef(RuleTranslatorParser.RuledefContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#ruledef}.
	 * @param ctx the parse tree
	 */
	void exitRuledef(RuleTranslatorParser.RuledefContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#import_stmts}.
	 * @param ctx the parse tree
	 */
	void enterImport_stmts(RuleTranslatorParser.Import_stmtsContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#import_stmts}.
	 * @param ctx the parse tree
	 */
	void exitImport_stmts(RuleTranslatorParser.Import_stmtsContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#rule_setting}.
	 * @param ctx the parse tree
	 */
	void enterRule_setting(RuleTranslatorParser.Rule_settingContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#rule_setting}.
	 * @param ctx the parse tree
	 */
	void exitRule_setting(RuleTranslatorParser.Rule_settingContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#class_name}.
	 * @param ctx the parse tree
	 */
	void enterClass_name(RuleTranslatorParser.Class_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#class_name}.
	 * @param ctx the parse tree
	 */
	void exitClass_name(RuleTranslatorParser.Class_nameContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#language}.
	 * @param ctx the parse tree
	 */
	void enterLanguage(RuleTranslatorParser.LanguageContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#language}.
	 * @param ctx the parse tree
	 */
	void exitLanguage(RuleTranslatorParser.LanguageContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#import_stmt}.
	 * @param ctx the parse tree
	 */
	void enterImport_stmt(RuleTranslatorParser.Import_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#import_stmt}.
	 * @param ctx the parse tree
	 */
	void exitImport_stmt(RuleTranslatorParser.Import_stmtContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#functionName}.
	 * @param ctx the parse tree
	 */
	void enterFunctionName(RuleTranslatorParser.FunctionNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#functionName}.
	 * @param ctx the parse tree
	 */
	void exitFunctionName(RuleTranslatorParser.FunctionNameContext ctx);
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
	 * Enter a parse tree produced by the {@code tfpdef_name}
	 * labeled alternative in {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef_name(RuleTranslatorParser.Tfpdef_nameContext ctx);
	/**
	 * Exit a parse tree produced by the {@code tfpdef_name}
	 * labeled alternative in {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef_name(RuleTranslatorParser.Tfpdef_nameContext ctx);
	/**
	 * Enter a parse tree produced by the {@code tfpdef_number}
	 * labeled alternative in {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef_number(RuleTranslatorParser.Tfpdef_numberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code tfpdef_number}
	 * labeled alternative in {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef_number(RuleTranslatorParser.Tfpdef_numberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code tfpdef_string}
	 * labeled alternative in {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef_string(RuleTranslatorParser.Tfpdef_stringContext ctx);
	/**
	 * Exit a parse tree produced by the {@code tfpdef_string}
	 * labeled alternative in {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef_string(RuleTranslatorParser.Tfpdef_stringContext ctx);
	/**
	 * Enter a parse tree produced by the {@code tfpdef_funct_stm}
	 * labeled alternative in {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef_funct_stm(RuleTranslatorParser.Tfpdef_funct_stmContext ctx);
	/**
	 * Exit a parse tree produced by the {@code tfpdef_funct_stm}
	 * labeled alternative in {@link RuleTranslatorParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef_funct_stm(RuleTranslatorParser.Tfpdef_funct_stmContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#dot_e}.
	 * @param ctx the parse tree
	 */
	void enterDot_e(RuleTranslatorParser.Dot_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#dot_e}.
	 * @param ctx the parse tree
	 */
	void exitDot_e(RuleTranslatorParser.Dot_eContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#funct_parameters}.
	 * @param ctx the parse tree
	 */
	void enterFunct_parameters(RuleTranslatorParser.Funct_parametersContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#funct_parameters}.
	 * @param ctx the parse tree
	 */
	void exitFunct_parameters(RuleTranslatorParser.Funct_parametersContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#var_stmt}.
	 * @param ctx the parse tree
	 */
	void enterVar_stmt(RuleTranslatorParser.Var_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#var_stmt}.
	 * @param ctx the parse tree
	 */
	void exitVar_stmt(RuleTranslatorParser.Var_stmtContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#condition}.
	 * @param ctx the parse tree
	 */
	void enterCondition(RuleTranslatorParser.ConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#condition}.
	 * @param ctx the parse tree
	 */
	void exitCondition(RuleTranslatorParser.ConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#elif_e}.
	 * @param ctx the parse tree
	 */
	void enterElif_e(RuleTranslatorParser.Elif_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#elif_e}.
	 * @param ctx the parse tree
	 */
	void exitElif_e(RuleTranslatorParser.Elif_eContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#else_e}.
	 * @param ctx the parse tree
	 */
	void enterElse_e(RuleTranslatorParser.Else_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#else_e}.
	 * @param ctx the parse tree
	 */
	void exitElse_e(RuleTranslatorParser.Else_eContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#for_testlist}.
	 * @param ctx the parse tree
	 */
	void enterFor_testlist(RuleTranslatorParser.For_testlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#for_testlist}.
	 * @param ctx the parse tree
	 */
	void exitFor_testlist(RuleTranslatorParser.For_testlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#block_stmt}.
	 * @param ctx the parse tree
	 */
	void enterBlock_stmt(RuleTranslatorParser.Block_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#block_stmt}.
	 * @param ctx the parse tree
	 */
	void exitBlock_stmt(RuleTranslatorParser.Block_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#block_suite}.
	 * @param ctx the parse tree
	 */
	void enterBlock_suite(RuleTranslatorParser.Block_suiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#block_suite}.
	 * @param ctx the parse tree
	 */
	void exitBlock_suite(RuleTranslatorParser.Block_suiteContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#or_e}.
	 * @param ctx the parse tree
	 */
	void enterOr_e(RuleTranslatorParser.Or_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#or_e}.
	 * @param ctx the parse tree
	 */
	void exitOr_e(RuleTranslatorParser.Or_eContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#and_e}.
	 * @param ctx the parse tree
	 */
	void enterAnd_e(RuleTranslatorParser.And_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#and_e}.
	 * @param ctx the parse tree
	 */
	void exitAnd_e(RuleTranslatorParser.And_eContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#not}.
	 * @param ctx the parse tree
	 */
	void enterNot(RuleTranslatorParser.NotContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#not}.
	 * @param ctx the parse tree
	 */
	void exitNot(RuleTranslatorParser.NotContext ctx);
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
	 * Enter a parse tree produced by the {@code less_than}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterLess_than(RuleTranslatorParser.Less_thanContext ctx);
	/**
	 * Exit a parse tree produced by the {@code less_than}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitLess_than(RuleTranslatorParser.Less_thanContext ctx);
	/**
	 * Enter a parse tree produced by the {@code greater_than}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterGreater_than(RuleTranslatorParser.Greater_thanContext ctx);
	/**
	 * Exit a parse tree produced by the {@code greater_than}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitGreater_than(RuleTranslatorParser.Greater_thanContext ctx);
	/**
	 * Enter a parse tree produced by the {@code equals}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterEquals(RuleTranslatorParser.EqualsContext ctx);
	/**
	 * Exit a parse tree produced by the {@code equals}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitEquals(RuleTranslatorParser.EqualsContext ctx);
	/**
	 * Enter a parse tree produced by the {@code greater_equal}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterGreater_equal(RuleTranslatorParser.Greater_equalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code greater_equal}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitGreater_equal(RuleTranslatorParser.Greater_equalContext ctx);
	/**
	 * Enter a parse tree produced by the {@code less_equal}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterLess_equal(RuleTranslatorParser.Less_equalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code less_equal}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitLess_equal(RuleTranslatorParser.Less_equalContext ctx);
	/**
	 * Enter a parse tree produced by the {@code not_equal}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterNot_equal(RuleTranslatorParser.Not_equalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code not_equal}
	 * labeled alternative in {@link RuleTranslatorParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitNot_equal(RuleTranslatorParser.Not_equalContext ctx);
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
	 * Enter a parse tree produced by the {@code atom_dotted_name}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterAtom_dotted_name(RuleTranslatorParser.Atom_dotted_nameContext ctx);
	/**
	 * Exit a parse tree produced by the {@code atom_dotted_name}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitAtom_dotted_name(RuleTranslatorParser.Atom_dotted_nameContext ctx);
	/**
	 * Enter a parse tree produced by the {@code atom_funct_stmt}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterAtom_funct_stmt(RuleTranslatorParser.Atom_funct_stmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code atom_funct_stmt}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitAtom_funct_stmt(RuleTranslatorParser.Atom_funct_stmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code number_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterNumber_e(RuleTranslatorParser.Number_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code number_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitNumber_e(RuleTranslatorParser.Number_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code string_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterString_e(RuleTranslatorParser.String_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code string_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitString_e(RuleTranslatorParser.String_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code true_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterTrue_e(RuleTranslatorParser.True_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code true_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitTrue_e(RuleTranslatorParser.True_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code false_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterFalse_e(RuleTranslatorParser.False_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code false_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitFalse_e(RuleTranslatorParser.False_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code last_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterLast_e(RuleTranslatorParser.Last_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code last_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitLast_e(RuleTranslatorParser.Last_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code first_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterFirst_e(RuleTranslatorParser.First_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code first_e}
	 * labeled alternative in {@link RuleTranslatorParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitFirst_e(RuleTranslatorParser.First_eContext ctx);
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
	 * Enter a parse tree produced by {@link RuleTranslatorParser#low}.
	 * @param ctx the parse tree
	 */
	void enterLow(RuleTranslatorParser.LowContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#low}.
	 * @param ctx the parse tree
	 */
	void exitLow(RuleTranslatorParser.LowContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleTranslatorParser#high}.
	 * @param ctx the parse tree
	 */
	void enterHigh(RuleTranslatorParser.HighContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleTranslatorParser#high}.
	 * @param ctx the parse tree
	 */
	void exitHigh(RuleTranslatorParser.HighContext ctx);
}
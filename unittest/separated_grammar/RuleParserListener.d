// Generated from RuleParser.g4 by ANTLR 4.7.2
import antlr.v4.runtime.tree.ParseTreeListener;
import RuleParser : RuleParser;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link RuleParser}.
 */
public interface RuleParserListener : ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link RuleParser#file_input}.
	 * @param ctx the parse tree
	 */
	void enterFile_input(RuleParser.File_inputContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#file_input}.
	 * @param ctx the parse tree
	 */
	void exitFile_input(RuleParser.File_inputContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#ruledef}.
	 * @param ctx the parse tree
	 */
	void enterRuledef(RuleParser.RuledefContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#ruledef}.
	 * @param ctx the parse tree
	 */
	void exitRuledef(RuleParser.RuledefContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#import_stmts}.
	 * @param ctx the parse tree
	 */
	void enterImport_stmts(RuleParser.Import_stmtsContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#import_stmts}.
	 * @param ctx the parse tree
	 */
	void exitImport_stmts(RuleParser.Import_stmtsContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#rule_setting}.
	 * @param ctx the parse tree
	 */
	void enterRule_setting(RuleParser.Rule_settingContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#rule_setting}.
	 * @param ctx the parse tree
	 */
	void exitRule_setting(RuleParser.Rule_settingContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#class_name}.
	 * @param ctx the parse tree
	 */
	void enterClass_name(RuleParser.Class_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#class_name}.
	 * @param ctx the parse tree
	 */
	void exitClass_name(RuleParser.Class_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#rule_name}.
	 * @param ctx the parse tree
	 */
	void enterRule_name(RuleParser.Rule_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#rule_name}.
	 * @param ctx the parse tree
	 */
	void exitRule_name(RuleParser.Rule_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#language}.
	 * @param ctx the parse tree
	 */
	void enterLanguage(RuleParser.LanguageContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#language}.
	 * @param ctx the parse tree
	 */
	void exitLanguage(RuleParser.LanguageContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#import_stmt}.
	 * @param ctx the parse tree
	 */
	void enterImport_stmt(RuleParser.Import_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#import_stmt}.
	 * @param ctx the parse tree
	 */
	void exitImport_stmt(RuleParser.Import_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#base_rules}.
	 * @param ctx the parse tree
	 */
	void enterBase_rules(RuleParser.Base_rulesContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#base_rules}.
	 * @param ctx the parse tree
	 */
	void exitBase_rules(RuleParser.Base_rulesContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#funcdef}.
	 * @param ctx the parse tree
	 */
	void enterFuncdef(RuleParser.FuncdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#funcdef}.
	 * @param ctx the parse tree
	 */
	void exitFuncdef(RuleParser.FuncdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#functionName}.
	 * @param ctx the parse tree
	 */
	void enterFunctionName(RuleParser.FunctionNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#functionName}.
	 * @param ctx the parse tree
	 */
	void exitFunctionName(RuleParser.FunctionNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#parameters}.
	 * @param ctx the parse tree
	 */
	void enterParameters(RuleParser.ParametersContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#parameters}.
	 * @param ctx the parse tree
	 */
	void exitParameters(RuleParser.ParametersContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#typedargslist}.
	 * @param ctx the parse tree
	 */
	void enterTypedargslist(RuleParser.TypedargslistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#typedargslist}.
	 * @param ctx the parse tree
	 */
	void exitTypedargslist(RuleParser.TypedargslistContext ctx);
	/**
	 * Enter a parse tree produced by the {@code tfpdef_name}
	 * labeled alternative in {@link RuleParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef_name(RuleParser.Tfpdef_nameContext ctx);
	/**
	 * Exit a parse tree produced by the {@code tfpdef_name}
	 * labeled alternative in {@link RuleParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef_name(RuleParser.Tfpdef_nameContext ctx);
	/**
	 * Enter a parse tree produced by the {@code tfpdef_number}
	 * labeled alternative in {@link RuleParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef_number(RuleParser.Tfpdef_numberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code tfpdef_number}
	 * labeled alternative in {@link RuleParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef_number(RuleParser.Tfpdef_numberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code tfpdef_string}
	 * labeled alternative in {@link RuleParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef_string(RuleParser.Tfpdef_stringContext ctx);
	/**
	 * Exit a parse tree produced by the {@code tfpdef_string}
	 * labeled alternative in {@link RuleParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef_string(RuleParser.Tfpdef_stringContext ctx);
	/**
	 * Enter a parse tree produced by the {@code tfpdef_funct_stm}
	 * labeled alternative in {@link RuleParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void enterTfpdef_funct_stm(RuleParser.Tfpdef_funct_stmContext ctx);
	/**
	 * Exit a parse tree produced by the {@code tfpdef_funct_stm}
	 * labeled alternative in {@link RuleParser#tfpdef}.
	 * @param ctx the parse tree
	 */
	void exitTfpdef_funct_stm(RuleParser.Tfpdef_funct_stmContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#suite}.
	 * @param ctx the parse tree
	 */
	void enterSuite(RuleParser.SuiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#suite}.
	 * @param ctx the parse tree
	 */
	void exitSuite(RuleParser.SuiteContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterStmt(RuleParser.StmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitStmt(RuleParser.StmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#simple_stmt}.
	 * @param ctx the parse tree
	 */
	void enterSimple_stmt(RuleParser.Simple_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#simple_stmt}.
	 * @param ctx the parse tree
	 */
	void exitSimple_stmt(RuleParser.Simple_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#small_stmt}.
	 * @param ctx the parse tree
	 */
	void enterSmall_stmt(RuleParser.Small_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#small_stmt}.
	 * @param ctx the parse tree
	 */
	void exitSmall_stmt(RuleParser.Small_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#string_stmt}.
	 * @param ctx the parse tree
	 */
	void enterString_stmt(RuleParser.String_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#string_stmt}.
	 * @param ctx the parse tree
	 */
	void exitString_stmt(RuleParser.String_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#funct_stmt}.
	 * @param ctx the parse tree
	 */
	void enterFunct_stmt(RuleParser.Funct_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#funct_stmt}.
	 * @param ctx the parse tree
	 */
	void exitFunct_stmt(RuleParser.Funct_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#funct_name}.
	 * @param ctx the parse tree
	 */
	void enterFunct_name(RuleParser.Funct_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#funct_name}.
	 * @param ctx the parse tree
	 */
	void exitFunct_name(RuleParser.Funct_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#dot_e}.
	 * @param ctx the parse tree
	 */
	void enterDot_e(RuleParser.Dot_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#dot_e}.
	 * @param ctx the parse tree
	 */
	void exitDot_e(RuleParser.Dot_eContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#funct_parameters}.
	 * @param ctx the parse tree
	 */
	void enterFunct_parameters(RuleParser.Funct_parametersContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#funct_parameters}.
	 * @param ctx the parse tree
	 */
	void exitFunct_parameters(RuleParser.Funct_parametersContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#var_stmt}.
	 * @param ctx the parse tree
	 */
	void enterVar_stmt(RuleParser.Var_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#var_stmt}.
	 * @param ctx the parse tree
	 */
	void exitVar_stmt(RuleParser.Var_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#flow_stmt}.
	 * @param ctx the parse tree
	 */
	void enterFlow_stmt(RuleParser.Flow_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#flow_stmt}.
	 * @param ctx the parse tree
	 */
	void exitFlow_stmt(RuleParser.Flow_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#break_stmt}.
	 * @param ctx the parse tree
	 */
	void enterBreak_stmt(RuleParser.Break_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#break_stmt}.
	 * @param ctx the parse tree
	 */
	void exitBreak_stmt(RuleParser.Break_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#continue_stmt}.
	 * @param ctx the parse tree
	 */
	void enterContinue_stmt(RuleParser.Continue_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#continue_stmt}.
	 * @param ctx the parse tree
	 */
	void exitContinue_stmt(RuleParser.Continue_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#dotted_as_name}.
	 * @param ctx the parse tree
	 */
	void enterDotted_as_name(RuleParser.Dotted_as_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#dotted_as_name}.
	 * @param ctx the parse tree
	 */
	void exitDotted_as_name(RuleParser.Dotted_as_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#dotted_as_names}.
	 * @param ctx the parse tree
	 */
	void enterDotted_as_names(RuleParser.Dotted_as_namesContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#dotted_as_names}.
	 * @param ctx the parse tree
	 */
	void exitDotted_as_names(RuleParser.Dotted_as_namesContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#dotted_name}.
	 * @param ctx the parse tree
	 */
	void enterDotted_name(RuleParser.Dotted_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#dotted_name}.
	 * @param ctx the parse tree
	 */
	void exitDotted_name(RuleParser.Dotted_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#dotted_name_first_part}.
	 * @param ctx the parse tree
	 */
	void enterDotted_name_first_part(RuleParser.Dotted_name_first_partContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#dotted_name_first_part}.
	 * @param ctx the parse tree
	 */
	void exitDotted_name_first_part(RuleParser.Dotted_name_first_partContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#dotted_name_part}.
	 * @param ctx the parse tree
	 */
	void enterDotted_name_part(RuleParser.Dotted_name_partContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#dotted_name_part}.
	 * @param ctx the parse tree
	 */
	void exitDotted_name_part(RuleParser.Dotted_name_partContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#first_part_of_dotted_name}.
	 * @param ctx the parse tree
	 */
	void enterFirst_part_of_dotted_name(RuleParser.First_part_of_dotted_nameContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#first_part_of_dotted_name}.
	 * @param ctx the parse tree
	 */
	void exitFirst_part_of_dotted_name(RuleParser.First_part_of_dotted_nameContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#compound_stmt}.
	 * @param ctx the parse tree
	 */
	void enterCompound_stmt(RuleParser.Compound_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#compound_stmt}.
	 * @param ctx the parse tree
	 */
	void exitCompound_stmt(RuleParser.Compound_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#if_stmt}.
	 * @param ctx the parse tree
	 */
	void enterIf_stmt(RuleParser.If_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#if_stmt}.
	 * @param ctx the parse tree
	 */
	void exitIf_stmt(RuleParser.If_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#if_condition_and_suite}.
	 * @param ctx the parse tree
	 */
	void enterIf_condition_and_suite(RuleParser.If_condition_and_suiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#if_condition_and_suite}.
	 * @param ctx the parse tree
	 */
	void exitIf_condition_and_suite(RuleParser.If_condition_and_suiteContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#elif_condition_and_suite}.
	 * @param ctx the parse tree
	 */
	void enterElif_condition_and_suite(RuleParser.Elif_condition_and_suiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#elif_condition_and_suite}.
	 * @param ctx the parse tree
	 */
	void exitElif_condition_and_suite(RuleParser.Elif_condition_and_suiteContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#else_and_suite}.
	 * @param ctx the parse tree
	 */
	void enterElse_and_suite(RuleParser.Else_and_suiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#else_and_suite}.
	 * @param ctx the parse tree
	 */
	void exitElse_and_suite(RuleParser.Else_and_suiteContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#condition_and_suite}.
	 * @param ctx the parse tree
	 */
	void enterCondition_and_suite(RuleParser.Condition_and_suiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#condition_and_suite}.
	 * @param ctx the parse tree
	 */
	void exitCondition_and_suite(RuleParser.Condition_and_suiteContext ctx);
	/**
	 * Enter a parse tree produced by the {@code condition_with_value}
	 * labeled alternative in {@link RuleParser#condition}.
	 * @param ctx the parse tree
	 */
	void enterCondition_with_value(RuleParser.Condition_with_valueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code condition_with_value}
	 * labeled alternative in {@link RuleParser#condition}.
	 * @param ctx the parse tree
	 */
	void exitCondition_with_value(RuleParser.Condition_with_valueContext ctx);
	/**
	 * Enter a parse tree produced by the {@code condition_without_value}
	 * labeled alternative in {@link RuleParser#condition}.
	 * @param ctx the parse tree
	 */
	void enterCondition_without_value(RuleParser.Condition_without_valueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code condition_without_value}
	 * labeled alternative in {@link RuleParser#condition}.
	 * @param ctx the parse tree
	 */
	void exitCondition_without_value(RuleParser.Condition_without_valueContext ctx);
	/**
	 * Enter a parse tree produced by the {@code condition_only}
	 * labeled alternative in {@link RuleParser#condition}.
	 * @param ctx the parse tree
	 */
	void enterCondition_only(RuleParser.Condition_onlyContext ctx);
	/**
	 * Exit a parse tree produced by the {@code condition_only}
	 * labeled alternative in {@link RuleParser#condition}.
	 * @param ctx the parse tree
	 */
	void exitCondition_only(RuleParser.Condition_onlyContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#open_paren}.
	 * @param ctx the parse tree
	 */
	void enterOpen_paren(RuleParser.Open_parenContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#open_paren}.
	 * @param ctx the parse tree
	 */
	void exitOpen_paren(RuleParser.Open_parenContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#close_paren}.
	 * @param ctx the parse tree
	 */
	void enterClose_paren(RuleParser.Close_parenContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#close_paren}.
	 * @param ctx the parse tree
	 */
	void exitClose_paren(RuleParser.Close_parenContext ctx);
	/**
	 * Enter a parse tree produced by the {@code r_equals}
	 * labeled alternative in {@link RuleParser#reduced_comperator}.
	 * @param ctx the parse tree
	 */
	void enterR_equals(RuleParser.R_equalsContext ctx);
	/**
	 * Exit a parse tree produced by the {@code r_equals}
	 * labeled alternative in {@link RuleParser#reduced_comperator}.
	 * @param ctx the parse tree
	 */
	void exitR_equals(RuleParser.R_equalsContext ctx);
	/**
	 * Enter a parse tree produced by the {@code r_not_equal}
	 * labeled alternative in {@link RuleParser#reduced_comperator}.
	 * @param ctx the parse tree
	 */
	void enterR_not_equal(RuleParser.R_not_equalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code r_not_equal}
	 * labeled alternative in {@link RuleParser#reduced_comperator}.
	 * @param ctx the parse tree
	 */
	void exitR_not_equal(RuleParser.R_not_equalContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#elif_e}.
	 * @param ctx the parse tree
	 */
	void enterElif_e(RuleParser.Elif_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#elif_e}.
	 * @param ctx the parse tree
	 */
	void exitElif_e(RuleParser.Elif_eContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#else_e}.
	 * @param ctx the parse tree
	 */
	void enterElse_e(RuleParser.Else_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#else_e}.
	 * @param ctx the parse tree
	 */
	void exitElse_e(RuleParser.Else_eContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#for_stmt}.
	 * @param ctx the parse tree
	 */
	void enterFor_stmt(RuleParser.For_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#for_stmt}.
	 * @param ctx the parse tree
	 */
	void exitFor_stmt(RuleParser.For_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#for_testlist}.
	 * @param ctx the parse tree
	 */
	void enterFor_testlist(RuleParser.For_testlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#for_testlist}.
	 * @param ctx the parse tree
	 */
	void exitFor_testlist(RuleParser.For_testlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#for_exprlist}.
	 * @param ctx the parse tree
	 */
	void enterFor_exprlist(RuleParser.For_exprlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#for_exprlist}.
	 * @param ctx the parse tree
	 */
	void exitFor_exprlist(RuleParser.For_exprlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#block_stmt}.
	 * @param ctx the parse tree
	 */
	void enterBlock_stmt(RuleParser.Block_stmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#block_stmt}.
	 * @param ctx the parse tree
	 */
	void exitBlock_stmt(RuleParser.Block_stmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#block_suite}.
	 * @param ctx the parse tree
	 */
	void enterBlock_suite(RuleParser.Block_suiteContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#block_suite}.
	 * @param ctx the parse tree
	 */
	void exitBlock_suite(RuleParser.Block_suiteContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#test}.
	 * @param ctx the parse tree
	 */
	void enterTest(RuleParser.TestContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#test}.
	 * @param ctx the parse tree
	 */
	void exitTest(RuleParser.TestContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#or_e}.
	 * @param ctx the parse tree
	 */
	void enterOr_e(RuleParser.Or_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#or_e}.
	 * @param ctx the parse tree
	 */
	void exitOr_e(RuleParser.Or_eContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#and_test}.
	 * @param ctx the parse tree
	 */
	void enterAnd_test(RuleParser.And_testContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#and_test}.
	 * @param ctx the parse tree
	 */
	void exitAnd_test(RuleParser.And_testContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#and_e}.
	 * @param ctx the parse tree
	 */
	void enterAnd_e(RuleParser.And_eContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#and_e}.
	 * @param ctx the parse tree
	 */
	void exitAnd_e(RuleParser.And_eContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#not_test}.
	 * @param ctx the parse tree
	 */
	void enterNot_test(RuleParser.Not_testContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#not_test}.
	 * @param ctx the parse tree
	 */
	void exitNot_test(RuleParser.Not_testContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#not}.
	 * @param ctx the parse tree
	 */
	void enterNot(RuleParser.NotContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#not}.
	 * @param ctx the parse tree
	 */
	void exitNot(RuleParser.NotContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#comparison}.
	 * @param ctx the parse tree
	 */
	void enterComparison(RuleParser.ComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#comparison}.
	 * @param ctx the parse tree
	 */
	void exitComparison(RuleParser.ComparisonContext ctx);
	/**
	 * Enter a parse tree produced by the {@code less_than}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterLess_than(RuleParser.Less_thanContext ctx);
	/**
	 * Exit a parse tree produced by the {@code less_than}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitLess_than(RuleParser.Less_thanContext ctx);
	/**
	 * Enter a parse tree produced by the {@code greater_than}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterGreater_than(RuleParser.Greater_thanContext ctx);
	/**
	 * Exit a parse tree produced by the {@code greater_than}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitGreater_than(RuleParser.Greater_thanContext ctx);
	/**
	 * Enter a parse tree produced by the {@code equals}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterEquals(RuleParser.EqualsContext ctx);
	/**
	 * Exit a parse tree produced by the {@code equals}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitEquals(RuleParser.EqualsContext ctx);
	/**
	 * Enter a parse tree produced by the {@code greater_equal}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterGreater_equal(RuleParser.Greater_equalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code greater_equal}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitGreater_equal(RuleParser.Greater_equalContext ctx);
	/**
	 * Enter a parse tree produced by the {@code less_equal}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterLess_equal(RuleParser.Less_equalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code less_equal}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitLess_equal(RuleParser.Less_equalContext ctx);
	/**
	 * Enter a parse tree produced by the {@code not_equal}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void enterNot_equal(RuleParser.Not_equalContext ctx);
	/**
	 * Exit a parse tree produced by the {@code not_equal}
	 * labeled alternative in {@link RuleParser#comp_op}.
	 * @param ctx the parse tree
	 */
	void exitNot_equal(RuleParser.Not_equalContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(RuleParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(RuleParser.ExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#xor_expr}.
	 * @param ctx the parse tree
	 */
	void enterXor_expr(RuleParser.Xor_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#xor_expr}.
	 * @param ctx the parse tree
	 */
	void exitXor_expr(RuleParser.Xor_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#and_expr}.
	 * @param ctx the parse tree
	 */
	void enterAnd_expr(RuleParser.And_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#and_expr}.
	 * @param ctx the parse tree
	 */
	void exitAnd_expr(RuleParser.And_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#arith_expr}.
	 * @param ctx the parse tree
	 */
	void enterArith_expr(RuleParser.Arith_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#arith_expr}.
	 * @param ctx the parse tree
	 */
	void exitArith_expr(RuleParser.Arith_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#factor}.
	 * @param ctx the parse tree
	 */
	void enterFactor(RuleParser.FactorContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#factor}.
	 * @param ctx the parse tree
	 */
	void exitFactor(RuleParser.FactorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code atom_dotted_name}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterAtom_dotted_name(RuleParser.Atom_dotted_nameContext ctx);
	/**
	 * Exit a parse tree produced by the {@code atom_dotted_name}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitAtom_dotted_name(RuleParser.Atom_dotted_nameContext ctx);
	/**
	 * Enter a parse tree produced by the {@code atom_funct_stmt}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterAtom_funct_stmt(RuleParser.Atom_funct_stmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code atom_funct_stmt}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitAtom_funct_stmt(RuleParser.Atom_funct_stmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code number_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterNumber_e(RuleParser.Number_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code number_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitNumber_e(RuleParser.Number_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code string_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterString_e(RuleParser.String_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code string_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitString_e(RuleParser.String_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code true_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterTrue_e(RuleParser.True_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code true_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitTrue_e(RuleParser.True_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code false_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterFalse_e(RuleParser.False_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code false_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitFalse_e(RuleParser.False_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code last_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterLast_e(RuleParser.Last_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code last_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitLast_e(RuleParser.Last_eContext ctx);
	/**
	 * Enter a parse tree produced by the {@code first_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void enterFirst_e(RuleParser.First_eContext ctx);
	/**
	 * Exit a parse tree produced by the {@code first_e}
	 * labeled alternative in {@link RuleParser#atom}.
	 * @param ctx the parse tree
	 */
	void exitFirst_e(RuleParser.First_eContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#add}.
	 * @param ctx the parse tree
	 */
	void enterAdd(RuleParser.AddContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#add}.
	 * @param ctx the parse tree
	 */
	void exitAdd(RuleParser.AddContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#minus}.
	 * @param ctx the parse tree
	 */
	void enterMinus(RuleParser.MinusContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#minus}.
	 * @param ctx the parse tree
	 */
	void exitMinus(RuleParser.MinusContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#testlist_comp}.
	 * @param ctx the parse tree
	 */
	void enterTestlist_comp(RuleParser.Testlist_compContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#testlist_comp}.
	 * @param ctx the parse tree
	 */
	void exitTestlist_comp(RuleParser.Testlist_compContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#trailer}.
	 * @param ctx the parse tree
	 */
	void enterTrailer(RuleParser.TrailerContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#trailer}.
	 * @param ctx the parse tree
	 */
	void exitTrailer(RuleParser.TrailerContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#subscriptlist}.
	 * @param ctx the parse tree
	 */
	void enterSubscriptlist(RuleParser.SubscriptlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#subscriptlist}.
	 * @param ctx the parse tree
	 */
	void exitSubscriptlist(RuleParser.SubscriptlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#subscript}.
	 * @param ctx the parse tree
	 */
	void enterSubscript(RuleParser.SubscriptContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#subscript}.
	 * @param ctx the parse tree
	 */
	void exitSubscript(RuleParser.SubscriptContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#sliceop}.
	 * @param ctx the parse tree
	 */
	void enterSliceop(RuleParser.SliceopContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#sliceop}.
	 * @param ctx the parse tree
	 */
	void exitSliceop(RuleParser.SliceopContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#exprlist}.
	 * @param ctx the parse tree
	 */
	void enterExprlist(RuleParser.ExprlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#exprlist}.
	 * @param ctx the parse tree
	 */
	void exitExprlist(RuleParser.ExprlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#testlist}.
	 * @param ctx the parse tree
	 */
	void enterTestlist(RuleParser.TestlistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#testlist}.
	 * @param ctx the parse tree
	 */
	void exitTestlist(RuleParser.TestlistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#dictorsetmaker}.
	 * @param ctx the parse tree
	 */
	void enterDictorsetmaker(RuleParser.DictorsetmakerContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#dictorsetmaker}.
	 * @param ctx the parse tree
	 */
	void exitDictorsetmaker(RuleParser.DictorsetmakerContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#arglist}.
	 * @param ctx the parse tree
	 */
	void enterArglist(RuleParser.ArglistContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#arglist}.
	 * @param ctx the parse tree
	 */
	void exitArglist(RuleParser.ArglistContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#argument}.
	 * @param ctx the parse tree
	 */
	void enterArgument(RuleParser.ArgumentContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#argument}.
	 * @param ctx the parse tree
	 */
	void exitArgument(RuleParser.ArgumentContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#element}.
	 * @param ctx the parse tree
	 */
	void enterElement(RuleParser.ElementContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#element}.
	 * @param ctx the parse tree
	 */
	void exitElement(RuleParser.ElementContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#content}.
	 * @param ctx the parse tree
	 */
	void enterContent(RuleParser.ContentContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#content}.
	 * @param ctx the parse tree
	 */
	void exitContent(RuleParser.ContentContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#attribute}.
	 * @param ctx the parse tree
	 */
	void enterAttribute(RuleParser.AttributeContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#attribute}.
	 * @param ctx the parse tree
	 */
	void exitAttribute(RuleParser.AttributeContext ctx);
	/**
	 * Enter a parse tree produced by {@link RuleParser#templatesBegin}.
	 * @param ctx the parse tree
	 */
	void enterTemplatesBegin(RuleParser.TemplatesBeginContext ctx);
	/**
	 * Exit a parse tree produced by {@link RuleParser#templatesBegin}.
	 * @param ctx the parse tree
	 */
	void exitTemplatesBegin(RuleParser.TemplatesBeginContext ctx);
}
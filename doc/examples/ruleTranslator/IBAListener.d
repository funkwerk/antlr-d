module IBAListener;

import RuleTranslatorBaseListener;
import RuleTranslatorParser: RuleTranslatorParser;
import RuleWriter: RuleWriter;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.ParseTreeProperty;
import antlr.v4.runtime.tree.TerminalNode;
import debugMixin;
import std.format;
import std.json;
import std.stdio;

alias Result = RuleWriter.Result;

/**
 * This class provides an implementation of {@link RuleTranslatorListener},
 * which translate a rule in the corresponding XML document for
 * wave based announcement devices (IBA).
 */
public class IBAListener : RuleTranslatorBaseListener {

    debug
    {
        __gshared short counter;
        File debugInfo;
    }

    public JSONValue ibaConfig;

    private JSONValue ibaConfigStat;

    private JSONValue ibaConfigVar;

    private JSONValue ibaConfigCond;

    private ushort lastIndent = 0;

    public RuleWriter writer;

    private string language;

    public string[string] functionTemplates;

    auto ifTests = new ParseTreeProperty!string;

    struct IfCond {string name; string cond; string value;}

    auto ifConditions = new ParseTreeProperty!IfCond;

    auto values = new ParseTreeProperty!(Result[]);

    private string switchCondition(string ifdef) {
        if (ifdef == "IFNDEF")
            return  "IFDEF";
        else
            return "IFNDEF";
    }

    /**
     * Begin of generation
     */
    override public void enterFile_input(RuleTranslatorParser.File_inputContext ctx) {
        auto header = `<?xml version='1.0' encoding='UTF-8'?>`;
        Result[] results;
        Result result;
        result.text = header ~ "\n";
        result.indent = 0;
        results ~= result;
        values.put(ctx, results);
        ibaConfigStat = ibaConfig["stat"];
        ibaConfigVar = ibaConfig["var"];
        ibaConfigCond = ibaConfig["condition"];
        debug {
            debugInfo = File("/tmp/traceIBA", "w");
        }
        mixin(DebugEnter);
    }
    /**
     * End of generation
     * Collecting results and printing it
     */
    override public void exitFile_input(RuleTranslatorParser.File_inputContext ctx) {
        mixin(DebugExit);
        debug {
            debugInfo.write(format("\tvalues --> %s\n", values.get(ctx.ruledef)));
        }
        writer.put(values.get(ctx));
        writer.put(values.get(ctx.rule_setting));
        writer.put(values.get(ctx.ruledef));
        writer.put("    </ANSAGE>\n</PAKET>\n");
        writer.print;
        writer.clear;
        debug
            debugInfo.close;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterRuledef(RuleTranslatorParser.RuledefContext ctx) {
        lastIndent = 2; // start value
        Result[] results;
        Result result;
        result.text = "\n";
        result.indent = lastIndent;
        results ~= result;
        values.put(ctx, results);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitRuledef(RuleTranslatorParser.RuledefContext ctx) {
        Result[] results;
        foreach (child; ctx.children)
            {
                results ~= values.get(child);
            }
        lastIndent--;
        values.put(ctx, results);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterImport_stmts(RuleTranslatorParser.Import_stmtsContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitImport_stmts(RuleTranslatorParser.Import_stmtsContext ctx) { }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitRule_setting(RuleTranslatorParser.Rule_settingContext ctx) {
        Result[] results;
        Result result;
        result.text ~= format!"<PAKET magic=\"%s_%s\">\n"(ctx.rule_name.getText,
                                                          ctx.language.getText);
        result.text ~= format!"    <ANSAGE id=\"%s_%s\">\n"(ctx.rule_name.getText,
                                                            ctx.language.getText);
        language = ctx.language.getText;
        result.indent = lastIndent;
        results ~= result;
        values.put(ctx, results);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterClass_name(RuleTranslatorParser.Class_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitClass_name(RuleTranslatorParser.Class_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterLanguage(RuleTranslatorParser.LanguageContext ctx) {
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitLanguage(RuleTranslatorParser.LanguageContext ctx) {
        mixin(DebugExit);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterImport_stmt(RuleTranslatorParser.Import_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitImport_stmt(RuleTranslatorParser.Import_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterBase_rules(RuleTranslatorParser.Base_rulesContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitBase_rules(RuleTranslatorParser.Base_rulesContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFuncdef(RuleTranslatorParser.FuncdefContext ctx) {
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFuncdef(RuleTranslatorParser.FuncdefContext ctx) {
        Result[] results;
        Result result;
        results ~= result;
        values.put(ctx, results);  // empty
        debug {
            debugInfo.write(format("%s exitFuncdef:", counter++));
            debugInfo.write(format("\n\tvalues --> %s", values.get(ctx)));
            debugInfo.write(format("\n\tvalues suite --> %s\n", values.get(ctx.suite)));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFunctionName(RuleTranslatorParser.FunctionNameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFunctionName(RuleTranslatorParser.FunctionNameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterParameters(RuleTranslatorParser.ParametersContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitParameters(RuleTranslatorParser.ParametersContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTypedargslist(RuleTranslatorParser.TypedargslistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTypedargslist(RuleTranslatorParser.TypedargslistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTfpdef_name(RuleTranslatorParser.Tfpdef_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTfpdef_name(RuleTranslatorParser.Tfpdef_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTfpdef_number(RuleTranslatorParser.Tfpdef_numberContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTfpdef_number(RuleTranslatorParser.Tfpdef_numberContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTfpdef_string(RuleTranslatorParser.Tfpdef_stringContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTfpdef_string(RuleTranslatorParser.Tfpdef_stringContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTfpdef_funct_stm(RuleTranslatorParser.Tfpdef_funct_stmContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTfpdef_funct_stm(RuleTranslatorParser.Tfpdef_funct_stmContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterStmt(RuleTranslatorParser.StmtContext ctx) {
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitStmt(RuleTranslatorParser.StmtContext ctx) {
        Result[] results = values.get(ctx.children[0]); // only forward
        values.put(ctx, results);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterSimple_stmt(RuleTranslatorParser.Simple_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitSimple_stmt(RuleTranslatorParser.Simple_stmtContext ctx) {
        Result[] results = values.get(ctx.children[0]); // only forward
        values.put(ctx, results);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterSmall_stmt(RuleTranslatorParser.Small_stmtContext ctx) {
        debug {
            debugInfo.write(format("%s enterSmall_stmt:", counter++));
            debugInfo.write(format("\n\t getText = %s\n", ctx.getText));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitSmall_stmt(RuleTranslatorParser.Small_stmtContext ctx) {
        values.put(ctx, values.get(ctx.children[0])); // only forward
        debug {
            debugInfo.write(format("%s exitSmall_stmt:", counter++));
            debugInfo.write(format("\n\tvalues --> %s\n", values.get(ctx)));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterString_stmt(RuleTranslatorParser.String_stmtContext ctx) {
        debug {
            debugInfo.write(format("%s enterString_stmt:", counter++));
            debugInfo.write(format("\n\tlastIndent --> %s\n", lastIndent));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitString_stmt(RuleTranslatorParser.String_stmtContext ctx) {
        Result[] results;
        Result result;
        string seachString = ctx.getText[1 .. $-1]; // remove "
        // search for related configuration entry
        if (seachString in ibaConfigStat && language in ibaConfigStat[seachString])
            {
                auto statDef = ibaConfigStat[seachString][language];
                result.text ~= format!"<STAT kat=%s>%s</STAT>\n"(statDef["kat"],
                                                                 statDef["ref"].str);
            }
        else
            {
                // TODO send error message
                result.text = format("<<<<< undefined symbol \"%s\" in \"%s\" >>>>>\n",
                                     ctx.getText, language);
            }
        result.indent = lastIndent;
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitString_stmt:", counter++));
        }
        mixin(DebugPrintValues);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFunct_stmt(RuleTranslatorParser.Funct_stmtContext ctx) {
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFunct_stmt(RuleTranslatorParser.Funct_stmtContext ctx) {
        Result[] results;
        Result result;
        result.text = ctx.getText ~ "\n";
        result.indent = lastIndent;
        results ~= result;
        values.put(ctx, results);
        mixin(DebugExit);
        debug {
            debugInfo.writefln(format("\tvalues --> %s", values.get(ctx)));
        }
        if (ctx.getText in functionTemplates) {
            debug {
                debugInfo.writefln("\tctx.getText in functionTemplates --> %s", true);
            }
        }
        else {
            debug {
                debugInfo.writefln("\tctx.getText in functionTemplates --> %s", false);
            }
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFunct_name(RuleTranslatorParser.Funct_nameContext ctx) {
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFunct_name(RuleTranslatorParser.Funct_nameContext ctx) {
        mixin(DebugExit);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDot_e(RuleTranslatorParser.Dot_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitDot_e(RuleTranslatorParser.Dot_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFunct_parameters(RuleTranslatorParser.Funct_parametersContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFunct_parameters(RuleTranslatorParser.Funct_parametersContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterVar_stmt(RuleTranslatorParser.Var_stmtContext ctx) {
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitVar_stmt(RuleTranslatorParser.Var_stmtContext ctx) {
        Result[] results;
        Result result;
        string seachString = ctx.getText;
        // search for related configuration entry
        if (seachString in ibaConfigVar && language in ibaConfigVar[seachString])
            {
                auto varDef = ibaConfigVar[seachString][language];
                result.text ~= format!"<VAR kat=%s name=%s/>\n"(varDef["kat"],
                                                                varDef["name"]);
            }
        else
            {
                // TODO send error message
                result.text = format("<<<<< undefined symbol \"%s\" in \"%s\" >>>>>\n",
                                     ctx.getText, language);
            }
        result.indent = lastIndent;
        results ~= result;
        values.put(ctx, results);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFlow_stmt(RuleTranslatorParser.Flow_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFlow_stmt(RuleTranslatorParser.Flow_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterBreak_stmt(RuleTranslatorParser.Break_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitBreak_stmt(RuleTranslatorParser.Break_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterContinue_stmt(RuleTranslatorParser.Continue_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitContinue_stmt(RuleTranslatorParser.Continue_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDotted_as_name(RuleTranslatorParser.Dotted_as_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitDotted_as_name(RuleTranslatorParser.Dotted_as_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDotted_as_names(RuleTranslatorParser.Dotted_as_namesContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitDotted_as_names(RuleTranslatorParser.Dotted_as_namesContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDotted_name(RuleTranslatorParser.Dotted_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitDotted_name(RuleTranslatorParser.Dotted_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDotted_name_first_part(RuleTranslatorParser.Dotted_name_first_partContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitDotted_name_first_part(RuleTranslatorParser.Dotted_name_first_partContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDotted_name_part(RuleTranslatorParser.Dotted_name_partContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitDotted_name_part(RuleTranslatorParser.Dotted_name_partContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFirst_part_of_dotted_name(RuleTranslatorParser.First_part_of_dotted_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFirst_part_of_dotted_name(RuleTranslatorParser.First_part_of_dotted_nameContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterCompound_stmt(RuleTranslatorParser.Compound_stmtContext ctx) {
        debug {
            debugInfo.write(format("%s enterCompound_stmt:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitCompound_stmt(RuleTranslatorParser.Compound_stmtContext ctx) {
        values.put(ctx, values.get(ctx.children[0])); // only forward
        debug {
            debugInfo.write(format("%s exitCompound_stmt:", counter++));
            debugInfo.write(format("\n\tvalues --> %s\n", values.get(ctx)));
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterIf_condition_and_suite(RuleTranslatorParser.If_condition_and_suiteContext ctx) {
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitIf_condition_and_suite(RuleTranslatorParser.If_condition_and_suiteContext ctx) {
        values.put(ctx, values.get(ctx.children[1]));
        ifConditions.put(ctx, ifConditions.get(ctx.children[1]));
        debug {
            debugInfo.write(format("%s exitIf_condition_and_suite:", counter++));
            debugInfo.write(format("\n\tvalues --> %s", values.get(ctx)));
            debugInfo.write(format("\n\tifCondition --> %s\n", ifConditions.get(ctx.children[1])));
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterElif_condition_and_suite(RuleTranslatorParser.Elif_condition_and_suiteContext ctx) {
        debug {
            debugInfo.write(format("%s enterElif_condition_and_suite:", counter++));
            debugInfo.write(format("\n\tchilds --> %s\n", ctx.children));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitElif_condition_and_suite(RuleTranslatorParser.Elif_condition_and_suiteContext ctx) {
        Result[] results;
        Result resultE;
        resultE.text = "<ELSE>\n";
        resultE.indent = lastIndent;
        results ~= resultE;
        values.put(ctx, results ~ values.get(ctx.children[1]));
        ifConditions.put(ctx, ifConditions.get(ctx.children[1]));
        mixin(DebugExit);
        mixin(DebugPrintValues);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterElse_and_suite(RuleTranslatorParser.Else_and_suiteContext ctx) {
        debug {
            debugInfo.write(format("%s enterElse_and_suite:", counter++));
            debugInfo.write(format("\n\tchilds --> %s\n", ctx.children));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitElse_and_suite(RuleTranslatorParser.Else_and_suiteContext ctx) {
        IfCond ifCond;
        ifCond.cond = "ELSE";
        ifConditions.put(ctx, ifCond);  // special context ELSE

        Result[] results;
        Result resultE;
        resultE.text = "<ELSE>\n";
        resultE.indent = lastIndent;
        results ~= resultE;

        Result result;
        result.indent = ++lastIndent;
        results ~= result;
        results ~= values.get(ctx.children[2]);
        values.put(ctx, results);
        lastIndent--;
        debug {
            debugInfo.write(format("%s exitElse_and_suite:", counter++));
            debugInfo.write(format("\n\tvalues --> %s\n", values.get(ctx)));
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterIf_stmt(RuleTranslatorParser.If_stmtContext ctx) {
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitIf_stmt(RuleTranslatorParser.If_stmtContext ctx) {
        Result[] resultsCloseIf;
        Result[] resultsChilds;
        foreach (child; ctx.children) {
            debug {
                debugInfo.write(format("%s exitIf_stmtxx:", counter++));
                debugInfo.write(format("\n\tvalues --> %s\n", values.get(child)));
            }
            resultsChilds ~= values.get(child);
            IfCond ifCond = ifConditions.get(child);
            if (ifCond.cond != "ELSE") {
                Result closeIf;
                closeIf.text = format!"</%s>\n"(ifCond.cond);
                closeIf.indent = lastIndent;
                resultsCloseIf ~= closeIf;
            }
        }
        import std.algorithm.mutation;
        resultsCloseIf.reverse;
        values.put(ctx, resultsChilds ~ resultsCloseIf);

        debug {
            debugInfo.write(format("%s exitIf_stmt:", counter++));
            debugInfo.write(format("\n\tvalues --> %s\n", values.get(ctx)));
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterCondition_and_suite(RuleTranslatorParser.Condition_and_suiteContext ctx) {
        lastIndent++;
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitCondition_and_suite(RuleTranslatorParser.Condition_and_suiteContext ctx) {
        lastIndent--;
        IfCond ifCond = ifConditions.get(ctx.children[0]);
        ifConditions.put(ctx, ifCond);  // forward
        Result[] results;  // suite container
        Result result;
        // search for related configuration entry
        if (ifCond.name in ibaConfigCond && language in ibaConfigCond[ifCond.name])
            {
                auto varDef = ibaConfigCond[ifCond.name][language];
                // no condition
                if (ifCond.value == "")
                    {
                        result.text ~= format!"<%s name=%s>\n"(ifCond.cond,
                                                               varDef["name"]);
                    }
                else {
                    result.text ~= format!"<%s name=%s wert=%s>\n"(ifCond.cond,
                                                                   varDef["name"],
                                                                   ifCond.value
                                                                   );
                }
            }
        else
            {
                // TODO send error message
                result.text = format("<<<<< undefined condition name=\"%s\" language=\"%s\" >>>>>\n",
                                     ifCond.name, language);
            }
        result.indent = lastIndent;
        results ~= result;
        results ~= values.get(ctx.children[2]);
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitCondition_and_suite:", counter++));
            debugInfo.write(format("\n\tchilds --> %s", ctx.children));
            debugInfo.write(format("\n\tifCond --> %s", ifCond));
            debugInfo.write(format("\n\tresults --> %s", results));
            debugInfo.write(format("\n\tlastIndent --> %s\n", lastIndent));
        }

    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterCondition_with_value(RuleTranslatorParser.Condition_with_valueContext ctx) {
        string ifTest = "";
        ifTests.put(ctx, ifTest);
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitCondition_with_value(RuleTranslatorParser.Condition_with_valueContext ctx) {
        IfCond ifCond;
        ifCond.name = ifTests.get(ctx.children[1]);  // ['(' , text ')']
        ifCond.value = ctx.atom.getText;
        if (ifCond.value[0] != '"')
            ifCond.value = '"' ~ ifCond.value ~ '"';
        ifCond.cond = "IFDEF";
        if (ctx.reduced_comperator.getText == "<>" ||
            ctx.reduced_comperator.getText == "!=") {
            ifCond.cond = switchCondition(ifCond.cond);
        }
        ifConditions.put(ctx, ifCond);

        debug {
            debugInfo.write(format("%s exitCondition_with_value:\n", counter++));
            debugInfo.write(format("\tname -> %s\n", ifTests.get(ctx.children[1])));
            debugInfo.write(format("\treduced_comperator -> %s\n", ctx.reduced_comperator.getText));
            debugInfo.write(format("\tatom -> %s\n", ctx.atom.getText));
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterCondition_without_value(RuleTranslatorParser.Condition_without_valueContext ctx) {
        string ifTest = "";
        ifTests.put(ctx, ifTest);
        debug {
            debugInfo.write(format("%s enterCondition_without_value:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitCondition_without_value(RuleTranslatorParser.Condition_without_valueContext ctx) {
        IfCond ifCond;
        if (ctx.children[0].getText == "not")
            {
                ifCond.cond = "IFNDEF";
                ifCond.name = ifTests.get(ctx.children[2]);  // 'not' ['(' , text ')']
            }
        else
            {
                ifCond.cond = "IFDEF";
                ifCond.name = ifTests.get(ctx.children[1]);  // ['(' , text ')']
            }
        ifConditions.put(ctx, ifCond);

        debug {
            debugInfo.write(format("%s exitCondition_without_value:\n", counter++));
            debugInfo.write(format("\tifConditions.parent -> %s\n", ifConditions.get(ctx)));
            debugInfo.write(format("\tifTest -> %s\n", ifTests.get(ctx)));
            debugInfo.write(format("\tchilds -> %s\n", ctx.children));
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterElif_e(RuleTranslatorParser.Elif_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitElif_e(RuleTranslatorParser.Elif_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterElse_e(RuleTranslatorParser.Else_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitElse_e(RuleTranslatorParser.Else_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFor_stmt(RuleTranslatorParser.For_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFor_stmt(RuleTranslatorParser.For_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFor_testlist(RuleTranslatorParser.For_testlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFor_testlist(RuleTranslatorParser.For_testlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFor_exprlist(RuleTranslatorParser.For_exprlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFor_exprlist(RuleTranslatorParser.For_exprlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterBlock_stmt(RuleTranslatorParser.Block_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitBlock_stmt(RuleTranslatorParser.Block_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterBlock_suite(RuleTranslatorParser.Block_suiteContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitBlock_suite(RuleTranslatorParser.Block_suiteContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterWith_stmt(RuleTranslatorParser.With_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitWith_stmt(RuleTranslatorParser.With_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterWith_item(RuleTranslatorParser.With_itemContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitWith_item(RuleTranslatorParser.With_itemContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterSuite(RuleTranslatorParser.SuiteContext ctx) {
        Result[] results;
        Result result;
        result.text = "\n";
        result.indent = lastIndent;
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s enterSuite:", counter++));
            debugInfo.write(format("\n\tvalues --> %s\n", values.get(ctx)));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitSuite(RuleTranslatorParser.SuiteContext ctx) {
        Result[] results = values.get(ctx.stmt[0]); // only forward
        values.put(ctx, results);
        mixin(DebugExit);
        mixin(DebugPrintValues);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTest(RuleTranslatorParser.TestContext ctx) {
        auto ifTest = ifTests.get(ctx.getParent);
        ifTests.put(ctx, ifTest);
        debug {
            debugInfo.write(format("%s enterTest:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTest(RuleTranslatorParser.TestContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            append ~= ifTests.get(child);
        }
        import std.array : join;
        ifTests.put(ctx, join(append, ' '));
        result.text ~= join(append, ' ');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitTest:\n", counter++));
            debugInfo.write(format("\tifTests -> \"%s\"\n", ifTests.get(ctx)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
        }

    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterR_equals(RuleTranslatorParser.R_equalsContext ctx) {
        debug {
            debugInfo.write(format("%s enterR_equals:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitR_equals(RuleTranslatorParser.R_equalsContext ctx) {
        Result result;
        result.text = "==";
        Result[] results;
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitR_equals:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterR_not_equal(RuleTranslatorParser.R_not_equalContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitR_not_equal(RuleTranslatorParser.R_not_equalContext ctx) {
        Result result;
        result.text = "!=";
        Result[] results;
        results ~= result;
        values.put(ctx, results);
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterOr_e(RuleTranslatorParser.Or_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitOr_e(RuleTranslatorParser.Or_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterAnd_test(RuleTranslatorParser.And_testContext ctx) {
        auto ifTest = ifTests.get(ctx.getParent);
        ifTests.put(ctx, ifTest);
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitAnd_test(RuleTranslatorParser.And_testContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            append ~= ifTests.get(child);
        }
        import std.array : join;
        ifTests.put(ctx, join(append, ' '));
        result.text ~= join(append, ' ');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitAnd_test:\n", counter++));
            debugInfo.write(format("\tifTests -> \"%s\"\n", ifTests.get(ctx)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterAnd_e(RuleTranslatorParser.And_eContext ctx) {
        debug {
            debugInfo.write(format("%s enterAnd_test:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitAnd_e(RuleTranslatorParser.And_eContext ctx) {
        mixin(DebugExit);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterNot_test(RuleTranslatorParser.Not_testContext ctx) {
        auto ifTest = "";
        ifTests.put(ctx, ifTest);
        debug {
            debugInfo.write(format("%s enterNot_test:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitNot_test(RuleTranslatorParser.Not_testContext ctx) {
        string[] append;

        debug {
            debugInfo.write(format("%s exitNot_test:\n", counter++));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
        }
        foreach (i, child; ctx.children) {
            debug debugInfo.write(format("\t%s: ctx.child -> %s\n", i, ifTests.get(child)));
            append ~= ifTests.get(child);
        }
        import std.array : join;
        ifTests.put(ctx, join(append, ' '));

        debug {
            debugInfo.write(format("\tifTest -> \"%s\"\n", ifTests.get(ctx)));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterNot(RuleTranslatorParser.NotContext ctx) {
        auto ifTest = "";
        ifTests.put(ctx, ifTest);
        debug {
            debugInfo.write(format("%s enterNot:\n", counter++));
        }
        mixin(DebugEnter);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitNot(RuleTranslatorParser.NotContext ctx) {
        auto ifTest = ifTests.get(ctx);
        ifTests.put(ctx, ifTest ~ "not");
        mixin(DebugExit);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterComparison(RuleTranslatorParser.ComparisonContext ctx) {
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitComparison(RuleTranslatorParser.ComparisonContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            append ~= child.getText;
        }
        import std.array : join;
        ifTests.put(ctx.getParent, join(append, '.'));
        result.text ~= join(append, '.');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitComparison:\n", counter++));
            debugInfo.write(format("\tifTests -> %s\n", ifTests.get(ctx.parent)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
            debugInfo.write(format("\tresults -> %s\n", results));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterLess_than(RuleTranslatorParser.Less_thanContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitLess_than(RuleTranslatorParser.Less_thanContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterGreater_than(RuleTranslatorParser.Greater_thanContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitGreater_than(RuleTranslatorParser.Greater_thanContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterEquals(RuleTranslatorParser.EqualsContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitEquals(RuleTranslatorParser.EqualsContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterGreater_equal(RuleTranslatorParser.Greater_equalContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitGreater_equal(RuleTranslatorParser.Greater_equalContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterLess_equal(RuleTranslatorParser.Less_equalContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitLess_equal(RuleTranslatorParser.Less_equalContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterNot_equal(RuleTranslatorParser.Not_equalContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitNot_equal(RuleTranslatorParser.Not_equalContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterExpr(RuleTranslatorParser.ExprContext ctx) {
        debug {
            debugInfo.write(format("%s enterExpr:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitExpr(RuleTranslatorParser.ExprContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            append ~= child.getText;
        }
        import std.array : join;
        ifTests.put(ctx.getParent, join(append, '.'));
        result.text ~= join(append, '.');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitExpr:\n", counter++));
            debugInfo.write(format("\tifTests -> %s\n", ifTests.get(ctx.parent)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
            debugInfo.write(format("\tresults -> %s\n", results));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterXor_expr(RuleTranslatorParser.Xor_exprContext ctx) {
        debug {
            debugInfo.write(format("%s enterXor_expr:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitXor_expr(RuleTranslatorParser.Xor_exprContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            append ~= child.getText;
        }
        import std.array : join;
        ifTests.put(ctx.getParent, join(append, '.'));
        result.text ~= join(append, '.');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitXor_expr:\n", counter++));
            debugInfo.write(format("\tifTests -> %s\n", ifTests.get(ctx.parent)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
            debugInfo.write(format("\tresults -> %s\n", results));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterAnd_expr(RuleTranslatorParser.And_exprContext ctx) {
        debug {
            debugInfo.write(format("%s enterAnd_expr:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitAnd_expr(RuleTranslatorParser.And_exprContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            append ~= child.getText;
        }
        import std.array : join;
        ifTests.put(ctx.getParent, join(append, '.'));
        result.text ~= join(append, '.');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitAnd_expr:\n", counter++));
            debugInfo.write(format("\tifTests -> %s\n", ifTests.get(ctx.parent)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
            debugInfo.write(format("\tresults -> %s\n", results));
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterArith_expr(RuleTranslatorParser.Arith_exprContext ctx) {
        debug {
            debugInfo.write(format("%s enterArith_expr:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitArith_expr(RuleTranslatorParser.Arith_exprContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            append ~= child.getText;
        }
        import std.array : join;
        ifTests.put(ctx.getParent, join(append, '.'));
        result.text ~= join(append, '.');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitArith_expr:\n", counter++));
            debugInfo.write(format("\tifTests -> %s\n", ifTests.get(ctx.parent)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
            debugInfo.write(format("\tresults -> %s\n", results));
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTerm(RuleTranslatorParser.TermContext ctx) {
        debug {
            debugInfo.write(format("%s enterTerm:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTerm(RuleTranslatorParser.TermContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            append ~= child.getText;
        }
        import std.array : join;
        ifTests.put(ctx.getParent, join(append, '.'));
        result.text ~= join(append, '.');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitTerm:\n", counter++));
            debugInfo.write(format("\tifTests -> %s\n", ifTests.get(ctx.parent)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
            debugInfo.write(format("\tresults -> %s\n", results));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFactor(RuleTranslatorParser.FactorContext ctx) {
        debug {
            debugInfo.write(format("%s enterFactor:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFactor(RuleTranslatorParser.FactorContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            debug debugInfo.write(format("\t%s: ctx.child -> %s\n", i, child.getText));
            append ~= child.getText;
        }
        import std.array : join;
        ifTests.put(ctx.getParent, join(append, '.'));
        result.text ~= join(append, '.');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitFactor:\n", counter++));
            debugInfo.write(format("\tifTests -> %s\n", ifTests.get(ctx.parent)));
            debugInfo.write(format("\tctx.children -> %s\n", ctx.children));
            debugInfo.write(format("\tresults -> %s\n", results));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterAtom_dotted_name(RuleTranslatorParser.Atom_dotted_nameContext ctx) {
        debug {
            debugInfo.write(format("%s enterAtom_dotted_name:\n", counter++));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitAtom_dotted_name(RuleTranslatorParser.Atom_dotted_nameContext ctx) {
        Result[] results;
        Result result;
        string[] append;
        foreach (i, child; ctx.children) {
            debug debugInfo.write(format("\t%s: ctx.child -> %s\n", i, child.getText));
            append ~= child.getText;
        }
        import std.array : join;
        ifTests.put(ctx.getParent, join(append, '.'));
        result.text ~= join(append, '.');
        results ~= result;
        values.put(ctx, results);
        debug {
            debugInfo.write(format("%s exitAtom_dotted_name:\n", counter++));
            debugInfo.write(format("\tgetText -> %s\n", ctx.getText));
            debugInfo.write(format("\tctx.children) -> %s\n", ctx.children));
            debugInfo.write(format("\tifTest -> %s\n", ifTests.get(ctx.getParent)));
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterAtom_funct_stmt(RuleTranslatorParser.Atom_funct_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitAtom_funct_stmt(RuleTranslatorParser.Atom_funct_stmtContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterNumber_e(RuleTranslatorParser.Number_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitNumber_e(RuleTranslatorParser.Number_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterString_e(RuleTranslatorParser.String_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitString_e(RuleTranslatorParser.String_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTrue_e(RuleTranslatorParser.True_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTrue_e(RuleTranslatorParser.True_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFalse_e(RuleTranslatorParser.False_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFalse_e(RuleTranslatorParser.False_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterLast_e(RuleTranslatorParser.Last_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitLast_e(RuleTranslatorParser.Last_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFirst_e(RuleTranslatorParser.First_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFirst_e(RuleTranslatorParser.First_eContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTestlist_comp(RuleTranslatorParser.Testlist_compContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTestlist_comp(RuleTranslatorParser.Testlist_compContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTrailer(RuleTranslatorParser.TrailerContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTrailer(RuleTranslatorParser.TrailerContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterSubscriptlist(RuleTranslatorParser.SubscriptlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitSubscriptlist(RuleTranslatorParser.SubscriptlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterSubscript(RuleTranslatorParser.SubscriptContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitSubscript(RuleTranslatorParser.SubscriptContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterSliceop(RuleTranslatorParser.SliceopContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitSliceop(RuleTranslatorParser.SliceopContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterExprlist(RuleTranslatorParser.ExprlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitExprlist(RuleTranslatorParser.ExprlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTestlist(RuleTranslatorParser.TestlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTestlist(RuleTranslatorParser.TestlistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDictorsetmaker(RuleTranslatorParser.DictorsetmakerContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitDictorsetmaker(RuleTranslatorParser.DictorsetmakerContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterArglist(RuleTranslatorParser.ArglistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitArglist(RuleTranslatorParser.ArglistContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterArgument(RuleTranslatorParser.ArgumentContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitArgument(RuleTranslatorParser.ArgumentContext ctx) { }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterEveryRule(ParserRuleContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitEveryRule(ParserRuleContext ctx) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void visitTerminal(TerminalNode node) { }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void visitErrorNode(ErrorNode node) { }
}

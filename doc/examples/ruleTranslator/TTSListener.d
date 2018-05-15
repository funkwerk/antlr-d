module TTSListener;

import RuleTranslatorBaseListener;
import RuleTranslatorParser: RuleTranslatorParser;
import RuleWriter: RuleWriter;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.TerminalNode;
import std.algorithm.iteration;
import std.array;
import std.container : SList;
import std.format;
import std.stdio;
import std.string;

/**
 * This class provides an empty implementation of {@link RuleTranslatorListener},
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
public class TTSListener : RuleTranslatorBaseListener {

    debug __gshared short counter;

    private auto stack = SList!(string[])();

    struct RuleSetting
    {
        string language;
        string ruleName;
        string className;
        string baseName;
    }

    private RuleSetting ruleSetting;

    struct LoopElement
    {
        string foreachType;
        string foreachElementType;
        ushort foreachIndex;  // index must not start at 0
    }

    private auto loopStack = SList!(LoopElement)();

    private string foreachElementName;

    private string dottedName;

    private ushort indentLevel;

    private bool funcdefFlag;

    private bool trailerMode;

    private bool ruleRequired = true;

    private bool ruleExists;

    public RuleWriter writer;

    public string withPropertyName;

    public string arguments;

    string[] startText = [
                          "\n",
                          "override string[] rule" ~
                          "(${arguments})\n",
                          "{\n",
                          "    output.clear;\n\n",
                          "    with(${withPropertyName})\n",
                          "    {\n"
                          ];

    string[] closingText = [
                            "\n",
                            "static this()\n",
                            "{\n",
                            "    auto inst = new ${class}();\n",
                            "    inst.type = \"${rule}\";\n",
                            "    inst.language = \"${language}\";\n",
                            "    Repository.register(inst);\n",
                            "}\n"
                            ];

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFile_input(RuleTranslatorParser.File_inputContext ctx) {
        writer.put("module ");
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFile_input(RuleTranslatorParser.File_inputContext ctx) {
        debug {
            writefln("%s exitFile_input:", counter++);
            writefln("\truleRequired = %s", ruleRequired);
            writefln("\truleExits = %s", ruleExists);
        }
        writer.indentLevel = -- indentLevel;
        writer.putnl("}");
        if(ruleExists) {
            with(ruleSetting) {
                closingText.each!((ref n) => n = n.replace("${class}",
                                                           className ? className : ruleName));
                closingText.each!((ref n) => n = n.replace("${rule}", ruleName));
                closingText.each!((ref n) => n = n.replace("${language}", language));
            }
            writer.putnl("return output.data;");
            writer.indentLevel = -- indentLevel;
            writer.putnl("}");
            writer.put(closingText);
            writer.indentLevel = -- indentLevel;
            writer.putnl("}");
        }
        writer.print;
        writer.clear;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitRule_setting(RuleTranslatorParser.Rule_settingContext ctx) {
        with(ruleSetting) {
            if (language)
                writer.putnl(format("%s.%s;\n",
                                    language,
                                    className ? className : ruleName
                                    )
                             );
            else
                writer.putnl(format("%s;\n",
                                    className ? className : ruleName
                                    )
                             );
        }
        writer.putnl("import std.array;");
        writer.putnl("import std.conv;");
        writer.putnl("import std.datetime;");
        writer.putnl("import rule.Repository;");
        writer.putnl("import rule.GeneratedRule;\n");
        writer.putnl("auto iterate(R)(R range)");
        writer.putnl("{");
        writer.putnl("    import std.algorithm : map;");
        writer.putnl("    import std.range : enumerate;");
        writer.putnl("    import std.typecons : tuple;\n");

        writer.putnl("    return enumerate(range)");
        writer.putnl("        .map!(a => tuple!(\"value\", \"first\", \"last\")(a.value, a.index == 0, a.index + 1 == range.length));");
        writer.putnl("}");
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterClass_name(RuleTranslatorParser.Class_nameContext ctx) {
        ruleSetting.className = ctx.getText;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterRule_name(RuleTranslatorParser.Rule_nameContext ctx) {
        ruleSetting.ruleName = ctx.getText;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterLanguage(RuleTranslatorParser.LanguageContext ctx) {
        ruleSetting.language = "";
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitLanguage(RuleTranslatorParser.LanguageContext ctx) {
        ruleSetting.language = ctx.getText;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterImport_stmt(RuleTranslatorParser.Import_stmtContext ctx) {
        string app;
        foreach(el; ctx.children[2..$])
            app ~= el.getText;
        writer.putnl(format("import %s;", app));
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterBase_rules(RuleTranslatorParser.Base_rulesContext ctx) {
        ruleSetting.baseName = ctx.getText;
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
    override public void exitImport_stmts(RuleTranslatorParser.Import_stmtsContext ctx) {
        if(ruleSetting.className)
            writer.putnl(format("\nclass %s : %s\n{", ruleSetting.className, ruleSetting.baseName));
        else
            writer.putnl(format("\nclass %s : GeneratedRule\n{", ruleSetting.ruleName));
        writer.indentLevel = ++ indentLevel;
    }


    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFunctionName(RuleTranslatorParser.FunctionNameContext ctx) {
        writer.put(ctx.getText);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterStmt(RuleTranslatorParser.StmtContext ctx) {
        debug {
            writefln("%s enterStmt:", counter++);
            writefln("\truleRequired = %s", ruleRequired);
            writefln("\truleExits = %s", ruleExists);
        }
        if (ruleRequired) {
            startText.each!((ref n) => n = n.replace("${withPropertyName}", withPropertyName));
            startText.each!((ref n) => n = n.replace("${arguments}", arguments));
            writer.put(startText);
            writer.indentLevel = ++ indentLevel;
            writer.indentLevel = ++ indentLevel;
            ruleExists = true;
            ruleRequired = false;
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFuncdef(RuleTranslatorParser.FuncdefContext ctx) {
        writer.putnl("");
        writer.put("void ");
        funcdefFlag = true;
        ruleRequired = false;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFuncdef(RuleTranslatorParser.FuncdefContext ctx) {
        writer.indentLevel = -- indentLevel;
        writer.putnl("}");
        ruleRequired = true;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterParameters(RuleTranslatorParser.ParametersContext ctx) {
        if (funcdefFlag)
            {
                auto spl = splitter(ctx.getText[1..($-1)], ',');
                writer.putnl('(' ~ spl.map!(a => "T_" ~ a).join(", ") ~ ')');
                writer.putnl("    (" ~ spl.map!(a => "T_" ~ a ~ ' ' ~ a).join(", ") ~ ')');
                writer.putnl("{");
                writer.indentLevel = ++ indentLevel;
                funcdefFlag = false;
            }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterString_stmt(RuleTranslatorParser.String_stmtContext ctx) {
        if (!stack.empty) {
            stack.front ~= format("append(%s)", ctx.children[0].getText);
            debug {
                writefln("%s enterString_stmt:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitVar_stmt(RuleTranslatorParser.Var_stmtContext ctx) {
        if (!stack.empty) {
            stack.front ~= format("append(%s)", dottedName);
        }
        debug {
            writefln("%s exitVar_stmt:", counter++);
            writefln("\tdottedName = %s", dottedName);
        }
    }

    /**
     * When the name of the variable is equal to the foreach element,
     * we need to append '.value' property
     */
    override public void enterFirst_part_of_dotted_name(RuleTranslatorParser.First_part_of_dotted_nameContext ctx) {
        dottedName = ctx.getText;
        if (!loopStack.empty) {
            import std.algorithm : map;
            import std.algorithm: canFind;
            if (array(map!(a => a.foreachElementType)(loopStack[])).canFind(ctx.getText)) {
                dottedName ~= ".value";
            }
        }
        debug {
            writefln("%s enterFirst_part_of_dotted_name:", counter++);
            writefln("\ttext = %s", ctx.getText);
            writefln("\tdottedName = %s", dottedName);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDotted_name_part(RuleTranslatorParser.Dotted_name_partContext ctx) {
        dottedName ~= "." ~ ctx.getText;
        debug {
            writefln("%s enterDotted_name_part:", counter++);
            writefln("\ttext = %s", ctx.getText);
            writefln("\tdottedName = %s", dottedName);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterIf_stmt(RuleTranslatorParser.If_stmtContext ctx) {
        writer.put("if (");
        debug {
            writefln("%s enterIf_stmt:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitIf_stmt(RuleTranslatorParser.If_stmtContext ctx) {
        writer.indentLevel = -- indentLevel;
        writer.putnl("}");
        debug {
            writefln("%s exitIf_stmt:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }


    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitAtom_dotted_name(RuleTranslatorParser.Atom_dotted_nameContext ctx) {
        if (!stack.empty) {
            stack.front ~= dottedName;
            debug {
                writefln("%s exitAtom_dotted_name:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFunct_name(RuleTranslatorParser.Funct_nameContext ctx) {
        if (!stack.empty) {
            stack.front ~= ctx.getText;
            debug {
                writefln("%s enterFunct_name: %s", counter++, ctx.getText);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterCondition(RuleTranslatorParser.ConditionContext ctx) {
        string[] conditionBuf;
        stack.insert(conditionBuf);
        debug {
            writefln("%s enterCondition:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitCondition(RuleTranslatorParser.ConditionContext ctx) {
        writer.put(stack.front.join);
        writer.putnl(")");
        stack.removeFront;
        writer.putnl("{");
        writer.indentLevel = ++ indentLevel;
        debug {
            writefln("%s exitCondition:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterNot(RuleTranslatorParser.NotContext ctx) {
        stack.front ~= "!";
        debug {
            writefln("%s enterNot:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFunct_parameters(RuleTranslatorParser.Funct_parametersContext ctx) {
        if (!stack.empty) {
            string[] s;
            stack.insert(s);
            debug {
                writefln("%s enterFunct_parameters: %s", counter++, ctx.getText);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFunct_parameters(RuleTranslatorParser.Funct_parametersContext ctx) {
        if (!stack.empty) {
            auto x = stack.front.join(", ");
            stack.removeFront;
            stack.front ~= "(" ~ x ~ ")";
            debug {
                writefln("%s exitFunct_parameters:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTfpdef_number(RuleTranslatorParser.Tfpdef_numberContext ctx) {
        if (!stack.empty) {
            stack.front ~= ctx.getText;
            debug {
                writefln("%s enterTfpdef_number(%s):", counter++, trailerMode);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTfpdef_name(RuleTranslatorParser.Tfpdef_nameContext ctx) {
        if (!stack.empty) {
            stack.front ~= dottedName;
            debug {
                writefln("%s exitTfpdefName:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTfpdef_string(RuleTranslatorParser.Tfpdef_stringContext ctx) {
        if (!stack.empty) {
            stack.front ~= ctx.getText;
            debug {
                writefln("%s enterTfpdef_string:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTfpdef_funct_stm(RuleTranslatorParser.Tfpdef_funct_stmContext ctx) {
        if (!stack.empty) {
            string[] s;
            stack.insert(s);
            debug {
                writefln("%s enterTfpdef_funct_stm:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTfpdef_funct_stm(RuleTranslatorParser.Tfpdef_funct_stmContext ctx) {
        if (!stack.empty) {
            auto x = stack.front.join;
            stack.removeFront;
            stack.front ~= x;
            debug {
                writefln("%s exitTfpdef_funct_stm:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterElse_e(RuleTranslatorParser.Else_eContext ctx) {
        writer.indentLevel = -- indentLevel;
        writer.putnl("}");
        writer.putnl("else");
        writer.putnl("{");
        writer.indentLevel = ++ indentLevel;
        debug {
            writefln("%s enterElse_e:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterElif_e(RuleTranslatorParser.Elif_eContext ctx) {
        writer.indentLevel = -- indentLevel;
        writer.putnl("}");
        writer.put("else if (");
        debug {
            writefln("%s enterElif_e:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterOr_e(RuleTranslatorParser.Or_eContext ctx) {
        if (!stack.empty) {
            stack.front ~= " || ";
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterAnd_e(RuleTranslatorParser.And_eContext ctx) {
        if (!stack.empty) {
            stack.front ~= " && ";
            debug {
                writefln("%s enterAnd_e:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterLess_than(RuleTranslatorParser.Less_thanContext ctx) {
        if (!stack.empty) {
            stack.front ~= " < ";
            debug {
                writefln("%s enterLess_than:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterGreater_than(RuleTranslatorParser.Greater_thanContext ctx) {
        if (!stack.empty) {
            stack.front ~= " > ";
            debug {
                writefln("%s enterGreater_than:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterGreater_equal(RuleTranslatorParser.Greater_equalContext ctx) {
        if (!stack.empty) {
            stack.front ~= " >= ";
            debug {
                writefln("%s enterGreater_equal:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterLess_equal(RuleTranslatorParser.Less_equalContext ctx) {
        if (!stack.empty) {
            stack.front ~= " <= ";
            debug {
                writefln("%s enterLess_equal:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterEquals(RuleTranslatorParser.EqualsContext ctx) {
        if (!stack.empty) {
            stack.front ~= " == ";
            debug {
                writefln("%s enterEquals:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterNot_equal(RuleTranslatorParser.Not_equalContext ctx) {
        if (!stack.empty) {
            stack.front ~= " != ";
            debug {
                writefln("%s enterNot_equal:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterDot_e(RuleTranslatorParser.Dot_eContext ctx) {
        if (!stack.empty) {
            stack.front ~= ".";
            debug {
                writefln("%s enterDot_e:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterSmall_stmt(RuleTranslatorParser.Small_stmtContext ctx) {
        string[] conditionBuf;
        stack.insert(conditionBuf);
        debug {
            writefln("%s enterSmall_stmt:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitSmall_stmt(RuleTranslatorParser.Small_stmtContext ctx) {
        if (!stack.empty) {
            writer.put(stack.front.join);
            writer.putnl(";");
            stack.removeFront;
            debug {
                writefln("%s exitSmall_stmt:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterBlock_stmt(RuleTranslatorParser.Block_stmtContext ctx) {
        string[] conditionBuf;
        stack.insert(conditionBuf);
        debug {
            writefln("%s enterBlock_stmt:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitBlock_stmt(RuleTranslatorParser.Block_stmtContext ctx) {
        if (!stack.empty) {
            writer.putnl(stack.front.join);
            stack.removeFront;
            debug {
                writefln("%s exitBlock_stmt:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }}
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterNumber_e(RuleTranslatorParser.Number_eContext ctx) {
        if (!stack.empty && !trailerMode) {
            stack.front ~= ctx.getText;
            debug {
                writefln("%s enterNumber_e(%s):", counter++, trailerMode);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterString_e(RuleTranslatorParser.String_eContext ctx) {
        if (!stack.empty)
            stack.front ~= ctx.getText;
        debug {
            writefln("%s enterString_e:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterAtom_funct_stmt(RuleTranslatorParser.Atom_funct_stmtContext ctx) {
        if (!stack.empty) {
            string[] s;
            stack.insert(s);
            debug {
                writefln("%s enterAtom_funct_stmt:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitAtom_funct_stmt(RuleTranslatorParser.Atom_funct_stmtContext ctx) {
        if (!stack.empty) {
            auto x = stack.front;
            stack.removeFront;
            stack.front ~= x;
            debug {
                writefln("%s exitAtom_funct_stmt:", counter++);
                foreach(el; stack.opSlice)
                    writefln("\t%s", el);
            }
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTrue_e(RuleTranslatorParser.True_eContext ctx) {
        if (!stack.empty)
            stack.front ~= "true";
        debug {
            writefln("%s enterTrue_e:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFalse_e(RuleTranslatorParser.False_eContext ctx) {
        if (!stack.empty)
            stack.front ~= "false";
        debug {
            writefln("%s enterFalse_e:", counter++);
            foreach(el; stack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFor_stmt(RuleTranslatorParser.For_stmtContext ctx) {
        LoopElement l;
        loopStack.insert(l);
        writer.put("foreach (");
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFor_stmt(RuleTranslatorParser.For_stmtContext ctx) {
        writer.indentLevel = -- indentLevel;
        writer.putnl("}");
        debug {
            writefln("%s exitFor_stm:", counter++);
            foreach(el; loopStack.opSlice)
                writefln("\t%s", el);
        }
        loopStack.removeFront;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFor_exprlist(RuleTranslatorParser.For_exprlistContext ctx) {
        foreachElementName = ctx.getText;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFor_testlist(RuleTranslatorParser.For_testlistContext ctx) {
        LoopElement l;
        l.foreachElementType = foreachElementName;
        l.foreachType = ctx.getText;
        l.foreachIndex = 0;
        loopStack.front = l;
        debug {
            writefln("%s enterFor_testlist loop stack:", counter++);
            foreach(el; loopStack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitFor_testlist(RuleTranslatorParser.For_testlistContext ctx)
    {
        writer.putnl(format("%s; %s.iterate)",
                            loopStack.front.foreachElementType,
                            loopStack.front.foreachType,
                            )
                     );
        writer.putnl("{");
        writer.indentLevel = ++ indentLevel;
        debug {
            writefln("%s exitFor_testlist:", counter++);
            foreach(el; loopStack.opSlice)
                writefln("\t%s", el);
        }
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFirst_e(RuleTranslatorParser.First_eContext ctx) {
        if (!stack.empty)
            stack.front ~= format("%s.first",
                                  loopStack.front.foreachElementType,
                                  );
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterLast_e(RuleTranslatorParser.Last_eContext ctx) {
        if (!stack.empty)
            stack.front ~= format("%s.last",
                                  loopStack.front.foreachElementType);
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterTrailer(RuleTranslatorParser.TrailerContext ctx) {
        trailerMode = true;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitTrailer(RuleTranslatorParser.TrailerContext ctx) {
        trailerMode = false;
    }
}

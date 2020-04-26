// Generated from RuleTranslator.g4 by ANTLR 4.8
import antlr.v4.runtime.atn.ATN : ATN;
alias ATNType = ATN;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.PredictionModeConst;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.atn.InterfaceParserATNSimulator;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.BailErrorStrategy;
import antlr.v4.runtime.RuntimeMetaData;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.TokenConstantDefinition;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.InterfaceRuleContext;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.FailedPredicateException;
import antlr.v4.runtime.NoViableAltException;
import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.tree.ParseTreeListener;
import antlr.v4.runtime.tree.ParseTreeVisitor;
import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.tree.ParseTreeWalker;
import std.conv : to;

public class RuleTranslatorParser : Parser {
    static this() { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

    protected static DFA[] _decisionToDFA;
    protected PredictionContextCache _sharedContextCache =
        new PredictionContextCache();
    public enum int
        T__0=1,T__1=2,STRING=3,NUMBER=4,INTEGER=5,FIRST=6,LAST=7,RULE=8,
        BASE=9,DEF=10,RETURN=11,AS=12,IF=13,IN=14,ELIF=15,ELSE=16,WHILE=17,
        FOR=18,OR=19,AND=20,NOT=21,TRUE=22,FALSE=23,CONTINUE=24,BREAK=25,
        BLOCK=26,NEWLINE=27,NAME=28,STRING_LITERAL=29,BYTES_LITERAL=30,DECIMAL_INTEGER=31,
        HEX_INTEGER=32,DOT=33,STAR=34,OPEN_PAREN=35,CLOSE_PAREN=36,COMMA=37,
        COLON=38,SEMI_COLON=39,POWER=40,ASSIGN=41,OPEN_BRACK=42,CLOSE_BRACK=43,
        OR_OP=44,XOR=45,AND_OP=46,ADD=47,MINUS=48,DIV=49,MOD=50,NOT_OP=51,
        OPEN_BRACE=52,CLOSE_BRACE=53,LESS_THAN=54,GREATER_THAN=55,EQUALS=56,
        GT_EQ=57,LT_EQ=58,NOT_EQ_1=59,NOT_EQ_2=60,AT=61,ARROW=62,ADD_ASSIGN=63,
        SUB_ASSIGN=64,MULT_ASSIGN=65,AT_ASSIGN=66,DIV_ASSIGN=67,MOD_ASSIGN=68,
        AND_ASSIGN=69,OR_ASSIGN=70,XOR_ASSIGN=71,LEFT_SHIFT_ASSIGN=72,RIGHT_SHIFT_ASSIGN=73,
        POWER_ASSIGN=74,IDIV_ASSIGN=75,SKIP_=76,UNKNOWN_CHAR=77,INDENT=78,
        DEDENT=79;
    public enum int
        RULE_file_input = 0,RULE_ruledef = 1,RULE_import_stmts = 2,RULE_rule_setting = 3,
        RULE_class_name = 4,RULE_rule_name = 5,RULE_language = 6,RULE_import_stmt = 7,
        RULE_base_rules = 8,RULE_funcdef = 9,RULE_functionName = 10,RULE_parameters = 11,
        RULE_typedargslist = 12,RULE_tfpdef = 13,RULE_stmt = 14,RULE_simple_stmt = 15,
        RULE_small_stmt = 16,RULE_string_stmt = 17,RULE_funct_stmt = 18,
        RULE_funct_name = 19,RULE_dot_e = 20,RULE_funct_parameters = 21,
        RULE_var_stmt = 22,RULE_flow_stmt = 23,RULE_break_stmt = 24,RULE_continue_stmt = 25,
        RULE_dotted_as_name = 26,RULE_dotted_as_names = 27,RULE_dotted_name = 28,
        RULE_dotted_name_first_part = 29,RULE_dotted_name_part = 30,RULE_first_part_of_dotted_name = 31,
        RULE_compound_stmt = 32,RULE_if_stmt = 33,RULE_condition = 34,RULE_elif_e = 35,
        RULE_else_e = 36,RULE_for_stmt = 37,RULE_for_testlist = 38,RULE_for_exprlist = 39,
        RULE_block_stmt = 40,RULE_block_suite = 41,RULE_with_stmt = 42,RULE_with_item = 43,
        RULE_suite = 44,RULE_test = 45,RULE_test_nocond = 46,RULE_or_test = 47,
        RULE_or_e = 48,RULE_and_test = 49,RULE_and_e = 50,RULE_not_test = 51,
        RULE_not = 52,RULE_comparison = 53,RULE_comp_op = 54,RULE_expr = 55,
        RULE_xor_expr = 56,RULE_and_expr = 57,RULE_arith_expr = 58,RULE_term = 59,
        RULE_factor = 60,RULE_atom = 61,RULE_add = 62,RULE_minus = 63,RULE_testlist_comp = 64,
        RULE_trailer = 65,RULE_subscriptlist = 66,RULE_subscript = 67,RULE_sliceop = 68,
        RULE_exprlist = 69,RULE_testlist = 70,RULE_dictorsetmaker = 71,RULE_arglist = 72,
        RULE_argument = 73;
    public static const string[] ruleNames = [
        "file_input","ruledef","import_stmts","rule_setting","class_name",
        "rule_name","language","import_stmt","base_rules","funcdef","functionName",
        "parameters","typedargslist","tfpdef","stmt","simple_stmt","small_stmt",
        "string_stmt","funct_stmt","funct_name","dot_e","funct_parameters",
        "var_stmt","flow_stmt","break_stmt","continue_stmt","dotted_as_name",
        "dotted_as_names","dotted_name","dotted_name_first_part","dotted_name_part",
        "first_part_of_dotted_name","compound_stmt","if_stmt","condition",
        "elif_e","else_e","for_stmt","for_testlist","for_exprlist","block_stmt",
        "block_suite","with_stmt","with_item","suite","test","test_nocond",
        "or_test","or_e","and_test","and_e","not_test","not","comparison",
        "comp_op","expr","xor_expr","and_expr","arith_expr","term","factor",
        "atom","add","minus","testlist_comp","trailer","subscriptlist","subscript",
        "sliceop","exprlist","testlist","dictorsetmaker","arglist","argument"
    ];

    private static const string[] _LITERAL_NAMES = [
        null,"'with'","'//'",null,null,null,"'first'","'last'","'rule'",
        "'base'","'def'","'return'","'as'","'if'","'in'","'elif'","'else'",
        "'while'","'for'","'or'","'and'","'not'","'True'","'False'","'continue'",
        "'break'","'block'",null,null,null,null,null,null,"'.'","'*'","'('",
        "')'","','","':'","';'","'**'","'='","'['","']'","'|'","'^'","'&'",
        "'+'","'-'","'/'","'%'","'~'","'{'","'}'","'<'","'>'","'=='","'>='",
        "'<='","'<>'","'!='","'@'","'->'","'+='","'-='","'*='","'@='","'/='",
        "'%='","'&='","'|='","'^='","'<<='","'>>='","'**='","'//='"
    ];
    private static const string[] _SYMBOLIC_NAMES = [
        null,null,null,"STRING","NUMBER","INTEGER","FIRST","LAST","RULE",
        "BASE","DEF","RETURN","AS","IF","IN","ELIF","ELSE","WHILE","FOR",
        "OR","AND","NOT","TRUE","FALSE","CONTINUE","BREAK","BLOCK","NEWLINE",
        "NAME","STRING_LITERAL","BYTES_LITERAL","DECIMAL_INTEGER","HEX_INTEGER",
        "DOT","STAR","OPEN_PAREN","CLOSE_PAREN","COMMA","COLON","SEMI_COLON",
        "POWER","ASSIGN","OPEN_BRACK","CLOSE_BRACK","OR_OP","XOR","AND_OP",
        "ADD","MINUS","DIV","MOD","NOT_OP","OPEN_BRACE","CLOSE_BRACE","LESS_THAN",
        "GREATER_THAN","EQUALS","GT_EQ","LT_EQ","NOT_EQ_1","NOT_EQ_2","AT",
        "ARROW","ADD_ASSIGN","SUB_ASSIGN","MULT_ASSIGN","AT_ASSIGN","DIV_ASSIGN",
        "MOD_ASSIGN","AND_ASSIGN","OR_ASSIGN","XOR_ASSIGN","LEFT_SHIFT_ASSIGN",
        "RIGHT_SHIFT_ASSIGN","POWER_ASSIGN","IDIV_ASSIGN","SKIP_","UNKNOWN_CHAR",
        "INDENT","DEDENT"
    ];
    public static Vocabulary VOCABULARY;

    /**
     * @deprecated Use {@link #VOCABULARY} instead.
     */
    public static string[_SYMBOLIC_NAMES.length] tokenNames;

    static this() {
        VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);
        for (int i = 0; i < tokenNames.length; i++) {
            tokenNames[i] = VOCABULARY.getLiteralName(i);
                if (tokenNames[i] is null) {
                    tokenNames[i] = VOCABULARY.getSymbolicName(i);
            }
            if (tokenNames[i] is null)
            {
                tokenNames[i] = "<INVALID>";
            }
        }
    }

    override public string[] getTokenNames() {
        return tokenNames;
    }

    override public Vocabulary getVocabulary() {
        return VOCABULARY;
    }

    override
    public string getGrammarFileName() { return "RuleTranslator.g4"; }

    override
    public string[] getRuleNames() { return ruleNames.dup; }

    override
    public wstring getSerializedATN() { return _serializedATN; }

    override
    public ATNType getATN() { return _ATN; }

    public this(TokenStream input) {
        super(input);
        _interp = new ParserATNSimulator(this,_ATN, _decisionToDFA, _sharedContextCache);
    }

    public static class File_inputContext : ParserRuleContext {
        public Rule_settingContext rule_setting() {
            return getRuleContext!Rule_settingContext(0);
        }
        public Import_stmtsContext import_stmts() {
            return getRuleContext!Import_stmtsContext(0);
        }
        public TerminalNode EOF() { return getToken(RuleTranslatorParser.EOF, 0); }
        public TerminalNode[] NEWLINE() { return getTokens(RuleTranslatorParser.NEWLINE); }
        public TerminalNode NEWLINE(int i) {
            return getToken(RuleTranslatorParser.NEWLINE, i);
        }
        public FuncdefContext[] funcdef() {
            return getRuleContexts!FuncdefContext;
        }
        public FuncdefContext funcdef(int i) {
            return getRuleContext!FuncdefContext(i);
        }
        public RuledefContext ruledef() {
            return getRuleContext!RuledefContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_file_input; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFile_input(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFile_input(this);
        }
    }

    public File_inputContext file_input() {
        File_inputContext _localctx = new File_inputContext(ctx_, getState());
        enterRule(_localctx, 0, RULE_file_input);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(148);
            rule_setting();
            setState(149);
            import_stmts();
            setState(154);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,1, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    {
                    setState(152);
                    _errHandler.sync(this);
                    switch (_input.LA(1)) {
                    case NEWLINE:
                        {
                        setState(150);
                        match(NEWLINE);
                        }
                        break;
                    case DEF:
                        {
                        setState(151);
                        funcdef();
                        }
                        break;
                    default:
                        throw new NoViableAltException(this);
                    }
                    }
                }
                setState(156);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,1, ctx_);
            }
            setState(161);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case NEWLINE:
                {
                setState(157);
                match(NEWLINE);
                }
                break;
            case EOF:
            case T__0:
            case STRING:
            case IF:
            case FOR:
            case CONTINUE:
            case BREAK:
            case BLOCK:
            case NAME:
                {
                setState(159);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << STRING) | (1L << IF) | (1L << FOR) | (1L << CONTINUE) | (1L << BREAK) | (1L << BLOCK) | (1L << NAME))) != 0)) {
                    {
                    setState(158);
                    ruledef();
                    }
                }

                }
                break;
            default:
                throw new NoViableAltException(this);
            }
            setState(163);
            match(EOF);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class RuledefContext : ParserRuleContext {
        public StmtContext[] stmt() {
            return getRuleContexts!StmtContext;
        }
        public StmtContext stmt(int i) {
            return getRuleContext!StmtContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_ruledef; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterRuledef(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitRuledef(this);
        }
    }

    public RuledefContext ruledef() {
        RuledefContext _localctx = new RuledefContext(ctx_, getState());
        enterRule(_localctx, 2, RULE_ruledef);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(166);
            _errHandler.sync(this);
            _la = _input.LA(1);
            do {
                {
                {
                setState(165);
                stmt();
                }
                }
                setState(168);
                _errHandler.sync(this);
                _la = _input.LA(1);
            } while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << STRING) | (1L << IF) | (1L << FOR) | (1L << CONTINUE) | (1L << BREAK) | (1L << BLOCK) | (1L << NAME))) != 0) );
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Import_stmtsContext : ParserRuleContext {
        public Import_stmtContext[] import_stmt() {
            return getRuleContexts!Import_stmtContext;
        }
        public Import_stmtContext import_stmt(int i) {
            return getRuleContext!Import_stmtContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_import_stmts; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterImport_stmts(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitImport_stmts(this);
        }
    }

    public Import_stmtsContext import_stmts() {
        Import_stmtsContext _localctx = new Import_stmtsContext(ctx_, getState());
        enterRule(_localctx, 4, RULE_import_stmts);
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(173);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,5, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    {
                    {
                    setState(170);
                    import_stmt();
                    }
                    }
                }
                setState(175);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,5, ctx_);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Rule_settingContext : ParserRuleContext {
        public TerminalNode RULE() { return getToken(RuleTranslatorParser.RULE, 0); }
        public Rule_nameContext rule_name() {
            return getRuleContext!Rule_nameContext(0);
        }
        public LanguageContext language() {
            return getRuleContext!LanguageContext(0);
        }
        public TerminalNode[] NEWLINE() { return getTokens(RuleTranslatorParser.NEWLINE); }
        public TerminalNode NEWLINE(int i) {
            return getToken(RuleTranslatorParser.NEWLINE, i);
        }
        public Class_nameContext class_name() {
            return getRuleContext!Class_nameContext(0);
        }
        public TerminalNode AS() { return getToken(RuleTranslatorParser.AS, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_rule_setting; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterRule_setting(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitRule_setting(this);
        }
    }

    public Rule_settingContext rule_setting() {
        Rule_settingContext _localctx = new Rule_settingContext(ctx_, getState());
        enterRule(_localctx, 6, RULE_rule_setting);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(179);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==NEWLINE) {
                {
                {
                setState(176);
                match(NEWLINE);
                }
                }
                setState(181);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            setState(182);
            match(RULE);
            setState(186);
            _errHandler.sync(this);
            switch ( getInterpreter.adaptivePredict(_input,7, ctx_) ) {
            case 1:
                {
                setState(183);
                class_name();
                setState(184);
                match(AS);
                }
                break;
                    default: {}
            }
            setState(188);
            rule_name();
            setState(189);
            language();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Class_nameContext : ParserRuleContext {
        public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_class_name; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterClass_name(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitClass_name(this);
        }
    }

    public Class_nameContext class_name() {
        Class_nameContext _localctx = new Class_nameContext(ctx_, getState());
        enterRule(_localctx, 8, RULE_class_name);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(191);
            match(NAME);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Rule_nameContext : ParserRuleContext {
        public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_rule_name; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterRule_name(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitRule_name(this);
        }
    }

    public Rule_nameContext rule_name() {
        Rule_nameContext _localctx = new Rule_nameContext(ctx_, getState());
        enterRule(_localctx, 10, RULE_rule_name);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(193);
            match(NAME);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class LanguageContext : ParserRuleContext {
        public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_language; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterLanguage(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitLanguage(this);
        }
    }

    public LanguageContext language() {
        LanguageContext _localctx = new LanguageContext(ctx_, getState());
        enterRule(_localctx, 12, RULE_language);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(195);
            match(NAME);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Import_stmtContext : ParserRuleContext {
        public TerminalNode BASE() { return getToken(RuleTranslatorParser.BASE, 0); }
        public LanguageContext language() {
            return getRuleContext!LanguageContext(0);
        }
        public TerminalNode DOT() { return getToken(RuleTranslatorParser.DOT, 0); }
        public Base_rulesContext base_rules() {
            return getRuleContext!Base_rulesContext(0);
        }
        public TerminalNode[] NEWLINE() { return getTokens(RuleTranslatorParser.NEWLINE); }
        public TerminalNode NEWLINE(int i) {
            return getToken(RuleTranslatorParser.NEWLINE, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_import_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterImport_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitImport_stmt(this);
        }
    }

    public Import_stmtContext import_stmt() {
        Import_stmtContext _localctx = new Import_stmtContext(ctx_, getState());
        enterRule(_localctx, 14, RULE_import_stmt);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(200);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==NEWLINE) {
                {
                {
                setState(197);
                match(NEWLINE);
                }
                }
                setState(202);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            setState(203);
            match(BASE);
            setState(204);
            language();
            setState(205);
            match(DOT);
            setState(206);
            base_rules();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Base_rulesContext : ParserRuleContext {
        public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_base_rules; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterBase_rules(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitBase_rules(this);
        }
    }

    public Base_rulesContext base_rules() {
        Base_rulesContext _localctx = new Base_rulesContext(ctx_, getState());
        enterRule(_localctx, 16, RULE_base_rules);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(208);
            match(NAME);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class FuncdefContext : ParserRuleContext {
        public TerminalNode DEF() { return getToken(RuleTranslatorParser.DEF, 0); }
        public FunctionNameContext functionName() {
            return getRuleContext!FunctionNameContext(0);
        }
        public ParametersContext parameters() {
            return getRuleContext!ParametersContext(0);
        }
        public TerminalNode COLON() { return getToken(RuleTranslatorParser.COLON, 0); }
        public SuiteContext suite() {
            return getRuleContext!SuiteContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_funcdef; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFuncdef(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFuncdef(this);
        }
    }

    public FuncdefContext funcdef() {
        FuncdefContext _localctx = new FuncdefContext(ctx_, getState());
        enterRule(_localctx, 18, RULE_funcdef);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(210);
            match(DEF);
            setState(211);
            functionName();
            setState(212);
            parameters();
            setState(213);
            match(COLON);
            setState(214);
            suite();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class FunctionNameContext : ParserRuleContext {
        public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_functionName; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFunctionName(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFunctionName(this);
        }
    }

    public FunctionNameContext functionName() {
        FunctionNameContext _localctx = new FunctionNameContext(ctx_, getState());
        enterRule(_localctx, 20, RULE_functionName);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(216);
            match(NAME);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class ParametersContext : ParserRuleContext {
        public TerminalNode OPEN_PAREN() { return getToken(RuleTranslatorParser.OPEN_PAREN, 0); }
        public TerminalNode CLOSE_PAREN() { return getToken(RuleTranslatorParser.CLOSE_PAREN, 0); }
        public TypedargslistContext typedargslist() {
            return getRuleContext!TypedargslistContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_parameters; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterParameters(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitParameters(this);
        }
    }

    public ParametersContext parameters() {
        ParametersContext _localctx = new ParametersContext(ctx_, getState());
        enterRule(_localctx, 22, RULE_parameters);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(218);
            match(OPEN_PAREN);
            setState(220);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << STRING) | (1L << NUMBER) | (1L << NAME) | (1L << STAR) | (1L << POWER))) != 0)) {
                {
                setState(219);
                typedargslist();
                }
            }

            setState(222);
            match(CLOSE_PAREN);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class TypedargslistContext : ParserRuleContext {
        public TfpdefContext[] tfpdef() {
            return getRuleContexts!TfpdefContext;
        }
        public TfpdefContext tfpdef(int i) {
            return getRuleContext!TfpdefContext(i);
        }
        public TerminalNode STAR() { return getToken(RuleTranslatorParser.STAR, 0); }
        public TerminalNode POWER() { return getToken(RuleTranslatorParser.POWER, 0); }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public TerminalNode[] ASSIGN() { return getTokens(RuleTranslatorParser.ASSIGN); }
        public TerminalNode ASSIGN(int i) {
            return getToken(RuleTranslatorParser.ASSIGN, i);
        }
        public TestContext[] test() {
            return getRuleContexts!TestContext;
        }
        public TestContext test(int i) {
            return getRuleContext!TestContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_typedargslist; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTypedargslist(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTypedargslist(this);
        }
    }

    public TypedargslistContext typedargslist() {
        TypedargslistContext _localctx = new TypedargslistContext(ctx_, getState());
        enterRule(_localctx, 24, RULE_typedargslist);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(297);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case STRING:
            case NUMBER:
            case NAME:
                {
                setState(224);
                tfpdef();
                setState(229);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,10, ctx_);
                while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                    if ( _alt==1 ) {
                        {
                        {
                        setState(225);
                        match(COMMA);
                        setState(226);
                        tfpdef();
                        }
                        }
                    }
                    setState(231);
                    _errHandler.sync(this);
                    _alt = getInterpreter.adaptivePredict(_input,10, ctx_);
                }
                setState(265);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if (_la==COMMA) {
                    {
                    setState(232);
                    match(COMMA);
                    setState(263);
                    _errHandler.sync(this);
                    switch (_input.LA(1)) {
                    case STAR:
                        {
                        setState(233);
                        match(STAR);
                        setState(235);
                        _errHandler.sync(this);
                        _la = _input.LA(1);
                        if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << STRING) | (1L << NUMBER) | (1L << NAME))) != 0)) {
                            {
                            setState(234);
                            tfpdef();
                            }
                        }

                        setState(245);
                        _errHandler.sync(this);
                        _alt = getInterpreter.adaptivePredict(_input,13, ctx_);
                        while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                            if ( _alt==1 ) {
                                {
                                {
                                setState(237);
                                match(COMMA);
                                setState(238);
                                tfpdef();
                                setState(241);
                                _errHandler.sync(this);
                                _la = _input.LA(1);
                                if (_la==ASSIGN) {
                                    {
                                    setState(239);
                                    match(ASSIGN);
                                    setState(240);
                                    test();
                                    }
                                }

                                }
                                }
                            }
                            setState(247);
                            _errHandler.sync(this);
                            _alt = getInterpreter.adaptivePredict(_input,13, ctx_);
                        }
                        setState(256);
                        _errHandler.sync(this);
                        _la = _input.LA(1);
                        if (_la==COMMA) {
                            {
                            setState(248);
                            match(COMMA);
                            setState(254);
                            _errHandler.sync(this);
                            _la = _input.LA(1);
                            if (_la==POWER) {
                                {
                                setState(249);
                                match(POWER);
                                setState(250);
                                tfpdef();
                                setState(252);
                                _errHandler.sync(this);
                                _la = _input.LA(1);
                                if (_la==COMMA) {
                                    {
                                    setState(251);
                                    match(COMMA);
                                    }
                                }

                                }
                            }

                            }
                        }

                        }
                        break;
                    case POWER:
                        {
                        setState(258);
                        match(POWER);
                        setState(259);
                        tfpdef();
                        setState(261);
                        _errHandler.sync(this);
                        _la = _input.LA(1);
                        if (_la==COMMA) {
                            {
                            setState(260);
                            match(COMMA);
                            }
                        }

                        }
                        break;
                    case CLOSE_PAREN:
                        break;
                    default:
                        break;
                    }
                    }
                }

                }
                break;
            case STAR:
                {
                setState(267);
                match(STAR);
                setState(269);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << STRING) | (1L << NUMBER) | (1L << NAME))) != 0)) {
                    {
                    setState(268);
                    tfpdef();
                    }
                }

                setState(279);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,22, ctx_);
                while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                    if ( _alt==1 ) {
                        {
                        {
                        setState(271);
                        match(COMMA);
                        setState(272);
                        tfpdef();
                        setState(275);
                        _errHandler.sync(this);
                        _la = _input.LA(1);
                        if (_la==ASSIGN) {
                            {
                            setState(273);
                            match(ASSIGN);
                            setState(274);
                            test();
                            }
                        }

                        }
                        }
                    }
                    setState(281);
                    _errHandler.sync(this);
                    _alt = getInterpreter.adaptivePredict(_input,22, ctx_);
                }
                setState(290);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if (_la==COMMA) {
                    {
                    setState(282);
                    match(COMMA);
                    setState(288);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                    if (_la==POWER) {
                        {
                        setState(283);
                        match(POWER);
                        setState(284);
                        tfpdef();
                        setState(286);
                        _errHandler.sync(this);
                        _la = _input.LA(1);
                        if (_la==COMMA) {
                            {
                            setState(285);
                            match(COMMA);
                            }
                        }

                        }
                    }

                    }
                }

                }
                break;
            case POWER:
                {
                setState(292);
                match(POWER);
                setState(293);
                tfpdef();
                setState(295);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if (_la==COMMA) {
                    {
                    setState(294);
                    match(COMMA);
                    }
                }

                }
                break;
            default:
                throw new NoViableAltException(this);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class TfpdefContext : ParserRuleContext {
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_tfpdef; }

        public this() { }
            alias copyFrom = ParserRuleContext.copyFrom;
        public void copyFrom(TfpdefContext ctx) {
            super.copyFrom(ctx);
        }
    }
    public static class Tfpdef_numberContext : TfpdefContext {
        public TerminalNode NUMBER() { return getToken(RuleTranslatorParser.NUMBER, 0); }
            alias copyFrom = TfpdefContext.copyFrom;
        public this(TfpdefContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTfpdef_number(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTfpdef_number(this);
        }
    }
    public static class Tfpdef_funct_stmContext : TfpdefContext {
        public Funct_stmtContext funct_stmt() {
            return getRuleContext!Funct_stmtContext(0);
        }
            alias copyFrom = TfpdefContext.copyFrom;
        public this(TfpdefContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTfpdef_funct_stm(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTfpdef_funct_stm(this);
        }
    }
    public static class Tfpdef_stringContext : TfpdefContext {
        public TerminalNode STRING() { return getToken(RuleTranslatorParser.STRING, 0); }
            alias copyFrom = TfpdefContext.copyFrom;
        public this(TfpdefContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTfpdef_string(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTfpdef_string(this);
        }
    }
    public static class Tfpdef_nameContext : TfpdefContext {
        public Dotted_nameContext dotted_name() {
            return getRuleContext!Dotted_nameContext(0);
        }
            alias copyFrom = TfpdefContext.copyFrom;
        public this(TfpdefContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTfpdef_name(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTfpdef_name(this);
        }
    }

    public TfpdefContext tfpdef() {
        TfpdefContext _localctx = new TfpdefContext(ctx_, getState());
        enterRule(_localctx, 26, RULE_tfpdef);
        try {
            setState(303);
            _errHandler.sync(this);
            switch ( getInterpreter.adaptivePredict(_input,28, ctx_) ) {
            case 1:
                _localctx = new Tfpdef_nameContext(_localctx);
                enterOuterAlt(_localctx, 1);
                {
                setState(299);
                dotted_name();
                }
                break;
            case 2:
                _localctx = new Tfpdef_numberContext(_localctx);
                enterOuterAlt(_localctx, 2);
                {
                setState(300);
                match(NUMBER);
                }
                break;
            case 3:
                _localctx = new Tfpdef_stringContext(_localctx);
                enterOuterAlt(_localctx, 3);
                {
                setState(301);
                match(STRING);
                }
                break;
            case 4:
                _localctx = new Tfpdef_funct_stmContext(_localctx);
                enterOuterAlt(_localctx, 4);
                {
                setState(302);
                funct_stmt();
                }
                break;
                    default: {}
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class StmtContext : ParserRuleContext {
        public Simple_stmtContext simple_stmt() {
            return getRuleContext!Simple_stmtContext(0);
        }
        public Compound_stmtContext compound_stmt() {
            return getRuleContext!Compound_stmtContext(0);
        }
        public Flow_stmtContext flow_stmt() {
            return getRuleContext!Flow_stmtContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterStmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitStmt(this);
        }
    }

    public StmtContext stmt() {
        StmtContext _localctx = new StmtContext(ctx_, getState());
        enterRule(_localctx, 28, RULE_stmt);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(308);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case STRING:
            case NAME:
                {
                setState(305);
                simple_stmt();
                }
                break;
            case T__0:
            case IF:
            case FOR:
            case BLOCK:
                {
                setState(306);
                compound_stmt();
                }
                break;
            case CONTINUE:
            case BREAK:
                {
                setState(307);
                flow_stmt();
                }
                break;
            default:
                throw new NoViableAltException(this);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Simple_stmtContext : ParserRuleContext {
        public TerminalNode NEWLINE() { return getToken(RuleTranslatorParser.NEWLINE, 0); }
        public Small_stmtContext[] small_stmt() {
            return getRuleContexts!Small_stmtContext;
        }
        public Small_stmtContext small_stmt(int i) {
            return getRuleContext!Small_stmtContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_simple_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterSimple_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitSimple_stmt(this);
        }
    }

    public Simple_stmtContext simple_stmt() {
        Simple_stmtContext _localctx = new Simple_stmtContext(ctx_, getState());
        enterRule(_localctx, 30, RULE_simple_stmt);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(311);
            _errHandler.sync(this);
            _la = _input.LA(1);
            do {
                {
                {
                setState(310);
                small_stmt();
                }
                }
                setState(313);
                _errHandler.sync(this);
                _la = _input.LA(1);
            } while ( _la==STRING || _la==NAME );
            setState(315);
            match(NEWLINE);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Small_stmtContext : ParserRuleContext {
        public String_stmtContext string_stmt() {
            return getRuleContext!String_stmtContext(0);
        }
        public Var_stmtContext var_stmt() {
            return getRuleContext!Var_stmtContext(0);
        }
        public Funct_stmtContext funct_stmt() {
            return getRuleContext!Funct_stmtContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_small_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterSmall_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitSmall_stmt(this);
        }
    }

    public Small_stmtContext small_stmt() {
        Small_stmtContext _localctx = new Small_stmtContext(ctx_, getState());
        enterRule(_localctx, 32, RULE_small_stmt);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(320);
            _errHandler.sync(this);
            switch ( getInterpreter.adaptivePredict(_input,31, ctx_) ) {
            case 1:
                {
                setState(317);
                string_stmt();
                }
                break;
            case 2:
                {
                setState(318);
                var_stmt();
                }
                break;
            case 3:
                {
                setState(319);
                funct_stmt();
                }
                break;
                    default: {}
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class String_stmtContext : ParserRuleContext {
        public TerminalNode STRING() { return getToken(RuleTranslatorParser.STRING, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_string_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterString_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitString_stmt(this);
        }
    }

    public String_stmtContext string_stmt() {
        String_stmtContext _localctx = new String_stmtContext(ctx_, getState());
        enterRule(_localctx, 34, RULE_string_stmt);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(322);
            match(STRING);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Funct_stmtContext : ParserRuleContext {
        public Funct_nameContext funct_name() {
            return getRuleContext!Funct_nameContext(0);
        }
        public Funct_parametersContext funct_parameters() {
            return getRuleContext!Funct_parametersContext(0);
        }
        public Dot_eContext[] dot_e() {
            return getRuleContexts!Dot_eContext;
        }
        public Dot_eContext dot_e(int i) {
            return getRuleContext!Dot_eContext(i);
        }
        public Funct_stmtContext[] funct_stmt() {
            return getRuleContexts!Funct_stmtContext;
        }
        public Funct_stmtContext funct_stmt(int i) {
            return getRuleContext!Funct_stmtContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_funct_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFunct_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFunct_stmt(this);
        }
    }

    public Funct_stmtContext funct_stmt() {
        Funct_stmtContext _localctx = new Funct_stmtContext(ctx_, getState());
        enterRule(_localctx, 36, RULE_funct_stmt);
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(324);
            funct_name();
            setState(325);
            funct_parameters();
            setState(331);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,32, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    {
                    {
                    setState(326);
                    dot_e();
                    setState(327);
                    funct_stmt();
                    }
                    }
                }
                setState(333);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,32, ctx_);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Funct_nameContext : ParserRuleContext {
        public Dotted_nameContext dotted_name() {
            return getRuleContext!Dotted_nameContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_funct_name; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFunct_name(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFunct_name(this);
        }
    }

    public Funct_nameContext funct_name() {
        Funct_nameContext _localctx = new Funct_nameContext(ctx_, getState());
        enterRule(_localctx, 38, RULE_funct_name);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(334);
            dotted_name();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Dot_eContext : ParserRuleContext {
        public TerminalNode DOT() { return getToken(RuleTranslatorParser.DOT, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_dot_e; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterDot_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitDot_e(this);
        }
    }

    public Dot_eContext dot_e() {
        Dot_eContext _localctx = new Dot_eContext(ctx_, getState());
        enterRule(_localctx, 40, RULE_dot_e);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(336);
            match(DOT);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Funct_parametersContext : ParserRuleContext {
        public ParametersContext parameters() {
            return getRuleContext!ParametersContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_funct_parameters; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFunct_parameters(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFunct_parameters(this);
        }
    }

    public Funct_parametersContext funct_parameters() {
        Funct_parametersContext _localctx = new Funct_parametersContext(ctx_, getState());
        enterRule(_localctx, 42, RULE_funct_parameters);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(338);
            parameters();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Var_stmtContext : ParserRuleContext {
        public Dotted_nameContext dotted_name() {
            return getRuleContext!Dotted_nameContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_var_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterVar_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitVar_stmt(this);
        }
    }

    public Var_stmtContext var_stmt() {
        Var_stmtContext _localctx = new Var_stmtContext(ctx_, getState());
        enterRule(_localctx, 44, RULE_var_stmt);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(340);
            dotted_name();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Flow_stmtContext : ParserRuleContext {
        public Break_stmtContext break_stmt() {
            return getRuleContext!Break_stmtContext(0);
        }
        public Continue_stmtContext continue_stmt() {
            return getRuleContext!Continue_stmtContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_flow_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFlow_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFlow_stmt(this);
        }
    }

    public Flow_stmtContext flow_stmt() {
        Flow_stmtContext _localctx = new Flow_stmtContext(ctx_, getState());
        enterRule(_localctx, 46, RULE_flow_stmt);
        try {
            setState(344);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case BREAK:
                enterOuterAlt(_localctx, 1);
                {
                setState(342);
                break_stmt();
                }
                break;
            case CONTINUE:
                enterOuterAlt(_localctx, 2);
                {
                setState(343);
                continue_stmt();
                }
                break;
            default:
                throw new NoViableAltException(this);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Break_stmtContext : ParserRuleContext {
        public TerminalNode BREAK() { return getToken(RuleTranslatorParser.BREAK, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_break_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterBreak_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitBreak_stmt(this);
        }
    }

    public Break_stmtContext break_stmt() {
        Break_stmtContext _localctx = new Break_stmtContext(ctx_, getState());
        enterRule(_localctx, 48, RULE_break_stmt);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(346);
            match(BREAK);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Continue_stmtContext : ParserRuleContext {
        public TerminalNode CONTINUE() { return getToken(RuleTranslatorParser.CONTINUE, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_continue_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterContinue_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitContinue_stmt(this);
        }
    }

    public Continue_stmtContext continue_stmt() {
        Continue_stmtContext _localctx = new Continue_stmtContext(ctx_, getState());
        enterRule(_localctx, 50, RULE_continue_stmt);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(348);
            match(CONTINUE);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Dotted_as_nameContext : ParserRuleContext {
        public Dotted_nameContext dotted_name() {
            return getRuleContext!Dotted_nameContext(0);
        }
        public TerminalNode AS() { return getToken(RuleTranslatorParser.AS, 0); }
        public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_dotted_as_name; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterDotted_as_name(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitDotted_as_name(this);
        }
    }

    public Dotted_as_nameContext dotted_as_name() {
        Dotted_as_nameContext _localctx = new Dotted_as_nameContext(ctx_, getState());
        enterRule(_localctx, 52, RULE_dotted_as_name);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(350);
            dotted_name();
            setState(353);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==AS) {
                {
                setState(351);
                match(AS);
                setState(352);
                match(NAME);
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Dotted_as_namesContext : ParserRuleContext {
        public Dotted_as_nameContext[] dotted_as_name() {
            return getRuleContexts!Dotted_as_nameContext;
        }
        public Dotted_as_nameContext dotted_as_name(int i) {
            return getRuleContext!Dotted_as_nameContext(i);
        }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_dotted_as_names; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterDotted_as_names(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitDotted_as_names(this);
        }
    }

    public Dotted_as_namesContext dotted_as_names() {
        Dotted_as_namesContext _localctx = new Dotted_as_namesContext(ctx_, getState());
        enterRule(_localctx, 54, RULE_dotted_as_names);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(355);
            dotted_as_name();
            setState(360);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==COMMA) {
                {
                {
                setState(356);
                match(COMMA);
                setState(357);
                dotted_as_name();
                }
                }
                setState(362);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Dotted_nameContext : ParserRuleContext {
        public Dotted_name_first_partContext dotted_name_first_part() {
            return getRuleContext!Dotted_name_first_partContext(0);
        }
        public TerminalNode[] DOT() { return getTokens(RuleTranslatorParser.DOT); }
        public TerminalNode DOT(int i) {
            return getToken(RuleTranslatorParser.DOT, i);
        }
        public Dotted_name_partContext[] dotted_name_part() {
            return getRuleContexts!Dotted_name_partContext;
        }
        public Dotted_name_partContext dotted_name_part(int i) {
            return getRuleContext!Dotted_name_partContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_dotted_name; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterDotted_name(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitDotted_name(this);
        }
    }

    public Dotted_nameContext dotted_name() {
        Dotted_nameContext _localctx = new Dotted_nameContext(ctx_, getState());
        enterRule(_localctx, 56, RULE_dotted_name);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(363);
            dotted_name_first_part();
            setState(368);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==DOT) {
                {
                {
                setState(364);
                match(DOT);
                setState(365);
                dotted_name_part();
                }
                }
                setState(370);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Dotted_name_first_partContext : ParserRuleContext {
        public First_part_of_dotted_nameContext first_part_of_dotted_name() {
            return getRuleContext!First_part_of_dotted_nameContext(0);
        }
        public TrailerContext[] trailer() {
            return getRuleContexts!TrailerContext;
        }
        public TrailerContext trailer(int i) {
            return getRuleContext!TrailerContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_dotted_name_first_part; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterDotted_name_first_part(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitDotted_name_first_part(this);
        }
    }

    public Dotted_name_first_partContext dotted_name_first_part() {
        Dotted_name_first_partContext _localctx = new Dotted_name_first_partContext(ctx_, getState());
        enterRule(_localctx, 58, RULE_dotted_name_first_part);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(371);
            first_part_of_dotted_name();
            setState(375);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==OPEN_BRACK) {
                {
                {
                setState(372);
                trailer();
                }
                }
                setState(377);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Dotted_name_partContext : ParserRuleContext {
        public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
        public TrailerContext[] trailer() {
            return getRuleContexts!TrailerContext;
        }
        public TrailerContext trailer(int i) {
            return getRuleContext!TrailerContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_dotted_name_part; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterDotted_name_part(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitDotted_name_part(this);
        }
    }

    public Dotted_name_partContext dotted_name_part() {
        Dotted_name_partContext _localctx = new Dotted_name_partContext(ctx_, getState());
        enterRule(_localctx, 60, RULE_dotted_name_part);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(378);
            match(NAME);
            setState(382);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==OPEN_BRACK) {
                {
                {
                setState(379);
                trailer();
                }
                }
                setState(384);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class First_part_of_dotted_nameContext : ParserRuleContext {
        public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_first_part_of_dotted_name; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFirst_part_of_dotted_name(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFirst_part_of_dotted_name(this);
        }
    }

    public First_part_of_dotted_nameContext first_part_of_dotted_name() {
        First_part_of_dotted_nameContext _localctx = new First_part_of_dotted_nameContext(ctx_, getState());
        enterRule(_localctx, 62, RULE_first_part_of_dotted_name);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(385);
            match(NAME);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Compound_stmtContext : ParserRuleContext {
        public If_stmtContext if_stmt() {
            return getRuleContext!If_stmtContext(0);
        }
        public For_stmtContext for_stmt() {
            return getRuleContext!For_stmtContext(0);
        }
        public With_stmtContext with_stmt() {
            return getRuleContext!With_stmtContext(0);
        }
        public Block_stmtContext block_stmt() {
            return getRuleContext!Block_stmtContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_compound_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterCompound_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitCompound_stmt(this);
        }
    }

    public Compound_stmtContext compound_stmt() {
        Compound_stmtContext _localctx = new Compound_stmtContext(ctx_, getState());
        enterRule(_localctx, 64, RULE_compound_stmt);
        try {
            setState(391);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case IF:
                enterOuterAlt(_localctx, 1);
                {
                setState(387);
                if_stmt();
                }
                break;
            case FOR:
                enterOuterAlt(_localctx, 2);
                {
                setState(388);
                for_stmt();
                }
                break;
            case T__0:
                enterOuterAlt(_localctx, 3);
                {
                setState(389);
                with_stmt();
                }
                break;
            case BLOCK:
                enterOuterAlt(_localctx, 4);
                {
                setState(390);
                block_stmt();
                }
                break;
            default:
                throw new NoViableAltException(this);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class If_stmtContext : ParserRuleContext {
        public TerminalNode IF() { return getToken(RuleTranslatorParser.IF, 0); }
        public ConditionContext[] condition() {
            return getRuleContexts!ConditionContext;
        }
        public ConditionContext condition(int i) {
            return getRuleContext!ConditionContext(i);
        }
        public TerminalNode[] COLON() { return getTokens(RuleTranslatorParser.COLON); }
        public TerminalNode COLON(int i) {
            return getToken(RuleTranslatorParser.COLON, i);
        }
        public SuiteContext[] suite() {
            return getRuleContexts!SuiteContext;
        }
        public SuiteContext suite(int i) {
            return getRuleContext!SuiteContext(i);
        }
        public Elif_eContext[] elif_e() {
            return getRuleContexts!Elif_eContext;
        }
        public Elif_eContext elif_e(int i) {
            return getRuleContext!Elif_eContext(i);
        }
        public Else_eContext else_e() {
            return getRuleContext!Else_eContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_if_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterIf_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitIf_stmt(this);
        }
    }

    public If_stmtContext if_stmt() {
        If_stmtContext _localctx = new If_stmtContext(ctx_, getState());
        enterRule(_localctx, 66, RULE_if_stmt);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(393);
            match(IF);
            setState(394);
            condition();
            setState(395);
            match(COLON);
            setState(396);
            suite();
            setState(404);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==ELIF) {
                {
                {
                setState(397);
                elif_e();
                setState(398);
                condition();
                setState(399);
                match(COLON);
                setState(400);
                suite();
                }
                }
                setState(406);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            setState(411);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==ELSE) {
                {
                setState(407);
                else_e();
                setState(408);
                match(COLON);
                setState(409);
                suite();
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class ConditionContext : ParserRuleContext {
        public TestContext test() {
            return getRuleContext!TestContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_condition; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterCondition(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitCondition(this);
        }
    }

    public ConditionContext condition() {
        ConditionContext _localctx = new ConditionContext(ctx_, getState());
        enterRule(_localctx, 68, RULE_condition);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(413);
            test();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Elif_eContext : ParserRuleContext {
        public TerminalNode ELIF() { return getToken(RuleTranslatorParser.ELIF, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_elif_e; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterElif_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitElif_e(this);
        }
    }

    public Elif_eContext elif_e() {
        Elif_eContext _localctx = new Elif_eContext(ctx_, getState());
        enterRule(_localctx, 70, RULE_elif_e);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(415);
            match(ELIF);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Else_eContext : ParserRuleContext {
        public TerminalNode ELSE() { return getToken(RuleTranslatorParser.ELSE, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_else_e; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterElse_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitElse_e(this);
        }
    }

    public Else_eContext else_e() {
        Else_eContext _localctx = new Else_eContext(ctx_, getState());
        enterRule(_localctx, 72, RULE_else_e);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(417);
            match(ELSE);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class For_stmtContext : ParserRuleContext {
        public TerminalNode FOR() { return getToken(RuleTranslatorParser.FOR, 0); }
        public For_exprlistContext for_exprlist() {
            return getRuleContext!For_exprlistContext(0);
        }
        public TerminalNode IN() { return getToken(RuleTranslatorParser.IN, 0); }
        public For_testlistContext for_testlist() {
            return getRuleContext!For_testlistContext(0);
        }
        public TerminalNode[] COLON() { return getTokens(RuleTranslatorParser.COLON); }
        public TerminalNode COLON(int i) {
            return getToken(RuleTranslatorParser.COLON, i);
        }
        public SuiteContext[] suite() {
            return getRuleContexts!SuiteContext;
        }
        public SuiteContext suite(int i) {
            return getRuleContext!SuiteContext(i);
        }
        public TerminalNode ELSE() { return getToken(RuleTranslatorParser.ELSE, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_for_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFor_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFor_stmt(this);
        }
    }

    public For_stmtContext for_stmt() {
        For_stmtContext _localctx = new For_stmtContext(ctx_, getState());
        enterRule(_localctx, 74, RULE_for_stmt);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(419);
            match(FOR);
            setState(420);
            for_exprlist();
            setState(421);
            match(IN);
            setState(422);
            for_testlist();
            setState(423);
            match(COLON);
            setState(424);
            suite();
            setState(428);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==ELSE) {
                {
                setState(425);
                match(ELSE);
                setState(426);
                match(COLON);
                setState(427);
                suite();
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class For_testlistContext : ParserRuleContext {
        public TestlistContext testlist() {
            return getRuleContext!TestlistContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_for_testlist; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFor_testlist(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFor_testlist(this);
        }
    }

    public For_testlistContext for_testlist() {
        For_testlistContext _localctx = new For_testlistContext(ctx_, getState());
        enterRule(_localctx, 76, RULE_for_testlist);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(430);
            testlist();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class For_exprlistContext : ParserRuleContext {
        public ExprlistContext exprlist() {
            return getRuleContext!ExprlistContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_for_exprlist; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFor_exprlist(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFor_exprlist(this);
        }
    }

    public For_exprlistContext for_exprlist() {
        For_exprlistContext _localctx = new For_exprlistContext(ctx_, getState());
        enterRule(_localctx, 78, RULE_for_exprlist);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(432);
            exprlist();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Block_stmtContext : ParserRuleContext {
        public TerminalNode BLOCK() { return getToken(RuleTranslatorParser.BLOCK, 0); }
        public TerminalNode COLON() { return getToken(RuleTranslatorParser.COLON, 0); }
        public Block_suiteContext block_suite() {
            return getRuleContext!Block_suiteContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_block_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterBlock_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitBlock_stmt(this);
        }
    }

    public Block_stmtContext block_stmt() {
        Block_stmtContext _localctx = new Block_stmtContext(ctx_, getState());
        enterRule(_localctx, 80, RULE_block_stmt);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(434);
            match(BLOCK);
            setState(435);
            match(COLON);
            setState(436);
            block_suite();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Block_suiteContext : ParserRuleContext {
        public TerminalNode NEWLINE() { return getToken(RuleTranslatorParser.NEWLINE, 0); }
        public TerminalNode INDENT() { return getToken(RuleTranslatorParser.INDENT, 0); }
        public TerminalNode DEDENT() { return getToken(RuleTranslatorParser.DEDENT, 0); }
        public Simple_stmtContext[] simple_stmt() {
            return getRuleContexts!Simple_stmtContext;
        }
        public Simple_stmtContext simple_stmt(int i) {
            return getRuleContext!Simple_stmtContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_block_suite; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterBlock_suite(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitBlock_suite(this);
        }
    }

    public Block_suiteContext block_suite() {
        Block_suiteContext _localctx = new Block_suiteContext(ctx_, getState());
        enterRule(_localctx, 82, RULE_block_suite);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(438);
            match(NEWLINE);
            setState(439);
            match(INDENT);
            setState(441);
            _errHandler.sync(this);
            _la = _input.LA(1);
            do {
                {
                {
                setState(440);
                simple_stmt();
                }
                }
                setState(443);
                _errHandler.sync(this);
                _la = _input.LA(1);
            } while ( _la==STRING || _la==NAME );
            setState(445);
            match(DEDENT);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class With_stmtContext : ParserRuleContext {
        public With_itemContext[] with_item() {
            return getRuleContexts!With_itemContext;
        }
        public With_itemContext with_item(int i) {
            return getRuleContext!With_itemContext(i);
        }
        public TerminalNode COLON() { return getToken(RuleTranslatorParser.COLON, 0); }
        public SuiteContext suite() {
            return getRuleContext!SuiteContext(0);
        }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_with_stmt; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterWith_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitWith_stmt(this);
        }
    }

    public With_stmtContext with_stmt() {
        With_stmtContext _localctx = new With_stmtContext(ctx_, getState());
        enterRule(_localctx, 84, RULE_with_stmt);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(447);
            match(T__0);
            setState(448);
            with_item();
            setState(453);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==COMMA) {
                {
                {
                setState(449);
                match(COMMA);
                setState(450);
                with_item();
                }
                }
                setState(455);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            setState(456);
            match(COLON);
            setState(457);
            suite();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class With_itemContext : ParserRuleContext {
        public TestContext test() {
            return getRuleContext!TestContext(0);
        }
        public TerminalNode AS() { return getToken(RuleTranslatorParser.AS, 0); }
        public ExprContext expr() {
            return getRuleContext!ExprContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_with_item; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterWith_item(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitWith_item(this);
        }
    }

    public With_itemContext with_item() {
        With_itemContext _localctx = new With_itemContext(ctx_, getState());
        enterRule(_localctx, 86, RULE_with_item);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(459);
            test();
            setState(462);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==AS) {
                {
                setState(460);
                match(AS);
                setState(461);
                expr();
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class SuiteContext : ParserRuleContext {
        public Simple_stmtContext simple_stmt() {
            return getRuleContext!Simple_stmtContext(0);
        }
        public TerminalNode NEWLINE() { return getToken(RuleTranslatorParser.NEWLINE, 0); }
        public TerminalNode INDENT() { return getToken(RuleTranslatorParser.INDENT, 0); }
        public TerminalNode DEDENT() { return getToken(RuleTranslatorParser.DEDENT, 0); }
        public StmtContext[] stmt() {
            return getRuleContexts!StmtContext;
        }
        public StmtContext stmt(int i) {
            return getRuleContext!StmtContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_suite; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterSuite(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitSuite(this);
        }
    }

    public SuiteContext suite() {
        SuiteContext _localctx = new SuiteContext(ctx_, getState());
        enterRule(_localctx, 88, RULE_suite);
        int _la;
        try {
            setState(474);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case STRING:
            case NAME:
                enterOuterAlt(_localctx, 1);
                {
                setState(464);
                simple_stmt();
                }
                break;
            case NEWLINE:
                enterOuterAlt(_localctx, 2);
                {
                setState(465);
                match(NEWLINE);
                setState(466);
                match(INDENT);
                setState(468);
                _errHandler.sync(this);
                _la = _input.LA(1);
                do {
                    {
                    {
                    setState(467);
                    stmt();
                    }
                    }
                    setState(470);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                } while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << STRING) | (1L << IF) | (1L << FOR) | (1L << CONTINUE) | (1L << BREAK) | (1L << BLOCK) | (1L << NAME))) != 0) );
                setState(472);
                match(DEDENT);
                }
                break;
            default:
                throw new NoViableAltException(this);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class TestContext : ParserRuleContext {
        public Or_testContext[] or_test() {
            return getRuleContexts!Or_testContext;
        }
        public Or_testContext or_test(int i) {
            return getRuleContext!Or_testContext(i);
        }
        public TerminalNode IF() { return getToken(RuleTranslatorParser.IF, 0); }
        public TerminalNode ELSE() { return getToken(RuleTranslatorParser.ELSE, 0); }
        public TestContext test() {
            return getRuleContext!TestContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_test; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTest(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTest(this);
        }
    }

    public TestContext test() {
        TestContext _localctx = new TestContext(ctx_, getState());
        enterRule(_localctx, 90, RULE_test);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(476);
            or_test();
            setState(482);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==IF) {
                {
                setState(477);
                match(IF);
                setState(478);
                or_test();
                setState(479);
                match(ELSE);
                setState(480);
                test();
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Test_nocondContext : ParserRuleContext {
        public Or_testContext or_test() {
            return getRuleContext!Or_testContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_test_nocond; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTest_nocond(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTest_nocond(this);
        }
    }

    public Test_nocondContext test_nocond() {
        Test_nocondContext _localctx = new Test_nocondContext(ctx_, getState());
        enterRule(_localctx, 92, RULE_test_nocond);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(484);
            or_test();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Or_testContext : ParserRuleContext {
        public And_testContext[] and_test() {
            return getRuleContexts!And_testContext;
        }
        public And_testContext and_test(int i) {
            return getRuleContext!And_testContext(i);
        }
        public Or_eContext[] or_e() {
            return getRuleContexts!Or_eContext;
        }
        public Or_eContext or_e(int i) {
            return getRuleContext!Or_eContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_or_test; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterOr_test(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitOr_test(this);
        }
    }

    public Or_testContext or_test() {
        Or_testContext _localctx = new Or_testContext(ctx_, getState());
        enterRule(_localctx, 94, RULE_or_test);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(486);
            and_test();
            setState(492);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==OR) {
                {
                {
                setState(487);
                or_e();
                setState(488);
                and_test();
                }
                }
                setState(494);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Or_eContext : ParserRuleContext {
        public TerminalNode OR() { return getToken(RuleTranslatorParser.OR, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_or_e; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterOr_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitOr_e(this);
        }
    }

    public Or_eContext or_e() {
        Or_eContext _localctx = new Or_eContext(ctx_, getState());
        enterRule(_localctx, 96, RULE_or_e);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(495);
            match(OR);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class And_testContext : ParserRuleContext {
        public Not_testContext[] not_test() {
            return getRuleContexts!Not_testContext;
        }
        public Not_testContext not_test(int i) {
            return getRuleContext!Not_testContext(i);
        }
        public And_eContext[] and_e() {
            return getRuleContexts!And_eContext;
        }
        public And_eContext and_e(int i) {
            return getRuleContext!And_eContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_and_test; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterAnd_test(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitAnd_test(this);
        }
    }

    public And_testContext and_test() {
        And_testContext _localctx = new And_testContext(ctx_, getState());
        enterRule(_localctx, 98, RULE_and_test);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(497);
            not_test();
            setState(503);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==AND) {
                {
                {
                setState(498);
                and_e();
                setState(499);
                not_test();
                }
                }
                setState(505);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class And_eContext : ParserRuleContext {
        public TerminalNode AND() { return getToken(RuleTranslatorParser.AND, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_and_e; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterAnd_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitAnd_e(this);
        }
    }

    public And_eContext and_e() {
        And_eContext _localctx = new And_eContext(ctx_, getState());
        enterRule(_localctx, 100, RULE_and_e);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(506);
            match(AND);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Not_testContext : ParserRuleContext {
        public NotContext not() {
            return getRuleContext!NotContext(0);
        }
        public Not_testContext not_test() {
            return getRuleContext!Not_testContext(0);
        }
        public ComparisonContext comparison() {
            return getRuleContext!ComparisonContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_not_test; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterNot_test(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitNot_test(this);
        }
    }

    public Not_testContext not_test() {
        Not_testContext _localctx = new Not_testContext(ctx_, getState());
        enterRule(_localctx, 102, RULE_not_test);
        try {
            setState(512);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case NOT:
                enterOuterAlt(_localctx, 1);
                {
                setState(508);
                not();
                setState(509);
                not_test();
                }
                break;
            case STRING:
            case NUMBER:
            case FIRST:
            case LAST:
            case TRUE:
            case FALSE:
            case NAME:
            case ADD:
            case MINUS:
            case NOT_OP:
                enterOuterAlt(_localctx, 2);
                {
                setState(511);
                comparison();
                }
                break;
            default:
                throw new NoViableAltException(this);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class NotContext : ParserRuleContext {
        public TerminalNode NOT() { return getToken(RuleTranslatorParser.NOT, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_not; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterNot(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitNot(this);
        }
    }

    public NotContext not() {
        NotContext _localctx = new NotContext(ctx_, getState());
        enterRule(_localctx, 104, RULE_not);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(514);
            match(NOT);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class ComparisonContext : ParserRuleContext {
        public ExprContext[] expr() {
            return getRuleContexts!ExprContext;
        }
        public ExprContext expr(int i) {
            return getRuleContext!ExprContext(i);
        }
        public Comp_opContext[] comp_op() {
            return getRuleContexts!Comp_opContext;
        }
        public Comp_opContext comp_op(int i) {
            return getRuleContext!Comp_opContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_comparison; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterComparison(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitComparison(this);
        }
    }

    public ComparisonContext comparison() {
        ComparisonContext _localctx = new ComparisonContext(ctx_, getState());
        enterRule(_localctx, 106, RULE_comparison);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(516);
            expr();
            setState(522);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << LESS_THAN) | (1L << GREATER_THAN) | (1L << EQUALS) | (1L << GT_EQ) | (1L << LT_EQ) | (1L << NOT_EQ_1) | (1L << NOT_EQ_2))) != 0)) {
                {
                {
                setState(517);
                comp_op();
                setState(518);
                expr();
                }
                }
                setState(524);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Comp_opContext : ParserRuleContext {
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_comp_op; }

        public this() { }
            alias copyFrom = ParserRuleContext.copyFrom;
        public void copyFrom(Comp_opContext ctx) {
            super.copyFrom(ctx);
        }
    }
    public static class Not_equalContext : Comp_opContext {
        public TerminalNode NOT_EQ_1() { return getToken(RuleTranslatorParser.NOT_EQ_1, 0); }
        public TerminalNode NOT_EQ_2() { return getToken(RuleTranslatorParser.NOT_EQ_2, 0); }
            alias copyFrom = Comp_opContext.copyFrom;
        public this(Comp_opContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterNot_equal(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitNot_equal(this);
        }
    }
    public static class Greater_thanContext : Comp_opContext {
        public TerminalNode GREATER_THAN() { return getToken(RuleTranslatorParser.GREATER_THAN, 0); }
            alias copyFrom = Comp_opContext.copyFrom;
        public this(Comp_opContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterGreater_than(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitGreater_than(this);
        }
    }
    public static class Less_thanContext : Comp_opContext {
        public TerminalNode LESS_THAN() { return getToken(RuleTranslatorParser.LESS_THAN, 0); }
            alias copyFrom = Comp_opContext.copyFrom;
        public this(Comp_opContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterLess_than(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitLess_than(this);
        }
    }
    public static class EqualsContext : Comp_opContext {
        public TerminalNode EQUALS() { return getToken(RuleTranslatorParser.EQUALS, 0); }
            alias copyFrom = Comp_opContext.copyFrom;
        public this(Comp_opContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterEquals(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitEquals(this);
        }
    }
    public static class Greater_equalContext : Comp_opContext {
        public TerminalNode GT_EQ() { return getToken(RuleTranslatorParser.GT_EQ, 0); }
            alias copyFrom = Comp_opContext.copyFrom;
        public this(Comp_opContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterGreater_equal(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitGreater_equal(this);
        }
    }
    public static class Less_equalContext : Comp_opContext {
        public TerminalNode LT_EQ() { return getToken(RuleTranslatorParser.LT_EQ, 0); }
            alias copyFrom = Comp_opContext.copyFrom;
        public this(Comp_opContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterLess_equal(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitLess_equal(this);
        }
    }

    public Comp_opContext comp_op() {
        Comp_opContext _localctx = new Comp_opContext(ctx_, getState());
        enterRule(_localctx, 108, RULE_comp_op);
        try {
            setState(532);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case LESS_THAN:
                _localctx = new Less_thanContext(_localctx);
                enterOuterAlt(_localctx, 1);
                {
                setState(525);
                match(LESS_THAN);
                }
                break;
            case GREATER_THAN:
                _localctx = new Greater_thanContext(_localctx);
                enterOuterAlt(_localctx, 2);
                {
                setState(526);
                match(GREATER_THAN);
                }
                break;
            case EQUALS:
                _localctx = new EqualsContext(_localctx);
                enterOuterAlt(_localctx, 3);
                {
                setState(527);
                match(EQUALS);
                }
                break;
            case GT_EQ:
                _localctx = new Greater_equalContext(_localctx);
                enterOuterAlt(_localctx, 4);
                {
                setState(528);
                match(GT_EQ);
                }
                break;
            case LT_EQ:
                _localctx = new Less_equalContext(_localctx);
                enterOuterAlt(_localctx, 5);
                {
                setState(529);
                match(LT_EQ);
                }
                break;
            case NOT_EQ_1:
                _localctx = new Not_equalContext(_localctx);
                enterOuterAlt(_localctx, 6);
                {
                setState(530);
                match(NOT_EQ_1);
                }
                break;
            case NOT_EQ_2:
                _localctx = new Not_equalContext(_localctx);
                enterOuterAlt(_localctx, 7);
                {
                setState(531);
                match(NOT_EQ_2);
                }
                break;
            default:
                throw new NoViableAltException(this);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class ExprContext : ParserRuleContext {
        public Xor_exprContext[] xor_expr() {
            return getRuleContexts!Xor_exprContext;
        }
        public Xor_exprContext xor_expr(int i) {
            return getRuleContext!Xor_exprContext(i);
        }
        public TerminalNode[] OR_OP() { return getTokens(RuleTranslatorParser.OR_OP); }
        public TerminalNode OR_OP(int i) {
            return getToken(RuleTranslatorParser.OR_OP, i);
        }
        public Dotted_nameContext dotted_name() {
            return getRuleContext!Dotted_nameContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_expr; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterExpr(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitExpr(this);
        }
    }

    public ExprContext expr() {
        ExprContext _localctx = new ExprContext(ctx_, getState());
        enterRule(_localctx, 110, RULE_expr);
        int _la;
        try {
            setState(543);
            _errHandler.sync(this);
            switch ( getInterpreter.adaptivePredict(_input,55, ctx_) ) {
            case 1:
                enterOuterAlt(_localctx, 1);
                {
                setState(534);
                xor_expr();
                setState(539);
                _errHandler.sync(this);
                _la = _input.LA(1);
                while (_la==OR_OP) {
                    {
                    {
                    setState(535);
                    match(OR_OP);
                    setState(536);
                    xor_expr();
                    }
                    }
                    setState(541);
                    _errHandler.sync(this);
                    _la = _input.LA(1);
                }
                }
                break;
            case 2:
                enterOuterAlt(_localctx, 2);
                {
                setState(542);
                dotted_name();
                }
                break;
                    default: {}
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Xor_exprContext : ParserRuleContext {
        public And_exprContext[] and_expr() {
            return getRuleContexts!And_exprContext;
        }
        public And_exprContext and_expr(int i) {
            return getRuleContext!And_exprContext(i);
        }
        public TerminalNode[] XOR() { return getTokens(RuleTranslatorParser.XOR); }
        public TerminalNode XOR(int i) {
            return getToken(RuleTranslatorParser.XOR, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_xor_expr; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterXor_expr(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitXor_expr(this);
        }
    }

    public Xor_exprContext xor_expr() {
        Xor_exprContext _localctx = new Xor_exprContext(ctx_, getState());
        enterRule(_localctx, 112, RULE_xor_expr);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(545);
            and_expr();
            setState(550);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==XOR) {
                {
                {
                setState(546);
                match(XOR);
                setState(547);
                and_expr();
                }
                }
                setState(552);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class And_exprContext : ParserRuleContext {
        public Arith_exprContext[] arith_expr() {
            return getRuleContexts!Arith_exprContext;
        }
        public Arith_exprContext arith_expr(int i) {
            return getRuleContext!Arith_exprContext(i);
        }
        public TerminalNode[] AND_OP() { return getTokens(RuleTranslatorParser.AND_OP); }
        public TerminalNode AND_OP(int i) {
            return getToken(RuleTranslatorParser.AND_OP, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_and_expr; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterAnd_expr(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitAnd_expr(this);
        }
    }

    public And_exprContext and_expr() {
        And_exprContext _localctx = new And_exprContext(ctx_, getState());
        enterRule(_localctx, 114, RULE_and_expr);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(553);
            arith_expr();
            setState(558);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==AND_OP) {
                {
                {
                setState(554);
                match(AND_OP);
                setState(555);
                arith_expr();
                }
                }
                setState(560);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Arith_exprContext : ParserRuleContext {
        public TermContext[] term() {
            return getRuleContexts!TermContext;
        }
        public TermContext term(int i) {
            return getRuleContext!TermContext(i);
        }
        public AddContext[] add() {
            return getRuleContexts!AddContext;
        }
        public AddContext add(int i) {
            return getRuleContext!AddContext(i);
        }
        public MinusContext[] minus() {
            return getRuleContexts!MinusContext;
        }
        public MinusContext minus(int i) {
            return getRuleContext!MinusContext(i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_arith_expr; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterArith_expr(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitArith_expr(this);
        }
    }

    public Arith_exprContext arith_expr() {
        Arith_exprContext _localctx = new Arith_exprContext(ctx_, getState());
        enterRule(_localctx, 116, RULE_arith_expr);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(561);
            term();
            setState(570);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==ADD || _la==MINUS) {
                {
                {
                setState(564);
                _errHandler.sync(this);
                switch (_input.LA(1)) {
                case ADD:
                    {
                    setState(562);
                    add();
                    }
                    break;
                case MINUS:
                    {
                    setState(563);
                    minus();
                    }
                    break;
                default:
                    throw new NoViableAltException(this);
                }
                setState(566);
                term();
                }
                }
                setState(572);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class TermContext : ParserRuleContext {
        public FactorContext[] factor() {
            return getRuleContexts!FactorContext;
        }
        public FactorContext factor(int i) {
            return getRuleContext!FactorContext(i);
        }
        public TerminalNode[] STAR() { return getTokens(RuleTranslatorParser.STAR); }
        public TerminalNode STAR(int i) {
            return getToken(RuleTranslatorParser.STAR, i);
        }
        public TerminalNode[] AT() { return getTokens(RuleTranslatorParser.AT); }
        public TerminalNode AT(int i) {
            return getToken(RuleTranslatorParser.AT, i);
        }
        public TerminalNode[] DIV() { return getTokens(RuleTranslatorParser.DIV); }
        public TerminalNode DIV(int i) {
            return getToken(RuleTranslatorParser.DIV, i);
        }
        public TerminalNode[] MOD() { return getTokens(RuleTranslatorParser.MOD); }
        public TerminalNode MOD(int i) {
            return getToken(RuleTranslatorParser.MOD, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_term; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTerm(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTerm(this);
        }
    }

    public TermContext term() {
        TermContext _localctx = new TermContext(ctx_, getState());
        enterRule(_localctx, 118, RULE_term);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(573);
            factor();
            setState(578);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << STAR) | (1L << DIV) | (1L << MOD) | (1L << AT))) != 0)) {
                {
                {
                setState(574);
                _la = _input.LA(1);
                if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << STAR) | (1L << DIV) | (1L << MOD) | (1L << AT))) != 0)) ) {
                _errHandler.recoverInline(this);
                }
                else {
                    if (_input.LA(1) == TokenConstantDefinition.EOF)
                        matchedEOF = true;
                    _errHandler.reportMatch(this);
                    consume();
                }
                setState(575);
                factor();
                }
                }
                setState(580);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class FactorContext : ParserRuleContext {
        public FactorContext factor() {
            return getRuleContext!FactorContext(0);
        }
        public TerminalNode ADD() { return getToken(RuleTranslatorParser.ADD, 0); }
        public TerminalNode MINUS() { return getToken(RuleTranslatorParser.MINUS, 0); }
        public TerminalNode NOT_OP() { return getToken(RuleTranslatorParser.NOT_OP, 0); }
        public AtomContext atom() {
            return getRuleContext!AtomContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_factor; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFactor(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFactor(this);
        }
    }

    public FactorContext factor() {
        FactorContext _localctx = new FactorContext(ctx_, getState());
        enterRule(_localctx, 120, RULE_factor);
        int _la;
        try {
            setState(584);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case ADD:
            case MINUS:
            case NOT_OP:
                enterOuterAlt(_localctx, 1);
                {
                setState(581);
                _la = _input.LA(1);
                if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ADD) | (1L << MINUS) | (1L << NOT_OP))) != 0)) ) {
                _errHandler.recoverInline(this);
                }
                else {
                    if (_input.LA(1) == TokenConstantDefinition.EOF)
                        matchedEOF = true;
                    _errHandler.reportMatch(this);
                    consume();
                }
                setState(582);
                factor();
                }
                break;
            case STRING:
            case NUMBER:
            case FIRST:
            case LAST:
            case TRUE:
            case FALSE:
            case NAME:
                enterOuterAlt(_localctx, 2);
                {
                setState(583);
                atom();
                }
                break;
            default:
                throw new NoViableAltException(this);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class AtomContext : ParserRuleContext {
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_atom; }

        public this() { }
            alias copyFrom = ParserRuleContext.copyFrom;
        public void copyFrom(AtomContext ctx) {
            super.copyFrom(ctx);
        }
    }
    public static class Atom_dotted_nameContext : AtomContext {
        public Dotted_nameContext dotted_name() {
            return getRuleContext!Dotted_nameContext(0);
        }
            alias copyFrom = AtomContext.copyFrom;
        public this(AtomContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterAtom_dotted_name(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitAtom_dotted_name(this);
        }
    }
    public static class Number_eContext : AtomContext {
        public TerminalNode NUMBER() { return getToken(RuleTranslatorParser.NUMBER, 0); }
            alias copyFrom = AtomContext.copyFrom;
        public this(AtomContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterNumber_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitNumber_e(this);
        }
    }
    public static class False_eContext : AtomContext {
        public TerminalNode FALSE() { return getToken(RuleTranslatorParser.FALSE, 0); }
            alias copyFrom = AtomContext.copyFrom;
        public this(AtomContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFalse_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFalse_e(this);
        }
    }
    public static class First_eContext : AtomContext {
        public TerminalNode FIRST() { return getToken(RuleTranslatorParser.FIRST, 0); }
            alias copyFrom = AtomContext.copyFrom;
        public this(AtomContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterFirst_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitFirst_e(this);
        }
    }
    public static class Last_eContext : AtomContext {
        public TerminalNode LAST() { return getToken(RuleTranslatorParser.LAST, 0); }
            alias copyFrom = AtomContext.copyFrom;
        public this(AtomContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterLast_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitLast_e(this);
        }
    }
    public static class String_eContext : AtomContext {
        public TerminalNode STRING() { return getToken(RuleTranslatorParser.STRING, 0); }
            alias copyFrom = AtomContext.copyFrom;
        public this(AtomContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterString_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitString_e(this);
        }
    }
    public static class True_eContext : AtomContext {
        public TerminalNode TRUE() { return getToken(RuleTranslatorParser.TRUE, 0); }
            alias copyFrom = AtomContext.copyFrom;
        public this(AtomContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTrue_e(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTrue_e(this);
        }
    }
    public static class Atom_funct_stmtContext : AtomContext {
        public Funct_stmtContext funct_stmt() {
            return getRuleContext!Funct_stmtContext(0);
        }
            alias copyFrom = AtomContext.copyFrom;
        public this(AtomContext ctx) { copyFrom(ctx); }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterAtom_funct_stmt(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitAtom_funct_stmt(this);
        }
    }

    public AtomContext atom() {
        AtomContext _localctx = new AtomContext(ctx_, getState());
        enterRule(_localctx, 122, RULE_atom);
        try {
            setState(594);
            _errHandler.sync(this);
            switch ( getInterpreter.adaptivePredict(_input,62, ctx_) ) {
            case 1:
                _localctx = new Atom_dotted_nameContext(_localctx);
                enterOuterAlt(_localctx, 1);
                {
                setState(586);
                dotted_name();
                }
                break;
            case 2:
                _localctx = new Atom_funct_stmtContext(_localctx);
                enterOuterAlt(_localctx, 2);
                {
                setState(587);
                funct_stmt();
                }
                break;
            case 3:
                _localctx = new Number_eContext(_localctx);
                enterOuterAlt(_localctx, 3);
                {
                setState(588);
                match(NUMBER);
                }
                break;
            case 4:
                _localctx = new String_eContext(_localctx);
                enterOuterAlt(_localctx, 4);
                {
                setState(589);
                match(STRING);
                }
                break;
            case 5:
                _localctx = new True_eContext(_localctx);
                enterOuterAlt(_localctx, 5);
                {
                setState(590);
                match(TRUE);
                }
                break;
            case 6:
                _localctx = new False_eContext(_localctx);
                enterOuterAlt(_localctx, 6);
                {
                setState(591);
                match(FALSE);
                }
                break;
            case 7:
                _localctx = new Last_eContext(_localctx);
                enterOuterAlt(_localctx, 7);
                {
                setState(592);
                match(LAST);
                }
                break;
            case 8:
                _localctx = new First_eContext(_localctx);
                enterOuterAlt(_localctx, 8);
                {
                setState(593);
                match(FIRST);
                }
                break;
                    default: {}
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class AddContext : ParserRuleContext {
        public TerminalNode ADD() { return getToken(RuleTranslatorParser.ADD, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_add; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterAdd(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitAdd(this);
        }
    }

    public AddContext add() {
        AddContext _localctx = new AddContext(ctx_, getState());
        enterRule(_localctx, 124, RULE_add);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(596);
            match(ADD);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class MinusContext : ParserRuleContext {
        public TerminalNode MINUS() { return getToken(RuleTranslatorParser.MINUS, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_minus; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterMinus(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitMinus(this);
        }
    }

    public MinusContext minus() {
        MinusContext _localctx = new MinusContext(ctx_, getState());
        enterRule(_localctx, 126, RULE_minus);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(598);
            match(MINUS);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class Testlist_compContext : ParserRuleContext {
        public TestContext[] test() {
            return getRuleContexts!TestContext;
        }
        public TestContext test(int i) {
            return getRuleContext!TestContext(i);
        }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_testlist_comp; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTestlist_comp(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTestlist_comp(this);
        }
    }

    public Testlist_compContext testlist_comp() {
        Testlist_compContext _localctx = new Testlist_compContext(ctx_, getState());
        enterRule(_localctx, 128, RULE_testlist_comp);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            {
            setState(600);
            test();
            }
            {
            setState(605);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,63, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    {
                    {
                    setState(601);
                    match(COMMA);
                    {
                    setState(602);
                    test();
                    }
                    }
                    }
                }
                setState(607);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,63, ctx_);
            }
            setState(609);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==COMMA) {
                {
                setState(608);
                match(COMMA);
                }
            }

            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class TrailerContext : ParserRuleContext {
        public TerminalNode OPEN_BRACK() { return getToken(RuleTranslatorParser.OPEN_BRACK, 0); }
        public SubscriptlistContext subscriptlist() {
            return getRuleContext!SubscriptlistContext(0);
        }
        public TerminalNode CLOSE_BRACK() { return getToken(RuleTranslatorParser.CLOSE_BRACK, 0); }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_trailer; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTrailer(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTrailer(this);
        }
    }

    public TrailerContext trailer() {
        TrailerContext _localctx = new TrailerContext(ctx_, getState());
        enterRule(_localctx, 130, RULE_trailer);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(611);
            match(OPEN_BRACK);
            setState(612);
            subscriptlist();
            setState(613);
            match(CLOSE_BRACK);
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class SubscriptlistContext : ParserRuleContext {
        public SubscriptContext[] subscript() {
            return getRuleContexts!SubscriptContext;
        }
        public SubscriptContext subscript(int i) {
            return getRuleContext!SubscriptContext(i);
        }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_subscriptlist; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterSubscriptlist(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitSubscriptlist(this);
        }
    }

    public SubscriptlistContext subscriptlist() {
        SubscriptlistContext _localctx = new SubscriptlistContext(ctx_, getState());
        enterRule(_localctx, 132, RULE_subscriptlist);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(615);
            subscript();
            setState(620);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,65, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    {
                    {
                    setState(616);
                    match(COMMA);
                    setState(617);
                    subscript();
                    }
                    }
                }
                setState(622);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,65, ctx_);
            }
            setState(624);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==COMMA) {
                {
                setState(623);
                match(COMMA);
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class SubscriptContext : ParserRuleContext {
        public TestContext[] test() {
            return getRuleContexts!TestContext;
        }
        public TestContext test(int i) {
            return getRuleContext!TestContext(i);
        }
        public TerminalNode COLON() { return getToken(RuleTranslatorParser.COLON, 0); }
        public SliceopContext sliceop() {
            return getRuleContext!SliceopContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_subscript; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterSubscript(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitSubscript(this);
        }
    }

    public SubscriptContext subscript() {
        SubscriptContext _localctx = new SubscriptContext(ctx_, getState());
        enterRule(_localctx, 134, RULE_subscript);
        int _la;
        try {
            setState(637);
            _errHandler.sync(this);
            switch ( getInterpreter.adaptivePredict(_input,70, ctx_) ) {
            case 1:
                enterOuterAlt(_localctx, 1);
                {
                setState(626);
                test();
                }
                break;
            case 2:
                enterOuterAlt(_localctx, 2);
                {
                setState(628);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << STRING) | (1L << NUMBER) | (1L << FIRST) | (1L << LAST) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP))) != 0)) {
                    {
                    setState(627);
                    test();
                    }
                }

                setState(630);
                match(COLON);
                setState(632);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << STRING) | (1L << NUMBER) | (1L << FIRST) | (1L << LAST) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP))) != 0)) {
                    {
                    setState(631);
                    test();
                    }
                }

                setState(635);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if (_la==COLON) {
                    {
                    setState(634);
                    sliceop();
                    }
                }

                }
                break;
                    default: {}
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class SliceopContext : ParserRuleContext {
        public TerminalNode COLON() { return getToken(RuleTranslatorParser.COLON, 0); }
        public TestContext test() {
            return getRuleContext!TestContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_sliceop; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterSliceop(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitSliceop(this);
        }
    }

    public SliceopContext sliceop() {
        SliceopContext _localctx = new SliceopContext(ctx_, getState());
        enterRule(_localctx, 136, RULE_sliceop);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(639);
            match(COLON);
            setState(641);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << STRING) | (1L << NUMBER) | (1L << FIRST) | (1L << LAST) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP))) != 0)) {
                {
                setState(640);
                test();
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class ExprlistContext : ParserRuleContext {
        public ExprContext[] expr() {
            return getRuleContexts!ExprContext;
        }
        public ExprContext expr(int i) {
            return getRuleContext!ExprContext(i);
        }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_exprlist; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterExprlist(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitExprlist(this);
        }
    }

    public ExprlistContext exprlist() {
        ExprlistContext _localctx = new ExprlistContext(ctx_, getState());
        enterRule(_localctx, 138, RULE_exprlist);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            {
            setState(643);
            expr();
            }
            setState(648);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,72, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    {
                    {
                    setState(644);
                    match(COMMA);
                    {
                    setState(645);
                    expr();
                    }
                    }
                    }
                }
                setState(650);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,72, ctx_);
            }
            setState(652);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==COMMA) {
                {
                setState(651);
                match(COMMA);
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class TestlistContext : ParserRuleContext {
        public TestContext[] test() {
            return getRuleContexts!TestContext;
        }
        public TestContext test(int i) {
            return getRuleContext!TestContext(i);
        }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_testlist; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterTestlist(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitTestlist(this);
        }
    }

    public TestlistContext testlist() {
        TestlistContext _localctx = new TestlistContext(ctx_, getState());
        enterRule(_localctx, 140, RULE_testlist);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(654);
            test();
            setState(659);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,74, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    {
                    {
                    setState(655);
                    match(COMMA);
                    setState(656);
                    test();
                    }
                    }
                }
                setState(661);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,74, ctx_);
            }
            setState(663);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==COMMA) {
                {
                setState(662);
                match(COMMA);
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class DictorsetmakerContext : ParserRuleContext {
        public TestContext[] test() {
            return getRuleContexts!TestContext;
        }
        public TestContext test(int i) {
            return getRuleContext!TestContext(i);
        }
        public TerminalNode[] COLON() { return getTokens(RuleTranslatorParser.COLON); }
        public TerminalNode COLON(int i) {
            return getToken(RuleTranslatorParser.COLON, i);
        }
        public TerminalNode[] POWER() { return getTokens(RuleTranslatorParser.POWER); }
        public TerminalNode POWER(int i) {
            return getToken(RuleTranslatorParser.POWER, i);
        }
        public ExprContext[] expr() {
            return getRuleContexts!ExprContext;
        }
        public ExprContext expr(int i) {
            return getRuleContext!ExprContext(i);
        }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_dictorsetmaker; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterDictorsetmaker(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitDictorsetmaker(this);
        }
    }

    public DictorsetmakerContext dictorsetmaker() {
        DictorsetmakerContext _localctx = new DictorsetmakerContext(ctx_, getState());
        enterRule(_localctx, 142, RULE_dictorsetmaker);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(701);
            _errHandler.sync(this);
            switch ( getInterpreter.adaptivePredict(_input,82, ctx_) ) {
            case 1:
                {
                {
                setState(671);
                _errHandler.sync(this);
                switch (_input.LA(1)) {
                case STRING:
                case NUMBER:
                case FIRST:
                case LAST:
                case NOT:
                case TRUE:
                case FALSE:
                case NAME:
                case ADD:
                case MINUS:
                case NOT_OP:
                    {
                    setState(665);
                    test();
                    setState(666);
                    match(COLON);
                    setState(667);
                    test();
                    }
                    break;
                case POWER:
                    {
                    setState(669);
                    match(POWER);
                    setState(670);
                    expr();
                    }
                    break;
                default:
                    throw new NoViableAltException(this);
                }
                {
                setState(684);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,78, ctx_);
                while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                    if ( _alt==1 ) {
                        {
                        {
                        setState(673);
                        match(COMMA);
                        setState(680);
                        _errHandler.sync(this);
                        switch (_input.LA(1)) {
                        case STRING:
                        case NUMBER:
                        case FIRST:
                        case LAST:
                        case NOT:
                        case TRUE:
                        case FALSE:
                        case NAME:
                        case ADD:
                        case MINUS:
                        case NOT_OP:
                            {
                            setState(674);
                            test();
                            setState(675);
                            match(COLON);
                            setState(676);
                            test();
                            }
                            break;
                        case POWER:
                            {
                            setState(678);
                            match(POWER);
                            setState(679);
                            expr();
                            }
                            break;
                        default:
                            throw new NoViableAltException(this);
                        }
                        }
                        }
                    }
                    setState(686);
                    _errHandler.sync(this);
                    _alt = getInterpreter.adaptivePredict(_input,78, ctx_);
                }
                setState(688);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if (_la==COMMA) {
                    {
                    setState(687);
                    match(COMMA);
                    }
                }

                }
                }
                }
                break;
            case 2:
                {
                {
                {
                setState(690);
                test();
                }
                {
                setState(695);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,80, ctx_);
                while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                    if ( _alt==1 ) {
                        {
                        {
                        setState(691);
                        match(COMMA);
                        {
                        setState(692);
                        test();
                        }
                        }
                        }
                    }
                    setState(697);
                    _errHandler.sync(this);
                    _alt = getInterpreter.adaptivePredict(_input,80, ctx_);
                }
                setState(699);
                _errHandler.sync(this);
                _la = _input.LA(1);
                if (_la==COMMA) {
                    {
                    setState(698);
                    match(COMMA);
                    }
                }

                }
                }
                }
                break;
                    default: {}
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class ArglistContext : ParserRuleContext {
        public ArgumentContext[] argument() {
            return getRuleContexts!ArgumentContext;
        }
        public ArgumentContext argument(int i) {
            return getRuleContext!ArgumentContext(i);
        }
        public TerminalNode[] COMMA() { return getTokens(RuleTranslatorParser.COMMA); }
        public TerminalNode COMMA(int i) {
            return getToken(RuleTranslatorParser.COMMA, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_arglist; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterArglist(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitArglist(this);
        }
    }

    public ArglistContext arglist() {
        ArglistContext _localctx = new ArglistContext(ctx_, getState());
        enterRule(_localctx, 144, RULE_arglist);
        int _la;
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(703);
            argument();
            setState(708);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,83, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    {
                    {
                    setState(704);
                    match(COMMA);
                    setState(705);
                    argument();
                    }
                    }
                }
                setState(710);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,83, ctx_);
            }
            setState(712);
            _errHandler.sync(this);
            _la = _input.LA(1);
            if (_la==COMMA) {
                {
                setState(711);
                match(COMMA);
                }
            }

            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class ArgumentContext : ParserRuleContext {
        public TestContext test() {
            return getRuleContext!TestContext(0);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_argument; }
        import RuleTranslatorListener;
        override
        public void enterRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).enterArgument(this);
        }
        import RuleTranslatorListener;
        override
        public void exitRule(ParseTreeListener listener) {
            if (cast(RuleTranslatorListener.RuleTranslatorListener)listener)
                (cast(RuleTranslatorListener)listener).exitArgument(this);
        }
    }

    public ArgumentContext argument() {
        ArgumentContext _localctx = new ArgumentContext(ctx_, getState());
        enterRule(_localctx, 146, RULE_argument);
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(714);
            test();
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static immutable wstring _serializedATN =
        "\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x03Q\u02cf"~
        "\x04\x02\t\x02\x04\x03\t\x03\x04\x04\t\x04\x04\x05\t\x05\x04\x06\t"~
        "\x06\x04\x07\t\x07\x04\b\t\b\x04\t\t\t\x04\n\t\n\x04\x0b\t\x0b\x04"~
        "\f\t\f\x04\r\t\r\x04\x0e\t\x0e\x04\x0f\t\x0f\x04\x10\t\x10\x04\x11"~
        "\t\x11\x04\x12\t\x12\x04\x13\t\x13\x04\x14\t\x14\x04\x15\t\x15\x04"~
        "\x16\t\x16\x04\x17\t\x17\x04\x18\t\x18\x04\x19\t\x19\x04\x1a\t\x1a"~
        "\x04\x1b\t\x1b\x04\x1c\t\x1c\x04\x1d\t\x1d\x04\x1e\t\x1e\x04\x1f\t"~
        "\x1f\x04 \t \x04!\t!\x04\"\t\"\x04#\t#\x04$\t$\x04%\t%\x04&\t&\x04"~
        "\'\t\'\x04(\t(\x04)\t)\x04*\t*\x04+\t+\x04,\t,\x04-\t-\x04.\t.\x04"~
        "/\t/\x040\t0\x041\t1\x042\t2\x043\t3\x044\t4\x045\t5\x046\t6\x047\t"~
        "7\x048\t8\x049\t9\x04:\t:\x04;\t;\x04<\t<\x04=\t=\x04>\t>\x04?\t?\x04"~
        "@\t@\x04A\tA\x04B\tB\x04C\tC\x04D\tD\x04E\tE\x04F\tF\x04G\tG\x04H\t"~
        "H\x04I\tI\x04J\tJ\x04K\tK\x03\x02\x03\x02\x03\x02\x03\x02\x07\x02\u009b"~
        "\n\x02\f\x02\x0e\x02\u009e\x0b\x02\x03\x02\x03\x02\x05\x02\u00a2\n"~
        "\x02\x05\x02\u00a4\n\x02\x03\x02\x03\x02\x03\x03\x06\x03\u00a9\n\x03"~
        "\r\x03\x0e\x03\u00aa\x03\x04\x07\x04\u00ae\n\x04\f\x04\x0e\x04\u00b1"~
        "\x0b\x04\x03\x05\x07\x05\u00b4\n\x05\f\x05\x0e\x05\u00b7\x0b\x05\x03"~
        "\x05\x03\x05\x03\x05\x03\x05\x05\x05\u00bd\n\x05\x03\x05\x03\x05\x03"~
        "\x05\x03\x06\x03\x06\x03\x07\x03\x07\x03\b\x03\b\x03\t\x07\t\u00c9"~
        "\n\t\f\t\x0e\t\u00cc\x0b\t\x03\t\x03\t\x03\t\x03\t\x03\t\x03\n\x03"~
        "\n\x03\x0b\x03\x0b\x03\x0b\x03\x0b\x03\x0b\x03\x0b\x03\f\x03\f\x03"~
        "\r\x03\r\x05\r\u00df\n\r\x03\r\x03\r\x03\x0e\x03\x0e\x03\x0e\x07\x0e"~
        "\u00e6\n\x0e\f\x0e\x0e\x0e\u00e9\x0b\x0e\x03\x0e\x03\x0e\x03\x0e\x05"~
        "\x0e\u00ee\n\x0e\x03\x0e\x03\x0e\x03\x0e\x03\x0e\x05\x0e\u00f4\n\x0e"~
        "\x07\x0e\u00f6\n\x0e\f\x0e\x0e\x0e\u00f9\x0b\x0e\x03\x0e\x03\x0e\x03"~
        "\x0e\x03\x0e\x05\x0e\u00ff\n\x0e\x05\x0e\u0101\n\x0e\x05\x0e\u0103"~
        "\n\x0e\x03\x0e\x03\x0e\x03\x0e\x05\x0e\u0108\n\x0e\x05\x0e\u010a\n"~
        "\x0e\x05\x0e\u010c\n\x0e\x03\x0e\x03\x0e\x05\x0e\u0110\n\x0e\x03\x0e"~
        "\x03\x0e\x03\x0e\x03\x0e\x05\x0e\u0116\n\x0e\x07\x0e\u0118\n\x0e\f"~
        "\x0e\x0e\x0e\u011b\x0b\x0e\x03\x0e\x03\x0e\x03\x0e\x03\x0e\x05\x0e"~
        "\u0121\n\x0e\x05\x0e\u0123\n\x0e\x05\x0e\u0125\n\x0e\x03\x0e\x03\x0e"~
        "\x03\x0e\x05\x0e\u012a\n\x0e\x05\x0e\u012c\n\x0e\x03\x0f\x03\x0f\x03"~
        "\x0f\x03\x0f\x05\x0f\u0132\n\x0f\x03\x10\x03\x10\x03\x10\x05\x10\u0137"~
        "\n\x10\x03\x11\x06\x11\u013a\n\x11\r\x11\x0e\x11\u013b\x03\x11\x03"~
        "\x11\x03\x12\x03\x12\x03\x12\x05\x12\u0143\n\x12\x03\x13\x03\x13\x03"~
        "\x14\x03\x14\x03\x14\x03\x14\x03\x14\x07\x14\u014c\n\x14\f\x14\x0e"~
        "\x14\u014f\x0b\x14\x03\x15\x03\x15\x03\x16\x03\x16\x03\x17\x03\x17"~
        "\x03\x18\x03\x18\x03\x19\x03\x19\x05\x19\u015b\n\x19\x03\x1a\x03\x1a"~
        "\x03\x1b\x03\x1b\x03\x1c\x03\x1c\x03\x1c\x05\x1c\u0164\n\x1c\x03\x1d"~
        "\x03\x1d\x03\x1d\x07\x1d\u0169\n\x1d\f\x1d\x0e\x1d\u016c\x0b\x1d\x03"~
        "\x1e\x03\x1e\x03\x1e\x07\x1e\u0171\n\x1e\f\x1e\x0e\x1e\u0174\x0b\x1e"~
        "\x03\x1f\x03\x1f\x07\x1f\u0178\n\x1f\f\x1f\x0e\x1f\u017b\x0b\x1f\x03"~
        " \x03 \x07 \u017f\n \f \x0e \u0182\x0b \x03!\x03!\x03\"\x03\"\x03\""~
        "\x03\"\x05\"\u018a\n\"\x03#\x03#\x03#\x03#\x03#\x03#\x03#\x03#\x03"~
        "#\x07#\u0195\n#\f#\x0e#\u0198\x0b#\x03#\x03#\x03#\x03#\x05#\u019e\n"~
        "#\x03$\x03$\x03%\x03%\x03&\x03&\x03\'\x03\'\x03\'\x03\'\x03\'\x03\'"~
        "\x03\'\x03\'\x03\'\x05\'\u01af\n\'\x03(\x03(\x03)\x03)\x03*\x03*\x03"~
        "*\x03*\x03+\x03+\x03+\x06+\u01bc\n+\r+\x0e+\u01bd\x03+\x03+\x03,\x03"~
        ",\x03,\x03,\x07,\u01c6\n,\f,\x0e,\u01c9\x0b,\x03,\x03,\x03,\x03-\x03"~
        "-\x03-\x05-\u01d1\n-\x03.\x03.\x03.\x03.\x06.\u01d7\n.\r.\x0e.\u01d8"~
        "\x03.\x03.\x05.\u01dd\n.\x03/\x03/\x03/\x03/\x03/\x03/\x05/\u01e5\n"~
        "/\x030\x030\x031\x031\x031\x031\x071\u01ed\n1\f1\x0e1\u01f0\x0b1\x03"~
        "2\x032\x033\x033\x033\x033\x073\u01f8\n3\f3\x0e3\u01fb\x0b3\x034\x03"~
        "4\x035\x035\x035\x035\x055\u0203\n5\x036\x036\x037\x037\x037\x037\x07"~
        "7\u020b\n7\f7\x0e7\u020e\x0b7\x038\x038\x038\x038\x038\x038\x038\x05"~
        "8\u0217\n8\x039\x039\x039\x079\u021c\n9\f9\x0e9\u021f\x0b9\x039\x05"~
        "9\u0222\n9\x03:\x03:\x03:\x07:\u0227\n:\f:\x0e:\u022a\x0b:\x03;\x03"~
        ";\x03;\x07;\u022f\n;\f;\x0e;\u0232\x0b;\x03<\x03<\x03<\x05<\u0237\n"~
        "<\x03<\x03<\x07<\u023b\n<\f<\x0e<\u023e\x0b<\x03=\x03=\x03=\x07=\u0243"~
        "\n=\f=\x0e=\u0246\x0b=\x03>\x03>\x03>\x05>\u024b\n>\x03?\x03?\x03?"~
        "\x03?\x03?\x03?\x03?\x03?\x05?\u0255\n?\x03@\x03@\x03A\x03A\x03B\x03"~
        "B\x03B\x07B\u025e\nB\fB\x0eB\u0261\x0bB\x03B\x05B\u0264\nB\x03C\x03"~
        "C\x03C\x03C\x03D\x03D\x03D\x07D\u026d\nD\fD\x0eD\u0270\x0bD\x03D\x05"~
        "D\u0273\nD\x03E\x03E\x05E\u0277\nE\x03E\x03E\x05E\u027b\nE\x03E\x05"~
        "E\u027e\nE\x05E\u0280\nE\x03F\x03F\x05F\u0284\nF\x03G\x03G\x03G\x07"~
        "G\u0289\nG\fG\x0eG\u028c\x0bG\x03G\x05G\u028f\nG\x03H\x03H\x03H\x07"~
        "H\u0294\nH\fH\x0eH\u0297\x0bH\x03H\x05H\u029a\nH\x03I\x03I\x03I\x03"~
        "I\x03I\x03I\x05I\u02a2\nI\x03I\x03I\x03I\x03I\x03I\x03I\x03I\x05I\u02ab"~
        "\nI\x07I\u02ad\nI\fI\x0eI\u02b0\x0bI\x03I\x05I\u02b3\nI\x03I\x03I\x03"~
        "I\x07I\u02b8\nI\fI\x0eI\u02bb\x0bI\x03I\x05I\u02be\nI\x05I\u02c0\n"~
        "I\x03J\x03J\x03J\x07J\u02c5\nJ\fJ\x0eJ\u02c8\x0bJ\x03J\x05J\u02cb\n"~
        "J\x03K\x03K\x03K\x02\x02L\x02\x04\x06\b\n\f\x0e\x10\x12\x14\x16\x18"~
        "\x1a\x1c\x1e \"$&(*,.02468:<>@BDFHJLNPRTVXZ\\^`bdfhjlnprtvxz|~\u0080"~
        "\u0082\u0084\u0086\u0088\u008a\u008c\u008e\u0090\u0092\u0094\x02\x04"~
        "\x06\x02\x04\x04$$34??\x04\x021255\x02\u02ec\x02\u0096\x03\x02\x02"~
        "\x02\x04\u00a8\x03\x02\x02\x02\x06\u00af\x03\x02\x02\x02\b\u00b5\x03"~
        "\x02\x02\x02\n\u00c1\x03\x02\x02\x02\f\u00c3\x03\x02\x02\x02\x0e\u00c5"~
        "\x03\x02\x02\x02\x10\u00ca\x03\x02\x02\x02\x12\u00d2\x03\x02\x02\x02"~
        "\x14\u00d4\x03\x02\x02\x02\x16\u00da\x03\x02\x02\x02\x18\u00dc\x03"~
        "\x02\x02\x02\x1a\u012b\x03\x02\x02\x02\x1c\u0131\x03\x02\x02\x02\x1e"~
        "\u0136\x03\x02\x02\x02 \u0139\x03\x02\x02\x02\"\u0142\x03\x02\x02\x02"~
        "$\u0144\x03\x02\x02\x02&\u0146\x03\x02\x02\x02(\u0150\x03\x02\x02\x02"~
        "*\u0152\x03\x02\x02\x02,\u0154\x03\x02\x02\x02.\u0156\x03\x02\x02\x02"~
        "0\u015a\x03\x02\x02\x022\u015c\x03\x02\x02\x024\u015e\x03\x02\x02\x02"~
        "6\u0160\x03\x02\x02\x028\u0165\x03\x02\x02\x02:\u016d\x03\x02\x02\x02"~
        "<\u0175\x03\x02\x02\x02>\u017c\x03\x02\x02\x02@\u0183\x03\x02\x02\x02"~
        "B\u0189\x03\x02\x02\x02D\u018b\x03\x02\x02\x02F\u019f\x03\x02\x02\x02"~
        "H\u01a1\x03\x02\x02\x02J\u01a3\x03\x02\x02\x02L\u01a5\x03\x02\x02\x02"~
        "N\u01b0\x03\x02\x02\x02P\u01b2\x03\x02\x02\x02R\u01b4\x03\x02\x02\x02"~
        "T\u01b8\x03\x02\x02\x02V\u01c1\x03\x02\x02\x02X\u01cd\x03\x02\x02\x02"~
        "Z\u01dc\x03\x02\x02\x02\\\u01de\x03\x02\x02\x02^\u01e6\x03\x02\x02"~
        "\x02`\u01e8\x03\x02\x02\x02b\u01f1\x03\x02\x02\x02d\u01f3\x03\x02\x02"~
        "\x02f\u01fc\x03\x02\x02\x02h\u0202\x03\x02\x02\x02j\u0204\x03\x02\x02"~
        "\x02l\u0206\x03\x02\x02\x02n\u0216\x03\x02\x02\x02p\u0221\x03\x02\x02"~
        "\x02r\u0223\x03\x02\x02\x02t\u022b\x03\x02\x02\x02v\u0233\x03\x02\x02"~
        "\x02x\u023f\x03\x02\x02\x02z\u024a\x03\x02\x02\x02|\u0254\x03\x02\x02"~
        "\x02~\u0256\x03\x02\x02\x02\u0080\u0258\x03\x02\x02\x02\u0082\u025a"~
        "\x03\x02\x02\x02\u0084\u0265\x03\x02\x02\x02\u0086\u0269\x03\x02\x02"~
        "\x02\u0088\u027f\x03\x02\x02\x02\u008a\u0281\x03\x02\x02\x02\u008c"~
        "\u0285\x03\x02\x02\x02\u008e\u0290\x03\x02\x02\x02\u0090\u02bf\x03"~
        "\x02\x02\x02\u0092\u02c1\x03\x02\x02\x02\u0094\u02cc\x03\x02\x02\x02"~
        "\u0096\u0097\x05\b\x05\x02\u0097\u009c\x05\x06\x04\x02\u0098\u009b"~
        "\x07\x1d\x02\x02\u0099\u009b\x05\x14\x0b\x02\u009a\u0098\x03\x02\x02"~
        "\x02\u009a\u0099\x03\x02\x02\x02\u009b\u009e\x03\x02\x02\x02\u009c"~
        "\u009a\x03\x02\x02\x02\u009c\u009d\x03\x02\x02\x02\u009d\u00a3\x03"~
        "\x02\x02\x02\u009e\u009c\x03\x02\x02\x02\u009f\u00a4\x07\x1d\x02\x02"~
        "\u00a0\u00a2\x05\x04\x03\x02\u00a1\u00a0\x03\x02\x02\x02\u00a1\u00a2"~
        "\x03\x02\x02\x02\u00a2\u00a4\x03\x02\x02\x02\u00a3\u009f\x03\x02\x02"~
        "\x02\u00a3\u00a1\x03\x02\x02\x02\u00a4\u00a5\x03\x02\x02\x02\u00a5"~
        "\u00a6\x07\x02\x02\x03\u00a6\x03\x03\x02\x02\x02\u00a7\u00a9\x05\x1e"~
        "\x10\x02\u00a8\u00a7\x03\x02\x02\x02\u00a9\u00aa\x03\x02\x02\x02\u00aa"~
        "\u00a8\x03\x02\x02\x02\u00aa\u00ab\x03\x02\x02\x02\u00ab\x05\x03\x02"~
        "\x02\x02\u00ac\u00ae\x05\x10\t\x02\u00ad\u00ac\x03\x02\x02\x02\u00ae"~
        "\u00b1\x03\x02\x02\x02\u00af\u00ad\x03\x02\x02\x02\u00af\u00b0\x03"~
        "\x02\x02\x02\u00b0\x07\x03\x02\x02\x02\u00b1\u00af\x03\x02\x02\x02"~
        "\u00b2\u00b4\x07\x1d\x02\x02\u00b3\u00b2\x03\x02\x02\x02\u00b4\u00b7"~
        "\x03\x02\x02\x02\u00b5\u00b3\x03\x02\x02\x02\u00b5\u00b6\x03\x02\x02"~
        "\x02\u00b6\u00b8\x03\x02\x02\x02\u00b7\u00b5\x03\x02\x02\x02\u00b8"~
        "\u00bc\x07\n\x02\x02\u00b9\u00ba\x05\n\x06\x02\u00ba\u00bb\x07\x0e"~
        "\x02\x02\u00bb\u00bd\x03\x02\x02\x02\u00bc\u00b9\x03\x02\x02\x02\u00bc"~
        "\u00bd\x03\x02\x02\x02\u00bd\u00be\x03\x02\x02\x02\u00be\u00bf\x05"~
        "\f\x07\x02\u00bf\u00c0\x05\x0e\b\x02\u00c0\t\x03\x02\x02\x02\u00c1"~
        "\u00c2\x07\x1e\x02\x02\u00c2\x0b\x03\x02\x02\x02\u00c3\u00c4\x07\x1e"~
        "\x02\x02\u00c4\r\x03\x02\x02\x02\u00c5\u00c6\x07\x1e\x02\x02\u00c6"~
        "\x0f\x03\x02\x02\x02\u00c7\u00c9\x07\x1d\x02\x02\u00c8\u00c7\x03\x02"~
        "\x02\x02\u00c9\u00cc\x03\x02\x02\x02\u00ca\u00c8\x03\x02\x02\x02\u00ca"~
        "\u00cb\x03\x02\x02\x02\u00cb\u00cd\x03\x02\x02\x02\u00cc\u00ca\x03"~
        "\x02\x02\x02\u00cd\u00ce\x07\x0b\x02\x02\u00ce\u00cf\x05\x0e\b\x02"~
        "\u00cf\u00d0\x07#\x02\x02\u00d0\u00d1\x05\x12\n\x02\u00d1\x11\x03\x02"~
        "\x02\x02\u00d2\u00d3\x07\x1e\x02\x02\u00d3\x13\x03\x02\x02\x02\u00d4"~
        "\u00d5\x07\f\x02\x02\u00d5\u00d6\x05\x16\f\x02\u00d6\u00d7\x05\x18"~
        "\r\x02\u00d7\u00d8\x07(\x02\x02\u00d8\u00d9\x05Z.\x02\u00d9\x15\x03"~
        "\x02\x02\x02\u00da\u00db\x07\x1e\x02\x02\u00db\x17\x03\x02\x02\x02"~
        "\u00dc\u00de\x07%\x02\x02\u00dd\u00df\x05\x1a\x0e\x02\u00de\u00dd\x03"~
        "\x02\x02\x02\u00de\u00df\x03\x02\x02\x02\u00df\u00e0\x03\x02\x02\x02"~
        "\u00e0\u00e1\x07&\x02\x02\u00e1\x19\x03\x02\x02\x02\u00e2\u00e7\x05"~
        "\x1c\x0f\x02\u00e3\u00e4\x07\'\x02\x02\u00e4\u00e6\x05\x1c\x0f\x02"~
        "\u00e5\u00e3\x03\x02\x02\x02\u00e6\u00e9\x03\x02\x02\x02\u00e7\u00e5"~
        "\x03\x02\x02\x02\u00e7\u00e8\x03\x02\x02\x02\u00e8\u010b\x03\x02\x02"~
        "\x02\u00e9\u00e7\x03\x02\x02\x02\u00ea\u0109\x07\'\x02\x02\u00eb\u00ed"~
        "\x07$\x02\x02\u00ec\u00ee\x05\x1c\x0f\x02\u00ed\u00ec\x03\x02\x02\x02"~
        "\u00ed\u00ee\x03\x02\x02\x02\u00ee\u00f7\x03\x02\x02\x02\u00ef\u00f0"~
        "\x07\'\x02\x02\u00f0\u00f3\x05\x1c\x0f\x02\u00f1\u00f2\x07+\x02\x02"~
        "\u00f2\u00f4\x05\\/\x02\u00f3\u00f1\x03\x02\x02\x02\u00f3\u00f4\x03"~
        "\x02\x02\x02\u00f4\u00f6\x03\x02\x02\x02\u00f5\u00ef\x03\x02\x02\x02"~
        "\u00f6\u00f9\x03\x02\x02\x02\u00f7\u00f5\x03\x02\x02\x02\u00f7\u00f8"~
        "\x03\x02\x02\x02\u00f8\u0102\x03\x02\x02\x02\u00f9\u00f7\x03\x02\x02"~
        "\x02\u00fa\u0100\x07\'\x02\x02\u00fb\u00fc\x07*\x02\x02\u00fc\u00fe"~
        "\x05\x1c\x0f\x02\u00fd\u00ff\x07\'\x02\x02\u00fe\u00fd\x03\x02\x02"~
        "\x02\u00fe\u00ff\x03\x02\x02\x02\u00ff\u0101\x03\x02\x02\x02\u0100"~
        "\u00fb\x03\x02\x02\x02\u0100\u0101\x03\x02\x02\x02\u0101\u0103\x03"~
        "\x02\x02\x02\u0102\u00fa\x03\x02\x02\x02\u0102\u0103\x03\x02\x02\x02"~
        "\u0103\u010a\x03\x02\x02\x02\u0104\u0105\x07*\x02\x02\u0105\u0107\x05"~
        "\x1c\x0f\x02\u0106\u0108\x07\'\x02\x02\u0107\u0106\x03\x02\x02\x02"~
        "\u0107\u0108\x03\x02\x02\x02\u0108\u010a\x03\x02\x02\x02\u0109\u00eb"~
        "\x03\x02\x02\x02\u0109\u0104\x03\x02\x02\x02\u0109\u010a\x03\x02\x02"~
        "\x02\u010a\u010c\x03\x02\x02\x02\u010b\u00ea\x03\x02\x02\x02\u010b"~
        "\u010c\x03\x02\x02\x02\u010c\u012c\x03\x02\x02\x02\u010d\u010f\x07"~
        "$\x02\x02\u010e\u0110\x05\x1c\x0f\x02\u010f\u010e\x03\x02\x02\x02\u010f"~
        "\u0110\x03\x02\x02\x02\u0110\u0119\x03\x02\x02\x02\u0111\u0112\x07"~
        "\'\x02\x02\u0112\u0115\x05\x1c\x0f\x02\u0113\u0114\x07+\x02\x02\u0114"~
        "\u0116\x05\\/\x02\u0115\u0113\x03\x02\x02\x02\u0115\u0116\x03\x02\x02"~
        "\x02\u0116\u0118\x03\x02\x02\x02\u0117\u0111\x03\x02\x02\x02\u0118"~
        "\u011b\x03\x02\x02\x02\u0119\u0117\x03\x02\x02\x02\u0119\u011a\x03"~
        "\x02\x02\x02\u011a\u0124\x03\x02\x02\x02\u011b\u0119\x03\x02\x02\x02"~
        "\u011c\u0122\x07\'\x02\x02\u011d\u011e\x07*\x02\x02\u011e\u0120\x05"~
        "\x1c\x0f\x02\u011f\u0121\x07\'\x02\x02\u0120\u011f\x03\x02\x02\x02"~
        "\u0120\u0121\x03\x02\x02\x02\u0121\u0123\x03\x02\x02\x02\u0122\u011d"~
        "\x03\x02\x02\x02\u0122\u0123\x03\x02\x02\x02\u0123\u0125\x03\x02\x02"~
        "\x02\u0124\u011c\x03\x02\x02\x02\u0124\u0125\x03\x02\x02\x02\u0125"~
        "\u012c\x03\x02\x02\x02\u0126\u0127\x07*\x02\x02\u0127\u0129\x05\x1c"~
        "\x0f\x02\u0128\u012a\x07\'\x02\x02\u0129\u0128\x03\x02\x02\x02\u0129"~
        "\u012a\x03\x02\x02\x02\u012a\u012c\x03\x02\x02\x02\u012b\u00e2\x03"~
        "\x02\x02\x02\u012b\u010d\x03\x02\x02\x02\u012b\u0126\x03\x02\x02\x02"~
        "\u012c\x1b\x03\x02\x02\x02\u012d\u0132\x05:\x1e\x02\u012e\u0132\x07"~
        "\x06\x02\x02\u012f\u0132\x07\x05\x02\x02\u0130\u0132\x05&\x14\x02\u0131"~
        "\u012d\x03\x02\x02\x02\u0131\u012e\x03\x02\x02\x02\u0131\u012f\x03"~
        "\x02\x02\x02\u0131\u0130\x03\x02\x02\x02\u0132\x1d\x03\x02\x02\x02"~
        "\u0133\u0137\x05 \x11\x02\u0134\u0137\x05B\"\x02\u0135\u0137\x050\x19"~
        "\x02\u0136\u0133\x03\x02\x02\x02\u0136\u0134\x03\x02\x02\x02\u0136"~
        "\u0135\x03\x02\x02\x02\u0137\x1f\x03\x02\x02\x02\u0138\u013a\x05\""~
        "\x12\x02\u0139\u0138\x03\x02\x02\x02\u013a\u013b\x03\x02\x02\x02\u013b"~
        "\u0139\x03\x02\x02\x02\u013b\u013c\x03\x02\x02\x02\u013c\u013d\x03"~
        "\x02\x02\x02\u013d\u013e\x07\x1d\x02\x02\u013e!\x03\x02\x02\x02\u013f"~
        "\u0143\x05$\x13\x02\u0140\u0143\x05.\x18\x02\u0141\u0143\x05&\x14\x02"~
        "\u0142\u013f\x03\x02\x02\x02\u0142\u0140\x03\x02\x02\x02\u0142\u0141"~
        "\x03\x02\x02\x02\u0143#\x03\x02\x02\x02\u0144\u0145\x07\x05\x02\x02"~
        "\u0145%\x03\x02\x02\x02\u0146\u0147\x05(\x15\x02\u0147\u014d\x05,\x17"~
        "\x02\u0148\u0149\x05*\x16\x02\u0149\u014a\x05&\x14\x02\u014a\u014c"~
        "\x03\x02\x02\x02\u014b\u0148\x03\x02\x02\x02\u014c\u014f\x03\x02\x02"~
        "\x02\u014d\u014b\x03\x02\x02\x02\u014d\u014e\x03\x02\x02\x02\u014e"~
        "\'\x03\x02\x02\x02\u014f\u014d\x03\x02\x02\x02\u0150\u0151\x05:\x1e"~
        "\x02\u0151)\x03\x02\x02\x02\u0152\u0153\x07#\x02\x02\u0153+\x03\x02"~
        "\x02\x02\u0154\u0155\x05\x18\r\x02\u0155-\x03\x02\x02\x02\u0156\u0157"~
        "\x05:\x1e\x02\u0157/\x03\x02\x02\x02\u0158\u015b\x052\x1a\x02\u0159"~
        "\u015b\x054\x1b\x02\u015a\u0158\x03\x02\x02\x02\u015a\u0159\x03\x02"~
        "\x02\x02\u015b1\x03\x02\x02\x02\u015c\u015d\x07\x1b\x02\x02\u015d3"~
        "\x03\x02\x02\x02\u015e\u015f\x07\x1a\x02\x02\u015f5\x03\x02\x02\x02"~
        "\u0160\u0163\x05:\x1e\x02\u0161\u0162\x07\x0e\x02\x02\u0162\u0164\x07"~
        "\x1e\x02\x02\u0163\u0161\x03\x02\x02\x02\u0163\u0164\x03\x02\x02\x02"~
        "\u01647\x03\x02\x02\x02\u0165\u016a\x056\x1c\x02\u0166\u0167\x07\'"~
        "\x02\x02\u0167\u0169\x056\x1c\x02\u0168\u0166\x03\x02\x02\x02\u0169"~
        "\u016c\x03\x02\x02\x02\u016a\u0168\x03\x02\x02\x02\u016a\u016b\x03"~
        "\x02\x02\x02\u016b9\x03\x02\x02\x02\u016c\u016a\x03\x02\x02\x02\u016d"~
        "\u0172\x05<\x1f\x02\u016e\u016f\x07#\x02\x02\u016f\u0171\x05> \x02"~
        "\u0170\u016e\x03\x02\x02\x02\u0171\u0174\x03\x02\x02\x02\u0172\u0170"~
        "\x03\x02\x02\x02\u0172\u0173\x03\x02\x02\x02\u0173;\x03\x02\x02\x02"~
        "\u0174\u0172\x03\x02\x02\x02\u0175\u0179\x05@!\x02\u0176\u0178\x05"~
        "\u0084C\x02\u0177\u0176\x03\x02\x02\x02\u0178\u017b\x03\x02\x02\x02"~
        "\u0179\u0177\x03\x02\x02\x02\u0179\u017a\x03\x02\x02\x02\u017a=\x03"~
        "\x02\x02\x02\u017b\u0179\x03\x02\x02\x02\u017c\u0180\x07\x1e\x02\x02"~
        "\u017d\u017f\x05\u0084C\x02\u017e\u017d\x03\x02\x02\x02\u017f\u0182"~
        "\x03\x02\x02\x02\u0180\u017e\x03\x02\x02\x02\u0180\u0181\x03\x02\x02"~
        "\x02\u0181?\x03\x02\x02\x02\u0182\u0180\x03\x02\x02\x02\u0183\u0184"~
        "\x07\x1e\x02\x02\u0184A\x03\x02\x02\x02\u0185\u018a\x05D#\x02\u0186"~
        "\u018a\x05L\'\x02\u0187\u018a\x05V,\x02\u0188\u018a\x05R*\x02\u0189"~
        "\u0185\x03\x02\x02\x02\u0189\u0186\x03\x02\x02\x02\u0189\u0187\x03"~
        "\x02\x02\x02\u0189\u0188\x03\x02\x02\x02\u018aC\x03\x02\x02\x02\u018b"~
        "\u018c\x07\x0f\x02\x02\u018c\u018d\x05F$\x02\u018d\u018e\x07(\x02\x02"~
        "\u018e\u0196\x05Z.\x02\u018f\u0190\x05H%\x02\u0190\u0191\x05F$\x02"~
        "\u0191\u0192\x07(\x02\x02\u0192\u0193\x05Z.\x02\u0193\u0195\x03\x02"~
        "\x02\x02\u0194\u018f\x03\x02\x02\x02\u0195\u0198\x03\x02\x02\x02\u0196"~
        "\u0194\x03\x02\x02\x02\u0196\u0197\x03\x02\x02\x02\u0197\u019d\x03"~
        "\x02\x02\x02\u0198\u0196\x03\x02\x02\x02\u0199\u019a\x05J&\x02\u019a"~
        "\u019b\x07(\x02\x02\u019b\u019c\x05Z.\x02\u019c\u019e\x03\x02\x02\x02"~
        "\u019d\u0199\x03\x02\x02\x02\u019d\u019e\x03\x02\x02\x02\u019eE\x03"~
        "\x02\x02\x02\u019f\u01a0\x05\\/\x02\u01a0G\x03\x02\x02\x02\u01a1\u01a2"~
        "\x07\x11\x02\x02\u01a2I\x03\x02\x02\x02\u01a3\u01a4\x07\x12\x02\x02"~
        "\u01a4K\x03\x02\x02\x02\u01a5\u01a6\x07\x14\x02\x02\u01a6\u01a7\x05"~
        "P)\x02\u01a7\u01a8\x07\x10\x02\x02\u01a8\u01a9\x05N(\x02\u01a9\u01aa"~
        "\x07(\x02\x02\u01aa\u01ae\x05Z.\x02\u01ab\u01ac\x07\x12\x02\x02\u01ac"~
        "\u01ad\x07(\x02\x02\u01ad\u01af\x05Z.\x02\u01ae\u01ab\x03\x02\x02\x02"~
        "\u01ae\u01af\x03\x02\x02\x02\u01afM\x03\x02\x02\x02\u01b0\u01b1\x05"~
        "\u008eH\x02\u01b1O\x03\x02\x02\x02\u01b2\u01b3\x05\u008cG\x02\u01b3"~
        "Q\x03\x02\x02\x02\u01b4\u01b5\x07\x1c\x02\x02\u01b5\u01b6\x07(\x02"~
        "\x02\u01b6\u01b7\x05T+\x02\u01b7S\x03\x02\x02\x02\u01b8\u01b9\x07\x1d"~
        "\x02\x02\u01b9\u01bb\x07P\x02\x02\u01ba\u01bc\x05 \x11\x02\u01bb\u01ba"~
        "\x03\x02\x02\x02\u01bc\u01bd\x03\x02\x02\x02\u01bd\u01bb\x03\x02\x02"~
        "\x02\u01bd\u01be\x03\x02\x02\x02\u01be\u01bf\x03\x02\x02\x02\u01bf"~
        "\u01c0\x07Q\x02\x02\u01c0U\x03\x02\x02\x02\u01c1\u01c2\x07\x03\x02"~
        "\x02\u01c2\u01c7\x05X-\x02\u01c3\u01c4\x07\'\x02\x02\u01c4\u01c6\x05"~
        "X-\x02\u01c5\u01c3\x03\x02\x02\x02\u01c6\u01c9\x03\x02\x02\x02\u01c7"~
        "\u01c5\x03\x02\x02\x02\u01c7\u01c8\x03\x02\x02\x02\u01c8\u01ca\x03"~
        "\x02\x02\x02\u01c9\u01c7\x03\x02\x02\x02\u01ca\u01cb\x07(\x02\x02\u01cb"~
        "\u01cc\x05Z.\x02\u01ccW\x03\x02\x02\x02\u01cd\u01d0\x05\\/\x02\u01ce"~
        "\u01cf\x07\x0e\x02\x02\u01cf\u01d1\x05p9\x02\u01d0\u01ce\x03\x02\x02"~
        "\x02\u01d0\u01d1\x03\x02\x02\x02\u01d1Y\x03\x02\x02\x02\u01d2\u01dd"~
        "\x05 \x11\x02\u01d3\u01d4\x07\x1d\x02\x02\u01d4\u01d6\x07P\x02\x02"~
        "\u01d5\u01d7\x05\x1e\x10\x02\u01d6\u01d5\x03\x02\x02\x02\u01d7\u01d8"~
        "\x03\x02\x02\x02\u01d8\u01d6\x03\x02\x02\x02\u01d8\u01d9\x03\x02\x02"~
        "\x02\u01d9\u01da\x03\x02\x02\x02\u01da\u01db\x07Q\x02\x02\u01db\u01dd"~
        "\x03\x02\x02\x02\u01dc\u01d2\x03\x02\x02\x02\u01dc\u01d3\x03\x02\x02"~
        "\x02\u01dd[\x03\x02\x02\x02\u01de\u01e4\x05`1\x02\u01df\u01e0\x07\x0f"~
        "\x02\x02\u01e0\u01e1\x05`1\x02\u01e1\u01e2\x07\x12\x02\x02\u01e2\u01e3"~
        "\x05\\/\x02\u01e3\u01e5\x03\x02\x02\x02\u01e4\u01df\x03\x02\x02\x02"~
        "\u01e4\u01e5\x03\x02\x02\x02\u01e5]\x03\x02\x02\x02\u01e6\u01e7\x05"~
        "`1\x02\u01e7_\x03\x02\x02\x02\u01e8\u01ee\x05d3\x02\u01e9\u01ea\x05"~
        "b2\x02\u01ea\u01eb\x05d3\x02\u01eb\u01ed\x03\x02\x02\x02\u01ec\u01e9"~
        "\x03\x02\x02\x02\u01ed\u01f0\x03\x02\x02\x02\u01ee\u01ec\x03\x02\x02"~
        "\x02\u01ee\u01ef\x03\x02\x02\x02\u01efa\x03\x02\x02\x02\u01f0\u01ee"~
        "\x03\x02\x02\x02\u01f1\u01f2\x07\x15\x02\x02\u01f2c\x03\x02\x02\x02"~
        "\u01f3\u01f9\x05h5\x02\u01f4\u01f5\x05f4\x02\u01f5\u01f6\x05h5\x02"~
        "\u01f6\u01f8\x03\x02\x02\x02\u01f7\u01f4\x03\x02\x02\x02\u01f8\u01fb"~
        "\x03\x02\x02\x02\u01f9\u01f7\x03\x02\x02\x02\u01f9\u01fa\x03\x02\x02"~
        "\x02\u01fae\x03\x02\x02\x02\u01fb\u01f9\x03\x02\x02\x02\u01fc\u01fd"~
        "\x07\x16\x02\x02\u01fdg\x03\x02\x02\x02\u01fe\u01ff\x05j6\x02\u01ff"~
        "\u0200\x05h5\x02\u0200\u0203\x03\x02\x02\x02\u0201\u0203\x05l7\x02"~
        "\u0202\u01fe\x03\x02\x02\x02\u0202\u0201\x03\x02\x02\x02\u0203i\x03"~
        "\x02\x02\x02\u0204\u0205\x07\x17\x02\x02\u0205k\x03\x02\x02\x02\u0206"~
        "\u020c\x05p9\x02\u0207\u0208\x05n8\x02\u0208\u0209\x05p9\x02\u0209"~
        "\u020b\x03\x02\x02\x02\u020a\u0207\x03\x02\x02\x02\u020b\u020e\x03"~
        "\x02\x02\x02\u020c\u020a\x03\x02\x02\x02\u020c\u020d\x03\x02\x02\x02"~
        "\u020dm\x03\x02\x02\x02\u020e\u020c\x03\x02\x02\x02\u020f\u0217\x07"~
        "8\x02\x02\u0210\u0217\x079\x02\x02\u0211\u0217\x07:\x02\x02\u0212\u0217"~
        "\x07;\x02\x02\u0213\u0217\x07<\x02\x02\u0214\u0217\x07=\x02\x02\u0215"~
        "\u0217\x07>\x02\x02\u0216\u020f\x03\x02\x02\x02\u0216\u0210\x03\x02"~
        "\x02\x02\u0216\u0211\x03\x02\x02\x02\u0216\u0212\x03\x02\x02\x02\u0216"~
        "\u0213\x03\x02\x02\x02\u0216\u0214\x03\x02\x02\x02\u0216\u0215\x03"~
        "\x02\x02\x02\u0217o\x03\x02\x02\x02\u0218\u021d\x05r:\x02\u0219\u021a"~
        "\x07.\x02\x02\u021a\u021c\x05r:\x02\u021b\u0219\x03\x02\x02\x02\u021c"~
        "\u021f\x03\x02\x02\x02\u021d\u021b\x03\x02\x02\x02\u021d\u021e\x03"~
        "\x02\x02\x02\u021e\u0222\x03\x02\x02\x02\u021f\u021d\x03\x02\x02\x02"~
        "\u0220\u0222\x05:\x1e\x02\u0221\u0218\x03\x02\x02\x02\u0221\u0220\x03"~
        "\x02\x02\x02\u0222q\x03\x02\x02\x02\u0223\u0228\x05t;\x02\u0224\u0225"~
        "\x07/\x02\x02\u0225\u0227\x05t;\x02\u0226\u0224\x03\x02\x02\x02\u0227"~
        "\u022a\x03\x02\x02\x02\u0228\u0226\x03\x02\x02\x02\u0228\u0229\x03"~
        "\x02\x02\x02\u0229s\x03\x02\x02\x02\u022a\u0228\x03\x02\x02\x02\u022b"~
        "\u0230\x05v<\x02\u022c\u022d\x070\x02\x02\u022d\u022f\x05v<\x02\u022e"~
        "\u022c\x03\x02\x02\x02\u022f\u0232\x03\x02\x02\x02\u0230\u022e\x03"~
        "\x02\x02\x02\u0230\u0231\x03\x02\x02\x02\u0231u\x03\x02\x02\x02\u0232"~
        "\u0230\x03\x02\x02\x02\u0233\u023c\x05x=\x02\u0234\u0237\x05~@\x02"~
        "\u0235\u0237\x05\u0080A\x02\u0236\u0234\x03\x02\x02\x02\u0236\u0235"~
        "\x03\x02\x02\x02\u0237\u0238\x03\x02\x02\x02\u0238\u0239\x05x=\x02"~
        "\u0239\u023b\x03\x02\x02\x02\u023a\u0236\x03\x02\x02\x02\u023b\u023e"~
        "\x03\x02\x02\x02\u023c\u023a\x03\x02\x02\x02\u023c\u023d\x03\x02\x02"~
        "\x02\u023dw\x03\x02\x02\x02\u023e\u023c\x03\x02\x02\x02\u023f\u0244"~
        "\x05z>\x02\u0240\u0241\t\x02\x02\x02\u0241\u0243\x05z>\x02\u0242\u0240"~
        "\x03\x02\x02\x02\u0243\u0246\x03\x02\x02\x02\u0244\u0242\x03\x02\x02"~
        "\x02\u0244\u0245\x03\x02\x02\x02\u0245y\x03\x02\x02\x02\u0246\u0244"~
        "\x03\x02\x02\x02\u0247\u0248\t\x03\x02\x02\u0248\u024b\x05z>\x02\u0249"~
        "\u024b\x05|?\x02\u024a\u0247\x03\x02\x02\x02\u024a\u0249\x03\x02\x02"~
        "\x02\u024b{\x03\x02\x02\x02\u024c\u0255\x05:\x1e\x02\u024d\u0255\x05"~
        "&\x14\x02\u024e\u0255\x07\x06\x02\x02\u024f\u0255\x07\x05\x02\x02\u0250"~
        "\u0255\x07\x18\x02\x02\u0251\u0255\x07\x19\x02\x02\u0252\u0255\x07"~
        "\t\x02\x02\u0253\u0255\x07\b\x02\x02\u0254\u024c\x03\x02\x02\x02\u0254"~
        "\u024d\x03\x02\x02\x02\u0254\u024e\x03\x02\x02\x02\u0254\u024f\x03"~
        "\x02\x02\x02\u0254\u0250\x03\x02\x02\x02\u0254\u0251\x03\x02\x02\x02"~
        "\u0254\u0252\x03\x02\x02\x02\u0254\u0253\x03\x02\x02\x02\u0255}\x03"~
        "\x02\x02\x02\u0256\u0257\x071\x02\x02\u0257\x7f\x03\x02\x02\x02\u0258"~
        "\u0259\x072\x02\x02\u0259\u0081\x03\x02\x02\x02\u025a\u025f\x05\\/"~
        "\x02\u025b\u025c\x07\'\x02\x02\u025c\u025e\x05\\/\x02\u025d\u025b\x03"~
        "\x02\x02\x02\u025e\u0261\x03\x02\x02\x02\u025f\u025d\x03\x02\x02\x02"~
        "\u025f\u0260\x03\x02\x02\x02\u0260\u0263\x03\x02\x02\x02\u0261\u025f"~
        "\x03\x02\x02\x02\u0262\u0264\x07\'\x02\x02\u0263\u0262\x03\x02\x02"~
        "\x02\u0263\u0264\x03\x02\x02\x02\u0264\u0083\x03\x02\x02\x02\u0265"~
        "\u0266\x07,\x02\x02\u0266\u0267\x05\u0086D\x02\u0267\u0268\x07-\x02"~
        "\x02\u0268\u0085\x03\x02\x02\x02\u0269\u026e\x05\u0088E\x02\u026a\u026b"~
        "\x07\'\x02\x02\u026b\u026d\x05\u0088E\x02\u026c\u026a\x03\x02\x02\x02"~
        "\u026d\u0270\x03\x02\x02\x02\u026e\u026c\x03\x02\x02\x02\u026e\u026f"~
        "\x03\x02\x02\x02\u026f\u0272\x03\x02\x02\x02\u0270\u026e\x03\x02\x02"~
        "\x02\u0271\u0273\x07\'\x02\x02\u0272\u0271\x03\x02\x02\x02\u0272\u0273"~
        "\x03\x02\x02\x02\u0273\u0087\x03\x02\x02\x02\u0274\u0280\x05\\/\x02"~
        "\u0275\u0277\x05\\/\x02\u0276\u0275\x03\x02\x02\x02\u0276\u0277\x03"~
        "\x02\x02\x02\u0277\u0278\x03\x02\x02\x02\u0278\u027a\x07(\x02\x02\u0279"~
        "\u027b\x05\\/\x02\u027a\u0279\x03\x02\x02\x02\u027a\u027b\x03\x02\x02"~
        "\x02\u027b\u027d\x03\x02\x02\x02\u027c\u027e\x05\u008aF\x02\u027d\u027c"~
        "\x03\x02\x02\x02\u027d\u027e\x03\x02\x02\x02\u027e\u0280\x03\x02\x02"~
        "\x02\u027f\u0274\x03\x02\x02\x02\u027f\u0276\x03\x02\x02\x02\u0280"~
        "\u0089\x03\x02\x02\x02\u0281\u0283\x07(\x02\x02\u0282\u0284\x05\\/"~
        "\x02\u0283\u0282\x03\x02\x02\x02\u0283\u0284\x03\x02\x02\x02\u0284"~
        "\u008b\x03\x02\x02\x02\u0285\u028a\x05p9\x02\u0286\u0287\x07\'\x02"~
        "\x02\u0287\u0289\x05p9\x02\u0288\u0286\x03\x02\x02\x02\u0289\u028c"~
        "\x03\x02\x02\x02\u028a\u0288\x03\x02\x02\x02\u028a\u028b\x03\x02\x02"~
        "\x02\u028b\u028e\x03\x02\x02\x02\u028c\u028a\x03\x02\x02\x02\u028d"~
        "\u028f\x07\'\x02\x02\u028e\u028d\x03\x02\x02\x02\u028e\u028f\x03\x02"~
        "\x02\x02\u028f\u008d\x03\x02\x02\x02\u0290\u0295\x05\\/\x02\u0291\u0292"~
        "\x07\'\x02\x02\u0292\u0294\x05\\/\x02\u0293\u0291\x03\x02\x02\x02\u0294"~
        "\u0297\x03\x02\x02\x02\u0295\u0293\x03\x02\x02\x02\u0295\u0296\x03"~
        "\x02\x02\x02\u0296\u0299\x03\x02\x02\x02\u0297\u0295\x03\x02\x02\x02"~
        "\u0298\u029a\x07\'\x02\x02\u0299\u0298\x03\x02\x02\x02\u0299\u029a"~
        "\x03\x02\x02\x02\u029a\u008f\x03\x02\x02\x02\u029b\u029c\x05\\/\x02"~
        "\u029c\u029d\x07(\x02\x02\u029d\u029e\x05\\/\x02\u029e\u02a2\x03\x02"~
        "\x02\x02\u029f\u02a0\x07*\x02\x02\u02a0\u02a2\x05p9\x02\u02a1\u029b"~
        "\x03\x02\x02\x02\u02a1\u029f\x03\x02\x02\x02\u02a2\u02ae\x03\x02\x02"~
        "\x02\u02a3\u02aa\x07\'\x02\x02\u02a4\u02a5\x05\\/\x02\u02a5\u02a6\x07"~
        "(\x02\x02\u02a6\u02a7\x05\\/\x02\u02a7\u02ab\x03\x02\x02\x02\u02a8"~
        "\u02a9\x07*\x02\x02\u02a9\u02ab\x05p9\x02\u02aa\u02a4\x03\x02\x02\x02"~
        "\u02aa\u02a8\x03\x02\x02\x02\u02ab\u02ad\x03\x02\x02\x02\u02ac\u02a3"~
        "\x03\x02\x02\x02\u02ad\u02b0\x03\x02\x02\x02\u02ae\u02ac\x03\x02\x02"~
        "\x02\u02ae\u02af\x03\x02\x02\x02\u02af\u02b2\x03\x02\x02\x02\u02b0"~
        "\u02ae\x03\x02\x02\x02\u02b1\u02b3\x07\'\x02\x02\u02b2\u02b1\x03\x02"~
        "\x02\x02\u02b2\u02b3\x03\x02\x02\x02\u02b3\u02c0\x03\x02\x02\x02\u02b4"~
        "\u02b9\x05\\/\x02\u02b5\u02b6\x07\'\x02\x02\u02b6\u02b8\x05\\/\x02"~
        "\u02b7\u02b5\x03\x02\x02\x02\u02b8\u02bb\x03\x02\x02\x02\u02b9\u02b7"~
        "\x03\x02\x02\x02\u02b9\u02ba\x03\x02\x02\x02\u02ba\u02bd\x03\x02\x02"~
        "\x02\u02bb\u02b9\x03\x02\x02\x02\u02bc\u02be\x07\'\x02\x02\u02bd\u02bc"~
        "\x03\x02\x02\x02\u02bd\u02be\x03\x02\x02\x02\u02be\u02c0\x03\x02\x02"~
        "\x02\u02bf\u02a1\x03\x02\x02\x02\u02bf\u02b4\x03\x02\x02\x02\u02c0"~
        "\u0091\x03\x02\x02\x02\u02c1\u02c6\x05\u0094K\x02\u02c2\u02c3\x07\'"~
        "\x02\x02\u02c3\u02c5\x05\u0094K\x02\u02c4\u02c2\x03\x02\x02\x02\u02c5"~
        "\u02c8\x03\x02\x02\x02\u02c6\u02c4\x03\x02\x02\x02\u02c6\u02c7\x03"~
        "\x02\x02\x02\u02c7\u02ca\x03\x02\x02\x02\u02c8\u02c6\x03\x02\x02\x02"~
        "\u02c9\u02cb\x07\'\x02\x02\u02ca\u02c9\x03\x02\x02\x02\u02ca\u02cb"~
        "\x03\x02\x02\x02\u02cb\u0093\x03\x02\x02\x02\u02cc\u02cd\x05\\/\x02"~
        "\u02cd\u0095\x03\x02\x02\x02W\u009a\u009c\u00a1\u00a3\u00aa\u00af\u00b5"~
        "\u00bc\u00ca\u00de\u00e7\u00ed\u00f3\u00f7\u00fe\u0100\u0102\u0107"~
        "\u0109\u010b\u010f\u0115\u0119\u0120\u0122\u0124\u0129\u012b\u0131"~
        "\u0136\u013b\u0142\u014d\u015a\u0163\u016a\u0172\u0179\u0180\u0189"~
        "\u0196\u019d\u01ae\u01bd\u01c7\u01d0\u01d8\u01dc\u01e4\u01ee\u01f9"~
        "\u0202\u020c\u0216\u021d\u0221\u0228\u0230\u0236\u023c\u0244\u024a"~
        "\u0254\u025f\u0263\u026e\u0272\u0276\u027a\u027d\u027f\u0283\u028a"~
        "\u028e\u0295\u0299\u02a1\u02aa\u02ae\u02b2\u02b9\u02bd\u02bf\u02c6"~
        "\u02ca";
    public static ATNType _ATN;

    static this() {
        auto atnDeserializer = new ATNDeserializer;
        _ATN = atnDeserializer.deserialize(_serializedATN);
        _decisionToDFA.length = 0;
        for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
            _decisionToDFA ~= new DFA(_ATN.getDecisionState(i), i);
        }
    }
}

// Generated from RuleTranslator.g4 by ANTLR 4.7.1
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.atn.InterfaceParserATNSimulator;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.RuntimeMetaData;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.Token;
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
import antlr.v4.runtime.tree.TerminalNode;

public class RuleTranslatorParser : Parser {
	static this() { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static DFA[] _decisionToDFA;
	protected PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static const int
		T__0=1, T__1=2, T__2=3, T__3=4, STRING=5, NUMBER=6, INTEGER=7, RULE=8, 
		BASE=9, DEF=10, RETURN=11, AS=12, IF=13, ELIF=14, ELSE=15, WHILE=16, FOR=17, 
		OR=18, AND=19, NOT=20, TRUE=21, FALSE=22, CONTINUE=23, BREAK=24, NEWLINE=25, 
		NAME=26, STRING_LITERAL=27, BYTES_LITERAL=28, DECIMAL_INTEGER=29, OCT_INTEGER=30, 
		HEX_INTEGER=31, BIN_INTEGER=32, DOT=33, ELLIPSIS=34, STAR=35, OPEN_PAREN=36, 
		CLOSE_PAREN=37, COMMA=38, COLON=39, SEMI_COLON=40, POWER=41, ASSIGN=42, 
		OPEN_BRACK=43, CLOSE_BRACK=44, OR_OP=45, XOR=46, AND_OP=47, LEFT_SHIFT=48, 
		RIGHT_SHIFT=49, ADD=50, MINUS=51, DIV=52, MOD=53, IDIV=54, NOT_OP=55, 
		OPEN_BRACE=56, CLOSE_BRACE=57, LESS_THAN=58, GREATER_THAN=59, EQUALS=60, 
		GT_EQ=61, LT_EQ=62, NOT_EQ_1=63, NOT_EQ_2=64, AT=65, ARROW=66, ADD_ASSIGN=67, 
		SUB_ASSIGN=68, MULT_ASSIGN=69, AT_ASSIGN=70, DIV_ASSIGN=71, MOD_ASSIGN=72, 
		AND_ASSIGN=73, OR_ASSIGN=74, XOR_ASSIGN=75, LEFT_SHIFT_ASSIGN=76, RIGHT_SHIFT_ASSIGN=77, 
		POWER_ASSIGN=78, IDIV_ASSIGN=79, SKIP_=80, UNKNOWN_CHAR=81, INDENT=82, 
		DEDENT=83;
	public static const int
		RULE_file_input = 0, RULE_rule_spec = 1, RULE_rule_name = 2, RULE_rule_ID = 3, 
		RULE_lang = 4, RULE_base = 5, RULE_base_rules = 6, RULE_funcdef = 7, RULE_parameters = 8, 
		RULE_typedargslist = 9, RULE_tfpdef = 10, RULE_varargslist = 11, RULE_vfpdef = 12, 
		RULE_stmt = 13, RULE_simple_stmt = 14, RULE_small_stmt = 15, RULE_string_stmt = 16, 
		RULE_funct_stmt = 17, RULE_expr_stmt = 18, RULE_annassign = 19, RULE_testlist_star_expr = 20, 
		RULE_flow_stmt = 21, RULE_break_stmt = 22, RULE_continue_stmt = 23, RULE_return_stmt = 24, 
		RULE_dotted_as_name = 25, RULE_dotted_as_names = 26, RULE_dotted_name = 27, 
		RULE_compound_stmt = 28, RULE_if_stmt = 29, RULE_while_stmt = 30, RULE_for_stmt = 31, 
		RULE_with_stmt = 32, RULE_with_item = 33, RULE_suite = 34, RULE_test = 35, 
		RULE_test_nocond = 36, RULE_or_test = 37, RULE_and_test = 38, RULE_not_test = 39, 
		RULE_comparison = 40, RULE_comp_op = 41, RULE_expr = 42, RULE_xor_expr = 43, 
		RULE_and_expr = 44, RULE_shift_expr = 45, RULE_arith_expr = 46, RULE_term = 47, 
		RULE_factor = 48, RULE_power = 49, RULE_atom_expr = 50, RULE_atom = 51, 
		RULE_testlist_comp = 52, RULE_trailer = 53, RULE_subscriptlist = 54, RULE_subscript = 55, 
		RULE_sliceop = 56, RULE_exprlist = 57, RULE_testlist = 58, RULE_dictorsetmaker = 59, 
		RULE_arglist = 60, RULE_argument = 61, RULE_comp_iter = 62, RULE_comp_for = 63, 
		RULE_comp_if = 64;
	public static const string[] ruleNames = [
		"file_input", "rule_spec", "rule_name", "rule_ID", "lang", "base", "base_rules", 
		"funcdef", "parameters", "typedargslist", "tfpdef", "varargslist", "vfpdef", 
		"stmt", "simple_stmt", "small_stmt", "string_stmt", "funct_stmt", "expr_stmt", 
		"annassign", "testlist_star_expr", "flow_stmt", "break_stmt", "continue_stmt", 
		"return_stmt", "dotted_as_name", "dotted_as_names", "dotted_name", "compound_stmt", 
		"if_stmt", "while_stmt", "for_stmt", "with_stmt", "with_item", "suite", 
		"test", "test_nocond", "or_test", "and_test", "not_test", "comparison", 
		"comp_op", "expr", "xor_expr", "and_expr", "shift_expr", "arith_expr", 
		"term", "factor", "power", "atom_expr", "atom", "testlist_comp", "trailer", 
		"subscriptlist", "subscript", "sliceop", "exprlist", "testlist", "dictorsetmaker", 
		"arglist", "argument", "comp_iter", "comp_for", "comp_if"
	];

	private static const string[] _LITERAL_NAMES = [
		null, "'in'", "'with'", "'is'", "'None'", null, null, null, "'rule'", 
		"'base'", "'def'", "'return'", "'as'", "'if'", "'elif'", "'else'", "'while'", 
		"'for'", "'or'", "'and'", "'not'", "'True'", "'False'", "'continue'", 
		"'break'", null, null, null, null, null, null, null, null, "'.'", "'...'", 
		"'*'", "'('", "')'", "','", "':'", "';'", "'**'", "'='", "'['", "']'", 
		"'|'", "'^'", "'&'", "'<<'", "'>>'", "'+'", "'-'", "'/'", "'%'", "'//'", 
		"'~'", "'{'", "'}'", "'<'", "'>'", "'=='", "'>='", "'<='", "'<>'", "'!='", 
		"'@'", "'->'", "'+='", "'-='", "'*='", "'@='", "'/='", "'%='", "'&='", 
		"'|='", "'^='", "'<<='", "'>>='", "'**='", "'//='"
	];
	private static const string[] _SYMBOLIC_NAMES = [
		null, null, null, null, null, "STRING", "NUMBER", "INTEGER", "RULE", "BASE", 
		"DEF", "RETURN", "AS", "IF", "ELIF", "ELSE", "WHILE", "FOR", "OR", "AND", 
		"NOT", "TRUE", "FALSE", "CONTINUE", "BREAK", "NEWLINE", "NAME", "STRING_LITERAL", 
		"BYTES_LITERAL", "DECIMAL_INTEGER", "OCT_INTEGER", "HEX_INTEGER", "BIN_INTEGER", 
		"DOT", "ELLIPSIS", "STAR", "OPEN_PAREN", "CLOSE_PAREN", "COMMA", "COLON", 
		"SEMI_COLON", "POWER", "ASSIGN", "OPEN_BRACK", "CLOSE_BRACK", "OR_OP", 
		"XOR", "AND_OP", "LEFT_SHIFT", "RIGHT_SHIFT", "ADD", "MINUS", "DIV", "MOD", 
		"IDIV", "NOT_OP", "OPEN_BRACE", "CLOSE_BRACE", "LESS_THAN", "GREATER_THAN", 
		"EQUALS", "GT_EQ", "LT_EQ", "NOT_EQ_1", "NOT_EQ_2", "AT", "ARROW", "ADD_ASSIGN", 
		"SUB_ASSIGN", "MULT_ASSIGN", "AT_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", 
		"AND_ASSIGN", "OR_ASSIGN", "XOR_ASSIGN", "LEFT_SHIFT_ASSIGN", "RIGHT_SHIFT_ASSIGN", 
		"POWER_ASSIGN", "IDIV_ASSIGN", "SKIP_", "UNKNOWN_CHAR", "INDENT", "DEDENT"
	];
	public static Vocabulary VOCABULARY;

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	public static string[] tokenNames;

	static this() {
	    VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);
	    string[_SYMBOLIC_NAMES.length] tokenNames;
	    for (int i = 0; i < tokenNames.length; i++) {
	        tokenNames[i] = VOCABULARY.getLiteralName(i);
	            if (tokenNames[i] is null) {
	                tokenNames[i] = VOCABULARY.getSymbolicName(i);
		    }

	            if (tokenNames[i] is null) {
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
	public ATN getATN() { return _ATN; }

	public this(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN, _decisionToDFA, _sharedContextCache);
	}
	public static class File_inputContext : ParserRuleContext {
		public Rule_specContext rule_spec() {
			return getRuleContext!Rule_specContext(0);
		}
		public BaseContext base() {
			return getRuleContext!BaseContext(0);
		}
		public TerminalNode EOF() { return getToken(RuleTranslatorParser.EOF, 0); }
		public TerminalNode[] NEWLINE() { return getTokens(RuleTranslatorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(RuleTranslatorParser.NEWLINE, i);
		}
		public StmtContext[] stmt() {
			return getRuleContexts!StmtContext;
		}
		public StmtContext stmt(int i) {
			return getRuleContext!StmtContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_file_input; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterFile_input(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitFile_input(this);
		}
	}

	public File_inputContext file_input() {
		File_inputContext _localctx = new File_inputContext(ctx_, getState());
		enterRule(_localctx, 0, RULE_file_input);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(130);
			rule_spec();
			setState(131);
			base();
			setState(134); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				setState(134);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case NEWLINE:
					{
					setState(132);
					match(NEWLINE);
					}
					break;
				case T__1:
				case T__3:
				case STRING:
				case NUMBER:
				case DEF:
				case RETURN:
				case IF:
				case WHILE:
				case FOR:
				case NOT:
				case TRUE:
				case FALSE:
				case CONTINUE:
				case BREAK:
				case NAME:
				case ELLIPSIS:
				case OPEN_PAREN:
				case OPEN_BRACK:
				case ADD:
				case MINUS:
				case NOT_OP:
				case OPEN_BRACE:
					{
					setState(133);
					stmt();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				}
				setState(136); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << DEF) | (1L << RETURN) | (1L << IF) | (1L << WHILE) | (1L << FOR) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << CONTINUE) | (1L << BREAK) | (1L << NEWLINE) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0) );
			setState(138);
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

	public static class Rule_specContext : ParserRuleContext {
		public TerminalNode RULE() { return getToken(RuleTranslatorParser.RULE, 0); }
		public Rule_nameContext rule_name() {
			return getRuleContext!Rule_nameContext(0);
		}
		public TerminalNode AS() { return getToken(RuleTranslatorParser.AS, 0); }
		public Rule_IDContext rule_ID() {
			return getRuleContext!Rule_IDContext(0);
		}
		public LangContext lang() {
			return getRuleContext!LangContext(0);
		}
		public TerminalNode[] NEWLINE() { return getTokens(RuleTranslatorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(RuleTranslatorParser.NEWLINE, i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_rule_spec; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterRule_spec(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitRule_spec(this);
		}
	}

	public Rule_specContext rule_spec() {
		Rule_specContext _localctx = new Rule_specContext(ctx_, getState());
		enterRule(_localctx, 2, RULE_rule_spec);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(143);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NEWLINE) {
				{
				{
				setState(140);
				match(NEWLINE);
				}
				}
				setState(145);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(146);
			match(RULE);
			setState(147);
			rule_name();
			setState(148);
			match(AS);
			setState(149);
			rule_ID();
			setState(150);
			lang();
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
		override public int getRuleIndex() { return RULE_rule_name; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterRule_name(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitRule_name(this);
		}
	}

	public Rule_nameContext rule_name() {
		Rule_nameContext _localctx = new Rule_nameContext(ctx_, getState());
		enterRule(_localctx, 4, RULE_rule_name);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(152);
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

	public static class Rule_IDContext : ParserRuleContext {
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_rule_ID; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterRule_ID(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitRule_ID(this);
		}
	}

	public Rule_IDContext rule_ID() {
		Rule_IDContext _localctx = new Rule_IDContext(ctx_, getState());
		enterRule(_localctx, 6, RULE_rule_ID);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(154);
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

	public static class LangContext : ParserRuleContext {
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_lang; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterLang(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitLang(this);
		}
	}

	public LangContext lang() {
		LangContext _localctx = new LangContext(ctx_, getState());
		enterRule(_localctx, 8, RULE_lang);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(156);
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

	public static class BaseContext : ParserRuleContext {
		public TerminalNode BASE() { return getToken(RuleTranslatorParser.BASE, 0); }
		public LangContext lang() {
			return getRuleContext!LangContext(0);
		}
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
		override public int getRuleIndex() { return RULE_base; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterBase(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitBase(this);
		}
	}

	public BaseContext base() {
		BaseContext _localctx = new BaseContext(ctx_, getState());
		enterRule(_localctx, 10, RULE_base);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(161);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NEWLINE) {
				{
				{
				setState(158);
				match(NEWLINE);
				}
				}
				setState(163);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(164);
			match(BASE);
			setState(165);
			lang();
			setState(166);
			match(DOT);
			setState(167);
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
		override public int getRuleIndex() { return RULE_base_rules; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterBase_rules(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitBase_rules(this);
		}
	}

	public Base_rulesContext base_rules() {
		Base_rulesContext _localctx = new Base_rulesContext(ctx_, getState());
		enterRule(_localctx, 12, RULE_base_rules);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(169);
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
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public ParametersContext parameters() {
			return getRuleContext!ParametersContext(0);
		}
		public SuiteContext suite() {
			return getRuleContext!SuiteContext(0);
		}
		public TestContext test() {
			return getRuleContext!TestContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_funcdef; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterFuncdef(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitFuncdef(this);
		}
	}

	public FuncdefContext funcdef() {
		FuncdefContext _localctx = new FuncdefContext(ctx_, getState());
		enterRule(_localctx, 14, RULE_funcdef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(171);
			match(DEF);
			setState(172);
			match(NAME);
			setState(173);
			parameters();
			setState(176);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ARROW) {
				{
				setState(174);
				match(ARROW);
				setState(175);
				test();
				}
			}

			setState(178);
			match(COLON);
			setState(179);
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

	public static class ParametersContext : ParserRuleContext {
		public TypedargslistContext typedargslist() {
			return getRuleContext!TypedargslistContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_parameters; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterParameters(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitParameters(this);
		}
	}

	public ParametersContext parameters() {
		ParametersContext _localctx = new ParametersContext(ctx_, getState());
		enterRule(_localctx, 16, RULE_parameters);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(181);
			match(OPEN_PAREN);
			setState(183);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << NAME) | (1L << STAR) | (1L << POWER))) != 0)) {
				{
				setState(182);
				typedargslist();
				}
			}

			setState(185);
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
		public TestContext[] test() {
			return getRuleContexts!TestContext;
		}
		public TestContext test(int i) {
			return getRuleContext!TestContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_typedargslist; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTypedargslist(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTypedargslist(this);
		}
	}

	public TypedargslistContext typedargslist() {
		TypedargslistContext _localctx = new TypedargslistContext(ctx_, getState());
		enterRule(_localctx, 18, RULE_typedargslist);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(268);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NAME:
				{
				setState(187);
				tfpdef();
				setState(190);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==ASSIGN) {
					{
					setState(188);
					match(ASSIGN);
					setState(189);
					test();
					}
				}

				setState(200);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,8, ctx_);
				while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(192);
						match(COMMA);
						setState(193);
						tfpdef();
						setState(196);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==ASSIGN) {
							{
							setState(194);
							match(ASSIGN);
							setState(195);
							test();
							}
						}

						}
						} 
					}
					setState(202);
					_errHandler.sync(this);
					_alt = getInterpreter.adaptivePredict(_input,8, ctx_);
				}
				setState(236);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMA) {
					{
					setState(203);
					match(COMMA);
					setState(234);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case STAR:
						{
						setState(204);
						match(STAR);
						setState(206);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==NAME) {
							{
							setState(205);
							tfpdef();
							}
						}

						setState(216);
						_errHandler.sync(this);
						_alt = getInterpreter.adaptivePredict(_input,11, ctx_);
						while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
							if ( _alt==1 ) {
								{
								{
								setState(208);
								match(COMMA);
								setState(209);
								tfpdef();
								setState(212);
								_errHandler.sync(this);
								_la = _input.LA(1);
								if (_la==ASSIGN) {
									{
									setState(210);
									match(ASSIGN);
									setState(211);
									test();
									}
								}

								}
								} 
							}
							setState(218);
							_errHandler.sync(this);
							_alt = getInterpreter.adaptivePredict(_input,11, ctx_);
						}
						setState(227);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==COMMA) {
							{
							setState(219);
							match(COMMA);
							setState(225);
							_errHandler.sync(this);
							_la = _input.LA(1);
							if (_la==POWER) {
								{
								setState(220);
								match(POWER);
								setState(221);
								tfpdef();
								setState(223);
								_errHandler.sync(this);
								_la = _input.LA(1);
								if (_la==COMMA) {
									{
									setState(222);
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
						setState(229);
						match(POWER);
						setState(230);
						tfpdef();
						setState(232);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==COMMA) {
							{
							setState(231);
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
				setState(238);
				match(STAR);
				setState(240);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==NAME) {
					{
					setState(239);
					tfpdef();
					}
				}

				setState(250);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,20, ctx_);
				while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(242);
						match(COMMA);
						setState(243);
						tfpdef();
						setState(246);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==ASSIGN) {
							{
							setState(244);
							match(ASSIGN);
							setState(245);
							test();
							}
						}

						}
						} 
					}
					setState(252);
					_errHandler.sync(this);
					_alt = getInterpreter.adaptivePredict(_input,20, ctx_);
				}
				setState(261);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMA) {
					{
					setState(253);
					match(COMMA);
					setState(259);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==POWER) {
						{
						setState(254);
						match(POWER);
						setState(255);
						tfpdef();
						setState(257);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==COMMA) {
							{
							setState(256);
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
				setState(263);
				match(POWER);
				setState(264);
				tfpdef();
				setState(266);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMA) {
					{
					setState(265);
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
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public TestContext test() {
			return getRuleContext!TestContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_tfpdef; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTfpdef(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTfpdef(this);
		}
	}

	public TfpdefContext tfpdef() {
		TfpdefContext _localctx = new TfpdefContext(ctx_, getState());
		enterRule(_localctx, 20, RULE_tfpdef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(270);
			match(NAME);
			setState(273);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==COLON) {
				{
				setState(271);
				match(COLON);
				setState(272);
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

	public static class VarargslistContext : ParserRuleContext {
		public VfpdefContext[] vfpdef() {
			return getRuleContexts!VfpdefContext;
		}
		public VfpdefContext vfpdef(int i) {
			return getRuleContext!VfpdefContext(i);
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
		override public int getRuleIndex() { return RULE_varargslist; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterVarargslist(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitVarargslist(this);
		}
	}

	public VarargslistContext varargslist() {
		VarargslistContext _localctx = new VarargslistContext(ctx_, getState());
		enterRule(_localctx, 22, RULE_varargslist);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(356);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NAME:
				{
				setState(275);
				vfpdef();
				setState(278);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==ASSIGN) {
					{
					setState(276);
					match(ASSIGN);
					setState(277);
					test();
					}
				}

				setState(288);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,29, ctx_);
				while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(280);
						match(COMMA);
						setState(281);
						vfpdef();
						setState(284);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==ASSIGN) {
							{
							setState(282);
							match(ASSIGN);
							setState(283);
							test();
							}
						}

						}
						} 
					}
					setState(290);
					_errHandler.sync(this);
					_alt = getInterpreter.adaptivePredict(_input,29, ctx_);
				}
				setState(324);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMA) {
					{
					setState(291);
					match(COMMA);
					setState(322);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case STAR:
						{
						setState(292);
						match(STAR);
						setState(294);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==NAME) {
							{
							setState(293);
							vfpdef();
							}
						}

						setState(304);
						_errHandler.sync(this);
						_alt = getInterpreter.adaptivePredict(_input,32, ctx_);
						while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
							if ( _alt==1 ) {
								{
								{
								setState(296);
								match(COMMA);
								setState(297);
								vfpdef();
								setState(300);
								_errHandler.sync(this);
								_la = _input.LA(1);
								if (_la==ASSIGN) {
									{
									setState(298);
									match(ASSIGN);
									setState(299);
									test();
									}
								}

								}
								} 
							}
							setState(306);
							_errHandler.sync(this);
							_alt = getInterpreter.adaptivePredict(_input,32, ctx_);
						}
						setState(315);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==COMMA) {
							{
							setState(307);
							match(COMMA);
							setState(313);
							_errHandler.sync(this);
							_la = _input.LA(1);
							if (_la==POWER) {
								{
								setState(308);
								match(POWER);
								setState(309);
								vfpdef();
								setState(311);
								_errHandler.sync(this);
								_la = _input.LA(1);
								if (_la==COMMA) {
									{
									setState(310);
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
						setState(317);
						match(POWER);
						setState(318);
						vfpdef();
						setState(320);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==COMMA) {
							{
							setState(319);
							match(COMMA);
							}
						}

						}
						break;
					case EOF:
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
				setState(326);
				match(STAR);
				setState(328);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==NAME) {
					{
					setState(327);
					vfpdef();
					}
				}

				setState(338);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,41, ctx_);
				while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(330);
						match(COMMA);
						setState(331);
						vfpdef();
						setState(334);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==ASSIGN) {
							{
							setState(332);
							match(ASSIGN);
							setState(333);
							test();
							}
						}

						}
						} 
					}
					setState(340);
					_errHandler.sync(this);
					_alt = getInterpreter.adaptivePredict(_input,41, ctx_);
				}
				setState(349);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMA) {
					{
					setState(341);
					match(COMMA);
					setState(347);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==POWER) {
						{
						setState(342);
						match(POWER);
						setState(343);
						vfpdef();
						setState(345);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==COMMA) {
							{
							setState(344);
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
				setState(351);
				match(POWER);
				setState(352);
				vfpdef();
				setState(354);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMA) {
					{
					setState(353);
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

	public static class VfpdefContext : ParserRuleContext {
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_vfpdef; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterVfpdef(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitVfpdef(this);
		}
	}

	public VfpdefContext vfpdef() {
		VfpdefContext _localctx = new VfpdefContext(ctx_, getState());
		enterRule(_localctx, 24, RULE_vfpdef);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(358);
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

	public static class StmtContext : ParserRuleContext {
		public Simple_stmtContext simple_stmt() {
			return getRuleContext!Simple_stmtContext(0);
		}
		public Compound_stmtContext compound_stmt() {
			return getRuleContext!Compound_stmtContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterStmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitStmt(this);
		}
	}

	public StmtContext stmt() {
		StmtContext _localctx = new StmtContext(ctx_, getState());
		enterRule(_localctx, 26, RULE_stmt);
		try {
			setState(362);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__3:
			case STRING:
			case NUMBER:
			case RETURN:
			case NOT:
			case TRUE:
			case FALSE:
			case CONTINUE:
			case BREAK:
			case NAME:
			case ELLIPSIS:
			case OPEN_PAREN:
			case OPEN_BRACK:
			case ADD:
			case MINUS:
			case NOT_OP:
			case OPEN_BRACE:
				enterOuterAlt(_localctx, 1);
				{
				setState(360);
				simple_stmt();
				}
				break;
			case T__1:
			case DEF:
			case IF:
			case WHILE:
			case FOR:
				enterOuterAlt(_localctx, 2);
				{
				setState(361);
				compound_stmt();
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
		override public int getRuleIndex() { return RULE_simple_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterSimple_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitSimple_stmt(this);
		}
	}

	public Simple_stmtContext simple_stmt() {
		Simple_stmtContext _localctx = new Simple_stmtContext(ctx_, getState());
		enterRule(_localctx, 28, RULE_simple_stmt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(365); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(364);
				small_stmt();
				}
				}
				setState(367); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << RETURN) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << CONTINUE) | (1L << BREAK) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0) );
			setState(369);
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
		public Expr_stmtContext expr_stmt() {
			return getRuleContext!Expr_stmtContext(0);
		}
		public String_stmtContext string_stmt() {
			return getRuleContext!String_stmtContext(0);
		}
		public Funct_stmtContext funct_stmt() {
			return getRuleContext!Funct_stmtContext(0);
		}
		public Flow_stmtContext flow_stmt() {
			return getRuleContext!Flow_stmtContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_small_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterSmall_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitSmall_stmt(this);
		}
	}

	public Small_stmtContext small_stmt() {
		Small_stmtContext _localctx = new Small_stmtContext(ctx_, getState());
		enterRule(_localctx, 30, RULE_small_stmt);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(375);
			_errHandler.sync(this);
			switch ( getInterpreter.adaptivePredict(_input,49, ctx_) ) {
			case 1:
				{
				setState(371);
				expr_stmt();
				}
				break;
			case 2:
				{
				setState(372);
				string_stmt();
				}
				break;
			case 3:
				{
				setState(373);
				funct_stmt();
				}
				break;
			case 4:
				{
				setState(374);
				flow_stmt();
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
		override public int getRuleIndex() { return RULE_string_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterString_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitString_stmt(this);
		}
	}

	public String_stmtContext string_stmt() {
		String_stmtContext _localctx = new String_stmtContext(ctx_, getState());
		enterRule(_localctx, 32, RULE_string_stmt);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(377);
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
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public ParametersContext parameters() {
			return getRuleContext!ParametersContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_funct_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterFunct_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitFunct_stmt(this);
		}
	}

	public Funct_stmtContext funct_stmt() {
		Funct_stmtContext _localctx = new Funct_stmtContext(ctx_, getState());
		enterRule(_localctx, 34, RULE_funct_stmt);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(379);
			match(NAME);
			setState(380);
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

	public static class Expr_stmtContext : ParserRuleContext {
		public Testlist_star_exprContext[] testlist_star_expr() {
			return getRuleContexts!Testlist_star_exprContext;
		}
		public Testlist_star_exprContext testlist_star_expr(int i) {
			return getRuleContext!Testlist_star_exprContext(i);
		}
		public AnnassignContext annassign() {
			return getRuleContext!AnnassignContext(0);
		}
		public TestlistContext testlist() {
			return getRuleContext!TestlistContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_expr_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterExpr_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitExpr_stmt(this);
		}
	}

	public Expr_stmtContext expr_stmt() {
		Expr_stmtContext _localctx = new Expr_stmtContext(ctx_, getState());
		enterRule(_localctx, 36, RULE_expr_stmt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(382);
			testlist_star_expr();
			setState(393);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case COLON:
				{
				setState(383);
				annassign();
				{
				setState(384);
				testlist();
				}
				}
				break;
			case T__3:
			case STRING:
			case NUMBER:
			case RETURN:
			case NOT:
			case TRUE:
			case FALSE:
			case CONTINUE:
			case BREAK:
			case NEWLINE:
			case NAME:
			case ELLIPSIS:
			case OPEN_PAREN:
			case ASSIGN:
			case OPEN_BRACK:
			case ADD:
			case MINUS:
			case NOT_OP:
			case OPEN_BRACE:
				{
				setState(390);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==ASSIGN) {
					{
					{
					setState(386);
					match(ASSIGN);
					{
					setState(387);
					testlist_star_expr();
					}
					}
					}
					setState(392);
					_errHandler.sync(this);
					_la = _input.LA(1);
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

	public static class AnnassignContext : ParserRuleContext {
		public TestContext[] test() {
			return getRuleContexts!TestContext;
		}
		public TestContext test(int i) {
			return getRuleContext!TestContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_annassign; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterAnnassign(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitAnnassign(this);
		}
	}

	public AnnassignContext annassign() {
		AnnassignContext _localctx = new AnnassignContext(ctx_, getState());
		enterRule(_localctx, 38, RULE_annassign);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(395);
			match(COLON);
			setState(396);
			test();
			setState(399);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ASSIGN) {
				{
				setState(397);
				match(ASSIGN);
				setState(398);
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

	public static class Testlist_star_exprContext : ParserRuleContext {
		public TestContext[] test() {
			return getRuleContexts!TestContext;
		}
		public TestContext test(int i) {
			return getRuleContext!TestContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_testlist_star_expr; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTestlist_star_expr(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTestlist_star_expr(this);
		}
	}

	public Testlist_star_exprContext testlist_star_expr() {
		Testlist_star_exprContext _localctx = new Testlist_star_exprContext(ctx_, getState());
		enterRule(_localctx, 40, RULE_testlist_star_expr);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(401);
			test();
			}
			setState(406);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,53, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(402);
					match(COMMA);
					{
					setState(403);
					test();
					}
					}
					} 
				}
				setState(408);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,53, ctx_);
			}
			setState(410);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==COMMA) {
				{
				setState(409);
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

	public static class Flow_stmtContext : ParserRuleContext {
		public Break_stmtContext break_stmt() {
			return getRuleContext!Break_stmtContext(0);
		}
		public Continue_stmtContext continue_stmt() {
			return getRuleContext!Continue_stmtContext(0);
		}
		public Return_stmtContext return_stmt() {
			return getRuleContext!Return_stmtContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_flow_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterFlow_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitFlow_stmt(this);
		}
	}

	public Flow_stmtContext flow_stmt() {
		Flow_stmtContext _localctx = new Flow_stmtContext(ctx_, getState());
		enterRule(_localctx, 42, RULE_flow_stmt);
		try {
			setState(415);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case BREAK:
				enterOuterAlt(_localctx, 1);
				{
				setState(412);
				break_stmt();
				}
				break;
			case CONTINUE:
				enterOuterAlt(_localctx, 2);
				{
				setState(413);
				continue_stmt();
				}
				break;
			case RETURN:
				enterOuterAlt(_localctx, 3);
				{
				setState(414);
				return_stmt();
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_break_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterBreak_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitBreak_stmt(this);
		}
	}

	public Break_stmtContext break_stmt() {
		Break_stmtContext _localctx = new Break_stmtContext(ctx_, getState());
		enterRule(_localctx, 44, RULE_break_stmt);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(417);
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_continue_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterContinue_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitContinue_stmt(this);
		}
	}

	public Continue_stmtContext continue_stmt() {
		Continue_stmtContext _localctx = new Continue_stmtContext(ctx_, getState());
		enterRule(_localctx, 46, RULE_continue_stmt);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(419);
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

	public static class Return_stmtContext : ParserRuleContext {
		public TestlistContext testlist() {
			return getRuleContext!TestlistContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_return_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterReturn_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitReturn_stmt(this);
		}
	}

	public Return_stmtContext return_stmt() {
		Return_stmtContext _localctx = new Return_stmtContext(ctx_, getState());
		enterRule(_localctx, 48, RULE_return_stmt);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(421);
			match(RETURN);
			setState(423);
			_errHandler.sync(this);
			switch ( getInterpreter.adaptivePredict(_input,56, ctx_) ) {
			case 1:
				{
				setState(422);
				testlist();
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

	public static class Dotted_as_nameContext : ParserRuleContext {
		public Dotted_nameContext dotted_name() {
			return getRuleContext!Dotted_nameContext(0);
		}
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_dotted_as_name; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterDotted_as_name(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitDotted_as_name(this);
		}
	}

	public Dotted_as_nameContext dotted_as_name() {
		Dotted_as_nameContext _localctx = new Dotted_as_nameContext(ctx_, getState());
		enterRule(_localctx, 50, RULE_dotted_as_name);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(425);
			dotted_name();
			setState(428);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==AS) {
				{
				setState(426);
				match(AS);
				setState(427);
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_dotted_as_names; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterDotted_as_names(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitDotted_as_names(this);
		}
	}

	public Dotted_as_namesContext dotted_as_names() {
		Dotted_as_namesContext _localctx = new Dotted_as_namesContext(ctx_, getState());
		enterRule(_localctx, 52, RULE_dotted_as_names);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(430);
			dotted_as_name();
			setState(435);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(431);
				match(COMMA);
				setState(432);
				dotted_as_name();
				}
				}
				setState(437);
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
		public TerminalNode[] NAME() { return getTokens(RuleTranslatorParser.NAME); }
		public TerminalNode NAME(int i) {
			return getToken(RuleTranslatorParser.NAME, i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_dotted_name; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterDotted_name(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitDotted_name(this);
		}
	}

	public Dotted_nameContext dotted_name() {
		Dotted_nameContext _localctx = new Dotted_nameContext(ctx_, getState());
		enterRule(_localctx, 54, RULE_dotted_name);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(438);
			match(NAME);
			setState(443);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==DOT) {
				{
				{
				setState(439);
				match(DOT);
				setState(440);
				match(NAME);
				}
				}
				setState(445);
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

	public static class Compound_stmtContext : ParserRuleContext {
		public If_stmtContext if_stmt() {
			return getRuleContext!If_stmtContext(0);
		}
		public While_stmtContext while_stmt() {
			return getRuleContext!While_stmtContext(0);
		}
		public For_stmtContext for_stmt() {
			return getRuleContext!For_stmtContext(0);
		}
		public With_stmtContext with_stmt() {
			return getRuleContext!With_stmtContext(0);
		}
		public FuncdefContext funcdef() {
			return getRuleContext!FuncdefContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_compound_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterCompound_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitCompound_stmt(this);
		}
	}

	public Compound_stmtContext compound_stmt() {
		Compound_stmtContext _localctx = new Compound_stmtContext(ctx_, getState());
		enterRule(_localctx, 56, RULE_compound_stmt);
		try {
			setState(451);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case IF:
				enterOuterAlt(_localctx, 1);
				{
				setState(446);
				if_stmt();
				}
				break;
			case WHILE:
				enterOuterAlt(_localctx, 2);
				{
				setState(447);
				while_stmt();
				}
				break;
			case FOR:
				enterOuterAlt(_localctx, 3);
				{
				setState(448);
				for_stmt();
				}
				break;
			case T__1:
				enterOuterAlt(_localctx, 4);
				{
				setState(449);
				with_stmt();
				}
				break;
			case DEF:
				enterOuterAlt(_localctx, 5);
				{
				setState(450);
				funcdef();
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
		public TestContext[] test() {
			return getRuleContexts!TestContext;
		}
		public TestContext test(int i) {
			return getRuleContext!TestContext(i);
		}
		public SuiteContext[] suite() {
			return getRuleContexts!SuiteContext;
		}
		public SuiteContext suite(int i) {
			return getRuleContext!SuiteContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_if_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterIf_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitIf_stmt(this);
		}
	}

	public If_stmtContext if_stmt() {
		If_stmtContext _localctx = new If_stmtContext(ctx_, getState());
		enterRule(_localctx, 58, RULE_if_stmt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(453);
			match(IF);
			setState(454);
			test();
			setState(455);
			match(COLON);
			setState(456);
			suite();
			setState(464);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==ELIF) {
				{
				{
				setState(457);
				match(ELIF);
				setState(458);
				test();
				setState(459);
				match(COLON);
				setState(460);
				suite();
				}
				}
				setState(466);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(470);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ELSE) {
				{
				setState(467);
				match(ELSE);
				setState(468);
				match(COLON);
				setState(469);
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

	public static class While_stmtContext : ParserRuleContext {
		public TestContext test() {
			return getRuleContext!TestContext(0);
		}
		public SuiteContext[] suite() {
			return getRuleContexts!SuiteContext;
		}
		public SuiteContext suite(int i) {
			return getRuleContext!SuiteContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_while_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterWhile_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitWhile_stmt(this);
		}
	}

	public While_stmtContext while_stmt() {
		While_stmtContext _localctx = new While_stmtContext(ctx_, getState());
		enterRule(_localctx, 60, RULE_while_stmt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(472);
			match(WHILE);
			setState(473);
			test();
			setState(474);
			match(COLON);
			setState(475);
			suite();
			setState(479);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ELSE) {
				{
				setState(476);
				match(ELSE);
				setState(477);
				match(COLON);
				setState(478);
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

	public static class For_stmtContext : ParserRuleContext {
		public ExprlistContext exprlist() {
			return getRuleContext!ExprlistContext(0);
		}
		public TestlistContext testlist() {
			return getRuleContext!TestlistContext(0);
		}
		public SuiteContext[] suite() {
			return getRuleContexts!SuiteContext;
		}
		public SuiteContext suite(int i) {
			return getRuleContext!SuiteContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_for_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterFor_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitFor_stmt(this);
		}
	}

	public For_stmtContext for_stmt() {
		For_stmtContext _localctx = new For_stmtContext(ctx_, getState());
		enterRule(_localctx, 62, RULE_for_stmt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(481);
			match(FOR);
			setState(482);
			exprlist();
			setState(483);
			match(T__0);
			setState(484);
			testlist();
			setState(485);
			match(COLON);
			setState(486);
			suite();
			setState(490);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ELSE) {
				{
				setState(487);
				match(ELSE);
				setState(488);
				match(COLON);
				setState(489);
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

	public static class With_stmtContext : ParserRuleContext {
		public With_itemContext[] with_item() {
			return getRuleContexts!With_itemContext;
		}
		public With_itemContext with_item(int i) {
			return getRuleContext!With_itemContext(i);
		}
		public SuiteContext suite() {
			return getRuleContext!SuiteContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_with_stmt; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterWith_stmt(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitWith_stmt(this);
		}
	}

	public With_stmtContext with_stmt() {
		With_stmtContext _localctx = new With_stmtContext(ctx_, getState());
		enterRule(_localctx, 64, RULE_with_stmt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(492);
			match(T__1);
			setState(493);
			with_item();
			setState(498);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(494);
				match(COMMA);
				setState(495);
				with_item();
				}
				}
				setState(500);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(501);
			match(COLON);
			setState(502);
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
		public ExprContext expr() {
			return getRuleContext!ExprContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_with_item; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterWith_item(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitWith_item(this);
		}
	}

	public With_itemContext with_item() {
		With_itemContext _localctx = new With_itemContext(ctx_, getState());
		enterRule(_localctx, 66, RULE_with_item);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(504);
			test();
			setState(507);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==AS) {
				{
				setState(505);
				match(AS);
				setState(506);
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
		override public int getRuleIndex() { return RULE_suite; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterSuite(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitSuite(this);
		}
	}

	public SuiteContext suite() {
		SuiteContext _localctx = new SuiteContext(ctx_, getState());
		enterRule(_localctx, 68, RULE_suite);
		int _la;
		try {
			setState(519);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__3:
			case STRING:
			case NUMBER:
			case RETURN:
			case NOT:
			case TRUE:
			case FALSE:
			case CONTINUE:
			case BREAK:
			case NAME:
			case ELLIPSIS:
			case OPEN_PAREN:
			case OPEN_BRACK:
			case ADD:
			case MINUS:
			case NOT_OP:
			case OPEN_BRACE:
				enterOuterAlt(_localctx, 1);
				{
				setState(509);
				simple_stmt();
				}
				break;
			case NEWLINE:
				enterOuterAlt(_localctx, 2);
				{
				setState(510);
				match(NEWLINE);
				setState(511);
				match(INDENT);
				setState(513); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(512);
					stmt();
					}
					}
					setState(515); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << DEF) | (1L << RETURN) | (1L << IF) | (1L << WHILE) | (1L << FOR) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << CONTINUE) | (1L << BREAK) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0) );
				setState(517);
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
		public TestContext test() {
			return getRuleContext!TestContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_test; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTest(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTest(this);
		}
	}

	public TestContext test() {
		TestContext _localctx = new TestContext(ctx_, getState());
		enterRule(_localctx, 70, RULE_test);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(521);
			or_test();
			setState(527);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==IF) {
				{
				setState(522);
				match(IF);
				setState(523);
				or_test();
				setState(524);
				match(ELSE);
				setState(525);
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
		override public int getRuleIndex() { return RULE_test_nocond; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTest_nocond(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTest_nocond(this);
		}
	}

	public Test_nocondContext test_nocond() {
		Test_nocondContext _localctx = new Test_nocondContext(ctx_, getState());
		enterRule(_localctx, 72, RULE_test_nocond);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(529);
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_or_test; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterOr_test(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitOr_test(this);
		}
	}

	public Or_testContext or_test() {
		Or_testContext _localctx = new Or_testContext(ctx_, getState());
		enterRule(_localctx, 74, RULE_or_test);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(531);
			and_test();
			setState(536);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==OR) {
				{
				{
				setState(532);
				match(OR);
				setState(533);
				and_test();
				}
				}
				setState(538);
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

	public static class And_testContext : ParserRuleContext {
		public Not_testContext[] not_test() {
			return getRuleContexts!Not_testContext;
		}
		public Not_testContext not_test(int i) {
			return getRuleContext!Not_testContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_and_test; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterAnd_test(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitAnd_test(this);
		}
	}

	public And_testContext and_test() {
		And_testContext _localctx = new And_testContext(ctx_, getState());
		enterRule(_localctx, 76, RULE_and_test);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(539);
			not_test();
			setState(544);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==AND) {
				{
				{
				setState(540);
				match(AND);
				setState(541);
				not_test();
				}
				}
				setState(546);
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

	public static class Not_testContext : ParserRuleContext {
		public Not_testContext not_test() {
			return getRuleContext!Not_testContext(0);
		}
		public ComparisonContext comparison() {
			return getRuleContext!ComparisonContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_not_test; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterNot_test(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitNot_test(this);
		}
	}

	public Not_testContext not_test() {
		Not_testContext _localctx = new Not_testContext(ctx_, getState());
		enterRule(_localctx, 78, RULE_not_test);
		try {
			setState(550);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NOT:
				enterOuterAlt(_localctx, 1);
				{
				setState(547);
				match(NOT);
				setState(548);
				not_test();
				}
				break;
			case T__3:
			case STRING:
			case NUMBER:
			case TRUE:
			case FALSE:
			case NAME:
			case ELLIPSIS:
			case OPEN_PAREN:
			case OPEN_BRACK:
			case ADD:
			case MINUS:
			case NOT_OP:
			case OPEN_BRACE:
				enterOuterAlt(_localctx, 2);
				{
				setState(549);
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
		override public int getRuleIndex() { return RULE_comparison; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterComparison(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitComparison(this);
		}
	}

	public ComparisonContext comparison() {
		ComparisonContext _localctx = new ComparisonContext(ctx_, getState());
		enterRule(_localctx, 80, RULE_comparison);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(552);
			expr();
			setState(558);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,73, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(553);
					comp_op();
					setState(554);
					expr();
					}
					} 
				}
				setState(560);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,73, ctx_);
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
		override public int getRuleIndex() { return RULE_comp_op; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterComp_op(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitComp_op(this);
		}
	}

	public Comp_opContext comp_op() {
		Comp_opContext _localctx = new Comp_opContext(ctx_, getState());
		enterRule(_localctx, 82, RULE_comp_op);
		try {
			setState(574);
			_errHandler.sync(this);
			switch ( getInterpreter.adaptivePredict(_input,74, ctx_) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(561);
				match(LESS_THAN);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(562);
				match(GREATER_THAN);
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(563);
				match(EQUALS);
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(564);
				match(GT_EQ);
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(565);
				match(LT_EQ);
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(566);
				match(NOT_EQ_1);
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(567);
				match(NOT_EQ_2);
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(568);
				match(T__0);
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(569);
				match(NOT);
				setState(570);
				match(T__0);
				}
				break;
			case 10:
				enterOuterAlt(_localctx, 10);
				{
				setState(571);
				match(T__2);
				}
				break;
			case 11:
				enterOuterAlt(_localctx, 11);
				{
				setState(572);
				match(T__2);
				setState(573);
				match(NOT);
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

	public static class ExprContext : ParserRuleContext {
		public Xor_exprContext[] xor_expr() {
			return getRuleContexts!Xor_exprContext;
		}
		public Xor_exprContext xor_expr(int i) {
			return getRuleContext!Xor_exprContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_expr; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterExpr(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitExpr(this);
		}
	}

	public ExprContext expr() {
		ExprContext _localctx = new ExprContext(ctx_, getState());
		enterRule(_localctx, 84, RULE_expr);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(576);
			xor_expr();
			setState(581);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==OR_OP) {
				{
				{
				setState(577);
				match(OR_OP);
				setState(578);
				xor_expr();
				}
				}
				setState(583);
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

	public static class Xor_exprContext : ParserRuleContext {
		public And_exprContext[] and_expr() {
			return getRuleContexts!And_exprContext;
		}
		public And_exprContext and_expr(int i) {
			return getRuleContext!And_exprContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_xor_expr; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterXor_expr(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitXor_expr(this);
		}
	}

	public Xor_exprContext xor_expr() {
		Xor_exprContext _localctx = new Xor_exprContext(ctx_, getState());
		enterRule(_localctx, 86, RULE_xor_expr);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(584);
			and_expr();
			setState(589);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==XOR) {
				{
				{
				setState(585);
				match(XOR);
				setState(586);
				and_expr();
				}
				}
				setState(591);
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
		public Shift_exprContext[] shift_expr() {
			return getRuleContexts!Shift_exprContext;
		}
		public Shift_exprContext shift_expr(int i) {
			return getRuleContext!Shift_exprContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_and_expr; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterAnd_expr(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitAnd_expr(this);
		}
	}

	public And_exprContext and_expr() {
		And_exprContext _localctx = new And_exprContext(ctx_, getState());
		enterRule(_localctx, 88, RULE_and_expr);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(592);
			shift_expr();
			setState(597);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==AND_OP) {
				{
				{
				setState(593);
				match(AND_OP);
				setState(594);
				shift_expr();
				}
				}
				setState(599);
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

	public static class Shift_exprContext : ParserRuleContext {
		public Arith_exprContext[] arith_expr() {
			return getRuleContexts!Arith_exprContext;
		}
		public Arith_exprContext arith_expr(int i) {
			return getRuleContext!Arith_exprContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_shift_expr; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterShift_expr(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitShift_expr(this);
		}
	}

	public Shift_exprContext shift_expr() {
		Shift_exprContext _localctx = new Shift_exprContext(ctx_, getState());
		enterRule(_localctx, 90, RULE_shift_expr);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(600);
			arith_expr();
			setState(605);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==LEFT_SHIFT || _la==RIGHT_SHIFT) {
				{
				{
				setState(601);
				_la = _input.LA(1);
				if ( !(_la==LEFT_SHIFT || _la==RIGHT_SHIFT) ) {
				_errHandler.recoverInline(this);
				}
				else {
				    if (_input.LA(1) == TokenConstantDefinition.EOF)
				        matchedEOF = true;
				    _errHandler.reportMatch(this);
				    consume();
				}
				setState(602);
				arith_expr();
				}
				}
				setState(607);
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_arith_expr; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterArith_expr(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitArith_expr(this);
		}
	}

	public Arith_exprContext arith_expr() {
		Arith_exprContext _localctx = new Arith_exprContext(ctx_, getState());
		enterRule(_localctx, 92, RULE_arith_expr);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(608);
			term();
			setState(613);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,79, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(609);
					_la = _input.LA(1);
					if ( !(_la==ADD || _la==MINUS) ) {
					_errHandler.recoverInline(this);
					}
					else {
					    if (_input.LA(1) == TokenConstantDefinition.EOF)
					        matchedEOF = true;
					    _errHandler.reportMatch(this);
					    consume();
					}
					setState(610);
					term();
					}
					} 
				}
				setState(615);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,79, ctx_);
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_term; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTerm(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTerm(this);
		}
	}

	public TermContext term() {
		TermContext _localctx = new TermContext(ctx_, getState());
		enterRule(_localctx, 94, RULE_term);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(616);
			factor();
			setState(621);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 35)) & ~0x3f) == 0 && ((1L << (_la - 35)) & ((1L << (STAR - 35)) | (1L << (DIV - 35)) | (1L << (MOD - 35)) | (1L << (IDIV - 35)) | (1L << (AT - 35)))) != 0)) {
				{
				{
				setState(617);
				_la = _input.LA(1);
				if ( !(((((_la - 35)) & ~0x3f) == 0 && ((1L << (_la - 35)) & ((1L << (STAR - 35)) | (1L << (DIV - 35)) | (1L << (MOD - 35)) | (1L << (IDIV - 35)) | (1L << (AT - 35)))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
				    if (_input.LA(1) == TokenConstantDefinition.EOF)
				        matchedEOF = true;
				    _errHandler.reportMatch(this);
				    consume();
				}
				setState(618);
				factor();
				}
				}
				setState(623);
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
		public PowerContext power() {
			return getRuleContext!PowerContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_factor; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterFactor(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitFactor(this);
		}
	}

	public FactorContext factor() {
		FactorContext _localctx = new FactorContext(ctx_, getState());
		enterRule(_localctx, 96, RULE_factor);
		int _la;
		try {
			setState(627);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case ADD:
			case MINUS:
			case NOT_OP:
				enterOuterAlt(_localctx, 1);
				{
				setState(624);
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
				setState(625);
				factor();
				}
				break;
			case T__3:
			case STRING:
			case NUMBER:
			case TRUE:
			case FALSE:
			case NAME:
			case ELLIPSIS:
			case OPEN_PAREN:
			case OPEN_BRACK:
			case OPEN_BRACE:
				enterOuterAlt(_localctx, 2);
				{
				setState(626);
				power();
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

	public static class PowerContext : ParserRuleContext {
		public Atom_exprContext atom_expr() {
			return getRuleContext!Atom_exprContext(0);
		}
		public FactorContext factor() {
			return getRuleContext!FactorContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_power; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterPower(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitPower(this);
		}
	}

	public PowerContext power() {
		PowerContext _localctx = new PowerContext(ctx_, getState());
		enterRule(_localctx, 98, RULE_power);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(629);
			atom_expr();
			setState(632);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==POWER) {
				{
				setState(630);
				match(POWER);
				setState(631);
				factor();
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

	public static class Atom_exprContext : ParserRuleContext {
		public AtomContext atom() {
			return getRuleContext!AtomContext(0);
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
		override public int getRuleIndex() { return RULE_atom_expr; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterAtom_expr(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitAtom_expr(this);
		}
	}

	public Atom_exprContext atom_expr() {
		Atom_exprContext _localctx = new Atom_exprContext(ctx_, getState());
		enterRule(_localctx, 100, RULE_atom_expr);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(634);
			atom();
			setState(638);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,83, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(635);
					trailer();
					}
					} 
				}
				setState(640);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,83, ctx_);
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

	public static class AtomContext : ParserRuleContext {
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public TerminalNode NUMBER() { return getToken(RuleTranslatorParser.NUMBER, 0); }
		public Testlist_compContext testlist_comp() {
			return getRuleContext!Testlist_compContext(0);
		}
		public DictorsetmakerContext dictorsetmaker() {
			return getRuleContext!DictorsetmakerContext(0);
		}
		public TerminalNode[] STRING() { return getTokens(RuleTranslatorParser.STRING); }
		public TerminalNode STRING(int i) {
			return getToken(RuleTranslatorParser.STRING, i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_atom; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterAtom(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitAtom(this);
		}
	}

	public AtomContext atom() {
		AtomContext _localctx = new AtomContext(ctx_, getState());
		enterRule(_localctx, 102, RULE_atom);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(667);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case OPEN_PAREN:
				{
				setState(641);
				match(OPEN_PAREN);
				setState(643);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0)) {
					{
					setState(642);
					testlist_comp();
					}
				}

				setState(645);
				match(CLOSE_PAREN);
				}
				break;
			case OPEN_BRACK:
				{
				setState(646);
				match(OPEN_BRACK);
				setState(648);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0)) {
					{
					setState(647);
					testlist_comp();
					}
				}

				setState(650);
				match(CLOSE_BRACK);
				}
				break;
			case OPEN_BRACE:
				{
				setState(651);
				match(OPEN_BRACE);
				setState(653);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << POWER) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0)) {
					{
					setState(652);
					dictorsetmaker();
					}
				}

				setState(655);
				match(CLOSE_BRACE);
				}
				break;
			case NAME:
				{
				setState(656);
				match(NAME);
				}
				break;
			case NUMBER:
				{
				setState(657);
				match(NUMBER);
				}
				break;
			case STRING:
				{
				setState(659); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(658);
						match(STRING);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(661); 
					_errHandler.sync(this);
					_alt = getInterpreter.adaptivePredict(_input,87, ctx_);
				} while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER );
				}
				break;
			case ELLIPSIS:
				{
				setState(663);
				match(ELLIPSIS);
				}
				break;
			case T__3:
				{
				setState(664);
				match(T__3);
				}
				break;
			case TRUE:
				{
				setState(665);
				match(TRUE);
				}
				break;
			case FALSE:
				{
				setState(666);
				match(FALSE);
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

	public static class Testlist_compContext : ParserRuleContext {
		public TestContext[] test() {
			return getRuleContexts!TestContext;
		}
		public TestContext test(int i) {
			return getRuleContext!TestContext(i);
		}
		public Comp_forContext comp_for() {
			return getRuleContext!Comp_forContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_testlist_comp; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTestlist_comp(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTestlist_comp(this);
		}
	}

	public Testlist_compContext testlist_comp() {
		Testlist_compContext _localctx = new Testlist_compContext(ctx_, getState());
		enterRule(_localctx, 104, RULE_testlist_comp);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(669);
			test();
			}
			setState(681);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case FOR:
				{
				setState(670);
				comp_for();
				}
				break;
			case CLOSE_PAREN:
			case COMMA:
			case CLOSE_BRACK:
				{
				setState(675);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,89, ctx_);
				while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(671);
						match(COMMA);
						{
						setState(672);
						test();
						}
						}
						} 
					}
					setState(677);
					_errHandler.sync(this);
					_alt = getInterpreter.adaptivePredict(_input,89, ctx_);
				}
				setState(679);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMA) {
					{
					setState(678);
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

	public static class TrailerContext : ParserRuleContext {
		public ArglistContext arglist() {
			return getRuleContext!ArglistContext(0);
		}
		public SubscriptlistContext subscriptlist() {
			return getRuleContext!SubscriptlistContext(0);
		}
		public TerminalNode NAME() { return getToken(RuleTranslatorParser.NAME, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_trailer; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTrailer(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTrailer(this);
		}
	}

	public TrailerContext trailer() {
		TrailerContext _localctx = new TrailerContext(ctx_, getState());
		enterRule(_localctx, 106, RULE_trailer);
		int _la;
		try {
			setState(694);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case OPEN_PAREN:
				enterOuterAlt(_localctx, 1);
				{
				setState(683);
				match(OPEN_PAREN);
				setState(685);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ELLIPSIS) | (1L << STAR) | (1L << OPEN_PAREN) | (1L << POWER) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0)) {
					{
					setState(684);
					arglist();
					}
				}

				setState(687);
				match(CLOSE_PAREN);
				}
				break;
			case OPEN_BRACK:
				enterOuterAlt(_localctx, 2);
				{
				setState(688);
				match(OPEN_BRACK);
				setState(689);
				subscriptlist();
				setState(690);
				match(CLOSE_BRACK);
				}
				break;
			case DOT:
				enterOuterAlt(_localctx, 3);
				{
				setState(692);
				match(DOT);
				setState(693);
				match(NAME);
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

	public static class SubscriptlistContext : ParserRuleContext {
		public SubscriptContext[] subscript() {
			return getRuleContexts!SubscriptContext;
		}
		public SubscriptContext subscript(int i) {
			return getRuleContext!SubscriptContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_subscriptlist; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterSubscriptlist(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitSubscriptlist(this);
		}
	}

	public SubscriptlistContext subscriptlist() {
		SubscriptlistContext _localctx = new SubscriptlistContext(ctx_, getState());
		enterRule(_localctx, 108, RULE_subscriptlist);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(696);
			subscript();
			setState(701);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,94, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(697);
					match(COMMA);
					setState(698);
					subscript();
					}
					} 
				}
				setState(703);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,94, ctx_);
			}
			setState(705);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==COMMA) {
				{
				setState(704);
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
		public SliceopContext sliceop() {
			return getRuleContext!SliceopContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_subscript; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterSubscript(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitSubscript(this);
		}
	}

	public SubscriptContext subscript() {
		SubscriptContext _localctx = new SubscriptContext(ctx_, getState());
		enterRule(_localctx, 110, RULE_subscript);
		int _la;
		try {
			setState(718);
			_errHandler.sync(this);
			switch ( getInterpreter.adaptivePredict(_input,99, ctx_) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(707);
				test();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(709);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0)) {
					{
					setState(708);
					test();
					}
				}

				setState(711);
				match(COLON);
				setState(713);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0)) {
					{
					setState(712);
					test();
					}
				}

				setState(716);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COLON) {
					{
					setState(715);
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
		public TestContext test() {
			return getRuleContext!TestContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_sliceop; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterSliceop(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitSliceop(this);
		}
	}

	public SliceopContext sliceop() {
		SliceopContext _localctx = new SliceopContext(ctx_, getState());
		enterRule(_localctx, 112, RULE_sliceop);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(720);
			match(COLON);
			setState(722);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__3) | (1L << STRING) | (1L << NUMBER) | (1L << NOT) | (1L << TRUE) | (1L << FALSE) | (1L << NAME) | (1L << ELLIPSIS) | (1L << OPEN_PAREN) | (1L << OPEN_BRACK) | (1L << ADD) | (1L << MINUS) | (1L << NOT_OP) | (1L << OPEN_BRACE))) != 0)) {
				{
				setState(721);
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_exprlist; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterExprlist(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitExprlist(this);
		}
	}

	public ExprlistContext exprlist() {
		ExprlistContext _localctx = new ExprlistContext(ctx_, getState());
		enterRule(_localctx, 114, RULE_exprlist);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(724);
			expr();
			}
			setState(729);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,101, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(725);
					match(COMMA);
					{
					setState(726);
					expr();
					}
					}
					} 
				}
				setState(731);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,101, ctx_);
			}
			setState(733);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==COMMA) {
				{
				setState(732);
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_testlist; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterTestlist(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitTestlist(this);
		}
	}

	public TestlistContext testlist() {
		TestlistContext _localctx = new TestlistContext(ctx_, getState());
		enterRule(_localctx, 116, RULE_testlist);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(735);
			test();
			setState(740);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,103, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(736);
					match(COMMA);
					setState(737);
					test();
					}
					} 
				}
				setState(742);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,103, ctx_);
			}
			setState(744);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==COMMA) {
				{
				setState(743);
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
		public ExprContext[] expr() {
			return getRuleContexts!ExprContext;
		}
		public ExprContext expr(int i) {
			return getRuleContext!ExprContext(i);
		}
		public Comp_forContext comp_for() {
			return getRuleContext!Comp_forContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_dictorsetmaker; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterDictorsetmaker(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitDictorsetmaker(this);
		}
	}

	public DictorsetmakerContext dictorsetmaker() {
		DictorsetmakerContext _localctx = new DictorsetmakerContext(ctx_, getState());
		enterRule(_localctx, 118, RULE_dictorsetmaker);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(788);
			_errHandler.sync(this);
			switch ( getInterpreter.adaptivePredict(_input,113, ctx_) ) {
			case 1:
				{
				{
				setState(752);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case T__3:
				case STRING:
				case NUMBER:
				case NOT:
				case TRUE:
				case FALSE:
				case NAME:
				case ELLIPSIS:
				case OPEN_PAREN:
				case OPEN_BRACK:
				case ADD:
				case MINUS:
				case NOT_OP:
				case OPEN_BRACE:
					{
					setState(746);
					test();
					setState(747);
					match(COLON);
					setState(748);
					test();
					}
					break;
				case POWER:
					{
					setState(750);
					match(POWER);
					setState(751);
					expr();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(772);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case FOR:
					{
					setState(754);
					comp_for();
					}
					break;
				case COMMA:
				case CLOSE_BRACE:
					{
					setState(766);
					_errHandler.sync(this);
					_alt = getInterpreter.adaptivePredict(_input,107, ctx_);
					while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
						if ( _alt==1 ) {
							{
							{
							setState(755);
							match(COMMA);
							setState(762);
							_errHandler.sync(this);
							switch (_input.LA(1)) {
							case T__3:
							case STRING:
							case NUMBER:
							case NOT:
							case TRUE:
							case FALSE:
							case NAME:
							case ELLIPSIS:
							case OPEN_PAREN:
							case OPEN_BRACK:
							case ADD:
							case MINUS:
							case NOT_OP:
							case OPEN_BRACE:
								{
								setState(756);
								test();
								setState(757);
								match(COLON);
								setState(758);
								test();
								}
								break;
							case POWER:
								{
								setState(760);
								match(POWER);
								setState(761);
								expr();
								}
								break;
							default:
								throw new NoViableAltException(this);
							}
							}
							} 
						}
						setState(768);
						_errHandler.sync(this);
						_alt = getInterpreter.adaptivePredict(_input,107, ctx_);
					}
					setState(770);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==COMMA) {
						{
						setState(769);
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
				break;
			case 2:
				{
				{
				{
				setState(774);
				test();
				}
				setState(786);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case FOR:
					{
					setState(775);
					comp_for();
					}
					break;
				case COMMA:
				case CLOSE_BRACE:
					{
					setState(780);
					_errHandler.sync(this);
					_alt = getInterpreter.adaptivePredict(_input,110, ctx_);
					while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
						if ( _alt==1 ) {
							{
							{
							setState(776);
							match(COMMA);
							{
							setState(777);
							test();
							}
							}
							} 
						}
						setState(782);
						_errHandler.sync(this);
						_alt = getInterpreter.adaptivePredict(_input,110, ctx_);
					}
					setState(784);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==COMMA) {
						{
						setState(783);
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
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_arglist; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterArglist(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitArglist(this);
		}
	}

	public ArglistContext arglist() {
		ArglistContext _localctx = new ArglistContext(ctx_, getState());
		enterRule(_localctx, 120, RULE_arglist);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(790);
			argument();
			setState(795);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,114, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(791);
					match(COMMA);
					setState(792);
					argument();
					}
					} 
				}
				setState(797);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,114, ctx_);
			}
			setState(799);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==COMMA) {
				{
				setState(798);
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
		public TestContext[] test() {
			return getRuleContexts!TestContext;
		}
		public TestContext test(int i) {
			return getRuleContext!TestContext(i);
		}
		public Comp_forContext comp_for() {
			return getRuleContext!Comp_forContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_argument; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterArgument(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitArgument(this);
		}
	}

	public ArgumentContext argument() {
		ArgumentContext _localctx = new ArgumentContext(ctx_, getState());
		enterRule(_localctx, 122, RULE_argument);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(813);
			_errHandler.sync(this);
			switch ( getInterpreter.adaptivePredict(_input,117, ctx_) ) {
			case 1:
				{
				setState(801);
				test();
				setState(803);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==FOR) {
					{
					setState(802);
					comp_for();
					}
				}

				}
				break;
			case 2:
				{
				setState(805);
				test();
				setState(806);
				match(ASSIGN);
				setState(807);
				test();
				}
				break;
			case 3:
				{
				setState(809);
				match(POWER);
				setState(810);
				test();
				}
				break;
			case 4:
				{
				setState(811);
				match(STAR);
				setState(812);
				test();
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

	public static class Comp_iterContext : ParserRuleContext {
		public Comp_forContext comp_for() {
			return getRuleContext!Comp_forContext(0);
		}
		public Comp_ifContext comp_if() {
			return getRuleContext!Comp_ifContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_comp_iter; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterComp_iter(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitComp_iter(this);
		}
	}

	public Comp_iterContext comp_iter() {
		Comp_iterContext _localctx = new Comp_iterContext(ctx_, getState());
		enterRule(_localctx, 124, RULE_comp_iter);
		try {
			setState(817);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case FOR:
				enterOuterAlt(_localctx, 1);
				{
				setState(815);
				comp_for();
				}
				break;
			case IF:
				enterOuterAlt(_localctx, 2);
				{
				setState(816);
				comp_if();
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

	public static class Comp_forContext : ParserRuleContext {
		public ExprlistContext exprlist() {
			return getRuleContext!ExprlistContext(0);
		}
		public Or_testContext or_test() {
			return getRuleContext!Or_testContext(0);
		}
		public Comp_iterContext comp_iter() {
			return getRuleContext!Comp_iterContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_comp_for; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterComp_for(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitComp_for(this);
		}
	}

	public Comp_forContext comp_for() {
		Comp_forContext _localctx = new Comp_forContext(ctx_, getState());
		enterRule(_localctx, 126, RULE_comp_for);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(819);
			match(FOR);
			setState(820);
			exprlist();
			setState(821);
			match(T__0);
			setState(822);
			or_test();
			setState(824);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==IF || _la==FOR) {
				{
				setState(823);
				comp_iter();
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

	public static class Comp_ifContext : ParserRuleContext {
		public Test_nocondContext test_nocond() {
			return getRuleContext!Test_nocondContext(0);
		}
		public Comp_iterContext comp_iter() {
			return getRuleContext!Comp_iterContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_comp_if; }
		import RuleTranslatorListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).enterComp_if(this);
		}
		import RuleTranslatorListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == RuleTranslatorListener.RuleTranslatorListener.classinfo) (cast(RuleTranslatorListener)listener).exitComp_if(this);
		}
	}

	public Comp_ifContext comp_if() {
		Comp_ifContext _localctx = new Comp_ifContext(ctx_, getState());
		enterRule(_localctx, 128, RULE_comp_if);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(826);
			match(IF);
			setState(827);
			test_nocond();
			setState(829);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==IF || _la==FOR) {
				{
				setState(828);
				comp_iter();
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

	public static immutable wstring _serializedATN =
		"\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x03U\u0342\x04\x02"~
		"\t\x02\x04\x03\t\x03\x04\x04\t\x04\x04\x05\t\x05\x04\x06\t\x06\x04\x07"~
		"\t\x07\x04\b\t\b\x04\t\t\t\x04\n\t\n\x04\x0b\t\x0b\x04\f\t\f\x04\r\t\r"~
		"\x04\x0e\t\x0e\x04\x0f\t\x0f\x04\x10\t\x10\x04\x11\t\x11\x04\x12\t\x12"~
		"\x04\x13\t\x13\x04\x14\t\x14\x04\x15\t\x15\x04\x16\t\x16\x04\x17\t\x17"~
		"\x04\x18\t\x18\x04\x19\t\x19\x04\x1a\t\x1a\x04\x1b\t\x1b\x04\x1c\t\x1c"~
		"\x04\x1d\t\x1d\x04\x1e\t\x1e\x04\x1f\t\x1f\x04 \t \x04!\t!\x04\"\t\"\x04"~
		"#\t#\x04$\t$\x04%\t%\x04&\t&\x04\'\t\'\x04(\t(\x04)\t)\x04*\t*\x04+\t"~
		"+\x04,\t,\x04-\t-\x04.\t.\x04/\t/\x040\t0\x041\t1\x042\t2\x043\t3\x04"~
		"4\t4\x045\t5\x046\t6\x047\t7\x048\t8\x049\t9\x04:\t:\x04;\t;\x04<\t<\x04"~
		"=\t=\x04>\t>\x04?\t?\x04@\t@\x04A\tA\x04B\tB\x03\x02\x03\x02\x03\x02\x03"~
		"\x02\x06\x02\u0089\n\x02\r\x02\x0e\x02\u008a\x03\x02\x03\x02\x03\x03\x07"~
		"\x03\u0090\n\x03\f\x03\x0e\x03\u0093\x0b\x03\x03\x03\x03\x03\x03\x03\x03"~
		"\x03\x03\x03\x03\x03\x03\x04\x03\x04\x03\x05\x03\x05\x03\x06\x03\x06\x03"~
		"\x07\x07\x07\u00a2\n\x07\f\x07\x0e\x07\u00a5\x0b\x07\x03\x07\x03\x07\x03"~
		"\x07\x03\x07\x03\x07\x03\b\x03\b\x03\t\x03\t\x03\t\x03\t\x03\t\x05\t\u00b3"~
		"\n\t\x03\t\x03\t\x03\t\x03\n\x03\n\x05\n\u00ba\n\n\x03\n\x03\n\x03\x0b"~
		"\x03\x0b\x03\x0b\x05\x0b\u00c1\n\x0b\x03\x0b\x03\x0b\x03\x0b\x03\x0b\x05"~
		"\x0b\u00c7\n\x0b\x07\x0b\u00c9\n\x0b\f\x0b\x0e\x0b\u00cc\x0b\x0b\x03\x0b"~
		"\x03\x0b\x03\x0b\x05\x0b\u00d1\n\x0b\x03\x0b\x03\x0b\x03\x0b\x03\x0b\x05"~
		"\x0b\u00d7\n\x0b\x07\x0b\u00d9\n\x0b\f\x0b\x0e\x0b\u00dc\x0b\x0b\x03\x0b"~
		"\x03\x0b\x03\x0b\x03\x0b\x05\x0b\u00e2\n\x0b\x05\x0b\u00e4\n\x0b\x05\x0b"~
		"\u00e6\n\x0b\x03\x0b\x03\x0b\x03\x0b\x05\x0b\u00eb\n\x0b\x05\x0b\u00ed"~
		"\n\x0b\x05\x0b\u00ef\n\x0b\x03\x0b\x03\x0b\x05\x0b\u00f3\n\x0b\x03\x0b"~
		"\x03\x0b\x03\x0b\x03\x0b\x05\x0b\u00f9\n\x0b\x07\x0b\u00fb\n\x0b\f\x0b"~
		"\x0e\x0b\u00fe\x0b\x0b\x03\x0b\x03\x0b\x03\x0b\x03\x0b\x05\x0b\u0104\n"~
		"\x0b\x05\x0b\u0106\n\x0b\x05\x0b\u0108\n\x0b\x03\x0b\x03\x0b\x03\x0b\x05"~
		"\x0b\u010d\n\x0b\x05\x0b\u010f\n\x0b\x03\f\x03\f\x03\f\x05\f\u0114\n\f"~
		"\x03\r\x03\r\x03\r\x05\r\u0119\n\r\x03\r\x03\r\x03\r\x03\r\x05\r\u011f"~
		"\n\r\x07\r\u0121\n\r\f\r\x0e\r\u0124\x0b\r\x03\r\x03\r\x03\r\x05\r\u0129"~
		"\n\r\x03\r\x03\r\x03\r\x03\r\x05\r\u012f\n\r\x07\r\u0131\n\r\f\r\x0e\r"~
		"\u0134\x0b\r\x03\r\x03\r\x03\r\x03\r\x05\r\u013a\n\r\x05\r\u013c\n\r\x05"~
		"\r\u013e\n\r\x03\r\x03\r\x03\r\x05\r\u0143\n\r\x05\r\u0145\n\r\x05\r\u0147"~
		"\n\r\x03\r\x03\r\x05\r\u014b\n\r\x03\r\x03\r\x03\r\x03\r\x05\r\u0151\n"~
		"\r\x07\r\u0153\n\r\f\r\x0e\r\u0156\x0b\r\x03\r\x03\r\x03\r\x03\r\x05\r"~
		"\u015c\n\r\x05\r\u015e\n\r\x05\r\u0160\n\r\x03\r\x03\r\x03\r\x05\r\u0165"~
		"\n\r\x05\r\u0167\n\r\x03\x0e\x03\x0e\x03\x0f\x03\x0f\x05\x0f\u016d\n\x0f"~
		"\x03\x10\x06\x10\u0170\n\x10\r\x10\x0e\x10\u0171\x03\x10\x03\x10\x03\x11"~
		"\x03\x11\x03\x11\x03\x11\x05\x11\u017a\n\x11\x03\x12\x03\x12\x03\x13\x03"~
		"\x13\x03\x13\x03\x14\x03\x14\x03\x14\x03\x14\x03\x14\x03\x14\x07\x14\u0187"~
		"\n\x14\f\x14\x0e\x14\u018a\x0b\x14\x05\x14\u018c\n\x14\x03\x15\x03\x15"~
		"\x03\x15\x03\x15\x05\x15\u0192\n\x15\x03\x16\x03\x16\x03\x16\x07\x16\u0197"~
		"\n\x16\f\x16\x0e\x16\u019a\x0b\x16\x03\x16\x05\x16\u019d\n\x16\x03\x17"~
		"\x03\x17\x03\x17\x05\x17\u01a2\n\x17\x03\x18\x03\x18\x03\x19\x03\x19\x03"~
		"\x1a\x03\x1a\x05\x1a\u01aa\n\x1a\x03\x1b\x03\x1b\x03\x1b\x05\x1b\u01af"~
		"\n\x1b\x03\x1c\x03\x1c\x03\x1c\x07\x1c\u01b4\n\x1c\f\x1c\x0e\x1c\u01b7"~
		"\x0b\x1c\x03\x1d\x03\x1d\x03\x1d\x07\x1d\u01bc\n\x1d\f\x1d\x0e\x1d\u01bf"~
		"\x0b\x1d\x03\x1e\x03\x1e\x03\x1e\x03\x1e\x03\x1e\x05\x1e\u01c6\n\x1e\x03"~
		"\x1f\x03\x1f\x03\x1f\x03\x1f\x03\x1f\x03\x1f\x03\x1f\x03\x1f\x03\x1f\x07"~
		"\x1f\u01d1\n\x1f\f\x1f\x0e\x1f\u01d4\x0b\x1f\x03\x1f\x03\x1f\x03\x1f\x05"~
		"\x1f\u01d9\n\x1f\x03 \x03 \x03 \x03 \x03 \x03 \x03 \x05 \u01e2\n \x03"~
		"!\x03!\x03!\x03!\x03!\x03!\x03!\x03!\x03!\x05!\u01ed\n!\x03\"\x03\"\x03"~
		"\"\x03\"\x07\"\u01f3\n\"\f\"\x0e\"\u01f6\x0b\"\x03\"\x03\"\x03\"\x03#"~
		"\x03#\x03#\x05#\u01fe\n#\x03$\x03$\x03$\x03$\x06$\u0204\n$\r$\x0e$\u0205"~
		"\x03$\x03$\x05$\u020a\n$\x03%\x03%\x03%\x03%\x03%\x03%\x05%\u0212\n%\x03"~
		"&\x03&\x03\'\x03\'\x03\'\x07\'\u0219\n\'\f\'\x0e\'\u021c\x0b\'\x03(\x03"~
		"(\x03(\x07(\u0221\n(\f(\x0e(\u0224\x0b(\x03)\x03)\x03)\x05)\u0229\n)\x03"~
		"*\x03*\x03*\x03*\x07*\u022f\n*\f*\x0e*\u0232\x0b*\x03+\x03+\x03+\x03+"~
		"\x03+\x03+\x03+\x03+\x03+\x03+\x03+\x03+\x03+\x05+\u0241\n+\x03,\x03,"~
		"\x03,\x07,\u0246\n,\f,\x0e,\u0249\x0b,\x03-\x03-\x03-\x07-\u024e\n-\f"~
		"-\x0e-\u0251\x0b-\x03.\x03.\x03.\x07.\u0256\n.\f.\x0e.\u0259\x0b.\x03"~
		"/\x03/\x03/\x07/\u025e\n/\f/\x0e/\u0261\x0b/\x030\x030\x030\x070\u0266"~
		"\n0\f0\x0e0\u0269\x0b0\x031\x031\x031\x071\u026e\n1\f1\x0e1\u0271\x0b"~
		"1\x032\x032\x032\x052\u0276\n2\x033\x033\x033\x053\u027b\n3\x034\x034"~
		"\x074\u027f\n4\f4\x0e4\u0282\x0b4\x035\x035\x055\u0286\n5\x035\x035\x03"~
		"5\x055\u028b\n5\x035\x035\x035\x055\u0290\n5\x035\x035\x035\x035\x065"~
		"\u0296\n5\r5\x0e5\u0297\x035\x035\x035\x035\x055\u029e\n5\x036\x036\x03"~
		"6\x036\x076\u02a4\n6\f6\x0e6\u02a7\x0b6\x036\x056\u02aa\n6\x056\u02ac"~
		"\n6\x037\x037\x057\u02b0\n7\x037\x037\x037\x037\x037\x037\x037\x057\u02b9"~
		"\n7\x038\x038\x038\x078\u02be\n8\f8\x0e8\u02c1\x0b8\x038\x058\u02c4\n"~
		"8\x039\x039\x059\u02c8\n9\x039\x039\x059\u02cc\n9\x039\x059\u02cf\n9\x05"~
		"9\u02d1\n9\x03:\x03:\x05:\u02d5\n:\x03;\x03;\x03;\x07;\u02da\n;\f;\x0e"~
		";\u02dd\x0b;\x03;\x05;\u02e0\n;\x03<\x03<\x03<\x07<\u02e5\n<\f<\x0e<\u02e8"~
		"\x0b<\x03<\x05<\u02eb\n<\x03=\x03=\x03=\x03=\x03=\x03=\x05=\u02f3\n=\x03"~
		"=\x03=\x03=\x03=\x03=\x03=\x03=\x03=\x05=\u02fd\n=\x07=\u02ff\n=\f=\x0e"~
		"=\u0302\x0b=\x03=\x05=\u0305\n=\x05=\u0307\n=\x03=\x03=\x03=\x03=\x07"~
		"=\u030d\n=\f=\x0e=\u0310\x0b=\x03=\x05=\u0313\n=\x05=\u0315\n=\x05=\u0317"~
		"\n=\x03>\x03>\x03>\x07>\u031c\n>\f>\x0e>\u031f\x0b>\x03>\x05>\u0322\n"~
		">\x03?\x03?\x05?\u0326\n?\x03?\x03?\x03?\x03?\x03?\x03?\x03?\x03?\x05"~
		"?\u0330\n?\x03@\x03@\x05@\u0334\n@\x03A\x03A\x03A\x03A\x03A\x05A\u033b"~
		"\nA\x03B\x03B\x03B\x05B\u0340\nB\x03B\x02\x02C\x02\x04\x06\b\n\f\x0e\x10"~
		"\x12\x14\x16\x18\x1a\x1c\x1e \"$&(*,.02468:<>@BDFHJLNPRTVXZ\\^`bdfhjl"~
		"nprtvxz|~\u0080\u0082\x02\x06\x03\x0223\x03\x0245\x05\x02%%68CC\x04\x02"~
		"4599\x02\u0397\x02\u0084\x03\x02\x02\x02\x04\u0091\x03\x02\x02\x02\x06"~
		"\u009a\x03\x02\x02\x02\b\u009c\x03\x02\x02\x02\n\u009e\x03\x02\x02\x02"~
		"\f\u00a3\x03\x02\x02\x02\x0e\u00ab\x03\x02\x02\x02\x10\u00ad\x03\x02\x02"~
		"\x02\x12\u00b7\x03\x02\x02\x02\x14\u010e\x03\x02\x02\x02\x16\u0110\x03"~
		"\x02\x02\x02\x18\u0166\x03\x02\x02\x02\x1a\u0168\x03\x02\x02\x02\x1c\u016c"~
		"\x03\x02\x02\x02\x1e\u016f\x03\x02\x02\x02 \u0179\x03\x02\x02\x02\"\u017b"~
		"\x03\x02\x02\x02$\u017d\x03\x02\x02\x02&\u0180\x03\x02\x02\x02(\u018d"~
		"\x03\x02\x02\x02*\u0193\x03\x02\x02\x02,\u01a1\x03\x02\x02\x02.\u01a3"~
		"\x03\x02\x02\x020\u01a5\x03\x02\x02\x022\u01a7\x03\x02\x02\x024\u01ab"~
		"\x03\x02\x02\x026\u01b0\x03\x02\x02\x028\u01b8\x03\x02\x02\x02:\u01c5"~
		"\x03\x02\x02\x02<\u01c7\x03\x02\x02\x02>\u01da\x03\x02\x02\x02@\u01e3"~
		"\x03\x02\x02\x02B\u01ee\x03\x02\x02\x02D\u01fa\x03\x02\x02\x02F\u0209"~
		"\x03\x02\x02\x02H\u020b\x03\x02\x02\x02J\u0213\x03\x02\x02\x02L\u0215"~
		"\x03\x02\x02\x02N\u021d\x03\x02\x02\x02P\u0228\x03\x02\x02\x02R\u022a"~
		"\x03\x02\x02\x02T\u0240\x03\x02\x02\x02V\u0242\x03\x02\x02\x02X\u024a"~
		"\x03\x02\x02\x02Z\u0252\x03\x02\x02\x02\\\u025a\x03\x02\x02\x02^\u0262"~
		"\x03\x02\x02\x02`\u026a\x03\x02\x02\x02b\u0275\x03\x02\x02\x02d\u0277"~
		"\x03\x02\x02\x02f\u027c\x03\x02\x02\x02h\u029d\x03\x02\x02\x02j\u029f"~
		"\x03\x02\x02\x02l\u02b8\x03\x02\x02\x02n\u02ba\x03\x02\x02\x02p\u02d0"~
		"\x03\x02\x02\x02r\u02d2\x03\x02\x02\x02t\u02d6\x03\x02\x02\x02v\u02e1"~
		"\x03\x02\x02\x02x\u0316\x03\x02\x02\x02z\u0318\x03\x02\x02\x02|\u032f"~
		"\x03\x02\x02\x02~\u0333\x03\x02\x02\x02\u0080\u0335\x03\x02\x02\x02\u0082"~
		"\u033c\x03\x02\x02\x02\u0084\u0085\x05\x04\x03\x02\u0085\u0088\x05\f\x07"~
		"\x02\u0086\u0089\x07\x1b\x02\x02\u0087\u0089\x05\x1c\x0f\x02\u0088\u0086"~
		"\x03\x02\x02\x02\u0088\u0087\x03\x02\x02\x02\u0089\u008a\x03\x02\x02\x02"~
		"\u008a\u0088\x03\x02\x02\x02\u008a\u008b\x03\x02\x02\x02\u008b\u008c\x03"~
		"\x02\x02\x02\u008c\u008d\x07\x02\x02\x03\u008d\x03\x03\x02\x02\x02\u008e"~
		"\u0090\x07\x1b\x02\x02\u008f\u008e\x03\x02\x02\x02\u0090\u0093\x03\x02"~
		"\x02\x02\u0091\u008f\x03\x02\x02\x02\u0091\u0092\x03\x02\x02\x02\u0092"~
		"\u0094\x03\x02\x02\x02\u0093\u0091\x03\x02\x02\x02\u0094\u0095\x07\n\x02"~
		"\x02\u0095\u0096\x05\x06\x04\x02\u0096\u0097\x07\x0e\x02\x02\u0097\u0098"~
		"\x05\b\x05\x02\u0098\u0099\x05\n\x06\x02\u0099\x05\x03\x02\x02\x02\u009a"~
		"\u009b\x07\x1c\x02\x02\u009b\x07\x03\x02\x02\x02\u009c\u009d\x07\x1c\x02"~
		"\x02\u009d\t\x03\x02\x02\x02\u009e\u009f\x07\x1c\x02\x02\u009f\x0b\x03"~
		"\x02\x02\x02\u00a0\u00a2\x07\x1b\x02\x02\u00a1\u00a0\x03\x02\x02\x02\u00a2"~
		"\u00a5\x03\x02\x02\x02\u00a3\u00a1\x03\x02\x02\x02\u00a3\u00a4\x03\x02"~
		"\x02\x02\u00a4\u00a6\x03\x02\x02\x02\u00a5\u00a3\x03\x02\x02\x02\u00a6"~
		"\u00a7\x07\x0b\x02\x02\u00a7\u00a8\x05\n\x06\x02\u00a8\u00a9\x07#\x02"~
		"\x02\u00a9\u00aa\x05\x0e\b\x02\u00aa\r\x03\x02\x02\x02\u00ab\u00ac\x07"~
		"\x1c\x02\x02\u00ac\x0f\x03\x02\x02\x02\u00ad\u00ae\x07\f\x02\x02\u00ae"~
		"\u00af\x07\x1c\x02\x02\u00af\u00b2\x05\x12\n\x02\u00b0\u00b1\x07D\x02"~
		"\x02\u00b1\u00b3\x05H%\x02\u00b2\u00b0\x03\x02\x02\x02\u00b2\u00b3\x03"~
		"\x02\x02\x02\u00b3\u00b4\x03\x02\x02\x02\u00b4\u00b5\x07)\x02\x02\u00b5"~
		"\u00b6\x05F$\x02\u00b6\x11\x03\x02\x02\x02\u00b7\u00b9\x07&\x02\x02\u00b8"~
		"\u00ba\x05\x14\x0b\x02\u00b9\u00b8\x03\x02\x02\x02\u00b9\u00ba\x03\x02"~
		"\x02\x02\u00ba\u00bb\x03\x02\x02\x02\u00bb\u00bc\x07\'\x02\x02\u00bc\x13"~
		"\x03\x02\x02\x02\u00bd\u00c0\x05\x16\f\x02\u00be\u00bf\x07,\x02\x02\u00bf"~
		"\u00c1\x05H%\x02\u00c0\u00be\x03\x02\x02\x02\u00c0\u00c1\x03\x02\x02\x02"~
		"\u00c1\u00ca\x03\x02\x02\x02\u00c2\u00c3\x07(\x02\x02\u00c3\u00c6\x05"~
		"\x16\f\x02\u00c4\u00c5\x07,\x02\x02\u00c5\u00c7\x05H%\x02\u00c6\u00c4"~
		"\x03\x02\x02\x02\u00c6\u00c7\x03\x02\x02\x02\u00c7\u00c9\x03\x02\x02\x02"~
		"\u00c8\u00c2\x03\x02\x02\x02\u00c9\u00cc\x03\x02\x02\x02\u00ca\u00c8\x03"~
		"\x02\x02\x02\u00ca\u00cb\x03\x02\x02\x02\u00cb\u00ee\x03\x02\x02\x02\u00cc"~
		"\u00ca\x03\x02\x02\x02\u00cd\u00ec\x07(\x02\x02\u00ce\u00d0\x07%\x02\x02"~
		"\u00cf\u00d1\x05\x16\f\x02\u00d0\u00cf\x03\x02\x02\x02\u00d0\u00d1\x03"~
		"\x02\x02\x02\u00d1\u00da\x03\x02\x02\x02\u00d2\u00d3\x07(\x02\x02\u00d3"~
		"\u00d6\x05\x16\f\x02\u00d4\u00d5\x07,\x02\x02\u00d5\u00d7\x05H%\x02\u00d6"~
		"\u00d4\x03\x02\x02\x02\u00d6\u00d7\x03\x02\x02\x02\u00d7\u00d9\x03\x02"~
		"\x02\x02\u00d8\u00d2\x03\x02\x02\x02\u00d9\u00dc\x03\x02\x02\x02\u00da"~
		"\u00d8\x03\x02\x02\x02\u00da\u00db\x03\x02\x02\x02\u00db\u00e5\x03\x02"~
		"\x02\x02\u00dc\u00da\x03\x02\x02\x02\u00dd\u00e3\x07(\x02\x02\u00de\u00df"~
		"\x07+\x02\x02\u00df\u00e1\x05\x16\f\x02\u00e0\u00e2\x07(\x02\x02\u00e1"~
		"\u00e0\x03\x02\x02\x02\u00e1\u00e2\x03\x02\x02\x02\u00e2\u00e4\x03\x02"~
		"\x02\x02\u00e3\u00de\x03\x02\x02\x02\u00e3\u00e4\x03\x02\x02\x02\u00e4"~
		"\u00e6\x03\x02\x02\x02\u00e5\u00dd\x03\x02\x02\x02\u00e5\u00e6\x03\x02"~
		"\x02\x02\u00e6\u00ed\x03\x02\x02\x02\u00e7\u00e8\x07+\x02\x02\u00e8\u00ea"~
		"\x05\x16\f\x02\u00e9\u00eb\x07(\x02\x02\u00ea\u00e9\x03\x02\x02\x02\u00ea"~
		"\u00eb\x03\x02\x02\x02\u00eb\u00ed\x03\x02\x02\x02\u00ec\u00ce\x03\x02"~
		"\x02\x02\u00ec\u00e7\x03\x02\x02\x02\u00ec\u00ed\x03\x02\x02\x02\u00ed"~
		"\u00ef\x03\x02\x02\x02\u00ee\u00cd\x03\x02\x02\x02\u00ee\u00ef\x03\x02"~
		"\x02\x02\u00ef\u010f\x03\x02\x02\x02\u00f0\u00f2\x07%\x02\x02\u00f1\u00f3"~
		"\x05\x16\f\x02\u00f2\u00f1\x03\x02\x02\x02\u00f2\u00f3\x03\x02\x02\x02"~
		"\u00f3\u00fc\x03\x02\x02\x02\u00f4\u00f5\x07(\x02\x02\u00f5\u00f8\x05"~
		"\x16\f\x02\u00f6\u00f7\x07,\x02\x02\u00f7\u00f9\x05H%\x02\u00f8\u00f6"~
		"\x03\x02\x02\x02\u00f8\u00f9\x03\x02\x02\x02\u00f9\u00fb\x03\x02\x02\x02"~
		"\u00fa\u00f4\x03\x02\x02\x02\u00fb\u00fe\x03\x02\x02\x02\u00fc\u00fa\x03"~
		"\x02\x02\x02\u00fc\u00fd\x03\x02\x02\x02\u00fd\u0107\x03\x02\x02\x02\u00fe"~
		"\u00fc\x03\x02\x02\x02\u00ff\u0105\x07(\x02\x02\u0100\u0101\x07+\x02\x02"~
		"\u0101\u0103\x05\x16\f\x02\u0102\u0104\x07(\x02\x02\u0103\u0102\x03\x02"~
		"\x02\x02\u0103\u0104\x03\x02\x02\x02\u0104\u0106\x03\x02\x02\x02\u0105"~
		"\u0100\x03\x02\x02\x02\u0105\u0106\x03\x02\x02\x02\u0106\u0108\x03\x02"~
		"\x02\x02\u0107\u00ff\x03\x02\x02\x02\u0107\u0108\x03\x02\x02\x02\u0108"~
		"\u010f\x03\x02\x02\x02\u0109\u010a\x07+\x02\x02\u010a\u010c\x05\x16\f"~
		"\x02\u010b\u010d\x07(\x02\x02\u010c\u010b\x03\x02\x02\x02\u010c\u010d"~
		"\x03\x02\x02\x02\u010d\u010f\x03\x02\x02\x02\u010e\u00bd\x03\x02\x02\x02"~
		"\u010e\u00f0\x03\x02\x02\x02\u010e\u0109\x03\x02\x02\x02\u010f\x15\x03"~
		"\x02\x02\x02\u0110\u0113\x07\x1c\x02\x02\u0111\u0112\x07)\x02\x02\u0112"~
		"\u0114\x05H%\x02\u0113\u0111\x03\x02\x02\x02\u0113\u0114\x03\x02\x02\x02"~
		"\u0114\x17\x03\x02\x02\x02\u0115\u0118\x05\x1a\x0e\x02\u0116\u0117\x07"~
		",\x02\x02\u0117\u0119\x05H%\x02\u0118\u0116\x03\x02\x02\x02\u0118\u0119"~
		"\x03\x02\x02\x02\u0119\u0122\x03\x02\x02\x02\u011a\u011b\x07(\x02\x02"~
		"\u011b\u011e\x05\x1a\x0e\x02\u011c\u011d\x07,\x02\x02\u011d\u011f\x05"~
		"H%\x02\u011e\u011c\x03\x02\x02\x02\u011e\u011f\x03\x02\x02\x02\u011f\u0121"~
		"\x03\x02\x02\x02\u0120\u011a\x03\x02\x02\x02\u0121\u0124\x03\x02\x02\x02"~
		"\u0122\u0120\x03\x02\x02\x02\u0122\u0123\x03\x02\x02\x02\u0123\u0146\x03"~
		"\x02\x02\x02\u0124\u0122\x03\x02\x02\x02\u0125\u0144\x07(\x02\x02\u0126"~
		"\u0128\x07%\x02\x02\u0127\u0129\x05\x1a\x0e\x02\u0128\u0127\x03\x02\x02"~
		"\x02\u0128\u0129\x03\x02\x02\x02\u0129\u0132\x03\x02\x02\x02\u012a\u012b"~
		"\x07(\x02\x02\u012b\u012e\x05\x1a\x0e\x02\u012c\u012d\x07,\x02\x02\u012d"~
		"\u012f\x05H%\x02\u012e\u012c\x03\x02\x02\x02\u012e\u012f\x03\x02\x02\x02"~
		"\u012f\u0131\x03\x02\x02\x02\u0130\u012a\x03\x02\x02\x02\u0131\u0134\x03"~
		"\x02\x02\x02\u0132\u0130\x03\x02\x02\x02\u0132\u0133\x03\x02\x02\x02\u0133"~
		"\u013d\x03\x02\x02\x02\u0134\u0132\x03\x02\x02\x02\u0135\u013b\x07(\x02"~
		"\x02\u0136\u0137\x07+\x02\x02\u0137\u0139\x05\x1a\x0e\x02\u0138\u013a"~
		"\x07(\x02\x02\u0139\u0138\x03\x02\x02\x02\u0139\u013a\x03\x02\x02\x02"~
		"\u013a\u013c\x03\x02\x02\x02\u013b\u0136\x03\x02\x02\x02\u013b\u013c\x03"~
		"\x02\x02\x02\u013c\u013e\x03\x02\x02\x02\u013d\u0135\x03\x02\x02\x02\u013d"~
		"\u013e\x03\x02\x02\x02\u013e\u0145\x03\x02\x02\x02\u013f\u0140\x07+\x02"~
		"\x02\u0140\u0142\x05\x1a\x0e\x02\u0141\u0143\x07(\x02\x02\u0142\u0141"~
		"\x03\x02\x02\x02\u0142\u0143\x03\x02\x02\x02\u0143\u0145\x03\x02\x02\x02"~
		"\u0144\u0126\x03\x02\x02\x02\u0144\u013f\x03\x02\x02\x02\u0144\u0145\x03"~
		"\x02\x02\x02\u0145\u0147\x03\x02\x02\x02\u0146\u0125\x03\x02\x02\x02\u0146"~
		"\u0147\x03\x02\x02\x02\u0147\u0167\x03\x02\x02\x02\u0148\u014a\x07%\x02"~
		"\x02\u0149\u014b\x05\x1a\x0e\x02\u014a\u0149\x03\x02\x02\x02\u014a\u014b"~
		"\x03\x02\x02\x02\u014b\u0154\x03\x02\x02\x02\u014c\u014d\x07(\x02\x02"~
		"\u014d\u0150\x05\x1a\x0e\x02\u014e\u014f\x07,\x02\x02\u014f\u0151\x05"~
		"H%\x02\u0150\u014e\x03\x02\x02\x02\u0150\u0151\x03\x02\x02\x02\u0151\u0153"~
		"\x03\x02\x02\x02\u0152\u014c\x03\x02\x02\x02\u0153\u0156\x03\x02\x02\x02"~
		"\u0154\u0152\x03\x02\x02\x02\u0154\u0155\x03\x02\x02\x02\u0155\u015f\x03"~
		"\x02\x02\x02\u0156\u0154\x03\x02\x02\x02\u0157\u015d\x07(\x02\x02\u0158"~
		"\u0159\x07+\x02\x02\u0159\u015b\x05\x1a\x0e\x02\u015a\u015c\x07(\x02\x02"~
		"\u015b\u015a\x03\x02\x02\x02\u015b\u015c\x03\x02\x02\x02\u015c\u015e\x03"~
		"\x02\x02\x02\u015d\u0158\x03\x02\x02\x02\u015d\u015e\x03\x02\x02\x02\u015e"~
		"\u0160\x03\x02\x02\x02\u015f\u0157\x03\x02\x02\x02\u015f\u0160\x03\x02"~
		"\x02\x02\u0160\u0167\x03\x02\x02\x02\u0161\u0162\x07+\x02\x02\u0162\u0164"~
		"\x05\x1a\x0e\x02\u0163\u0165\x07(\x02\x02\u0164\u0163\x03\x02\x02\x02"~
		"\u0164\u0165\x03\x02\x02\x02\u0165\u0167\x03\x02\x02\x02\u0166\u0115\x03"~
		"\x02\x02\x02\u0166\u0148\x03\x02\x02\x02\u0166\u0161\x03\x02\x02\x02\u0167"~
		"\x19\x03\x02\x02\x02\u0168\u0169\x07\x1c\x02\x02\u0169\x1b\x03\x02\x02"~
		"\x02\u016a\u016d\x05\x1e\x10\x02\u016b\u016d\x05:\x1e\x02\u016c\u016a"~
		"\x03\x02\x02\x02\u016c\u016b\x03\x02\x02\x02\u016d\x1d\x03\x02\x02\x02"~
		"\u016e\u0170\x05 \x11\x02\u016f\u016e\x03\x02\x02\x02\u0170\u0171\x03"~
		"\x02\x02\x02\u0171\u016f\x03\x02\x02\x02\u0171\u0172\x03\x02\x02\x02\u0172"~
		"\u0173\x03\x02\x02\x02\u0173\u0174\x07\x1b\x02\x02\u0174\x1f\x03\x02\x02"~
		"\x02\u0175\u017a\x05&\x14\x02\u0176\u017a\x05\"\x12\x02\u0177\u017a\x05"~
		"$\x13\x02\u0178\u017a\x05,\x17\x02\u0179\u0175\x03\x02\x02\x02\u0179\u0176"~
		"\x03\x02\x02\x02\u0179\u0177\x03\x02\x02\x02\u0179\u0178\x03\x02\x02\x02"~
		"\u017a!\x03\x02\x02\x02\u017b\u017c\x07\x07\x02\x02\u017c#\x03\x02\x02"~
		"\x02\u017d\u017e\x07\x1c\x02\x02\u017e\u017f\x05\x12\n\x02\u017f%\x03"~
		"\x02\x02\x02\u0180\u018b\x05*\x16\x02\u0181\u0182\x05(\x15\x02\u0182\u0183"~
		"\x05v<\x02\u0183\u018c\x03\x02\x02\x02\u0184\u0185\x07,\x02\x02\u0185"~
		"\u0187\x05*\x16\x02\u0186\u0184\x03\x02\x02\x02\u0187\u018a\x03\x02\x02"~
		"\x02\u0188\u0186\x03\x02\x02\x02\u0188\u0189\x03\x02\x02\x02\u0189\u018c"~
		"\x03\x02\x02\x02\u018a\u0188\x03\x02\x02\x02\u018b\u0181\x03\x02\x02\x02"~
		"\u018b\u0188\x03\x02\x02\x02\u018c\'\x03\x02\x02\x02\u018d\u018e\x07)"~
		"\x02\x02\u018e\u0191\x05H%\x02\u018f\u0190\x07,\x02\x02\u0190\u0192\x05"~
		"H%\x02\u0191\u018f\x03\x02\x02\x02\u0191\u0192\x03\x02\x02\x02\u0192)"~
		"\x03\x02\x02\x02\u0193\u0198\x05H%\x02\u0194\u0195\x07(\x02\x02\u0195"~
		"\u0197\x05H%\x02\u0196\u0194\x03\x02\x02\x02\u0197\u019a\x03\x02\x02\x02"~
		"\u0198\u0196\x03\x02\x02\x02\u0198\u0199\x03\x02\x02\x02\u0199\u019c\x03"~
		"\x02\x02\x02\u019a\u0198\x03\x02\x02\x02\u019b\u019d\x07(\x02\x02\u019c"~
		"\u019b\x03\x02\x02\x02\u019c\u019d\x03\x02\x02\x02\u019d+\x03\x02\x02"~
		"\x02\u019e\u01a2\x05.\x18\x02\u019f\u01a2\x050\x19\x02\u01a0\u01a2\x05"~
		"2\x1a\x02\u01a1\u019e\x03\x02\x02\x02\u01a1\u019f\x03\x02\x02\x02\u01a1"~
		"\u01a0\x03\x02\x02\x02\u01a2-\x03\x02\x02\x02\u01a3\u01a4\x07\x1a\x02"~
		"\x02\u01a4/\x03\x02\x02\x02\u01a5\u01a6\x07\x19\x02\x02\u01a61\x03\x02"~
		"\x02\x02\u01a7\u01a9\x07\r\x02\x02\u01a8\u01aa\x05v<\x02\u01a9\u01a8\x03"~
		"\x02\x02\x02\u01a9\u01aa\x03\x02\x02\x02\u01aa3\x03\x02\x02\x02\u01ab"~
		"\u01ae\x058\x1d\x02\u01ac\u01ad\x07\x0e\x02\x02\u01ad\u01af\x07\x1c\x02"~
		"\x02\u01ae\u01ac\x03\x02\x02\x02\u01ae\u01af\x03\x02\x02\x02\u01af5\x03"~
		"\x02\x02\x02\u01b0\u01b5\x054\x1b\x02\u01b1\u01b2\x07(\x02\x02\u01b2\u01b4"~
		"\x054\x1b\x02\u01b3\u01b1\x03\x02\x02\x02\u01b4\u01b7\x03\x02\x02\x02"~
		"\u01b5\u01b3\x03\x02\x02\x02\u01b5\u01b6\x03\x02\x02\x02\u01b67\x03\x02"~
		"\x02\x02\u01b7\u01b5\x03\x02\x02\x02\u01b8\u01bd\x07\x1c\x02\x02\u01b9"~
		"\u01ba\x07#\x02\x02\u01ba\u01bc\x07\x1c\x02\x02\u01bb\u01b9\x03\x02\x02"~
		"\x02\u01bc\u01bf\x03\x02\x02\x02\u01bd\u01bb\x03\x02\x02\x02\u01bd\u01be"~
		"\x03\x02\x02\x02\u01be9\x03\x02\x02\x02\u01bf\u01bd\x03\x02\x02\x02\u01c0"~
		"\u01c6\x05<\x1f\x02\u01c1\u01c6\x05> \x02\u01c2\u01c6\x05@!\x02\u01c3"~
		"\u01c6\x05B\"\x02\u01c4\u01c6\x05\x10\t\x02\u01c5\u01c0\x03\x02\x02\x02"~
		"\u01c5\u01c1\x03\x02\x02\x02\u01c5\u01c2\x03\x02\x02\x02\u01c5\u01c3\x03"~
		"\x02\x02\x02\u01c5\u01c4\x03\x02\x02\x02\u01c6;\x03\x02\x02\x02\u01c7"~
		"\u01c8\x07\x0f\x02\x02\u01c8\u01c9\x05H%\x02\u01c9\u01ca\x07)\x02\x02"~
		"\u01ca\u01d2\x05F$\x02\u01cb\u01cc\x07\x10\x02\x02\u01cc\u01cd\x05H%\x02"~
		"\u01cd\u01ce\x07)\x02\x02\u01ce\u01cf\x05F$\x02\u01cf\u01d1\x03\x02\x02"~
		"\x02\u01d0\u01cb\x03\x02\x02\x02\u01d1\u01d4\x03\x02\x02\x02\u01d2\u01d0"~
		"\x03\x02\x02\x02\u01d2\u01d3\x03\x02\x02\x02\u01d3\u01d8\x03\x02\x02\x02"~
		"\u01d4\u01d2\x03\x02\x02\x02\u01d5\u01d6\x07\x11\x02\x02\u01d6\u01d7\x07"~
		")\x02\x02\u01d7\u01d9\x05F$\x02\u01d8\u01d5\x03\x02\x02\x02\u01d8\u01d9"~
		"\x03\x02\x02\x02\u01d9=\x03\x02\x02\x02\u01da\u01db\x07\x12\x02\x02\u01db"~
		"\u01dc\x05H%\x02\u01dc\u01dd\x07)\x02\x02\u01dd\u01e1\x05F$\x02\u01de"~
		"\u01df\x07\x11\x02\x02\u01df\u01e0\x07)\x02\x02\u01e0\u01e2\x05F$\x02"~
		"\u01e1\u01de\x03\x02\x02\x02\u01e1\u01e2\x03\x02\x02\x02\u01e2?\x03\x02"~
		"\x02\x02\u01e3\u01e4\x07\x13\x02\x02\u01e4\u01e5\x05t;\x02\u01e5\u01e6"~
		"\x07\x03\x02\x02\u01e6\u01e7\x05v<\x02\u01e7\u01e8\x07)\x02\x02\u01e8"~
		"\u01ec\x05F$\x02\u01e9\u01ea\x07\x11\x02\x02\u01ea\u01eb\x07)\x02\x02"~
		"\u01eb\u01ed\x05F$\x02\u01ec\u01e9\x03\x02\x02\x02\u01ec\u01ed\x03\x02"~
		"\x02\x02\u01edA\x03\x02\x02\x02\u01ee\u01ef\x07\x04\x02\x02\u01ef\u01f4"~
		"\x05D#\x02\u01f0\u01f1\x07(\x02\x02\u01f1\u01f3\x05D#\x02\u01f2\u01f0"~
		"\x03\x02\x02\x02\u01f3\u01f6\x03\x02\x02\x02\u01f4\u01f2\x03\x02\x02\x02"~
		"\u01f4\u01f5\x03\x02\x02\x02\u01f5\u01f7\x03\x02\x02\x02\u01f6\u01f4\x03"~
		"\x02\x02\x02\u01f7\u01f8\x07)\x02\x02\u01f8\u01f9\x05F$\x02\u01f9C\x03"~
		"\x02\x02\x02\u01fa\u01fd\x05H%\x02\u01fb\u01fc\x07\x0e\x02\x02\u01fc\u01fe"~
		"\x05V,\x02\u01fd\u01fb\x03\x02\x02\x02\u01fd\u01fe\x03\x02\x02\x02\u01fe"~
		"E\x03\x02\x02\x02\u01ff\u020a\x05\x1e\x10\x02\u0200\u0201\x07\x1b\x02"~
		"\x02\u0201\u0203\x07T\x02\x02\u0202\u0204\x05\x1c\x0f\x02\u0203\u0202"~
		"\x03\x02\x02\x02\u0204\u0205\x03\x02\x02\x02\u0205\u0203\x03\x02\x02\x02"~
		"\u0205\u0206\x03\x02\x02\x02\u0206\u0207\x03\x02\x02\x02\u0207\u0208\x07"~
		"U\x02\x02\u0208\u020a\x03\x02\x02\x02\u0209\u01ff\x03\x02\x02\x02\u0209"~
		"\u0200\x03\x02\x02\x02\u020aG\x03\x02\x02\x02\u020b\u0211\x05L\'\x02\u020c"~
		"\u020d\x07\x0f\x02\x02\u020d\u020e\x05L\'\x02\u020e\u020f\x07\x11\x02"~
		"\x02\u020f\u0210\x05H%\x02\u0210\u0212\x03\x02\x02\x02\u0211\u020c\x03"~
		"\x02\x02\x02\u0211\u0212\x03\x02\x02\x02\u0212I\x03\x02\x02\x02\u0213"~
		"\u0214\x05L\'\x02\u0214K\x03\x02\x02\x02\u0215\u021a\x05N(\x02\u0216\u0217"~
		"\x07\x14\x02\x02\u0217\u0219\x05N(\x02\u0218\u0216\x03\x02\x02\x02\u0219"~
		"\u021c\x03\x02\x02\x02\u021a\u0218\x03\x02\x02\x02\u021a\u021b\x03\x02"~
		"\x02\x02\u021bM\x03\x02\x02\x02\u021c\u021a\x03\x02\x02\x02\u021d\u0222"~
		"\x05P)\x02\u021e\u021f\x07\x15\x02\x02\u021f\u0221\x05P)\x02\u0220\u021e"~
		"\x03\x02\x02\x02\u0221\u0224\x03\x02\x02\x02\u0222\u0220\x03\x02\x02\x02"~
		"\u0222\u0223\x03\x02\x02\x02\u0223O\x03\x02\x02\x02\u0224\u0222\x03\x02"~
		"\x02\x02\u0225\u0226\x07\x16\x02\x02\u0226\u0229\x05P)\x02\u0227\u0229"~
		"\x05R*\x02\u0228\u0225\x03\x02\x02\x02\u0228\u0227\x03\x02\x02\x02\u0229"~
		"Q\x03\x02\x02\x02\u022a\u0230\x05V,\x02\u022b\u022c\x05T+\x02\u022c\u022d"~
		"\x05V,\x02\u022d\u022f\x03\x02\x02\x02\u022e\u022b\x03\x02\x02\x02\u022f"~
		"\u0232\x03\x02\x02\x02\u0230\u022e\x03\x02\x02\x02\u0230\u0231\x03\x02"~
		"\x02\x02\u0231S\x03\x02\x02\x02\u0232\u0230\x03\x02\x02\x02\u0233\u0241"~
		"\x07<\x02\x02\u0234\u0241\x07=\x02\x02\u0235\u0241\x07>\x02\x02\u0236"~
		"\u0241\x07?\x02\x02\u0237\u0241\x07@\x02\x02\u0238\u0241\x07A\x02\x02"~
		"\u0239\u0241\x07B\x02\x02\u023a\u0241\x07\x03\x02\x02\u023b\u023c\x07"~
		"\x16\x02\x02\u023c\u0241\x07\x03\x02\x02\u023d\u0241\x07\x05\x02\x02\u023e"~
		"\u023f\x07\x05\x02\x02\u023f\u0241\x07\x16\x02\x02\u0240\u0233\x03\x02"~
		"\x02\x02\u0240\u0234\x03\x02\x02\x02\u0240\u0235\x03\x02\x02\x02\u0240"~
		"\u0236\x03\x02\x02\x02\u0240\u0237\x03\x02\x02\x02\u0240\u0238\x03\x02"~
		"\x02\x02\u0240\u0239\x03\x02\x02\x02\u0240\u023a\x03\x02\x02\x02\u0240"~
		"\u023b\x03\x02\x02\x02\u0240\u023d\x03\x02\x02\x02\u0240\u023e\x03\x02"~
		"\x02\x02\u0241U\x03\x02\x02\x02\u0242\u0247\x05X-\x02\u0243\u0244\x07"~
		"/\x02\x02\u0244\u0246\x05X-\x02\u0245\u0243\x03\x02\x02\x02\u0246\u0249"~
		"\x03\x02\x02\x02\u0247\u0245\x03\x02\x02\x02\u0247\u0248\x03\x02\x02\x02"~
		"\u0248W\x03\x02\x02\x02\u0249\u0247\x03\x02\x02\x02\u024a\u024f\x05Z."~
		"\x02\u024b\u024c\x070\x02\x02\u024c\u024e\x05Z.\x02\u024d\u024b\x03\x02"~
		"\x02\x02\u024e\u0251\x03\x02\x02\x02\u024f\u024d\x03\x02\x02\x02\u024f"~
		"\u0250\x03\x02\x02\x02\u0250Y\x03\x02\x02\x02\u0251\u024f\x03\x02\x02"~
		"\x02\u0252\u0257\x05\\/\x02\u0253\u0254\x071\x02\x02\u0254\u0256\x05\\"~
		"/\x02\u0255\u0253\x03\x02\x02\x02\u0256\u0259\x03\x02\x02\x02\u0257\u0255"~
		"\x03\x02\x02\x02\u0257\u0258\x03\x02\x02\x02\u0258[\x03\x02\x02\x02\u0259"~
		"\u0257\x03\x02\x02\x02\u025a\u025f\x05^0\x02\u025b\u025c\t\x02\x02\x02"~
		"\u025c\u025e\x05^0\x02\u025d\u025b\x03\x02\x02\x02\u025e\u0261\x03\x02"~
		"\x02\x02\u025f\u025d\x03\x02\x02\x02\u025f\u0260\x03\x02\x02\x02\u0260"~
		"]\x03\x02\x02\x02\u0261\u025f\x03\x02\x02\x02\u0262\u0267\x05`1\x02\u0263"~
		"\u0264\t\x03\x02\x02\u0264\u0266\x05`1\x02\u0265\u0263\x03\x02\x02\x02"~
		"\u0266\u0269\x03\x02\x02\x02\u0267\u0265\x03\x02\x02\x02\u0267\u0268\x03"~
		"\x02\x02\x02\u0268_\x03\x02\x02\x02\u0269\u0267\x03\x02\x02\x02\u026a"~
		"\u026f\x05b2\x02\u026b\u026c\t\x04\x02\x02\u026c\u026e\x05b2\x02\u026d"~
		"\u026b\x03\x02\x02\x02\u026e\u0271\x03\x02\x02\x02\u026f\u026d\x03\x02"~
		"\x02\x02\u026f\u0270\x03\x02\x02\x02\u0270a\x03\x02\x02\x02\u0271\u026f"~
		"\x03\x02\x02\x02\u0272\u0273\t\x05\x02\x02\u0273\u0276\x05b2\x02\u0274"~
		"\u0276\x05d3\x02\u0275\u0272\x03\x02\x02\x02\u0275\u0274\x03\x02\x02\x02"~
		"\u0276c\x03\x02\x02\x02\u0277\u027a\x05f4\x02\u0278\u0279\x07+\x02\x02"~
		"\u0279\u027b\x05b2\x02\u027a\u0278\x03\x02\x02\x02\u027a\u027b\x03\x02"~
		"\x02\x02\u027be\x03\x02\x02\x02\u027c\u0280\x05h5\x02\u027d\u027f\x05"~
		"l7\x02\u027e\u027d\x03\x02\x02\x02\u027f\u0282\x03\x02\x02\x02\u0280\u027e"~
		"\x03\x02\x02\x02\u0280\u0281\x03\x02\x02\x02\u0281g\x03\x02\x02\x02\u0282"~
		"\u0280\x03\x02\x02\x02\u0283\u0285\x07&\x02\x02\u0284\u0286\x05j6\x02"~
		"\u0285\u0284\x03\x02\x02\x02\u0285\u0286\x03\x02\x02\x02\u0286\u0287\x03"~
		"\x02\x02\x02\u0287\u029e\x07\'\x02\x02\u0288\u028a\x07-\x02\x02\u0289"~
		"\u028b\x05j6\x02\u028a\u0289\x03\x02\x02\x02\u028a\u028b\x03\x02\x02\x02"~
		"\u028b\u028c\x03\x02\x02\x02\u028c\u029e\x07.\x02\x02\u028d\u028f\x07"~
		":\x02\x02\u028e\u0290\x05x=\x02\u028f\u028e\x03\x02\x02\x02\u028f\u0290"~
		"\x03\x02\x02\x02\u0290\u0291\x03\x02\x02\x02\u0291\u029e\x07;\x02\x02"~
		"\u0292\u029e\x07\x1c\x02\x02\u0293\u029e\x07\b\x02\x02\u0294\u0296\x07"~
		"\x07\x02\x02\u0295\u0294\x03\x02\x02\x02\u0296\u0297\x03\x02\x02\x02\u0297"~
		"\u0295\x03\x02\x02\x02\u0297\u0298\x03\x02\x02\x02\u0298\u029e\x03\x02"~
		"\x02\x02\u0299\u029e\x07$\x02\x02\u029a\u029e\x07\x06\x02\x02\u029b\u029e"~
		"\x07\x17\x02\x02\u029c\u029e\x07\x18\x02\x02\u029d\u0283\x03\x02\x02\x02"~
		"\u029d\u0288\x03\x02\x02\x02\u029d\u028d\x03\x02\x02\x02\u029d\u0292\x03"~
		"\x02\x02\x02\u029d\u0293\x03\x02\x02\x02\u029d\u0295\x03\x02\x02\x02\u029d"~
		"\u0299\x03\x02\x02\x02\u029d\u029a\x03\x02\x02\x02\u029d\u029b\x03\x02"~
		"\x02\x02\u029d\u029c\x03\x02\x02\x02\u029ei\x03\x02\x02\x02\u029f\u02ab"~
		"\x05H%\x02\u02a0\u02ac\x05\u0080A\x02\u02a1\u02a2\x07(\x02\x02\u02a2\u02a4"~
		"\x05H%\x02\u02a3\u02a1\x03\x02\x02\x02\u02a4\u02a7\x03\x02\x02\x02\u02a5"~
		"\u02a3\x03\x02\x02\x02\u02a5\u02a6\x03\x02\x02\x02\u02a6\u02a9\x03\x02"~
		"\x02\x02\u02a7\u02a5\x03\x02\x02\x02\u02a8\u02aa\x07(\x02\x02\u02a9\u02a8"~
		"\x03\x02\x02\x02\u02a9\u02aa\x03\x02\x02\x02\u02aa\u02ac\x03\x02\x02\x02"~
		"\u02ab\u02a0\x03\x02\x02\x02\u02ab\u02a5\x03\x02\x02\x02\u02ack\x03\x02"~
		"\x02\x02\u02ad\u02af\x07&\x02\x02\u02ae\u02b0\x05z>\x02\u02af\u02ae\x03"~
		"\x02\x02\x02\u02af\u02b0\x03\x02\x02\x02\u02b0\u02b1\x03\x02\x02\x02\u02b1"~
		"\u02b9\x07\'\x02\x02\u02b2\u02b3\x07-\x02\x02\u02b3\u02b4\x05n8\x02\u02b4"~
		"\u02b5\x07.\x02\x02\u02b5\u02b9\x03\x02\x02\x02\u02b6\u02b7\x07#\x02\x02"~
		"\u02b7\u02b9\x07\x1c\x02\x02\u02b8\u02ad\x03\x02\x02\x02\u02b8\u02b2\x03"~
		"\x02\x02\x02\u02b8\u02b6\x03\x02\x02\x02\u02b9m\x03\x02\x02\x02\u02ba"~
		"\u02bf\x05p9\x02\u02bb\u02bc\x07(\x02\x02\u02bc\u02be\x05p9\x02\u02bd"~
		"\u02bb\x03\x02\x02\x02\u02be\u02c1\x03\x02\x02\x02\u02bf\u02bd\x03\x02"~
		"\x02\x02\u02bf\u02c0\x03\x02\x02\x02\u02c0\u02c3\x03\x02\x02\x02\u02c1"~
		"\u02bf\x03\x02\x02\x02\u02c2\u02c4\x07(\x02\x02\u02c3\u02c2\x03\x02\x02"~
		"\x02\u02c3\u02c4\x03\x02\x02\x02\u02c4o\x03\x02\x02\x02\u02c5\u02d1\x05"~
		"H%\x02\u02c6\u02c8\x05H%\x02\u02c7\u02c6\x03\x02\x02\x02\u02c7\u02c8\x03"~
		"\x02\x02\x02\u02c8\u02c9\x03\x02\x02\x02\u02c9\u02cb\x07)\x02\x02\u02ca"~
		"\u02cc\x05H%\x02\u02cb\u02ca\x03\x02\x02\x02\u02cb\u02cc\x03\x02\x02\x02"~
		"\u02cc\u02ce\x03\x02\x02\x02\u02cd\u02cf\x05r:\x02\u02ce\u02cd\x03\x02"~
		"\x02\x02\u02ce\u02cf\x03\x02\x02\x02\u02cf\u02d1\x03\x02\x02\x02\u02d0"~
		"\u02c5\x03\x02\x02\x02\u02d0\u02c7\x03\x02\x02\x02\u02d1q\x03\x02\x02"~
		"\x02\u02d2\u02d4\x07)\x02\x02\u02d3\u02d5\x05H%\x02\u02d4\u02d3\x03\x02"~
		"\x02\x02\u02d4\u02d5\x03\x02\x02\x02\u02d5s\x03\x02\x02\x02\u02d6\u02db"~
		"\x05V,\x02\u02d7\u02d8\x07(\x02\x02\u02d8\u02da\x05V,\x02\u02d9\u02d7"~
		"\x03\x02\x02\x02\u02da\u02dd\x03\x02\x02\x02\u02db\u02d9\x03\x02\x02\x02"~
		"\u02db\u02dc\x03\x02\x02\x02\u02dc\u02df\x03\x02\x02\x02\u02dd\u02db\x03"~
		"\x02\x02\x02\u02de\u02e0\x07(\x02\x02\u02df\u02de\x03\x02\x02\x02\u02df"~
		"\u02e0\x03\x02\x02\x02\u02e0u\x03\x02\x02\x02\u02e1\u02e6\x05H%\x02\u02e2"~
		"\u02e3\x07(\x02\x02\u02e3\u02e5\x05H%\x02\u02e4\u02e2\x03\x02\x02\x02"~
		"\u02e5\u02e8\x03\x02\x02\x02\u02e6\u02e4\x03\x02\x02\x02\u02e6\u02e7\x03"~
		"\x02\x02\x02\u02e7\u02ea\x03\x02\x02\x02\u02e8\u02e6\x03\x02\x02\x02\u02e9"~
		"\u02eb\x07(\x02\x02\u02ea\u02e9\x03\x02\x02\x02\u02ea\u02eb\x03\x02\x02"~
		"\x02\u02ebw\x03\x02\x02\x02\u02ec\u02ed\x05H%\x02\u02ed\u02ee\x07)\x02"~
		"\x02\u02ee\u02ef\x05H%\x02\u02ef\u02f3\x03\x02\x02\x02\u02f0\u02f1\x07"~
		"+\x02\x02\u02f1\u02f3\x05V,\x02\u02f2\u02ec\x03\x02\x02\x02\u02f2\u02f0"~
		"\x03\x02\x02\x02\u02f3\u0306\x03\x02\x02\x02\u02f4\u0307\x05\u0080A\x02"~
		"\u02f5\u02fc\x07(\x02\x02\u02f6\u02f7\x05H%\x02\u02f7\u02f8\x07)\x02\x02"~
		"\u02f8\u02f9\x05H%\x02\u02f9\u02fd\x03\x02\x02\x02\u02fa\u02fb\x07+\x02"~
		"\x02\u02fb\u02fd\x05V,\x02\u02fc\u02f6\x03\x02\x02\x02\u02fc\u02fa\x03"~
		"\x02\x02\x02\u02fd\u02ff\x03\x02\x02\x02\u02fe\u02f5\x03\x02\x02\x02\u02ff"~
		"\u0302\x03\x02\x02\x02\u0300\u02fe\x03\x02\x02\x02\u0300\u0301\x03\x02"~
		"\x02\x02\u0301\u0304\x03\x02\x02\x02\u0302\u0300\x03\x02\x02\x02\u0303"~
		"\u0305\x07(\x02\x02\u0304\u0303\x03\x02\x02\x02\u0304\u0305\x03\x02\x02"~
		"\x02\u0305\u0307\x03\x02\x02\x02\u0306\u02f4\x03\x02\x02\x02\u0306\u0300"~
		"\x03\x02\x02\x02\u0307\u0317\x03\x02\x02\x02\u0308\u0314\x05H%\x02\u0309"~
		"\u0315\x05\u0080A\x02\u030a\u030b\x07(\x02\x02\u030b\u030d\x05H%\x02\u030c"~
		"\u030a\x03\x02\x02\x02\u030d\u0310\x03\x02\x02\x02\u030e\u030c\x03\x02"~
		"\x02\x02\u030e\u030f\x03\x02\x02\x02\u030f\u0312\x03\x02\x02\x02\u0310"~
		"\u030e\x03\x02\x02\x02\u0311\u0313\x07(\x02\x02\u0312\u0311\x03\x02\x02"~
		"\x02\u0312\u0313\x03\x02\x02\x02\u0313\u0315\x03\x02\x02\x02\u0314\u0309"~
		"\x03\x02\x02\x02\u0314\u030e\x03\x02\x02\x02\u0315\u0317\x03\x02\x02\x02"~
		"\u0316\u02f2\x03\x02\x02\x02\u0316\u0308\x03\x02\x02\x02\u0317y\x03\x02"~
		"\x02\x02\u0318\u031d\x05|?\x02\u0319\u031a\x07(\x02\x02\u031a\u031c\x05"~
		"|?\x02\u031b\u0319\x03\x02\x02\x02\u031c\u031f\x03\x02\x02\x02\u031d\u031b"~
		"\x03\x02\x02\x02\u031d\u031e\x03\x02\x02\x02\u031e\u0321\x03\x02\x02\x02"~
		"\u031f\u031d\x03\x02\x02\x02\u0320\u0322\x07(\x02\x02\u0321\u0320\x03"~
		"\x02\x02\x02\u0321\u0322\x03\x02\x02\x02\u0322{\x03\x02\x02\x02\u0323"~
		"\u0325\x05H%\x02\u0324\u0326\x05\u0080A\x02\u0325\u0324\x03\x02\x02\x02"~
		"\u0325\u0326\x03\x02\x02\x02\u0326\u0330\x03\x02\x02\x02\u0327\u0328\x05"~
		"H%\x02\u0328\u0329\x07,\x02\x02\u0329\u032a\x05H%\x02\u032a\u0330\x03"~
		"\x02\x02\x02\u032b\u032c\x07+\x02\x02\u032c\u0330\x05H%\x02\u032d\u032e"~
		"\x07%\x02\x02\u032e\u0330\x05H%\x02\u032f\u0323\x03\x02\x02\x02\u032f"~
		"\u0327\x03\x02\x02\x02\u032f\u032b\x03\x02\x02\x02\u032f\u032d\x03\x02"~
		"\x02\x02\u0330}\x03\x02\x02\x02\u0331\u0334\x05\u0080A\x02\u0332\u0334"~
		"\x05\u0082B\x02\u0333\u0331\x03\x02\x02\x02\u0333\u0332\x03\x02\x02\x02"~
		"\u0334\x7f\x03\x02\x02\x02\u0335\u0336\x07\x13\x02\x02\u0336\u0337\x05"~
		"t;\x02\u0337\u0338\x07\x03\x02\x02\u0338\u033a\x05L\'\x02\u0339\u033b"~
		"\x05~@\x02\u033a\u0339\x03\x02\x02\x02\u033a\u033b\x03\x02\x02\x02\u033b"~
		"\u0081\x03\x02\x02\x02\u033c\u033d\x07\x0f\x02\x02\u033d\u033f\x05J&\x02"~
		"\u033e\u0340\x05~@\x02\u033f\u033e\x03\x02\x02\x02\u033f\u0340\x03\x02"~
		"\x02\x02\u0340\u0083\x03\x02\x02\x02{\u0088\u008a\u0091\u00a3\u00b2\u00b9"~
		"\u00c0\u00c6\u00ca\u00d0\u00d6\u00da\u00e1\u00e3\u00e5\u00ea\u00ec\u00ee"~
		"\u00f2\u00f8\u00fc\u0103\u0105\u0107\u010c\u010e\u0113\u0118\u011e\u0122"~
		"\u0128\u012e\u0132\u0139\u013b\u013d\u0142\u0144\u0146\u014a\u0150\u0154"~
		"\u015b\u015d\u015f\u0164\u0166\u016c\u0171\u0179\u0188\u018b\u0191\u0198"~
		"\u019c\u01a1\u01a9\u01ae\u01b5\u01bd\u01c5\u01d2\u01d8\u01e1\u01ec\u01f4"~
		"\u01fd\u0205\u0209\u0211\u021a\u0222\u0228\u0230\u0240\u0247\u024f\u0257"~
		"\u025f\u0267\u026f\u0275\u027a\u0280\u0285\u028a\u028f\u0297\u029d\u02a5"~
		"\u02a9\u02ab\u02af\u02b8\u02bf\u02c3\u02c7\u02cb\u02ce\u02d0\u02d4\u02db"~
		"\u02df\u02e6\u02ea\u02f2\u02fc\u0300\u0304\u0306\u030e\u0312\u0314\u0316"~
		"\u031d\u0321\u0325\u032f\u0333\u033a\u033f";
	public static ATN _ATN;

	static this() {
	    auto atnDeserializer = new ATNDeserializer;
	    _ATN = atnDeserializer.deserialize(_serializedATN);
	    _decisionToDFA.length = 0;
	    for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
	        _decisionToDFA ~= new DFA(_ATN.getDecisionState(i), i);
	    }
	}
}
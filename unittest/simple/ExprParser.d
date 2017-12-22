// Generated from doc/examples/Expr.g4 by ANTLR 4.5.3
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.atn.InterfaceParserATNSimulator;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.RuntimeMetaData;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.Token;
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
            import std.stdio;
public class ExprParser : Parser {
	static this() { RuntimeMetaData.checkVersion("4.5.3", RuntimeMetaData.VERSION); }

	protected static DFA[] _decisionToDFA;
	protected PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static const int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, NEWLINE=7, INT=8;
	public static const int
		RULE_prog = 0, RULE_expr = 1;
	public static const string[] ruleNames = [
		"prog", "expr"
	];

	private static const string[] _LITERAL_NAMES = [
		null, "'*'", "'/'", "'+'", "'-'", "'('", "')'"
	];
	private static const string[] _SYMBOLIC_NAMES = [
		null, null, null, null, null, null, null, "NEWLINE", "INT"
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
	public string getGrammarFileName() { return "Expr.g4"; }

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
	public static class ProgContext : ParserRuleContext {
		public ExprContext[] expr() {
			return getRuleContexts!ExprContext;
		}
		public ExprContext expr(int i) {
			return getRuleContext!ExprContext(i);
		}
		public TerminalNode[] NEWLINE() { return getTokens(ExprParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(ExprParser.NEWLINE, i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_prog; }
		import ExprListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == ExprListener.ExprListener.classinfo) (cast(ExprListener)listener).enterProg(this);
		}
		import ExprListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == ExprListener.ExprListener.classinfo) (cast(ExprListener)listener).exitProg(this);
		}
	}

	public ProgContext prog() {

		ProgContext _localctx = new ProgContext(ctx_, getState());
		enterRule(_localctx, 0, RULE_prog);
		int _la;
                writefln("ProgContext start");
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(9);
                        writefln("ProgContext setState(9);");
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__4 || _la==INT) {
				{
				{
				setState(4);
				expr(0);
				setState(5);writefln("ProgContext setState(5);");
				match(NEWLINE);
				}
				}
				setState(11);setState(5);writefln("ProgContext setState(11);");
				_errHandler.sync(this);
				_la = _input.LA(1);setState(5);writefln("ProgContext setState(11); %s", _la);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
                    exitRule();writefln("ProgContext exitRule");
		}writefln("ProgContext returnRule _localctx =  %s(%s)",  _localctx.classinfo,  _localctx);
		return _localctx;
	}

	public static class ExprContext : ParserRuleContext {
		public TerminalNode INT() { return getToken(ExprParser.INT, 0); }
		public ExprContext[] expr() {
			return getRuleContexts!ExprContext;
		}
		public ExprContext expr(int i) {
			return getRuleContext!ExprContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_expr; }
		import ExprListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == ExprListener.ExprListener.classinfo) (cast(ExprListener)listener).enterExpr(this);
		}
		import ExprListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == ExprListener.ExprListener.classinfo) (cast(ExprListener)listener).exitExpr(this);
		}
	}

	public ExprContext expr() {
		return expr(0);
	}

	private ExprContext expr(int _p) {
		ParserRuleContext _parentctx = ctx_;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(ctx_, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 2;
		enterRecursionRule(_localctx, 2, RULE_expr, _p);
		int _la;
                writefln("ExprContext start");
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(18);
                        writefln("ExprContext setState(18);");
			switch (_input.LA(1)) {
			case INT:writefln("ExprContext INT");
				{
				setState(13);writefln("ExprContext setState(13);");
				match(INT);
				}
				break;
			case T__4:writefln("ExprContext T__4");
				{
				setState(14);writefln("ExprContext setState(14);");
				match(T__4);
				setState(15);writefln("ExprContext setState(15);");
				expr(0);
				setState(16);writefln("ExprContext setState(16);");
				match(T__5);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			ctx_.stop = _input.LT(-1);
			setState(28);
                        writefln("ExprContext setState(28);");
			_errHandler.sync(this);writefln("ExprContext setState(28); after sync");
			_alt = getInterpreter.adaptivePredict(_input,3, ctx_);writefln("ExprContext while alt = before while");
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {writefln("ExprContext while alt = %s", _alt);
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(26);writefln("ExprContext setState(26);");
					_errHandler.sync(this);
					switch ( getInterpreter.adaptivePredict(_input,2, ctx_) ) {
					case 1:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(20);
						if (!(precpred(ctx_, 4))) throw new FailedPredicateException(this, "precpred(ctx_, 4)");
						setState(21);
						_la = _input.LA(1);
						if ( !(_la==T__0 || _la==T__1) ) {
						_errHandler.recoverInline(this);
						} else {
							consume();
						}
						setState(22);
						expr(5);
						}
						break;
					case 2:
						{
						_localctx = new ExprContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(23);
						if (!(precpred(ctx_, 3))) throw new FailedPredicateException(this, "precpred(ctx_, 3)");
						setState(24);
						_la = _input.LA(1);
						if ( !(_la==T__2 || _la==T__3) ) {
						_errHandler.recoverInline(this);
						} else {
							consume();
						}
						setState(25);
						expr(4);
						}
						break;
					        default: assert(0);
					}
					} 
				}
				setState(30);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,3, ctx_);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
                        writefln("ExprContext unrollRecursionContexts;");
		}
		return _localctx;
	}

    override
    public bool sempred(InterfaceRuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 1:
			return expr_sempred(cast(ExprContext)_localctx, predIndex);
    default: assert(0);
		}
		return true;
	}
	private bool expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(ctx_, 4);
		case 1:
			return precpred(ctx_, 3);
	        default: assert(0);
		}
		return true;
	}

	public static immutable wstring _serializedATN =
		"\u0003\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\u0003\n\"\u0004"~
		"\u0002\t\u0002\u0004\u0003\t\u0003\u0003\u0002\u0003\u0002\u0003\u0002"~
		"\u0007\u0002\n\n\u0002\f\u0002\u000e\u0002\r\u000b\u0002\u0003\u0003\u0003"~
		"\u0003\u0003\u0003\u0003\u0003\u0003\u0003\u0003\u0003\u0005\u0003\u0015"~
		"\n\u0003\u0003\u0003\u0003\u0003\u0003\u0003\u0003\u0003\u0003\u0003\u0003"~
		"\u0003\u0007\u0003\u001d\n\u0003\f\u0003\u000e\u0003 \u000b\u0003\u0003"~
		"\u0003\u0002\u0003\u0004\u0004\u0002\u0004\u0002\u0004\u0003\u0002\u0003"~
		"\u0004\u0003\u0002\u0005\u0006#\u0002\u000b\u0003\u0002\u0002\u0002\u0004"~
		"\u0014\u0003\u0002\u0002\u0002\u0006\u0007\u0005\u0004\u0003\u0002\u0007"~
		"\b\u0007\t\u0002\u0002\b\n\u0003\u0002\u0002\u0002\t\u0006\u0003\u0002"~
		"\u0002\u0002\n\r\u0003\u0002\u0002\u0002\u000b\t\u0003\u0002\u0002\u0002"~
		"\u000b\f\u0003\u0002\u0002\u0002\f\u0003\u0003\u0002\u0002\u0002\r\u000b"~
		"\u0003\u0002\u0002\u0002\u000e\u000f\b\u0003\u0001\u0002\u000f\u0015\u0007"~
		"\n\u0002\u0002\u0010\u0011\u0007\u0007\u0002\u0002\u0011\u0012\u0005\u0004"~
		"\u0003\u0002\u0012\u0013\u0007\b\u0002\u0002\u0013\u0015\u0003\u0002\u0002"~
		"\u0002\u0014\u000e\u0003\u0002\u0002\u0002\u0014\u0010\u0003\u0002\u0002"~
		"\u0002\u0015\u001e\u0003\u0002\u0002\u0002\u0016\u0017\f\u0006\u0002\u0002"~
		"\u0017\u0018\t\u0002\u0002\u0002\u0018\u001d\u0005\u0004\u0003\u0007\u0019"~
		"\u001a\f\u0005\u0002\u0002\u001a\u001b\t\u0003\u0002\u0002\u001b\u001d"~
		"\u0005\u0004\u0003\u0006\u001c\u0016\u0003\u0002\u0002\u0002\u001c\u0019"~
		"\u0003\u0002\u0002\u0002\u001d \u0003\u0002\u0002\u0002\u001e\u001c\u0003"~
		"\u0002\u0002\u0002\u001e\u001f\u0003\u0002\u0002\u0002\u001f\u0005\u0003"~
		"\u0002\u0002\u0002 \u001e\u0003\u0002\u0002\u0002\u0006\u000b\u0014\u001c"~
		"\u001e";
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

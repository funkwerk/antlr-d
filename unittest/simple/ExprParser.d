// Generated from doc/examples/Expr.g4 by ANTLR 4.7.1
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

public class ExprParser : Parser {
	static this() { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

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
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(9);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__4 || _la==INT) {
				{
				{
				setState(4);
				expr(0);
				setState(5);
				match(NEWLINE);
				}
				}
				setState(11);
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
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(18);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case INT:
				{
				setState(13);
				match(INT);
				}
				break;
			case T__4:
				{
				setState(14);
				match(T__4);
				setState(15);
				expr(0);
				setState(16);
				match(T__5);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			ctx_.stop = _input.LT(-1);
			setState(28);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,3, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(26);
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
						}
						else {
						    if (_input.LA(1) == TokenConstantDefinition.EOF)
						        matchedEOF = true;
						    _errHandler.reportMatch(this);
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
						}
						else {
						    if (_input.LA(1) == TokenConstantDefinition.EOF)
						        matchedEOF = true;
						    _errHandler.reportMatch(this);
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
		}
		return _localctx;
	}

    override
    public bool sempred(InterfaceRuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 1:
			return expr_sempred(cast(ExprContext)_localctx, predIndex);
    default: {}
    }
    return true;
}
	private bool expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(ctx_, 4);
		case 1:
			return precpred(ctx_, 3);
	        default: {}
		}
		return true;
	}

	public static immutable wstring _serializedATN =
		"\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x03\n\"\x04\x02\t"~
		"\x02\x04\x03\t\x03\x03\x02\x03\x02\x03\x02\x07\x02\n\n\x02\f\x02\x0e\x02"~
		"\r\x0b\x02\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x05\x03\x15"~
		"\n\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x07\x03\x1d\n\x03"~
		"\f\x03\x0e\x03 \x0b\x03\x03\x03\x02\x03\x04\x04\x02\x04\x02\x04\x03\x02"~
		"\x03\x04\x03\x02\x05\x06\x02#\x02\x0b\x03\x02\x02\x02\x04\x14\x03\x02"~
		"\x02\x02\x06\x07\x05\x04\x03\x02\x07\b\x07\t\x02\x02\b\n\x03\x02\x02\x02"~
		"\t\x06\x03\x02\x02\x02\n\r\x03\x02\x02\x02\x0b\t\x03\x02\x02\x02\x0b\f"~
		"\x03\x02\x02\x02\f\x03\x03\x02\x02\x02\r\x0b\x03\x02\x02\x02\x0e\x0f\b"~
		"\x03\x01\x02\x0f\x15\x07\n\x02\x02\x10\x11\x07\x07\x02\x02\x11\x12\x05"~
		"\x04\x03\x02\x12\x13\x07\b\x02\x02\x13\x15\x03\x02\x02\x02\x14\x0e\x03"~
		"\x02\x02\x02\x14\x10\x03\x02\x02\x02\x15\x1e\x03\x02\x02\x02\x16\x17\f"~
		"\x06\x02\x02\x17\x18\t\x02\x02\x02\x18\x1d\x05\x04\x03\x07\x19\x1a\f\x05"~
		"\x02\x02\x1a\x1b\t\x03\x02\x02\x1b\x1d\x05\x04\x03\x06\x1c\x16\x03\x02"~
		"\x02\x02\x1c\x19\x03\x02\x02\x02\x1d \x03\x02\x02\x02\x1e\x1c\x03\x02"~
		"\x02\x02\x1e\x1f\x03\x02\x02\x02\x1f\x05\x03\x02\x02\x02 \x1e\x03\x02"~
		"\x02\x02\x06\x0b\x14\x1c\x1e";
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
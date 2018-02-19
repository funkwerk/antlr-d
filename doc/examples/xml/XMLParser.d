// Generated from XMLParser.g4 by ANTLR 4.7.1
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

public class XMLParser : Parser {
	static this() { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static DFA[] _decisionToDFA;
	protected PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static const int
		COMMENT=1, CDATA=2, DTD=3, EntityRef=4, CharRef=5, SEA_WS=6, OPEN=7, XMLDeclOpen=8, 
		TEXT=9, CLOSE=10, SPECIAL_CLOSE=11, SLASH_CLOSE=12, SLASH=13, EQUALS=14, 
		STRING=15, Name=16, S=17, PI=18;
	public static const int
		RULE_document = 0, RULE_prolog = 1, RULE_content = 2, RULE_element = 3, 
		RULE_reference = 4, RULE_attribute = 5, RULE_chardata = 6, RULE_misc = 7;
	public static const string[] ruleNames = [
		"document", "prolog", "content", "element", "reference", "attribute", 
		"chardata", "misc"
	];

	private static const string[] _LITERAL_NAMES = [
		null, null, null, null, null, null, null, "'<'", null, null, "'>'", null, 
		"'/>'", "'/'", "'='"
	];
	private static const string[] _SYMBOLIC_NAMES = [
		null, "COMMENT", "CDATA", "DTD", "EntityRef", "CharRef", "SEA_WS", "OPEN", 
		"XMLDeclOpen", "TEXT", "CLOSE", "SPECIAL_CLOSE", "SLASH_CLOSE", "SLASH", 
		"EQUALS", "STRING", "Name", "S", "PI"
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
	public string getGrammarFileName() { return "XMLParser.g4"; }

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
	public static class DocumentContext : ParserRuleContext {
		public ElementContext element() {
			return getRuleContext!ElementContext(0);
		}
		public PrologContext prolog() {
			return getRuleContext!PrologContext(0);
		}
		public MiscContext[] misc() {
			return getRuleContexts!MiscContext;
		}
		public MiscContext misc(int i) {
			return getRuleContext!MiscContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_document; }
		import XMLParserListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).enterDocument(this);
		}
		import XMLParserListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).exitDocument(this);
		}
	}

	public DocumentContext document() {
		DocumentContext _localctx = new DocumentContext(ctx_, getState());
		enterRule(_localctx, 0, RULE_document);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(17);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==XMLDeclOpen) {
				{
				setState(16);
				prolog();
				}
			}

			setState(22);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << COMMENT) | (1L << SEA_WS) | (1L << PI))) != 0)) {
				{
				{
				setState(19);
				misc();
				}
				}
				setState(24);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(25);
			element();
			setState(29);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << COMMENT) | (1L << SEA_WS) | (1L << PI))) != 0)) {
				{
				{
				setState(26);
				misc();
				}
				}
				setState(31);
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

	public static class PrologContext : ParserRuleContext {
		public TerminalNode XMLDeclOpen() { return getToken(XMLParser.XMLDeclOpen, 0); }
		public TerminalNode SPECIAL_CLOSE() { return getToken(XMLParser.SPECIAL_CLOSE, 0); }
		public AttributeContext[] attribute() {
			return getRuleContexts!AttributeContext;
		}
		public AttributeContext attribute(int i) {
			return getRuleContext!AttributeContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_prolog; }
		import XMLParserListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).enterProlog(this);
		}
		import XMLParserListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).exitProlog(this);
		}
	}

	public PrologContext prolog() {
		PrologContext _localctx = new PrologContext(ctx_, getState());
		enterRule(_localctx, 2, RULE_prolog);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(32);
			match(XMLDeclOpen);
			setState(36);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==Name) {
				{
				{
				setState(33);
				attribute();
				}
				}
				setState(38);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(39);
			match(SPECIAL_CLOSE);
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

	public static class ContentContext : ParserRuleContext {
		public ChardataContext[] chardata() {
			return getRuleContexts!ChardataContext;
		}
		public ChardataContext chardata(int i) {
			return getRuleContext!ChardataContext(i);
		}
		public ElementContext[] element() {
			return getRuleContexts!ElementContext;
		}
		public ElementContext element(int i) {
			return getRuleContext!ElementContext(i);
		}
		public ReferenceContext[] reference() {
			return getRuleContexts!ReferenceContext;
		}
		public ReferenceContext reference(int i) {
			return getRuleContext!ReferenceContext(i);
		}
		public TerminalNode[] CDATA() { return getTokens(XMLParser.CDATA); }
		public TerminalNode CDATA(int i) {
			return getToken(XMLParser.CDATA, i);
		}
		public TerminalNode[] PI() { return getTokens(XMLParser.PI); }
		public TerminalNode PI(int i) {
			return getToken(XMLParser.PI, i);
		}
		public TerminalNode[] COMMENT() { return getTokens(XMLParser.COMMENT); }
		public TerminalNode COMMENT(int i) {
			return getToken(XMLParser.COMMENT, i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_content; }
		import XMLParserListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).enterContent(this);
		}
		import XMLParserListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).exitContent(this);
		}
	}

	public ContentContext content() {
		ContentContext _localctx = new ContentContext(ctx_, getState());
		enterRule(_localctx, 4, RULE_content);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(42);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==SEA_WS || _la==TEXT) {
				{
				setState(41);
				chardata();
				}
			}

			setState(56);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,7, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(49);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case OPEN:
						{
						setState(44);
						element();
						}
						break;
					case EntityRef:
					case CharRef:
						{
						setState(45);
						reference();
						}
						break;
					case CDATA:
						{
						setState(46);
						match(CDATA);
						}
						break;
					case PI:
						{
						setState(47);
						match(PI);
						}
						break;
					case COMMENT:
						{
						setState(48);
						match(COMMENT);
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(52);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==SEA_WS || _la==TEXT) {
						{
						setState(51);
						chardata();
						}
					}

					}
					} 
				}
				setState(58);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,7, ctx_);
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

	public static class ElementContext : ParserRuleContext {
		public TerminalNode[] Name() { return getTokens(XMLParser.Name); }
		public TerminalNode Name(int i) {
			return getToken(XMLParser.Name, i);
		}
		public ContentContext content() {
			return getRuleContext!ContentContext(0);
		}
		public AttributeContext[] attribute() {
			return getRuleContexts!AttributeContext;
		}
		public AttributeContext attribute(int i) {
			return getRuleContext!AttributeContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_element; }
		import XMLParserListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).enterElement(this);
		}
		import XMLParserListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).exitElement(this);
		}
	}

	public ElementContext element() {
		ElementContext _localctx = new ElementContext(ctx_, getState());
		enterRule(_localctx, 6, RULE_element);
		int _la;
		try {
			setState(83);
			_errHandler.sync(this);
			switch ( getInterpreter.adaptivePredict(_input,10, ctx_) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(59);
				match(OPEN);
				setState(60);
				match(Name);
				setState(64);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==Name) {
					{
					{
					setState(61);
					attribute();
					}
					}
					setState(66);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(67);
				match(CLOSE);
				setState(68);
				content();
				setState(69);
				match(OPEN);
				setState(70);
				match(SLASH);
				setState(71);
				match(Name);
				setState(72);
				match(CLOSE);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(74);
				match(OPEN);
				setState(75);
				match(Name);
				setState(79);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==Name) {
					{
					{
					setState(76);
					attribute();
					}
					}
					setState(81);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(82);
				match(SLASH_CLOSE);
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

	public static class ReferenceContext : ParserRuleContext {
		public TerminalNode EntityRef() { return getToken(XMLParser.EntityRef, 0); }
		public TerminalNode CharRef() { return getToken(XMLParser.CharRef, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_reference; }
		import XMLParserListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).enterReference(this);
		}
		import XMLParserListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).exitReference(this);
		}
	}

	public ReferenceContext reference() {
		ReferenceContext _localctx = new ReferenceContext(ctx_, getState());
		enterRule(_localctx, 8, RULE_reference);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(85);
			_la = _input.LA(1);
			if ( !(_la==EntityRef || _la==CharRef) ) {
			_errHandler.recoverInline(this);
			}
			else {
			    if (_input.LA(1) == TokenConstantDefinition.EOF)
			        matchedEOF = true;
			    _errHandler.reportMatch(this);
			    consume();
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

	public static class AttributeContext : ParserRuleContext {
		public TerminalNode Name() { return getToken(XMLParser.Name, 0); }
		public TerminalNode STRING() { return getToken(XMLParser.STRING, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_attribute; }
		import XMLParserListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).enterAttribute(this);
		}
		import XMLParserListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).exitAttribute(this);
		}
	}

	public AttributeContext attribute() {
		AttributeContext _localctx = new AttributeContext(ctx_, getState());
		enterRule(_localctx, 10, RULE_attribute);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(87);
			match(Name);
			setState(88);
			match(EQUALS);
			setState(89);
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

	public static class ChardataContext : ParserRuleContext {
		public TerminalNode TEXT() { return getToken(XMLParser.TEXT, 0); }
		public TerminalNode SEA_WS() { return getToken(XMLParser.SEA_WS, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_chardata; }
		import XMLParserListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).enterChardata(this);
		}
		import XMLParserListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).exitChardata(this);
		}
	}

	public ChardataContext chardata() {
		ChardataContext _localctx = new ChardataContext(ctx_, getState());
		enterRule(_localctx, 12, RULE_chardata);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(91);
			_la = _input.LA(1);
			if ( !(_la==SEA_WS || _la==TEXT) ) {
			_errHandler.recoverInline(this);
			}
			else {
			    if (_input.LA(1) == TokenConstantDefinition.EOF)
			        matchedEOF = true;
			    _errHandler.reportMatch(this);
			    consume();
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

	public static class MiscContext : ParserRuleContext {
		public TerminalNode COMMENT() { return getToken(XMLParser.COMMENT, 0); }
		public TerminalNode PI() { return getToken(XMLParser.PI, 0); }
		public TerminalNode SEA_WS() { return getToken(XMLParser.SEA_WS, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_misc; }
		import XMLParserListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).enterMisc(this);
		}
		import XMLParserListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == XMLParserListener.XMLParserListener.classinfo) (cast(XMLParserListener)listener).exitMisc(this);
		}
	}

	public MiscContext misc() {
		MiscContext _localctx = new MiscContext(ctx_, getState());
		enterRule(_localctx, 14, RULE_misc);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(93);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << COMMENT) | (1L << SEA_WS) | (1L << PI))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
			    if (_input.LA(1) == TokenConstantDefinition.EOF)
			        matchedEOF = true;
			    _errHandler.reportMatch(this);
			    consume();
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
		"\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x03\x14b\x04\x02"~
		"\t\x02\x04\x03\t\x03\x04\x04\t\x04\x04\x05\t\x05\x04\x06\t\x06\x04\x07"~
		"\t\x07\x04\b\t\b\x04\t\t\t\x03\x02\x05\x02\x14\n\x02\x03\x02\x07\x02\x17"~
		"\n\x02\f\x02\x0e\x02\x1a\x0b\x02\x03\x02\x03\x02\x07\x02\x1e\n\x02\f\x02"~
		"\x0e\x02!\x0b\x02\x03\x03\x03\x03\x07\x03%\n\x03\f\x03\x0e\x03(\x0b\x03"~
		"\x03\x03\x03\x03\x03\x04\x05\x04-\n\x04\x03\x04\x03\x04\x03\x04\x03\x04"~
		"\x03\x04\x05\x044\n\x04\x03\x04\x05\x047\n\x04\x07\x049\n\x04\f\x04\x0e"~
		"\x04<\x0b\x04\x03\x05\x03\x05\x03\x05\x07\x05A\n\x05\f\x05\x0e\x05D\x0b"~
		"\x05\x03\x05\x03\x05\x03\x05\x03\x05\x03\x05\x03\x05\x03\x05\x03\x05\x03"~
		"\x05\x03\x05\x07\x05P\n\x05\f\x05\x0e\x05S\x0b\x05\x03\x05\x05\x05V\n"~
		"\x05\x03\x06\x03\x06\x03\x07\x03\x07\x03\x07\x03\x07\x03\b\x03\b\x03\t"~
		"\x03\t\x03\t\x02\x02\n\x02\x04\x06\b\n\f\x0e\x10\x02\x05\x03\x02\x06\x07"~
		"\x04\x02\b\b\x0b\x0b\x05\x02\x03\x03\b\b\x14\x14\x02g\x02\x13\x03\x02"~
		"\x02\x02\x04\"\x03\x02\x02\x02\x06,\x03\x02\x02\x02\bU\x03\x02\x02\x02"~
		"\nW\x03\x02\x02\x02\fY\x03\x02\x02\x02\x0e]\x03\x02\x02\x02\x10_\x03\x02"~
		"\x02\x02\x12\x14\x05\x04\x03\x02\x13\x12\x03\x02\x02\x02\x13\x14\x03\x02"~
		"\x02\x02\x14\x18\x03\x02\x02\x02\x15\x17\x05\x10\t\x02\x16\x15\x03\x02"~
		"\x02\x02\x17\x1a\x03\x02\x02\x02\x18\x16\x03\x02\x02\x02\x18\x19\x03\x02"~
		"\x02\x02\x19\x1b\x03\x02\x02\x02\x1a\x18\x03\x02\x02\x02\x1b\x1f\x05\b"~
		"\x05\x02\x1c\x1e\x05\x10\t\x02\x1d\x1c\x03\x02\x02\x02\x1e!\x03\x02\x02"~
		"\x02\x1f\x1d\x03\x02\x02\x02\x1f \x03\x02\x02\x02 \x03\x03\x02\x02\x02"~
		"!\x1f\x03\x02\x02\x02\"&\x07\n\x02\x02#%\x05\f\x07\x02$#\x03\x02\x02\x02"~
		"%(\x03\x02\x02\x02&$\x03\x02\x02\x02&\'\x03\x02\x02\x02\')\x03\x02\x02"~
		"\x02(&\x03\x02\x02\x02)*\x07\r\x02\x02*\x05\x03\x02\x02\x02+-\x05\x0e"~
		"\b\x02,+\x03\x02\x02\x02,-\x03\x02\x02\x02-:\x03\x02\x02\x02.4\x05\b\x05"~
		"\x02/4\x05\n\x06\x0204\x07\x04\x02\x0214\x07\x14\x02\x0224\x07\x03\x02"~
		"\x023.\x03\x02\x02\x023/\x03\x02\x02\x0230\x03\x02\x02\x0231\x03\x02\x02"~
		"\x0232\x03\x02\x02\x0246\x03\x02\x02\x0257\x05\x0e\b\x0265\x03\x02\x02"~
		"\x0267\x03\x02\x02\x0279\x03\x02\x02\x0283\x03\x02\x02\x029<\x03\x02\x02"~
		"\x02:8\x03\x02\x02\x02:;\x03\x02\x02\x02;\x07\x03\x02\x02\x02<:\x03\x02"~
		"\x02\x02=>\x07\t\x02\x02>B\x07\x12\x02\x02?A\x05\f\x07\x02@?\x03\x02\x02"~
		"\x02AD\x03\x02\x02\x02B@\x03\x02\x02\x02BC\x03\x02\x02\x02CE\x03\x02\x02"~
		"\x02DB\x03\x02\x02\x02EF\x07\f\x02\x02FG\x05\x06\x04\x02GH\x07\t\x02\x02"~
		"HI\x07\x0f\x02\x02IJ\x07\x12\x02\x02JK\x07\f\x02\x02KV\x03\x02\x02\x02"~
		"LM\x07\t\x02\x02MQ\x07\x12\x02\x02NP\x05\f\x07\x02ON\x03\x02\x02\x02P"~
		"S\x03\x02\x02\x02QO\x03\x02\x02\x02QR\x03\x02\x02\x02RT\x03\x02\x02\x02"~
		"SQ\x03\x02\x02\x02TV\x07\x0e\x02\x02U=\x03\x02\x02\x02UL\x03\x02\x02\x02"~
		"V\t\x03\x02\x02\x02WX\t\x02\x02\x02X\x0b\x03\x02\x02\x02YZ\x07\x12\x02"~
		"\x02Z[\x07\x10\x02\x02[\\\x07\x11\x02\x02\\\r\x03\x02\x02\x02]^\t\x03"~
		"\x02\x02^\x0f\x03\x02\x02\x02_`\t\x04\x02\x02`\x11\x03\x02\x02\x02\r\x13"~
		"\x18\x1f&,36:BQU";
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
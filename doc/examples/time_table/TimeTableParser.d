// Generated from doc/examples/time_table/TimeTable.g4 by ANTLR 4.7.1
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

public class TimeTableParser : Parser {
	static this() { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static DFA[] _decisionToDFA;
	protected PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static const int
		SINGLE_LINE_COMMENT=1, DELIMITED_COMMENT=2, ANKUNFTSZEIT=3, ABFAHRTSZEIT=4, 
		LINIE=5, LINIENVERLAUF=6, START=7, ZIEL=8, VIA=9, FAHRT=10, LEGENDE=11, 
		DELI=12, AUCH=13, NICHT=14, VOR=15, NACH=16, GUELTIG=17, FAEHRT=18, VOM=19, 
		BIS=20, IN=21, DAY=22, DATUM=23, WOCHENFEIERTAG=24, VERKEHRSTAGESSCHLUESSEL=25, 
		GLEIS=26, ZUGLAENGE=27, AM=28, DEM=29, ZEIT=30, NUMBER=31, ID=32, KEY=33, 
		TEXT=34, COMMA=35, WS=36;
	public static const int
		RULE_linie = 0, RULE_gueltig_vom = 1, RULE_gueltig_bis = 2, RULE_liniendefinition = 3, 
		RULE_fahrten = 4, RULE_linien_teil = 5, RULE_fahrt = 6, RULE_station = 7, 
		RULE_station_id = 8, RULE_text = 9, RULE_start = 10, RULE_ziel = 11, RULE_via = 12, 
		RULE_vias = 13, RULE_default_zuglaenge = 14, RULE_default_gleis = 15, 
		RULE_verkehrstag_legende = 16, RULE_condition = 17, RULE_datum = 18, RULE_day = 19, 
		RULE_wochenfeiertag = 20, RULE_date = 21, RULE_cond_date = 22, RULE_range_of_days = 23, 
		RULE_days = 24, RULE_date_expression = 25, RULE_date_key_legend = 26, 
		RULE_date_key = 27, RULE_gleis = 28, RULE_zuglaenge = 29, RULE_verkehrstagesschluessel = 30, 
		RULE_ankunftszeit = 31, RULE_abfahrtszeit = 32;
	public static const string[] ruleNames = [
		"linie", "gueltig_vom", "gueltig_bis", "liniendefinition", "fahrten", 
		"linien_teil", "fahrt", "station", "station_id", "text", "start", "ziel", 
		"via", "vias", "default_zuglaenge", "default_gleis", "verkehrstag_legende", 
		"condition", "datum", "day", "wochenfeiertag", "date", "cond_date", "range_of_days", 
		"days", "date_expression", "date_key_legend", "date_key", "gleis", "zuglaenge", 
		"verkehrstagesschluessel", "ankunftszeit", "abfahrtszeit"
	];

	private static const string[] _LITERAL_NAMES = [
		null, null, null, "'Ankunftszeit'", "'Abfahrtszeit'", "'Linie'", "'Linienverlauf'", 
		"'Start'", "'Ziel'", "'Via'", "'Fahrt'", "'Legende'", "':'", "'auch'", 
		"'nicht'", "'vor'", "'nach'", "'gueltig'", "'faehrt'", "'vom'", "'bis'", 
		"'in'", null, null, "'Wochenfeiertag'", "'Verkehrstagesschluessel'", "'Gleis'", 
		"'Zuglaenge'", "'am'", "'dem'", null, null, null, null, null, "','"
	];
	private static const string[] _SYMBOLIC_NAMES = [
		null, "SINGLE_LINE_COMMENT", "DELIMITED_COMMENT", "ANKUNFTSZEIT", "ABFAHRTSZEIT", 
		"LINIE", "LINIENVERLAUF", "START", "ZIEL", "VIA", "FAHRT", "LEGENDE", 
		"DELI", "AUCH", "NICHT", "VOR", "NACH", "GUELTIG", "FAEHRT", "VOM", "BIS", 
		"IN", "DAY", "DATUM", "WOCHENFEIERTAG", "VERKEHRSTAGESSCHLUESSEL", "GLEIS", 
		"ZUGLAENGE", "AM", "DEM", "ZEIT", "NUMBER", "ID", "KEY", "TEXT", "COMMA", 
		"WS"
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
	public string getGrammarFileName() { return "TimeTable.g4"; }

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
	public static class LinieContext : ParserRuleContext {
		public TerminalNode LINIE() { return getToken(TimeTableParser.LINIE, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public TerminalNode ID() { return getToken(TimeTableParser.ID, 0); }
		public Gueltig_vomContext gueltig_vom() {
			return getRuleContext!Gueltig_vomContext(0);
		}
		public Gueltig_bisContext gueltig_bis() {
			return getRuleContext!Gueltig_bisContext(0);
		}
		public TerminalNode EOF() { return getToken(TimeTableParser.EOF, 0); }
		public LiniendefinitionContext[] liniendefinition() {
			return getRuleContexts!LiniendefinitionContext;
		}
		public LiniendefinitionContext liniendefinition(int i) {
			return getRuleContext!LiniendefinitionContext(i);
		}
		public Verkehrstag_legendeContext verkehrstag_legende() {
			return getRuleContext!Verkehrstag_legendeContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_linie; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterLinie(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitLinie(this);
		}
	}

	public LinieContext linie() {
		LinieContext _localctx = new LinieContext(ctx_, getState());
		enterRule(_localctx, 0, RULE_linie);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(66);
			match(LINIE);
			setState(67);
			match(DELI);
			setState(68);
			match(ID);
			setState(69);
			gueltig_vom();
			setState(70);
			gueltig_bis();
			setState(72); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(71);
				liniendefinition();
				}
				}
				setState(74); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==LINIENVERLAUF );
			setState(77);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==LEGENDE) {
				{
				setState(76);
				verkehrstag_legende();
				}
			}

			setState(79);
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

	public static class Gueltig_vomContext : ParserRuleContext {
		public TerminalNode VOM() { return getToken(TimeTableParser.VOM, 0); }
		public TerminalNode DATUM() { return getToken(TimeTableParser.DATUM, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_gueltig_vom; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterGueltig_vom(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitGueltig_vom(this);
		}
	}

	public Gueltig_vomContext gueltig_vom() {
		Gueltig_vomContext _localctx = new Gueltig_vomContext(ctx_, getState());
		enterRule(_localctx, 2, RULE_gueltig_vom);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(81);
			match(VOM);
			setState(82);
			match(DATUM);
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

	public static class Gueltig_bisContext : ParserRuleContext {
		public TerminalNode BIS() { return getToken(TimeTableParser.BIS, 0); }
		public TerminalNode DATUM() { return getToken(TimeTableParser.DATUM, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_gueltig_bis; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterGueltig_bis(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitGueltig_bis(this);
		}
	}

	public Gueltig_bisContext gueltig_bis() {
		Gueltig_bisContext _localctx = new Gueltig_bisContext(ctx_, getState());
		enterRule(_localctx, 4, RULE_gueltig_bis);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(84);
			match(BIS);
			setState(85);
			match(DATUM);
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

	public static class LiniendefinitionContext : ParserRuleContext {
		public TerminalNode LINIENVERLAUF() { return getToken(TimeTableParser.LINIENVERLAUF, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public StartContext start() {
			return getRuleContext!StartContext(0);
		}
		public Default_zuglaengeContext default_zuglaenge() {
			return getRuleContext!Default_zuglaengeContext(0);
		}
		public Default_gleisContext default_gleis() {
			return getRuleContext!Default_gleisContext(0);
		}
		public FahrtenContext fahrten() {
			return getRuleContext!FahrtenContext(0);
		}
		public Linien_teilContext[] linien_teil() {
			return getRuleContexts!Linien_teilContext;
		}
		public Linien_teilContext linien_teil(int i) {
			return getRuleContext!Linien_teilContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_liniendefinition; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterLiniendefinition(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitLiniendefinition(this);
		}
	}

	public LiniendefinitionContext liniendefinition() {
		LiniendefinitionContext _localctx = new LiniendefinitionContext(ctx_, getState());
		enterRule(_localctx, 6, RULE_liniendefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(87);
			match(LINIENVERLAUF);
			setState(88);
			match(DELI);
			setState(89);
			start();
			setState(91); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(90);
				linien_teil();
				}
				}
				setState(93); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==VERKEHRSTAGESSCHLUESSEL );
			setState(95);
			default_zuglaenge();
			setState(96);
			default_gleis();
			setState(97);
			fahrten();
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

	public static class FahrtenContext : ParserRuleContext {
		public FahrtContext[] fahrt() {
			return getRuleContexts!FahrtContext;
		}
		public FahrtContext fahrt(int i) {
			return getRuleContext!FahrtContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_fahrten; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterFahrten(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitFahrten(this);
		}
	}

	public FahrtenContext fahrten() {
		FahrtenContext _localctx = new FahrtenContext(ctx_, getState());
		enterRule(_localctx, 8, RULE_fahrten);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(100); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(99);
				fahrt();
				}
				}
				setState(102); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==FAHRT );
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

	public static class Linien_teilContext : ParserRuleContext {
		public VerkehrstagesschluesselContext verkehrstagesschluessel() {
			return getRuleContext!VerkehrstagesschluesselContext(0);
		}
		public ZielContext ziel() {
			return getRuleContext!ZielContext(0);
		}
		public ViasContext vias() {
			return getRuleContext!ViasContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_linien_teil; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterLinien_teil(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitLinien_teil(this);
		}
	}

	public Linien_teilContext linien_teil() {
		Linien_teilContext _localctx = new Linien_teilContext(ctx_, getState());
		enterRule(_localctx, 10, RULE_linien_teil);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(104);
			verkehrstagesschluessel();
			setState(106);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==VIA) {
				{
				setState(105);
				vias();
				}
			}

			setState(108);
			ziel();
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

	public static class FahrtContext : ParserRuleContext {
		public TerminalNode FAHRT() { return getToken(TimeTableParser.FAHRT, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public TerminalNode NUMBER() { return getToken(TimeTableParser.NUMBER, 0); }
		public ZuglaengeContext zuglaenge() {
			return getRuleContext!ZuglaengeContext(0);
		}
		public GleisContext gleis() {
			return getRuleContext!GleisContext(0);
		}
		public AbfahrtszeitContext[] abfahrtszeit() {
			return getRuleContexts!AbfahrtszeitContext;
		}
		public AbfahrtszeitContext abfahrtszeit(int i) {
			return getRuleContext!AbfahrtszeitContext(i);
		}
		public AnkunftszeitContext[] ankunftszeit() {
			return getRuleContexts!AnkunftszeitContext;
		}
		public AnkunftszeitContext ankunftszeit(int i) {
			return getRuleContext!AnkunftszeitContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_fahrt; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterFahrt(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitFahrt(this);
		}
	}

	public FahrtContext fahrt() {
		FahrtContext _localctx = new FahrtContext(ctx_, getState());
		enterRule(_localctx, 12, RULE_fahrt);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(110);
			match(FAHRT);
			setState(111);
			match(DELI);
			setState(112);
			match(NUMBER);
			setState(121); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				setState(121);
				_errHandler.sync(this);
				switch ( getInterpreter.adaptivePredict(_input,7, ctx_) ) {
				case 1:
					{
					{
					setState(114);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==ANKUNFTSZEIT) {
						{
						setState(113);
						ankunftszeit();
						}
					}

					setState(116);
					abfahrtszeit();
					}
					}
					break;
				case 2:
					{
					{
					setState(117);
					ankunftszeit();
					setState(119);
					_errHandler.sync(this);
					switch ( getInterpreter.adaptivePredict(_input,6, ctx_) ) {
					case 1:
						{
						setState(118);
						abfahrtszeit();
						}
						break;
					        default: {}
					}
					}
					}
					break;
				        default: {}
				}
				}
				setState(123); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==ANKUNFTSZEIT || _la==ABFAHRTSZEIT );
			setState(126);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ZUGLAENGE) {
				{
				setState(125);
				zuglaenge();
				}
			}

			setState(129);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==GLEIS) {
				{
				setState(128);
				gleis();
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

	public static class StationContext : ParserRuleContext {
		public Station_idContext station_id() {
			return getRuleContext!Station_idContext(0);
		}
		public TextContext text() {
			return getRuleContext!TextContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_station; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterStation(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitStation(this);
		}
	}

	public StationContext station() {
		StationContext _localctx = new StationContext(ctx_, getState());
		enterRule(_localctx, 14, RULE_station);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(131);
			station_id();
			setState(133);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==TEXT) {
				{
				setState(132);
				text();
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

	public static class Station_idContext : ParserRuleContext {
		public TerminalNode ID() { return getToken(TimeTableParser.ID, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_station_id; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterStation_id(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitStation_id(this);
		}
	}

	public Station_idContext station_id() {
		Station_idContext _localctx = new Station_idContext(ctx_, getState());
		enterRule(_localctx, 16, RULE_station_id);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(135);
			match(ID);
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

	public static class TextContext : ParserRuleContext {
		public TerminalNode TEXT() { return getToken(TimeTableParser.TEXT, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_text; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterText(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitText(this);
		}
	}

	public TextContext text() {
		TextContext _localctx = new TextContext(ctx_, getState());
		enterRule(_localctx, 18, RULE_text);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(137);
			match(TEXT);
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

	public static class StartContext : ParserRuleContext {
		public TerminalNode START() { return getToken(TimeTableParser.START, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public StationContext station() {
			return getRuleContext!StationContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_start; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterStart(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitStart(this);
		}
	}

	public StartContext start() {
		StartContext _localctx = new StartContext(ctx_, getState());
		enterRule(_localctx, 20, RULE_start);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(139);
			match(START);
			setState(140);
			match(DELI);
			setState(141);
			station();
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

	public static class ZielContext : ParserRuleContext {
		public TerminalNode ZIEL() { return getToken(TimeTableParser.ZIEL, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public StationContext station() {
			return getRuleContext!StationContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_ziel; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterZiel(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitZiel(this);
		}
	}

	public ZielContext ziel() {
		ZielContext _localctx = new ZielContext(ctx_, getState());
		enterRule(_localctx, 22, RULE_ziel);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(143);
			match(ZIEL);
			setState(144);
			match(DELI);
			setState(145);
			station();
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

	public static class ViaContext : ParserRuleContext {
		public StationContext station() {
			return getRuleContext!StationContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_via; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterVia(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitVia(this);
		}
	}

	public ViaContext via() {
		ViaContext _localctx = new ViaContext(ctx_, getState());
		enterRule(_localctx, 24, RULE_via);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(147);
			station();
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

	public static class ViasContext : ParserRuleContext {
		public TerminalNode VIA() { return getToken(TimeTableParser.VIA, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public ViaContext[] via() {
			return getRuleContexts!ViaContext;
		}
		public ViaContext via(int i) {
			return getRuleContext!ViaContext(i);
		}
		public TerminalNode[] COMMA() { return getTokens(TimeTableParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(TimeTableParser.COMMA, i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_vias; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterVias(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitVias(this);
		}
	}

	public ViasContext vias() {
		ViasContext _localctx = new ViasContext(ctx_, getState());
		enterRule(_localctx, 26, RULE_vias);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(149);
			match(VIA);
			setState(150);
			match(DELI);
			setState(151);
			via();
			setState(156);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(152);
				match(COMMA);
				setState(153);
				via();
				}
				}
				setState(158);
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

	public static class Default_zuglaengeContext : ParserRuleContext {
		public ZuglaengeContext zuglaenge() {
			return getRuleContext!ZuglaengeContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_default_zuglaenge; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDefault_zuglaenge(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDefault_zuglaenge(this);
		}
	}

	public Default_zuglaengeContext default_zuglaenge() {
		Default_zuglaengeContext _localctx = new Default_zuglaengeContext(ctx_, getState());
		enterRule(_localctx, 28, RULE_default_zuglaenge);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(159);
			zuglaenge();
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

	public static class Default_gleisContext : ParserRuleContext {
		public GleisContext gleis() {
			return getRuleContext!GleisContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_default_gleis; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDefault_gleis(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDefault_gleis(this);
		}
	}

	public Default_gleisContext default_gleis() {
		Default_gleisContext _localctx = new Default_gleisContext(ctx_, getState());
		enterRule(_localctx, 30, RULE_default_gleis);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(161);
			gleis();
                        import std.stdio;
                        writefln("default_gleis() gleis state 161");
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

	public static class Verkehrstag_legendeContext : ParserRuleContext {
		public TerminalNode LEGENDE() { return getToken(TimeTableParser.LEGENDE, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public DaysContext[] days() {
			return getRuleContexts!DaysContext;
		}
		public DaysContext days(int i) {
			return getRuleContext!DaysContext(i);
		}
		public Date_expressionContext[] date_expression() {
			return getRuleContexts!Date_expressionContext;
		}
		public Date_expressionContext date_expression(int i) {
			return getRuleContext!Date_expressionContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_verkehrstag_legende; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterVerkehrstag_legende(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitVerkehrstag_legende(this);
		}
	}

	public Verkehrstag_legendeContext verkehrstag_legende() {
		Verkehrstag_legendeContext _localctx = new Verkehrstag_legendeContext(ctx_, getState());
		enterRule(_localctx, 32, RULE_verkehrstag_legende);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(163);
			match(LEGENDE);
			setState(164);
			match(DELI);
			setState(167); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				setState(167);
				_errHandler.sync(this);
				switch ( getInterpreter.adaptivePredict(_input,13, ctx_) ) {
				case 1:
					{
					setState(165);
					days();
					}
					break;
				case 2:
					{
					setState(166);
					date_expression();
					}
					break;
				        default: {}
				}
				}
				setState(169); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << NUMBER) | (1L << ID) | (1L << KEY))) != 0) );
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
		public TerminalNode FAEHRT() { return getToken(TimeTableParser.FAEHRT, 0); }
		public TerminalNode NICHT() { return getToken(TimeTableParser.NICHT, 0); }
		public TerminalNode AUCH() { return getToken(TimeTableParser.AUCH, 0); }
		public TerminalNode VOR() { return getToken(TimeTableParser.VOR, 0); }
		public TerminalNode NACH() { return getToken(TimeTableParser.NACH, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_condition; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterCondition(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitCondition(this);
		}
	}

	public ConditionContext condition() {
		ConditionContext _localctx = new ConditionContext(ctx_, getState());
		enterRule(_localctx, 34, RULE_condition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(171);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << AUCH) | (1L << NICHT) | (1L << VOR) | (1L << NACH) | (1L << FAEHRT))) != 0)) ) {
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

	public static class DatumContext : ParserRuleContext {
		public TerminalNode DATUM() { return getToken(TimeTableParser.DATUM, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_datum; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDatum(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDatum(this);
		}
	}

	public DatumContext datum() {
		DatumContext _localctx = new DatumContext(ctx_, getState());
		enterRule(_localctx, 36, RULE_datum);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(173);
			match(DATUM);
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

	public static class DayContext : ParserRuleContext {
		public TerminalNode DAY() { return getToken(TimeTableParser.DAY, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_day; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDay(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDay(this);
		}
	}

	public DayContext day() {
		DayContext _localctx = new DayContext(ctx_, getState());
		enterRule(_localctx, 38, RULE_day);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(175);
			match(DAY);
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

	public static class WochenfeiertagContext : ParserRuleContext {
		public TerminalNode WOCHENFEIERTAG() { return getToken(TimeTableParser.WOCHENFEIERTAG, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_wochenfeiertag; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterWochenfeiertag(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitWochenfeiertag(this);
		}
	}

	public WochenfeiertagContext wochenfeiertag() {
		WochenfeiertagContext _localctx = new WochenfeiertagContext(ctx_, getState());
		enterRule(_localctx, 40, RULE_wochenfeiertag);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(177);
			match(WOCHENFEIERTAG);
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

	public static class DateContext : ParserRuleContext {
		public DatumContext datum() {
			return getRuleContext!DatumContext(0);
		}
		public DayContext day() {
			return getRuleContext!DayContext(0);
		}
		public WochenfeiertagContext wochenfeiertag() {
			return getRuleContext!WochenfeiertagContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_date; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDate(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDate(this);
		}
	}

	public DateContext date() {
		DateContext _localctx = new DateContext(ctx_, getState());
		enterRule(_localctx, 42, RULE_date);
		try {
			setState(182);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case DATUM:
				enterOuterAlt(_localctx, 1);
				{
				setState(179);
				datum();
				}
				break;
			case DAY:
				enterOuterAlt(_localctx, 2);
				{
				setState(180);
				day();
				}
				break;
			case WOCHENFEIERTAG:
				enterOuterAlt(_localctx, 3);
				{
				setState(181);
				wochenfeiertag();
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

	public static class Cond_dateContext : ParserRuleContext {
		public ConditionContext condition() {
			return getRuleContext!ConditionContext(0);
		}
		public DateContext[] date() {
			return getRuleContexts!DateContext;
		}
		public DateContext date(int i) {
			return getRuleContext!DateContext(i);
		}
		public TerminalNode[] COMMA() { return getTokens(TimeTableParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(TimeTableParser.COMMA, i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_cond_date; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterCond_date(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitCond_date(this);
		}
	}

	public Cond_dateContext cond_date() {
		Cond_dateContext _localctx = new Cond_dateContext(ctx_, getState());
		enterRule(_localctx, 44, RULE_cond_date);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(184);
			condition();
			setState(185);
			date();
			setState(190);
			_errHandler.sync(this);
			_alt = getInterpreter.adaptivePredict(_input,16, ctx_);
			while ( _alt!=2 && _alt!=ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(186);
					match(COMMA);
					setState(187);
					date();
					}
					} 
				}
				setState(192);
				_errHandler.sync(this);
				_alt = getInterpreter.adaptivePredict(_input,16, ctx_);
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

	public static class Range_of_daysContext : ParserRuleContext {
		public TerminalNode[] DAY() { return getTokens(TimeTableParser.DAY); }
		public TerminalNode DAY(int i) {
			return getToken(TimeTableParser.DAY, i);
		}
		public TerminalNode BIS() { return getToken(TimeTableParser.BIS, 0); }
		public TerminalNode FAEHRT() { return getToken(TimeTableParser.FAEHRT, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_range_of_days; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterRange_of_days(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitRange_of_days(this);
		}
	}

	public Range_of_daysContext range_of_days() {
		Range_of_daysContext _localctx = new Range_of_daysContext(ctx_, getState());
		enterRule(_localctx, 46, RULE_range_of_days);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(194);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==FAEHRT) {
				{
				setState(193);
				match(FAEHRT);
				}
			}

			setState(196);
			match(DAY);
			setState(197);
			match(BIS);
			setState(198);
			match(DAY);
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

	public static class DaysContext : ParserRuleContext {
		public Date_key_legendContext date_key_legend() {
			return getRuleContext!Date_key_legendContext(0);
		}
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public Range_of_daysContext range_of_days() {
			return getRuleContext!Range_of_daysContext(0);
		}
		public TerminalNode[] COMMA() { return getTokens(TimeTableParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(TimeTableParser.COMMA, i);
		}
		public Cond_dateContext[] cond_date() {
			return getRuleContexts!Cond_dateContext;
		}
		public Cond_dateContext cond_date(int i) {
			return getRuleContext!Cond_dateContext(i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_days; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDays(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDays(this);
		}
	}

	public DaysContext days() {
		DaysContext _localctx = new DaysContext(ctx_, getState());
		enterRule(_localctx, 48, RULE_days);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(200);
			date_key_legend();
			setState(201);
			match(DELI);
			setState(202);
			range_of_days();
			setState(207);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(203);
				match(COMMA);
				setState(204);
				cond_date();
				}
				}
				setState(209);
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

	public static class Date_expressionContext : ParserRuleContext {
		public Date_key_legendContext date_key_legend() {
			return getRuleContext!Date_key_legendContext(0);
		}
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public Cond_dateContext[] cond_date() {
			return getRuleContexts!Cond_dateContext;
		}
		public Cond_dateContext cond_date(int i) {
			return getRuleContext!Cond_dateContext(i);
		}
		public TerminalNode[] COMMA() { return getTokens(TimeTableParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(TimeTableParser.COMMA, i);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_date_expression; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDate_expression(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDate_expression(this);
		}
	}

	public Date_expressionContext date_expression() {
		Date_expressionContext _localctx = new Date_expressionContext(ctx_, getState());
		enterRule(_localctx, 50, RULE_date_expression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(210);
			date_key_legend();
			setState(211);
			match(DELI);
			setState(212);
			cond_date();
			setState(217);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(213);
				match(COMMA);
				setState(214);
				cond_date();
				}
				}
				setState(219);
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

	public static class Date_key_legendContext : ParserRuleContext {
		public Date_keyContext date_key() {
			return getRuleContext!Date_keyContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_date_key_legend; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDate_key_legend(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDate_key_legend(this);
		}
	}

	public Date_key_legendContext date_key_legend() {
		Date_key_legendContext _localctx = new Date_key_legendContext(ctx_, getState());
		enterRule(_localctx, 52, RULE_date_key_legend);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(220);
			date_key();
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

	public static class Date_keyContext : ParserRuleContext {
		public TerminalNode ID() { return getToken(TimeTableParser.ID, 0); }
		public TerminalNode KEY() { return getToken(TimeTableParser.KEY, 0); }
		public TerminalNode NUMBER() { return getToken(TimeTableParser.NUMBER, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_date_key; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterDate_key(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitDate_key(this);
		}
	}

	public Date_keyContext date_key() {
		Date_keyContext _localctx = new Date_keyContext(ctx_, getState());
		enterRule(_localctx, 54, RULE_date_key);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(222);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << NUMBER) | (1L << ID) | (1L << KEY))) != 0)) ) {
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

	public static class GleisContext : ParserRuleContext {
		public TerminalNode GLEIS() { return getToken(TimeTableParser.GLEIS, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public TerminalNode NUMBER() { return getToken(TimeTableParser.NUMBER, 0); }
		public Date_keyContext date_key() {
			return getRuleContext!Date_keyContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_gleis; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterGleis(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitGleis(this);
		}
	}

	public GleisContext gleis() {
		GleisContext _localctx = new GleisContext(ctx_, getState());
		enterRule(_localctx, 56, RULE_gleis);

		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(224);
			match(GLEIS);
			setState(225);
			match(DELI);
			setState(228);
			_errHandler.sync(this);
                        import std.stdio;
                        writefln("gleis()  2---------getInterpreter %s", getInterpreter);
                        //writefln("gleis()  2---------getInterpreter %s .... %s", getInterpreter,  getInterpreter.adaptivePredict(_input,20, ctx_) );
			switch ( getInterpreter.adaptivePredict(_input,20, ctx_) ) {
			case 1:
				{
                                    import std.stdio;
                                writefln("gleis() 226");
				setState(226);

				match(NUMBER);
				}
				break;
			case 2:
				{writefln("gleis() 227");
				setState(227);
				date_key();
				}
				break;
                        default: {writefln("gleis()  3---------");}
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally { import std.stdio;writefln("gleis() exit rule");
			exitRule();
		}
		return _localctx;
	}

	public static class ZuglaengeContext : ParserRuleContext {
		public TerminalNode ZUGLAENGE() { return getToken(TimeTableParser.ZUGLAENGE, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public TerminalNode NUMBER() { return getToken(TimeTableParser.NUMBER, 0); }
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_zuglaenge; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterZuglaenge(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitZuglaenge(this);
		}
	}

	public ZuglaengeContext zuglaenge() {
		ZuglaengeContext _localctx = new ZuglaengeContext(ctx_, getState());
		enterRule(_localctx, 58, RULE_zuglaenge);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(230);
			match(ZUGLAENGE);
			setState(231);
			match(DELI);
			setState(232);
			match(NUMBER);
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

	public static class VerkehrstagesschluesselContext : ParserRuleContext {
		public TerminalNode VERKEHRSTAGESSCHLUESSEL() { return getToken(TimeTableParser.VERKEHRSTAGESSCHLUESSEL, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public Date_keyContext date_key() {
			return getRuleContext!Date_keyContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_verkehrstagesschluessel; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterVerkehrstagesschluessel(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitVerkehrstagesschluessel(this);
		}
	}

	public VerkehrstagesschluesselContext verkehrstagesschluessel() {
		VerkehrstagesschluesselContext _localctx = new VerkehrstagesschluesselContext(ctx_, getState());
		enterRule(_localctx, 60, RULE_verkehrstagesschluessel);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(234);
			match(VERKEHRSTAGESSCHLUESSEL);
			setState(235);
			match(DELI);
			setState(236);
			date_key();
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

	public static class AnkunftszeitContext : ParserRuleContext {
		public TerminalNode ANKUNFTSZEIT() { return getToken(TimeTableParser.ANKUNFTSZEIT, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public TerminalNode ZEIT() { return getToken(TimeTableParser.ZEIT, 0); }
		public TerminalNode IN() { return getToken(TimeTableParser.IN, 0); }
		public Station_idContext station_id() {
			return getRuleContext!Station_idContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_ankunftszeit; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterAnkunftszeit(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitAnkunftszeit(this);
		}
	}

	public AnkunftszeitContext ankunftszeit() {
		AnkunftszeitContext _localctx = new AnkunftszeitContext(ctx_, getState());
		enterRule(_localctx, 62, RULE_ankunftszeit);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(238);
			match(ANKUNFTSZEIT);
			setState(239);
			match(DELI);
			setState(240);
			match(ZEIT);
			setState(243);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==IN) {
				{
				setState(241);
				match(IN);
				setState(242);
				station_id();
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

	public static class AbfahrtszeitContext : ParserRuleContext {
		public TerminalNode ABFAHRTSZEIT() { return getToken(TimeTableParser.ABFAHRTSZEIT, 0); }
		public TerminalNode DELI() { return getToken(TimeTableParser.DELI, 0); }
		public TerminalNode ZEIT() { return getToken(TimeTableParser.ZEIT, 0); }
		public TerminalNode IN() { return getToken(TimeTableParser.IN, 0); }
		public Station_idContext station_id() {
			return getRuleContext!Station_idContext(0);
		}
		public this(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		override public int getRuleIndex() { return RULE_abfahrtszeit; }
		import TimeTableListener;
		override
		public void enterRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).enterAbfahrtszeit(this);
		}
		import TimeTableListener;
		override
		public void exitRule(ParseTreeListener listener) {
			if (listener.classinfo == TimeTableListener.TimeTableListener.classinfo) (cast(TimeTableListener)listener).exitAbfahrtszeit(this);
		}
	}

	public AbfahrtszeitContext abfahrtszeit() {
		AbfahrtszeitContext _localctx = new AbfahrtszeitContext(ctx_, getState());
		enterRule(_localctx, 64, RULE_abfahrtszeit);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(245);
			match(ABFAHRTSZEIT);
			setState(246);
			match(DELI);
			setState(247);
			match(ZEIT);
			setState(250);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==IN) {
				{
				setState(248);
				match(IN);
				setState(249);
				station_id();
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
		"\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x03&\u00ff\x04\x02"~
		"\t\x02\x04\x03\t\x03\x04\x04\t\x04\x04\x05\t\x05\x04\x06\t\x06\x04\x07"~
		"\t\x07\x04\b\t\b\x04\t\t\t\x04\n\t\n\x04\x0b\t\x0b\x04\f\t\f\x04\r\t\r"~
		"\x04\x0e\t\x0e\x04\x0f\t\x0f\x04\x10\t\x10\x04\x11\t\x11\x04\x12\t\x12"~
		"\x04\x13\t\x13\x04\x14\t\x14\x04\x15\t\x15\x04\x16\t\x16\x04\x17\t\x17"~
		"\x04\x18\t\x18\x04\x19\t\x19\x04\x1a\t\x1a\x04\x1b\t\x1b\x04\x1c\t\x1c"~
		"\x04\x1d\t\x1d\x04\x1e\t\x1e\x04\x1f\t\x1f\x04 \t \x04!\t!\x04\"\t\"\x03"~
		"\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x06\x02K\n\x02\r\x02\x0e"~
		"\x02L\x03\x02\x05\x02P\n\x02\x03\x02\x03\x02\x03\x03\x03\x03\x03\x03\x03"~
		"\x04\x03\x04\x03\x04\x03\x05\x03\x05\x03\x05\x03\x05\x06\x05^\n\x05\r"~
		"\x05\x0e\x05_\x03\x05\x03\x05\x03\x05\x03\x05\x03\x06\x06\x06g\n\x06\r"~
		"\x06\x0e\x06h\x03\x07\x03\x07\x05\x07m\n\x07\x03\x07\x03\x07\x03\b\x03"~
		"\b\x03\b\x03\b\x05\bu\n\b\x03\b\x03\b\x03\b\x05\bz\n\b\x06\b|\n\b\r\b"~
		"\x0e\b}\x03\b\x05\b\u0081\n\b\x03\b\x05\b\u0084\n\b\x03\t\x03\t\x05\t"~
		"\u0088\n\t\x03\n\x03\n\x03\x0b\x03\x0b\x03\f\x03\f\x03\f\x03\f\x03\r\x03"~
		"\r\x03\r\x03\r\x03\x0e\x03\x0e\x03\x0f\x03\x0f\x03\x0f\x03\x0f\x03\x0f"~
		"\x07\x0f\u009d\n\x0f\f\x0f\x0e\x0f\u00a0\x0b\x0f\x03\x10\x03\x10\x03\x11"~
		"\x03\x11\x03\x12\x03\x12\x03\x12\x03\x12\x06\x12\u00aa\n\x12\r\x12\x0e"~
		"\x12\u00ab\x03\x13\x03\x13\x03\x14\x03\x14\x03\x15\x03\x15\x03\x16\x03"~
		"\x16\x03\x17\x03\x17\x03\x17\x05\x17\u00b9\n\x17\x03\x18\x03\x18\x03\x18"~
		"\x03\x18\x07\x18\u00bf\n\x18\f\x18\x0e\x18\u00c2\x0b\x18\x03\x19\x05\x19"~
		"\u00c5\n\x19\x03\x19\x03\x19\x03\x19\x03\x19\x03\x1a\x03\x1a\x03\x1a\x03"~
		"\x1a\x03\x1a\x07\x1a\u00d0\n\x1a\f\x1a\x0e\x1a\u00d3\x0b\x1a\x03\x1b\x03"~
		"\x1b\x03\x1b\x03\x1b\x03\x1b\x07\x1b\u00da\n\x1b\f\x1b\x0e\x1b\u00dd\x0b"~
		"\x1b\x03\x1c\x03\x1c\x03\x1d\x03\x1d\x03\x1e\x03\x1e\x03\x1e\x03\x1e\x05"~
		"\x1e\u00e7\n\x1e\x03\x1f\x03\x1f\x03\x1f\x03\x1f\x03 \x03 \x03 \x03 \x03"~
		"!\x03!\x03!\x03!\x03!\x05!\u00f6\n!\x03\"\x03\"\x03\"\x03\"\x03\"\x05"~
		"\"\u00fd\n\"\x03\"\x02\x02#\x02\x04\x06\b\n\f\x0e\x10\x12\x14\x16\x18"~
		"\x1a\x1c\x1e \"$&(*,.02468:<>@B\x02\x04\x04\x02\x0f\x12\x14\x14\x03\x02"~
		"!#\x02\u00f5\x02D\x03\x02\x02\x02\x04S\x03\x02\x02\x02\x06V\x03\x02\x02"~
		"\x02\bY\x03\x02\x02\x02\nf\x03\x02\x02\x02\fj\x03\x02\x02\x02\x0ep\x03"~
		"\x02\x02\x02\x10\u0085\x03\x02\x02\x02\x12\u0089\x03\x02\x02\x02\x14\u008b"~
		"\x03\x02\x02\x02\x16\u008d\x03\x02\x02\x02\x18\u0091\x03\x02\x02\x02\x1a"~
		"\u0095\x03\x02\x02\x02\x1c\u0097\x03\x02\x02\x02\x1e\u00a1\x03\x02\x02"~
		"\x02 \u00a3\x03\x02\x02\x02\"\u00a5\x03\x02\x02\x02$\u00ad\x03\x02\x02"~
		"\x02&\u00af\x03\x02\x02\x02(\u00b1\x03\x02\x02\x02*\u00b3\x03\x02\x02"~
		"\x02,\u00b8\x03\x02\x02\x02.\u00ba\x03\x02\x02\x020\u00c4\x03\x02\x02"~
		"\x022\u00ca\x03\x02\x02\x024\u00d4\x03\x02\x02\x026\u00de\x03\x02\x02"~
		"\x028\u00e0\x03\x02\x02\x02:\u00e2\x03\x02\x02\x02<\u00e8\x03\x02\x02"~
		"\x02>\u00ec\x03\x02\x02\x02@\u00f0\x03\x02\x02\x02B\u00f7\x03\x02\x02"~
		"\x02DE\x07\x07\x02\x02EF\x07\x0e\x02\x02FG\x07\"\x02\x02GH\x05\x04\x03"~
		"\x02HJ\x05\x06\x04\x02IK\x05\b\x05\x02JI\x03\x02\x02\x02KL\x03\x02\x02"~
		"\x02LJ\x03\x02\x02\x02LM\x03\x02\x02\x02MO\x03\x02\x02\x02NP\x05\"\x12"~
		"\x02ON\x03\x02\x02\x02OP\x03\x02\x02\x02PQ\x03\x02\x02\x02QR\x07\x02\x02"~
		"\x03R\x03\x03\x02\x02\x02ST\x07\x15\x02\x02TU\x07\x19\x02\x02U\x05\x03"~
		"\x02\x02\x02VW\x07\x16\x02\x02WX\x07\x19\x02\x02X\x07\x03\x02\x02\x02"~
		"YZ\x07\b\x02\x02Z[\x07\x0e\x02\x02[]\x05\x16\f\x02\\^\x05\f\x07\x02]\\"~
		"\x03\x02\x02\x02^_\x03\x02\x02\x02_]\x03\x02\x02\x02_`\x03\x02\x02\x02"~
		"`a\x03\x02\x02\x02ab\x05\x1e\x10\x02bc\x05 \x11\x02cd\x05\n\x06\x02d\t"~
		"\x03\x02\x02\x02eg\x05\x0e\b\x02fe\x03\x02\x02\x02gh\x03\x02\x02\x02h"~
		"f\x03\x02\x02\x02hi\x03\x02\x02\x02i\x0b\x03\x02\x02\x02jl\x05> \x02k"~
		"m\x05\x1c\x0f\x02lk\x03\x02\x02\x02lm\x03\x02\x02\x02mn\x03\x02\x02\x02"~
		"no\x05\x18\r\x02o\r\x03\x02\x02\x02pq\x07\f\x02\x02qr\x07\x0e\x02\x02"~
		"r{\x07!\x02\x02su\x05@!\x02ts\x03\x02\x02\x02tu\x03\x02\x02\x02uv\x03"~
		"\x02\x02\x02v|\x05B\"\x02wy\x05@!\x02xz\x05B\"\x02yx\x03\x02\x02\x02y"~
		"z\x03\x02\x02\x02z|\x03\x02\x02\x02{t\x03\x02\x02\x02{w\x03\x02\x02\x02"~
		"|}\x03\x02\x02\x02}{\x03\x02\x02\x02}~\x03\x02\x02\x02~\u0080\x03\x02"~
		"\x02\x02\x7f\u0081\x05<\x1f\x02\u0080\x7f\x03\x02\x02\x02\u0080\u0081"~
		"\x03\x02\x02\x02\u0081\u0083\x03\x02\x02\x02\u0082\u0084\x05:\x1e\x02"~
		"\u0083\u0082\x03\x02\x02\x02\u0083\u0084\x03\x02\x02\x02\u0084\x0f\x03"~
		"\x02\x02\x02\u0085\u0087\x05\x12\n\x02\u0086\u0088\x05\x14\x0b\x02\u0087"~
		"\u0086\x03\x02\x02\x02\u0087\u0088\x03\x02\x02\x02\u0088\x11\x03\x02\x02"~
		"\x02\u0089\u008a\x07\"\x02\x02\u008a\x13\x03\x02\x02\x02\u008b\u008c\x07"~
		"$\x02\x02\u008c\x15\x03\x02\x02\x02\u008d\u008e\x07\t\x02\x02\u008e\u008f"~
		"\x07\x0e\x02\x02\u008f\u0090\x05\x10\t\x02\u0090\x17\x03\x02\x02\x02\u0091"~
		"\u0092\x07\n\x02\x02\u0092\u0093\x07\x0e\x02\x02\u0093\u0094\x05\x10\t"~
		"\x02\u0094\x19\x03\x02\x02\x02\u0095\u0096\x05\x10\t\x02\u0096\x1b\x03"~
		"\x02\x02\x02\u0097\u0098\x07\x0b\x02\x02\u0098\u0099\x07\x0e\x02\x02\u0099"~
		"\u009e\x05\x1a\x0e\x02\u009a\u009b\x07%\x02\x02\u009b\u009d\x05\x1a\x0e"~
		"\x02\u009c\u009a\x03\x02\x02\x02\u009d\u00a0\x03\x02\x02\x02\u009e\u009c"~
		"\x03\x02\x02\x02\u009e\u009f\x03\x02\x02\x02\u009f\x1d\x03\x02\x02\x02"~
		"\u00a0\u009e\x03\x02\x02\x02\u00a1\u00a2\x05<\x1f\x02\u00a2\x1f\x03\x02"~
		"\x02\x02\u00a3\u00a4\x05:\x1e\x02\u00a4!\x03\x02\x02\x02\u00a5\u00a6\x07"~
		"\r\x02\x02\u00a6\u00a9\x07\x0e\x02\x02\u00a7\u00aa\x052\x1a\x02\u00a8"~
		"\u00aa\x054\x1b\x02\u00a9\u00a7\x03\x02\x02\x02\u00a9\u00a8\x03\x02\x02"~
		"\x02\u00aa\u00ab\x03\x02\x02\x02\u00ab\u00a9\x03\x02\x02\x02\u00ab\u00ac"~
		"\x03\x02\x02\x02\u00ac#\x03\x02\x02\x02\u00ad\u00ae\t\x02\x02\x02\u00ae"~
		"%\x03\x02\x02\x02\u00af\u00b0\x07\x19\x02\x02\u00b0\'\x03\x02\x02\x02"~
		"\u00b1\u00b2\x07\x18\x02\x02\u00b2)\x03\x02\x02\x02\u00b3\u00b4\x07\x1a"~
		"\x02\x02\u00b4+\x03\x02\x02\x02\u00b5\u00b9\x05&\x14\x02\u00b6\u00b9\x05"~
		"(\x15\x02\u00b7\u00b9\x05*\x16\x02\u00b8\u00b5\x03\x02\x02\x02\u00b8\u00b6"~
		"\x03\x02\x02\x02\u00b8\u00b7\x03\x02\x02\x02\u00b9-\x03\x02\x02\x02\u00ba"~
		"\u00bb\x05$\x13\x02\u00bb\u00c0\x05,\x17\x02\u00bc\u00bd\x07%\x02\x02"~
		"\u00bd\u00bf\x05,\x17\x02\u00be\u00bc\x03\x02\x02\x02\u00bf\u00c2\x03"~
		"\x02\x02\x02\u00c0\u00be\x03\x02\x02\x02\u00c0\u00c1\x03\x02\x02\x02\u00c1"~
		"/\x03\x02\x02\x02\u00c2\u00c0\x03\x02\x02\x02\u00c3\u00c5\x07\x14\x02"~
		"\x02\u00c4\u00c3\x03\x02\x02\x02\u00c4\u00c5\x03\x02\x02\x02\u00c5\u00c6"~
		"\x03\x02\x02\x02\u00c6\u00c7\x07\x18\x02\x02\u00c7\u00c8\x07\x16\x02\x02"~
		"\u00c8\u00c9\x07\x18\x02\x02\u00c91\x03\x02\x02\x02\u00ca\u00cb\x056\x1c"~
		"\x02\u00cb\u00cc\x07\x0e\x02\x02\u00cc\u00d1\x050\x19\x02\u00cd\u00ce"~
		"\x07%\x02\x02\u00ce\u00d0\x05.\x18\x02\u00cf\u00cd\x03\x02\x02\x02\u00d0"~
		"\u00d3\x03\x02\x02\x02\u00d1\u00cf\x03\x02\x02\x02\u00d1\u00d2\x03\x02"~
		"\x02\x02\u00d23\x03\x02\x02\x02\u00d3\u00d1\x03\x02\x02\x02\u00d4\u00d5"~
		"\x056\x1c\x02\u00d5\u00d6\x07\x0e\x02\x02\u00d6\u00db\x05.\x18\x02\u00d7"~
		"\u00d8\x07%\x02\x02\u00d8\u00da\x05.\x18\x02\u00d9\u00d7\x03\x02\x02\x02"~
		"\u00da\u00dd\x03\x02\x02\x02\u00db\u00d9\x03\x02\x02\x02\u00db\u00dc\x03"~
		"\x02\x02\x02\u00dc5\x03\x02\x02\x02\u00dd\u00db\x03\x02\x02\x02\u00de"~
		"\u00df\x058\x1d\x02\u00df7\x03\x02\x02\x02\u00e0\u00e1\t\x03\x02\x02\u00e1"~
		"9\x03\x02\x02\x02\u00e2\u00e3\x07\x1c\x02\x02\u00e3\u00e6\x07\x0e\x02"~
		"\x02\u00e4\u00e7\x07!\x02\x02\u00e5\u00e7\x058\x1d\x02\u00e6\u00e4\x03"~
		"\x02\x02\x02\u00e6\u00e5\x03\x02\x02\x02\u00e7;\x03\x02\x02\x02\u00e8"~
		"\u00e9\x07\x1d\x02\x02\u00e9\u00ea\x07\x0e\x02\x02\u00ea\u00eb\x07!\x02"~
		"\x02\u00eb=\x03\x02\x02\x02\u00ec\u00ed\x07\x1b\x02\x02\u00ed\u00ee\x07"~
		"\x0e\x02\x02\u00ee\u00ef\x058\x1d\x02\u00ef?\x03\x02\x02\x02\u00f0\u00f1"~
		"\x07\x05\x02\x02\u00f1\u00f2\x07\x0e\x02\x02\u00f2\u00f5\x07 \x02\x02"~
		"\u00f3\u00f4\x07\x17\x02\x02\u00f4\u00f6\x05\x12\n\x02\u00f5\u00f3\x03"~
		"\x02\x02\x02\u00f5\u00f6\x03\x02\x02\x02\u00f6A\x03\x02\x02\x02\u00f7"~
		"\u00f8\x07\x06\x02\x02\u00f8\u00f9\x07\x0e\x02\x02\u00f9\u00fc\x07 \x02"~
		"\x02\u00fa\u00fb\x07\x17\x02\x02\u00fb\u00fd\x05\x12\n\x02\u00fc\u00fa"~
		"\x03\x02\x02\x02\u00fc\u00fd\x03\x02\x02\x02\u00fdC\x03\x02\x02\x02\x19"~
		"LO_hlty{}\u0080\u0083\u0087\u009e\u00a9\u00ab\u00b8\u00c0\u00c4\u00d1"~
		"\u00db\u00e6\u00f5\u00fc";
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

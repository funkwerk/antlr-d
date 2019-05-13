// Generated from doc/examples/simple_expression/Expr.g4 by ANTLR 4.7.2
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.InterfaceRuleContext;
import antlr.v4.runtime.RuntimeMetaData;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.LexerATNSimulator;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.LexerNoViableAltException;

public class ExprLexer : Lexer {
    alias recover = Lexer.recover;
    static this() { RuntimeMetaData.checkVersion("4.7.2", RuntimeMetaData.VERSION); }

    protected static DFA[] _decisionToDFA;
    protected PredictionContextCache _sharedContextCache =
        new PredictionContextCache();
    public static immutable int
		T__0=1,T__1=2,T__2=3,T__3=4,T__4=5,T__5=6,NEWLINE=7,INT=8;
    public static string[] channelNames = [
        "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
    ];
	public static string[] modeNames = [
		"DEFAULT_MODE"
	];

	public static string[] ruleNames = [
		"T__0","T__1","T__2","T__3","T__4","T__5","NEWLINE","INT"
	];

	private static const string[] _LITERAL_NAMES = [
		null,"'*'","'/'","'+'","'-'","'('","')'"
	];
	private static const string[] _SYMBOLIC_NAMES = [
		null,null,null,null,null,null,null,"NEWLINE","INT"
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


	public this(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	override
	public string getGrammarFileName() { return "Expr.g4"; }

	override
	public string[] getRuleNames() { return ruleNames; }

	override
	public wstring getSerializedATN() { return _serializedATN; }

        override
	public string[] getChannelNames() { return channelNames; }

	override
	public string[] getModeNames() { return modeNames; }

	override
	public ATN getATN() { return _ATN; }

	public static immutable wstring _serializedATN =
		"\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x02\n)\b\x01\x04"~
		"\x02\t\x02\x04\x03\t\x03\x04\x04\t\x04\x04\x05\t\x05\x04\x06\t\x06\x04"~
		"\x07\t\x07\x04\b\t\b\x04\t\t\t\x03\x02\x03\x02\x03\x03\x03\x03\x03\x04"~
		"\x03\x04\x03\x05\x03\x05\x03\x06\x03\x06\x03\x07\x03\x07\x03\b\x06\b!"~
		"\n\b\r\b\x0e\b\"\x03\t\x06\t&\n\t\r\t\x0e\t\'\x02\x02\n\x03\x03\x05\x04"~
		"\x07\x05\t\x06\x0b\x07\r\b\x0f\t\x11\n\x03\x02\x04\x04\x02\f\f\x0f\x0f"~
		"\x03\x022;\x02*\x02\x03\x03\x02\x02\x02\x02\x05\x03\x02\x02\x02\x02\x07"~
		"\x03\x02\x02\x02\x02\t\x03\x02\x02\x02\x02\x0b\x03\x02\x02\x02\x02\r\x03"~
		"\x02\x02\x02\x02\x0f\x03\x02\x02\x02\x02\x11\x03\x02\x02\x02\x03\x13\x03"~
		"\x02\x02\x02\x05\x15\x03\x02\x02\x02\x07\x17\x03\x02\x02\x02\t\x19\x03"~
		"\x02\x02\x02\x0b\x1b\x03\x02\x02\x02\r\x1d\x03\x02\x02\x02\x0f \x03\x02"~
		"\x02\x02\x11%\x03\x02\x02\x02\x13\x14\x07,\x02\x02\x14\x04\x03\x02\x02"~
		"\x02\x15\x16\x071\x02\x02\x16\x06\x03\x02\x02\x02\x17\x18\x07-\x02\x02"~
		"\x18\b\x03\x02\x02\x02\x19\x1a\x07/\x02\x02\x1a\n\x03\x02\x02\x02\x1b"~
		"\x1c\x07*\x02\x02\x1c\f\x03\x02\x02\x02\x1d\x1e\x07+\x02\x02\x1e\x0e\x03"~
		"\x02\x02\x02\x1f!\t\x02\x02\x02 \x1f\x03\x02\x02\x02!\"\x03\x02\x02\x02"~
		"\" \x03\x02\x02\x02\"#\x03\x02\x02\x02#\x10\x03\x02\x02\x02$&\t\x03\x02"~
		"\x02%$\x03\x02\x02\x02&\'\x03\x02\x02\x02\'%\x03\x02\x02\x02\'(\x03\x02"~
		"\x02\x02(\x12\x03\x02\x02\x02\x05\x02\"\'\x02";
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
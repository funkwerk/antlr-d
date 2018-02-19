// Generated from doc/examples/arithmetic/arithmetic.g4 by ANTLR 4.7.1
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

public class arithmeticLexer : Lexer {
    alias recover = Lexer.recover;
    static this() { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

    protected static DFA[] _decisionToDFA;
    protected PredictionContextCache _sharedContextCache =
        new PredictionContextCache();
    public static immutable int
		VARIABLE=1, SCIENTIFIC_NUMBER=2, LPAREN=3, RPAREN=4, PLUS=5, MINUS=6, 
		TIMES=7, DIV=8, GT=9, LT=10, EQ=11, POINT=12, POW=13, WS=14;
    public static string[] channelNames = [
        "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
    ];
	public static string[] modeNames = [
		"DEFAULT_MODE"
	];

	public static string[] ruleNames = [
		"VARIABLE", "VALID_ID_START", "VALID_ID_CHAR", "SCIENTIFIC_NUMBER", "NUMBER", 
		"E", "SIGN", "LPAREN", "RPAREN", "PLUS", "MINUS", "TIMES", "DIV", "GT", 
		"LT", "EQ", "POINT", "POW", "WS"
	];

	private static const string[] _LITERAL_NAMES = [
		null, null, null, "'('", "')'", "'+'", "'-'", "'*'", "'/'", "'>'", "'<'", 
		"'='", "'.'", "'^'"
	];
	private static const string[] _SYMBOLIC_NAMES = [
		null, "VARIABLE", "SCIENTIFIC_NUMBER", "LPAREN", "RPAREN", "PLUS", "MINUS", 
		"TIMES", "DIV", "GT", "LT", "EQ", "POINT", "POW", "WS"
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
	public string getGrammarFileName() { return "arithmetic.g4"; }

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
		"\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x02\x10n\b\x01\x04"~
		"\x02\t\x02\x04\x03\t\x03\x04\x04\t\x04\x04\x05\t\x05\x04\x06\t\x06\x04"~
		"\x07\t\x07\x04\b\t\b\x04\t\t\t\x04\n\t\n\x04\x0b\t\x0b\x04\f\t\f\x04\r"~
		"\t\r\x04\x0e\t\x0e\x04\x0f\t\x0f\x04\x10\t\x10\x04\x11\t\x11\x04\x12\t"~
		"\x12\x04\x13\t\x13\x04\x14\t\x14\x03\x02\x03\x02\x07\x02,\n\x02\f\x02"~
		"\x0e\x02/\x0b\x02\x03\x03\x05\x032\n\x03\x03\x04\x03\x04\x05\x046\n\x04"~
		"\x03\x05\x03\x05\x03\x05\x05\x05;\n\x05\x03\x05\x03\x05\x05\x05?\n\x05"~
		"\x03\x06\x06\x06B\n\x06\r\x06\x0e\x06C\x03\x06\x03\x06\x06\x06H\n\x06"~
		"\r\x06\x0e\x06I\x05\x06L\n\x06\x03\x07\x03\x07\x03\b\x03\b\x03\t\x03\t"~
		"\x03\n\x03\n\x03\x0b\x03\x0b\x03\f\x03\f\x03\r\x03\r\x03\x0e\x03\x0e\x03"~
		"\x0f\x03\x0f\x03\x10\x03\x10\x03\x11\x03\x11\x03\x12\x03\x12\x03\x13\x03"~
		"\x13\x03\x14\x06\x14i\n\x14\r\x14\x0e\x14j\x03\x14\x03\x14\x02\x02\x15"~
		"\x03\x03\x05\x02\x07\x02\t\x04\x0b\x02\r\x02\x0f\x02\x11\x05\x13\x06\x15"~
		"\x07\x17\b\x19\t\x1b\n\x1d\x0b\x1f\f!\r#\x0e%\x0f\'\x10\x03\x02\x06\x05"~
		"\x02C\\aac|\x04\x02GGgg\x04\x02--//\x05\x02\x0b\f\x0f\x0f\"\"\x02p\x02"~
		"\x03\x03\x02\x02\x02\x02\t\x03\x02\x02\x02\x02\x11\x03\x02\x02\x02\x02"~
		"\x13\x03\x02\x02\x02\x02\x15\x03\x02\x02\x02\x02\x17\x03\x02\x02\x02\x02"~
		"\x19\x03\x02\x02\x02\x02\x1b\x03\x02\x02\x02\x02\x1d\x03\x02\x02\x02\x02"~
		"\x1f\x03\x02\x02\x02\x02!\x03\x02\x02\x02\x02#\x03\x02\x02\x02\x02%\x03"~
		"\x02\x02\x02\x02\'\x03\x02\x02\x02\x03)\x03\x02\x02\x02\x051\x03\x02\x02"~
		"\x02\x075\x03\x02\x02\x02\t7\x03\x02\x02\x02\x0bA\x03\x02\x02\x02\rM\x03"~
		"\x02\x02\x02\x0fO\x03\x02\x02\x02\x11Q\x03\x02\x02\x02\x13S\x03\x02\x02"~
		"\x02\x15U\x03\x02\x02\x02\x17W\x03\x02\x02\x02\x19Y\x03\x02\x02\x02\x1b"~
		"[\x03\x02\x02\x02\x1d]\x03\x02\x02\x02\x1f_\x03\x02\x02\x02!a\x03\x02"~
		"\x02\x02#c\x03\x02\x02\x02%e\x03\x02\x02\x02\'h\x03\x02\x02\x02)-\x05"~
		"\x05\x03\x02*,\x05\x07\x04\x02+*\x03\x02\x02\x02,/\x03\x02\x02\x02-+\x03"~
		"\x02\x02\x02-.\x03\x02\x02\x02.\x04\x03\x02\x02\x02/-\x03\x02\x02\x02"~
		"02\t\x02\x02\x0210\x03\x02\x02\x022\x06\x03\x02\x02\x0236\x05\x05\x03"~
		"\x0246\x042;\x0253\x03\x02\x02\x0254\x03\x02\x02\x026\b\x03\x02\x02\x02"~
		"7>\x05\x0b\x06\x028:\x05\r\x07\x029;\x05\x0f\b\x02:9\x03\x02\x02\x02:"~
		";\x03\x02\x02\x02;<\x03\x02\x02\x02<=\x05\x0b\x06\x02=?\x03\x02\x02\x02"~
		">8\x03\x02\x02\x02>?\x03\x02\x02\x02?\n\x03\x02\x02\x02@B\x042;\x02A@"~
		"\x03\x02\x02\x02BC\x03\x02\x02\x02CA\x03\x02\x02\x02CD\x03\x02\x02\x02"~
		"DK\x03\x02\x02\x02EG\x070\x02\x02FH\x042;\x02GF\x03\x02\x02\x02HI\x03"~
		"\x02\x02\x02IG\x03\x02\x02\x02IJ\x03\x02\x02\x02JL\x03\x02\x02\x02KE\x03"~
		"\x02\x02\x02KL\x03\x02\x02\x02L\f\x03\x02\x02\x02MN\t\x03\x02\x02N\x0e"~
		"\x03\x02\x02\x02OP\t\x04\x02\x02P\x10\x03\x02\x02\x02QR\x07*\x02\x02R"~
		"\x12\x03\x02\x02\x02ST\x07+\x02\x02T\x14\x03\x02\x02\x02UV\x07-\x02\x02"~
		"V\x16\x03\x02\x02\x02WX\x07/\x02\x02X\x18\x03\x02\x02\x02YZ\x07,\x02\x02"~
		"Z\x1a\x03\x02\x02\x02[\\\x071\x02\x02\\\x1c\x03\x02\x02\x02]^\x07@\x02"~
		"\x02^\x1e\x03\x02\x02\x02_`\x07>\x02\x02` \x03\x02\x02\x02ab\x07?\x02"~
		"\x02b\"\x03\x02\x02\x02cd\x070\x02\x02d$\x03\x02\x02\x02ef\x07`\x02\x02"~
		"f&\x03\x02\x02\x02gi\t\x05\x02\x02hg\x03\x02\x02\x02ij\x03\x02\x02\x02"~
		"jh\x03\x02\x02\x02jk\x03\x02\x02\x02kl\x03\x02\x02\x02lm\b\x14\x02\x02"~
		"m(\x03\x02\x02\x02\f\x02-15:>CIKj\x03\b\x02\x02";
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
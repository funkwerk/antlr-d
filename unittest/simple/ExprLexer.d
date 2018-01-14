// Generated from doc/examples/Expr.g4 by ANTLR 4.7.1
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
    static this() { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

    protected static DFA[] _decisionToDFA;
    protected PredictionContextCache _sharedContextCache =
        new PredictionContextCache();
    public static immutable int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, NEWLINE=7, INT=8;
    public static string[] channelNames = [
        "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
    ];
	public static string[] modeNames = [
		"DEFAULT_MODE"
	];

	public static string[] ruleNames = [
		"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "NEWLINE", "INT"
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
		"\u0003\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\u0002\n)\b\u0001"~
		"\u0004\u0002\t\u0002\u0004\u0003\t\u0003\u0004\u0004\t\u0004\u0004\u0005"~
		"\t\u0005\u0004\u0006\t\u0006\u0004\u0007\t\u0007\u0004\b\t\b\u0004\t\t"~
		"\t\u0003\u0002\u0003\u0002\u0003\u0003\u0003\u0003\u0003\u0004\u0003\u0004"~
		"\u0003\u0005\u0003\u0005\u0003\u0006\u0003\u0006\u0003\u0007\u0003\u0007"~
		"\u0003\b\u0006\b!\n\b\r\b\u000e\b\"\u0003\t\u0006\t&\n\t\r\t\u000e\t\'"~
		"\u0002\u0002\n\u0003\u0003\u0005\u0004\u0007\u0005\t\u0006\u000b\u0007"~
		"\r\b\u000f\t\u0011\n\u0003\u0002\u0004\u0004\u0002\f\f\u000f\u000f\u0003"~
		"\u00022;\u0002*\u0002\u0003\u0003\u0002\u0002\u0002\u0002\u0005\u0003"~
		"\u0002\u0002\u0002\u0002\u0007\u0003\u0002\u0002\u0002\u0002\t\u0003\u0002"~
		"\u0002\u0002\u0002\u000b\u0003\u0002\u0002\u0002\u0002\r\u0003\u0002\u0002"~
		"\u0002\u0002\u000f\u0003\u0002\u0002\u0002\u0002\u0011\u0003\u0002\u0002"~
		"\u0002\u0003\u0013\u0003\u0002\u0002\u0002\u0005\u0015\u0003\u0002\u0002"~
		"\u0002\u0007\u0017\u0003\u0002\u0002\u0002\t\u0019\u0003\u0002\u0002\u0002"~
		"\u000b\u001b\u0003\u0002\u0002\u0002\r\u001d\u0003\u0002\u0002\u0002\u000f"~
		" \u0003\u0002\u0002\u0002\u0011%\u0003\u0002\u0002\u0002\u0013\u0014\u0007"~
		",\u0002\u0002\u0014\u0004\u0003\u0002\u0002\u0002\u0015\u0016\u00071\u0002"~
		"\u0002\u0016\u0006\u0003\u0002\u0002\u0002\u0017\u0018\u0007-\u0002\u0002"~
		"\u0018\b\u0003\u0002\u0002\u0002\u0019\u001a\u0007/\u0002\u0002\u001a"~
		"\n\u0003\u0002\u0002\u0002\u001b\u001c\u0007*\u0002\u0002\u001c\f\u0003"~
		"\u0002\u0002\u0002\u001d\u001e\u0007+\u0002\u0002\u001e\u000e\u0003\u0002"~
		"\u0002\u0002\u001f!\t\u0002\u0002\u0002 \u001f\u0003\u0002\u0002\u0002"~
		"!\"\u0003\u0002\u0002\u0002\" \u0003\u0002\u0002\u0002\"#\u0003\u0002"~
		"\u0002\u0002#\u0010\u0003\u0002\u0002\u0002$&\t\u0003\u0002\u0002%$\u0003"~
		"\u0002\u0002\u0002&\'\u0003\u0002\u0002\u0002\'%\u0003\u0002\u0002\u0002"~
		"\'(\u0003\u0002\u0002\u0002(\u0012\u0003\u0002\u0002\u0002\u0005\u0002"~
		"\"\'\u0002";
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
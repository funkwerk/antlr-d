// Generated from Hello.g4 by ANTLR 4.9.2
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.InterfaceRuleContext;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.RuntimeMetaData;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.atn.ATN : ATN;
alias ATNType = ATN;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.LexerATNSimulator;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.LexerNoViableAltException;

public class HelloLexer : Lexer {
    alias recover = Lexer.recover;
    static this() { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

    protected static DFA[] _decisionToDFA;
    protected PredictionContextCache _sharedContextCache =
        new PredictionContextCache();
    public enum int
        T__0=1,ID=2,WS=3;
    public static string[] channelNames = [
        "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
    ];
    public static string[] modeNames = [
        "DEFAULT_MODE"
    ];

    public static string[] ruleNames = [
        "T__0","ID","WS"
    ];

    private static const string[] _LITERAL_NAMES = [
        null,"'hello'"
    ];
    private static const string[] _SYMBOLIC_NAMES = [
        null,null,"ID","WS"
    ];
    public static Vocabulary VOCABULARY;

    /**
     * @deprecated Use {@link #VOCABULARY} instead.
     */
    public static string[_SYMBOLIC_NAMES.length] tokenNames;

    static this() {
        VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);
        int index = 0;
        foreach (ref tokenName; tokenNames)
            {
                tokenName = VOCABULARY.getLiteralName(index);
                    if (!tokenName) {
                        tokenName = VOCABULARY.getSymbolicName(index);
                }
                if (!tokenName)
                {
                    tokenName = "<INVALID>";
                }
            }
            ++index;
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
    public string getGrammarFileName() { return "Hello.g4"; }

    override
    public string[] getRuleNames() { return ruleNames; }

    override
    public wstring getSerializedATN() { return _serializedATN; }

        override
    public string[] getChannelNames() { return channelNames; }

    override
    public string[] getModeNames() { return modeNames; }

    override
    public ATNType getATN() { return _ATN; }

    public static immutable wstring _serializedATN =
        "\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x02\x05\x1b"~
    	"\b\x01\x04\x02\t\x02\x04\x03\t\x03\x04\x04\t\x04\x03\x02\x03\x02\x03"~
    	"\x02\x03\x02\x03\x02\x03\x02\x03\x03\x06\x03\x11\n\x03\r\x03\x0e\x03"~
    	"\x12\x03\x04\x06\x04\x16\n\x04\r\x04\x0e\x04\x17\x03\x04\x03\x04\x02"~
    	"\x02\x05\x03\x03\x05\x04\x07\x05\x03\x02\x04\x03\x02c|\x05\x02\x0b"~
    	"\f\x0f\x0f\"\"\x02\x1c\x02\x03\x03\x02\x02\x02\x02\x05\x03\x02\x02"~
    	"\x02\x02\x07\x03\x02\x02\x02\x03\t\x03\x02\x02\x02\x05\x10\x03\x02"~
    	"\x02\x02\x07\x15\x03\x02\x02\x02\t\n\x07j\x02\x02\n\x0b\x07g\x02\x02"~
    	"\x0b\f\x07n\x02\x02\f\r\x07n\x02\x02\r\x0e\x07q\x02\x02\x0e\x04\x03"~
    	"\x02\x02\x02\x0f\x11\t\x02\x02\x02\x10\x0f\x03\x02\x02\x02\x11\x12"~
    	"\x03\x02\x02\x02\x12\x10\x03\x02\x02\x02\x12\x13\x03\x02\x02\x02\x13"~
    	"\x06\x03\x02\x02\x02\x14\x16\t\x03\x02\x02\x15\x14\x03\x02\x02\x02"~
    	"\x16\x17\x03\x02\x02\x02\x17\x15\x03\x02\x02\x02\x17\x18\x03\x02\x02"~
    	"\x02\x18\x19\x03\x02\x02\x02\x19\x1a\b\x04\x02\x02\x1a\b\x03\x02\x02"~
    	"\x02\x05\x02\x12\x17\x03\b\x02\x02";
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
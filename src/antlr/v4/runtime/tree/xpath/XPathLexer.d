// Generated from src/antlr/v4/runtime/tree/xpath/XPathLexer.g4 by ANTLR 4.5.3
module antlr.v4.runtime.tree.xpath.XPathLexer;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.dfa.DFA;
//import antlr.v4.runtime.misc.*;

public class XPathLexer : Lexer {
	static this() { RuntimeMetaData.checkVersion("4.5.3", RuntimeMetaData.VERSION); }

	protected static const DFA[] _decisionToDFA;
	protected static const PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static const int
		TOKEN_REF=1, RULE_REF=2, ANYWHERE=3, ROOT=4, WILDCARD=5, BANG=6, ID=7, 
		STRING=8;
	public static string[] modeNames = [
		"DEFAULT_MODE"
	];

	public static const string[] ruleNames = [
		"ANYWHERE", "ROOT", "WILDCARD", "BANG", "ID", "NameChar", "NameStartChar", 
		"STRING"
	];

	private static const string[] _LITERAL_NAMES = [
		null, null, null, "'//'", "'/'", "'*'", "'!'"
	];
	private static const string[] _SYMBOLIC_NAMES = [
		null, "TOKEN_REF", "RULE_REF", "ANYWHERE", "ROOT", "WILDCARD", "BANG", 
		"ID", "STRING"
	];
    public static const Vocabulary VOCABULARY; // = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	deprecated
	public static const string[] tokenNames;
	static this() {
		tokenNames = new string[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	override
	deprecated
	public string[] getTokenNames() {
		return tokenNames;
	}

	override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public this(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	override
	public string getGrammarFileName() { return "XPathLexer.g4"; }

	override
	public string[] getRuleNames() { return ruleNames; }

	override
	public string getSerializedATN() { return _serializedATN; }

	override
	public string[] getModeNames() { return modeNames; }

	override
	public ATN getATN() { return _ATN; }

	override
	public void action(RuleContext _localctx, int ruleIndex, int actionIndex) {
		switch (ruleIndex) {
		case 4:
			ID_action(cast(RuleContext)_localctx, actionIndex);
			break;
		}
	}
	private void ID_action(RuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 0:

							String text = getText();
							if ( Character.isUpperCase(text.charAt(0)) ) setType(TOKEN_REF);
							else setType(RULE_REF);
							
			break;
		}
	}

	public static const string _serializedATN =
		"\3\x0430\xd6d1\x8206\xad2d\x4417\xaef1\x8d80\xaadd\2\n4\b\1\4\2\t\2\4"~
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\3\2\3\2\3\2\3\3"~
		"\3\3\3\4\3\4\3\5\3\5\3\6\3\6\7\6\37\n\6\f\6\16\6\"\13\6\3\6\3\6\3\7\3"~
		"\7\5\7(\n\7\3\b\3\b\3\t\3\t\7\t.\n\t\f\t\16\t1\13\t\3\t\3\t\3/\2\n\3\5"~
		"\5\6\7\7\t\b\13\t\r\2\17\2\21\n\3\2\4\7\22;aa\x00b9\x00b9\x0302\x0371"~
		"\x2041\x2042\17\2C\\c|\x00c2\x00d8\x00da\x00f8\x00fa\x0301\x0372\x037f"~
		"\x0381\x2001\x200e\x200f\x2072\x2191\x2c02\x2ff1\x3003\xd801\xf902\xfdd1"~
		"\xfdf2\xffff4\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2"~
		"\2\2\2\21\3\2\2\2\3\23\3\2\2\2\5\26\3\2\2\2\7\30\3\2\2\2\t\32\3\2\2\2"~
		"\13\34\3\2\2\2\r\'\3\2\2\2\17)\3\2\2\2\21+\3\2\2\2\23\24\71\2\2\24\25"~
		"\71\2\2\25\4\3\2\2\2\26\27\71\2\2\27\6\3\2\2\2\30\31\7,\2\2\31\b\3\2\2"~
		"\2\32\33\7#\2\2\33\n\3\2\2\2\34 \5\17\b\2\35\37\5\r\7\2\36\35\3\2\2\2"~
		"\37\"\3\2\2\2 \36\3\2\2\2 !\3\2\2\2!#\3\2\2\2\" \3\2\2\2#$\b\6\2\2$\f"~
		"\3\2\2\2%(\5\17\b\2&(\t\2\2\2\'%\3\2\2\2\'&\3\2\2\2(\16\3\2\2\2)*\t\3"~
		"\2\2*\20\3\2\2\2+/\7)\2\2,.\13\2\2\2-,\3\2\2\2.1\3\2\2\2/0\3\2\2\2/-\3"~
		"\2\2\202\3\2\2\21/\3\2\2\223\7)\2\23\22\3\2\2\2\6\2 \'/\3\3\6\2";

    public static const ATN _ATN;

    static this() {
        _ATN = new ATNDeserializer();
        _ATN.deserialize(_serializedATN);
        VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);
        _decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
        for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
            _decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
        }
    }
}

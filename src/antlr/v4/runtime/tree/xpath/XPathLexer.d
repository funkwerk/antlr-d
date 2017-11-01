// Generated from src/antlr/v4/runtime/tree/xpath/XPathLexer.g4 by ANTLR 4.5.3
module antlr.v4.runtime.tree.xpath.XPathLexer;

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

public class XPathLexer : Lexer {
    alias recover = Lexer.recover;
    static this() { RuntimeMetaData.checkVersion("4.5.3", RuntimeMetaData.VERSION); }

    protected static DFA[] _decisionToDFA;
    protected PredictionContextCache _sharedContextCache =
        new PredictionContextCache();
    public static const int
		TOKEN_REF=1, RULE_REF=2, ANYWHERE=3, ROOT=4, WILDCARD=5, BANG=6, ID=7, 
		STRING=8;
	public static string[] modeNames = [
		"DEFAULT_MODE"
	];

	public static string[] ruleNames = [
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
	public static Vocabulary VOCABULARY;

	public override void recover(LexerNoViableAltException e)
	    {
	        throw e;
	    }

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
	public string getGrammarFileName() { return "XPathLexer.g4"; }

	override
	public string[] getRuleNames() { return ruleNames; }

	override
	public wstring getSerializedATN() { return _serializedATN; }

	override
	public string[] getModeNames() { return modeNames; }

	override
	public ATN getATN() { return _ATN; }

	override
	public void action(InterfaceRuleContext _localctx, int ruleIndex, int actionIndex) {
		switch (ruleIndex) {
		case 4:
			ID_action(cast(InterfaceRuleContext)_localctx, actionIndex);
			break;
	        default: break;
		}
	}
	private void ID_action(InterfaceRuleContext _localctx, int actionIndex) {
		switch (actionIndex) {
		case 0:

			               import std.ascii;
			               string text = getText();
				       if (isUpper(text[0])) setType(TOKEN_REF);
				       else setType(RULE_REF);
				       
			break;
	        default: break;
		}
	}

	public static immutable wstring _serializedATN =
		"\u0003\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\u0002\n4\b\u0001"~
		"\u0004\u0002\t\u0002\u0004\u0003\t\u0003\u0004\u0004\t\u0004\u0004\u0005"~
		"\t\u0005\u0004\u0006\t\u0006\u0004\u0007\t\u0007\u0004\b\t\b\u0004\t\t"~
		"\t\u0003\u0002\u0003\u0002\u0003\u0002\u0003\u0003\u0003\u0003\u0003\u0004"~
		"\u0003\u0004\u0003\u0005\u0003\u0005\u0003\u0006\u0003\u0006\u0007\u0006"~
		"\u001f\n\u0006\f\u0006\u000e\u0006\"\u000b\u0006\u0003\u0006\u0003\u0006"~
		"\u0003\u0007\u0003\u0007\u0005\u0007(\n\u0007\u0003\b\u0003\b\u0003\t"~
		"\u0003\t\u0007\t.\n\t\f\t\u000e\t1\u000b\t\u0003\t\u0003\t\u0003/\u0002"~
		"\n\u0003\u0005\u0005\u0006\u0007\u0007\t\b\u000b\t\r\u0002\u000f\u0002"~
		"\u0011\n\u0003\u0002\u0004\u0007\u00022;aa\u00b9\u00b9\u0302\u0371\u2041"~
		"\u2042\u000f\u0002C\\c|\u00c2\u00d8\u00da\u00f8\u00fa\u0301\u0372\u037f"~
		"\u0381\u2001\u200e\u200f\u2072\u2191\u2c02\u2ff1\u3003[154001]\uf902\ufdd1"~
		"\ufdf2\uffff4\u0002\u0003\u0003\u0002\u0002\u0002\u0002\u0005\u0003\u0002"~
		"\u0002\u0002\u0002\u0007\u0003\u0002\u0002\u0002\u0002\t\u0003\u0002\u0002"~
		"\u0002\u0002\u000b\u0003\u0002\u0002\u0002\u0002\u0011\u0003\u0002\u0002"~
		"\u0002\u0003\u0013\u0003\u0002\u0002\u0002\u0005\u0016\u0003\u0002\u0002"~
		"\u0002\u0007\u0018\u0003\u0002\u0002\u0002\t\u001a\u0003\u0002\u0002\u0002"~
		"\u000b\u001c\u0003\u0002\u0002\u0002\r\'\u0003\u0002\u0002\u0002\u000f"~
		")\u0003\u0002\u0002\u0002\u0011+\u0003\u0002\u0002\u0002\u0013\u0014\u0007"~
		"1\u0002\u0002\u0014\u0015\u00071\u0002\u0002\u0015\u0004\u0003\u0002\u0002"~
		"\u0002\u0016\u0017\u00071\u0002\u0002\u0017\u0006\u0003\u0002\u0002\u0002"~
		"\u0018\u0019\u0007,\u0002\u0002\u0019\b\u0003\u0002\u0002\u0002\u001a"~
		"\u001b\u0007#\u0002\u0002\u001b\n\u0003\u0002\u0002\u0002\u001c \u0005"~
		"\u000f\b\u0002\u001d\u001f\u0005\r\u0007\u0002\u001e\u001d\u0003\u0002"~
		"\u0002\u0002\u001f\"\u0003\u0002\u0002\u0002 \u001e\u0003\u0002\u0002"~
		"\u0002 !\u0003\u0002\u0002\u0002!#\u0003\u0002\u0002\u0002\" \u0003\u0002"~
		"\u0002\u0002#$\b\u0006\u0002\u0002$\f\u0003\u0002\u0002\u0002%(\u0005"~
		"\u000f\b\u0002&(\t\u0002\u0002\u0002\'%\u0003\u0002\u0002\u0002\'&\u0003"~
		"\u0002\u0002\u0002(\u000e\u0003\u0002\u0002\u0002)*\t\u0003\u0002\u0002"~
		"*\u0010\u0003\u0002\u0002\u0002+/\u0007)\u0002\u0002,.\u000b\u0002\u0002"~
		"\u0002-,\u0003\u0002\u0002\u0002.1\u0003\u0002\u0002\u0002/0\u0003\u0002"~
		"\u0002\u0002/-\u0003\u0002\u0002\u000202\u0003\u0002\u0002\u00021/\u0003"~
		"\u0002\u0002\u000223\u0007)\u0002\u00023\u0012\u0003\u0002\u0002\u0002"~
		"\u0006\u0002 \'/\u0003\u0003\u0006\u0002";
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
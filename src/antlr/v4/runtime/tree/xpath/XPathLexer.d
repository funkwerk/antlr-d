/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.tree.xpath.XPathLexer;

import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.LexerATNSimulator;

// Class XPathLexer
/**
 * TODO add class description
 */
class XPathLexer : Lexer
{

    protected static DFA[] _decisionToDFA;

    protected static PredictionContextCache _sharedContextCache;

    public static string[] modeNames = ["DEFAULT_MODE"];

    public static string[] ruleNames = ["ANYWHERE", "ROOT", "WILDCARD", "BANG", "ID", "NameChar", "NameStartChar", "STRING"];

    private static string[] _LITERAL_NAMES = [null, null, null, "'//'", "'/'", "'*'", "'!'"];

    private static string[] _SYMBOLIC_NAMES = [null, "TOKEN_REF", "RULE_REF", "ANYWHERE", "ROOT", "WILDCARD", "BANG", "ID", "STRING"];

    public static Vocabulary VOCABULARY;

    public static string[] tokenNames;

    public static immutable int TOKEN_REF = 1;

    public static immutable int RULE_REF = 2;

    public static immutable int ANYWHERE = 3;

    public static immutable int ROOT = 4;

    public static immutable int WILDCARD = 5;

    public static immutable int BANG = 6;

    public static immutable int ID = 7;

    public static immutable int STRING = 8;

    public static immutable string _serializedATN = "\3\x0430\xd6d1\x8206\xad2d\x4417\xaef1\x8d80\xaadd\2\n\64\b\1\4\2\t\2" ~
"\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\3\2\3\2\3\2\3" ~
"\3\3\3\3\4\3\4\3\5\3\5\3\6\3\6\7\6\37\n\6\f\6\16\6\"\13\6\3\6\3\6\3\7" ~
"\3\7\5\7(\n\7\3\b\3\b\3\t\3\t\7\t.\n\t\f\t\16\t\61\13\t\3\t\3\t\3/\2\n" ~
"\3\5\5\6\7\7\t\b\13\t\r\2\17\2\21\n\3\2\4\7\2\62;aa\x00b9\x00b9\x0302" ~
"\x0371\x2041\x2042\17\2C\\c|\x00c2\x00d8\x00da\x00f8\x00fa\x0301\x0372" ~
"\x037f\x0381\x2001\x200e\x200f\x2072\x2191\x2c02\x2ff1\x3003\xd801\xf902" ~
"\xfdd1\xfdf2\xffff\64\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2" ~
"\2\13\3\2\2\2\2\21\3\2\2\2\3\23\3\2\2\2\5\26\3\2\2\2\7\30\3\2\2\2\t\32" ~
"\3\2\2\2\13\34\3\2\2\2\r\'\3\2\2\2\17)\3\2\2\2\21+\3\2\2\2\23\24\7\61" ~
"\2\2\24\25\7\61\2\2\25\4\3\2\2\2\26\27\7\61\2\2\27\6\3\2\2\2\30\31\7," ~
"\2\2\31\b\3\2\2\2\32\33\7#\2\2\33\n\3\2\2\2\34 \5\17\b\2\35\37\5\r\7\2" ~
"\36\35\3\2\2\2\37\"\3\2\2\2 \36\3\2\2\2 !\3\2\2\2!#\3\2\2\2\" \3\2\2\2" ~
"#$\b\6\2\2$\f\3\2\2\2%(\5\17\b\2&(\t\2\2\2\'%\3\2\2\2\'&\3\2\2\2(\16\3" ~
"\2\2\2)*\t\3\2\2*\20\3\2\2\2+/\7)\2\2,.\13\2\2\2-,\3\2\2\2.\61\3\2\2\2" ~
"/\60\3\2\2\2/-\3\2\2\2\60\62\3\2\2\2\61/\3\2\2\2\62\63\7)\2\2\63\22\3" ~
"\2\2\2\6\2 \'/\3\3\6\2";

    public ATN _ATN;

    public this(CharStream input)
    {
        super(input);
        _interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
    }

    /**
     * @uml
     * @override
     */
    public override string getGrammarFileName()
    {
    }

    /**
     * @uml
     * @override
     */
    public override string[] getRuleNames()
    {
    }

    /**
     * @uml
     * @override
     */
    public override string getSerializedATN()
    {
    }

    public string getModeNames()
    {
    }

    /**
     * @uml
     * @override
     */
    public override ATN getATN()
    {
    }

    /**
     * @uml
     * @override
     */
    public override void action(RuleContext _localctx, int ruleIndex, int actionIndex)
    {
    }

    public void ID_action(RuleContext _localctx, int actionIndex)
    {
    }

}

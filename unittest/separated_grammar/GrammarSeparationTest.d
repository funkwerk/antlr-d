module GrammarSeparationTest;

import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.tree.ParseTreeWalker;
import antlr.v4.runtime.atn.ParserATNSimulator;
import dshould;
import RuleLexer : RuleLexer;
import RuleParser : RuleParser;
import RuleParserBaseListener : RuleParserBaseListener;
import RuleWriter : RuleWriter;
import std.conv;
import std.file;
import std.stdio;

@("construct")
unittest
{
    auto antlrInput =
        new ANTLRInputStream(File("unittest/separated_grammar/declaration.rule", "r"));
    auto lexer = new RuleLexer(antlrInput);
    auto cts = new CommonTokenStream(lexer);
    cts.fill;

    string s;
    int i;
    foreach (t; cts.getTokens) {
        s = cts.get(i++).to!string;
    }

    auto parser = new RuleParser(cts);
    parser.isTTS = true; // tts mode
    // Specify entry point
    auto rootContext = parser.file_input;
    parser.numberOfSyntaxErrors.should.equal(0);
    auto templateWalker = new ParseTreeWalker;
    auto templatesListener = new RuleParserBaseListener;
    auto writer = new RuleWriter;
    //templatesListener.writer = writer;
    templateWalker.walk(templatesListener, rootContext);
    // //writefln("edT = %s", templatesListener.externalDefinedTemplates);
}

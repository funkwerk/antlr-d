module TTSListenerTest;

import std.stdio;
import std.conv;

version(unittest) {

    import RuleTranslatorLexer;
    import RuleTranslatorParser;
    import TTSListener;
    import antlr.v4.runtime.ANTLRInputStream;
    import antlr.v4.runtime.CommonToken;
    import antlr.v4.runtime.CommonTokenStream;
    import antlr.v4.runtime.DiagnosticErrorListener;
    import antlr.v4.runtime.LexerNoViableAltException;
    import antlr.v4.runtime.Token;
    import antlr.v4.runtime.atn.ParserATNSimulator;
    import antlr.v4.runtime.tree.ParseTreeWalker;
    import dshould : be, equal, not, should;
    import dshould.thrown;
    import std.conv : to;
    import std.file;
    import unit_threaded;

    class Test {

        @Tags("ANTLRInputStream")
        @("input file missing")
        unittest {
            try
                auto antlrInput = new ANTLRInputStream(File("simple.rule1"));
            catch (Exception e)
                e.msg.should.equal("Cannot open file `simple.rule1' in " ~
                                   "mode `rb' (No such file or directory)");
        }

        @Tags("Lexer")
        @("rule")
        unittest {
            auto antlrInput = new ANTLRInputStream(File("unittest/complex/complex.rule", "r"));
            auto lexer = new RuleTranslatorLexer(antlrInput);
            auto cts = new CommonTokenStream(lexer);
            cts.getNumberOfOnChannelTokens.should.equal(405);
            auto f = File("unittest/complex/tokens.cmp");
            auto charRange = f.byLine();
            string s;
            int i;
            foreach (t; charRange) {
                s = cts.get(i++).to!string;
                s.should.equal(t);
            }
            f.close;
        }

        @Tags("Parser")
        @("simple_rule")
        unittest {
            auto antlrInput = new ANTLRInputStream(File("unittest/complex/simple.rule", "r"));
            auto lexer = new RuleTranslatorLexer(antlrInput);
            auto cts = new CommonTokenStream(lexer);
            cts.getNumberOfOnChannelTokens.should.equal(35);
            auto f = File("unittest/complex/simple_tokens.cmp");
            auto charRange = f.byLine();
            string s;
            int i;
            foreach (t; charRange) {
                s = cts.get(i++).to!string;
                s.should.equal(t);
            }
            f.close;
            auto parser = new RuleTranslatorParser(cts);
            // Specify entry point
            auto rootContext = parser.file_input;
            parser.numberOfSyntaxErrors.should.equal(0);
        }

        @Tags("Parser")
        @("simple_rule_syntax_error")
        unittest {
            auto antlrInput = new ANTLRInputStream(File("unittest/complex/simple_error.rule", "r"));
            auto lexer = new RuleTranslatorLexer(antlrInput);
            auto cts = new CommonTokenStream(lexer);
            cts.getNumberOfOnChannelTokens.should.equal(36);
            auto f = File("unittest/complex/simple_tokens_error.cmp");
            auto charRange = f.byLine();
            string s;
            int i;
            foreach (t; charRange) {
                s = cts.get(i++).to!string;
                s.should.equal(t);
            }
            f.close;
            auto parser = new RuleTranslatorParser(cts);
            parser.addErrorListener(new DiagnosticErrorListener!(Token, ParserATNSimulator));
            // Specify entry point
            auto rootContext = parser.file_input;
            parser.numberOfSyntaxErrors.should.equal(2);
        }

    }
}

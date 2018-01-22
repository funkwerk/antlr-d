import std.stdio;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.LexerNoViableAltException;
import HelloLexer;
import fluent.asserts;
import unit_threaded;


class Test {

    @Tags("simpleHello", "reg")
    @("simpleHelloTestUnknownToken")
    unittest {
        auto input = "hello Egbert";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new HelloLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Hello.g4").because("xx");
        lexer.getRuleNames.should.equal(["T__0", "ID", "WS"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        try {
            cts.getNumberOfOnChannelTokens.should.equal(3).because("xx");
        }
        catch (LexerNoViableAltException e) {
            Assert.equal("LexerNoViableAltException('E')", e.toString);
        }
    }

    @Tags("simple", "reg")
    @("simpleHelloTestWithString")
    unittest {
        auto input = "hello egbert";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new HelloLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Hello.g4");
        lexer.getRuleNames.should.equal(["T__0", "ID", "WS"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(3);
        lexer.getModeNames.should.equal(["DEFAULT_MODE"]);
        Assert.equal((cast(CommonToken)cts.LT(1)).toString,
                     "[@0,0:4='hello',<1>,1:0]");
        Assert.equal((cast(CommonToken)cts.LT(2)).toString,
                     "[@1,6:11='egbert',<2>,1:6]");
    }

    @Tags("simple", "reg")
    @("simpleHelloTestWithFile")
    unittest {
        File file = File("unittest/simple/hello.txt", "r");
        auto antlrInput = new ANTLRInputStream(file);
        antlrInput.should.not.beNull;
        auto lexer = new HelloLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Hello.g4");
        lexer.getRuleNames.should.equal(["T__0", "ID", "WS"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(3);
        file.close();
    }

}

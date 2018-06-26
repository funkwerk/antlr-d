import std.stdio;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.LexerNoViableAltException;
import HelloLexer;
import dshould : be, equal, not, should;
import unit_threaded;


class Test {

    @Tags("simpleHello", "reg")
    @("simpleHelloTestUnknownToken")
    unittest {
        auto input = "hello Egbert";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.be(null);
        auto lexer = new HelloLexer(antlrInput);
        lexer.should.not.be(null);
        lexer.getGrammarFileName.should.equal("Hello.g4");
        lexer.getRuleNames.should.equal(["T__0", "ID", "WS"]);
        auto cts = new CommonTokenStream(lexer);
        // try {
        //     cts.getNumberOfOnChannelTokens.should.equal(3).because("xx");
        // }
        // catch (LexerNoViableAltException e) {
        //     Assert.equal("LexerNoViableAltException('E')", e.toString);
        // }
        cts.getNumberOfOnChannelTokens.should.equal(3); //.should
        //   .throwAn!LexerNoViableAltException;
        //           .where.msg.should.be("");
    }

    @Tags("simple", "reg")
    @("simpleHelloTestWithString")
    unittest {
        auto input = "hello egbert";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.be(null);
        auto lexer = new HelloLexer(antlrInput);
        lexer.should.not.be(null);
        lexer.getGrammarFileName.should.equal("Hello.g4");
        lexer.getRuleNames.should.equal(["T__0", "ID", "WS"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.be(null);
        cts.getNumberOfOnChannelTokens.should.equal(3);
        lexer.getModeNames.should.equal(["DEFAULT_MODE"]);
        (cast(CommonToken)cts.LT(1)).toString.should.equal(
                     "[@0,0:4='hello',<1>,1:0]");
        (cast(CommonToken)cts.LT(2)).toString.should.equal(
                     "[@1,6:11='egbert',<2>,1:6]");
    }

    @Tags("simple", "reg")
    @("simpleHelloTestWithFile")
    unittest {
        File file = File("unittest/simple/hello.txt", "r");
        auto antlrInput = new ANTLRInputStream(file);
        antlrInput.should.not.be(null);
        auto lexer = new HelloLexer(antlrInput);
        lexer.should.not.be(null);
        lexer.getGrammarFileName.should.equal("Hello.g4");
        lexer.getRuleNames.should.equal(["T__0", "ID", "WS"]);
        auto cts = new CommonTokenStream(lexer);
        cts.getNumberOfOnChannelTokens.should.equal(3);
        file.close();
    }

}

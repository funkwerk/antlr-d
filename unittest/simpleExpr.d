import std.stdio;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.LexerNoViableAltException;
import ExprLexer;
import ExprParser;
import fluent.asserts;
import unit_threaded;


class Test {
    
    @Tags("simpleExpr")
    @("simpleExprSimpleInput")
    unittest {
        auto input = "100\n";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new ExprLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Expr.g4");
        lexer.getRuleNames.should.equal(["T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "NEWLINE", "INT"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(3);
        Assert.equal((cast(CommonToken)cts.LT(1)).toString,
                     "[@0,0:2='100',<8>,1:0]");
        Assert.equal((cast(CommonToken)cts.LT(2)).toString,
                     "[@1,3:3='\\n',<7>,1:3]");
        Assert.equal((cast(CommonToken)cts.LT(3)).toString,
                     "[@2,4:3='<EOF>',<-1>,2:0]");
        // Pass the tokens to the parser
        ExprParser parser = new ExprParser(cts);
        // Specify our entry point
        ExprParser.ExprParser.ProgContext progContext = parser.prog;
    }

    @Tags("simpleExpr2")
    @("simpleExprSimpleInput")
    unittest {
        auto input = "100+1\n";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new ExprLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Expr.g4");
        lexer.getRuleNames.should.equal(["T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "NEWLINE", "INT"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(5);
        Assert.equal((cast(CommonToken)cts.LT(1)).toString,
                     "[@0,0:2='100',<8>,1:0]");
        Assert.equal((cast(CommonToken)cts.LT(2)).toString,
                     "[@1,3:3='+',<3>,1:3]");
        Assert.equal((cast(CommonToken)cts.LT(3)).toString,
                     "[@2,4:4='1',<8>,1:4]");
        // Pass the tokens to the parser
        ExprParser parser = new ExprParser(cts);
        // Specify our entry point
        ExprParser.ExprParser.ProgContext progContext = parser.prog;
    }

    @Tags("simpleExpr1")
    @("simpleExpr")
    unittest {
        auto input = "(100+2)*3";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.beNull;
        auto lexer = new ExprLexer(antlrInput);
        lexer.should.not.beNull;
        lexer.getGrammarFileName.should.equal("Expr.g4");
        lexer.getRuleNames.should.equal(["T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "NEWLINE", "INT"]);
        auto cts = new CommonTokenStream(lexer);
        cts.should.not.beNull;
        cts.getNumberOfOnChannelTokens.should.equal(8);
        Assert.equal((cast(CommonToken)cts.LT(1)).toString,
                     "[@0,0:0='(',<5>,1:0]");
        Assert.equal((cast(CommonToken)cts.LT(2)).toString,
                     "[@1,1:3='100',<8>,1:1]");
        Assert.equal((cast(CommonToken)cts.LT(3)).toString,
                     "[@2,4:4='+',<3>,1:4]");
        // Pass the tokens to the parser
        ExprParser parser = new ExprParser(cts);
        // Specify our entry point
        ExprParser.ExprParser.ProgContext progContext = parser.prog;
    }
}
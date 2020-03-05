import std.conv;
import std.stdio;
import std.variant;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.LexerNoViableAltException;
import L;
import dshould : be, equal, not, should;
import unit_threaded;


class Test {

    @Tags("Lexer")
    @("largeLexer")
    unittest {
        auto input = "KW400";
        auto antlrInput = new ANTLRInputStream(input);
        antlrInput.should.not.be(null);
        auto lexer = new L(antlrInput);
        lexer.should.not.be(null);
        lexer.getGrammarFileName.should.equal("L.g4");
        auto cts = new CommonTokenStream(lexer);
        cts.fill;
        cts.getTokens[0].getText.get!(string).should.equal("KW400");
        cts.get(0).to!string.should.equal("[@0,0:4='KW400',<402>,1:0]");
    }

}

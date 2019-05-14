import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.Token;
import dshould : be, equal, not, should;
import dshould.thrown;
import ExprLexer;
import ExprParser;
import PrintExprVisitor;
import std.conv;
import std.file;
import std.stdio;
import unit_threaded;


class Test
{

    @Tags("simpleExpr", "reg")
    @("simpleVisistor")
    unittest
    {
        auto s = "4/2+2*(12-3)+3\n"; // 23
        auto antlrInput =
            new ANTLRInputStream(s);
        auto lexer = new ExprLexer(antlrInput);
        auto cts = new CommonTokenStream(lexer);
        auto parser = new ExprParser(cts);
        // Specify entry point
        auto rootContext = parser.prog;
        auto pev = new PrintExprVisitor.PrintExprVisitor;
        auto res = pev.visit(rootContext);
        writefln("res = %s", res);
        res.get!(int).should.be(23);
    }
}

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
import antlr.v4.runtime.Token;
import antlr.v4.runtime.atn.ParserATNSimulator;
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

        auto s = "1+2\n";
        auto antlrInput =
            new ANTLRInputStream(s);
        auto lexer = new ExprLexer(antlrInput);
        auto cts = new CommonTokenStream(lexer);
        cts.fill;

        int i;
        foreach (t; cts.getTokens) {
            writeln(cts.get(i++).to!string);
        }

        auto parser = new ExprParser(cts);
        // Specify entry point
        auto rootContext = parser.prog;
        auto pev = new PrintExprVisitor.PrintExprVisitor;
        auto res = pev.visit(rootContext);
        writefln("res = %s", res);
    }
}

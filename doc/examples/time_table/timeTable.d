import std.stdio;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.tree.ParseTreeWalker;
import TimeTableLexer;
import TimeTableParser;
import TimeTableBaseListener;

int main(string[] argv) {
    if (argv.length > 1) {
        File file = File(argv[1], "r");
        auto antlrInput = new ANTLRInputStream(file);
        auto lexer = new TimeTableLexer(antlrInput);
        auto cts = new CommonTokenStream(lexer);

        //writefln("------------------Token getNumberOfOnChannelTokens %s", cts.getNumberOfOnChannelTokens);
        //writefln("------------------Token 0 %s", cts.getTokens);

        // Pass the tokens to the parser
        TimeTableParser parser = new TimeTableParser(cts);
    
        // Specify our entry point
        writefln("------------------ start parser.linie");
        TimeTableParser.TimeTableParser.LinieContext progContext = parser.linie;
        writefln("------------------ new TimeTableBaseListener");
        auto baseLis = new TimeTableBaseListener;
        auto walker = new ParseTreeWalker;
        walker.walk(baseLis, progContext);
        return 0;
    }
    else {
        return -1;
    }
}


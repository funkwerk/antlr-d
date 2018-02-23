import std.stdio;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.tree.ParseTreeWalker;
import RuleTranslatorLexer;
import RuleTranslatorParser: RuleTranslatorParser;

int main(string[] argv) {
    if (argv.length > 1) {
        File file = File(argv[1], "r");
        auto antlrInput = new ANTLRInputStream(file);
        auto lexer = new RuleTranslatorLexer(antlrInput);
        auto cts = new CommonTokenStream(lexer);

        // Pass the tokens to the parser
        auto parser = new RuleTranslatorParser(cts);
        writefln("cts = %s", cts.getNumberOfOnChannelTokens);
        
        // // Specify our entry point
        auto progContext = parser.file_input;

        // auto baseLis = new modelListener;
        // auto walker = new ParseTreeWalker;
        // walker.walk(baseLis, progContext);
        return 0;
    }
    else {
        return -1;
    }
}


module ruleTranslator;

import RuleTranslatorLexer;
import RuleTranslatorParser: RuleTranslatorParser;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.tree.ParseTreeWalker;
import TTSListener;
import std.getopt;
import std.stdio;

string outputDir;
bool verbose;
enum Version {tts, iba};
Version grammar_version;

int main(string[] argv) {
    auto helpInformation = getopt(
                                  argv,
                                  "od", "Output directory name, otherwise print to standard output", &outputDir,
                                  "dsl-type|d", "DSL source type: tts (default) or iba", &grammar_version,
                                  "verbose|v", &verbose
                                  );

    if (helpInformation.helpWanted)
        {
            defaultGetoptPrinter("Combined Announcement-DSL to IBA-XML/Text-to-speech translator.\n",
                                 helpInformation.options);
            return 0;
        }
    if (argv.length > 1) {
        bool parserFailed = false;
        foreach(filename; argv[1..$])
            {
                writefln("Processing: %s", filename);
                auto antlrInput = new ANTLRInputStream(File(filename, "r"));
                auto lexer = new RuleTranslatorLexer(antlrInput);
                auto cts = new CommonTokenStream(lexer);

                // Pass the tokens to the parser
                auto parser = new RuleTranslatorParser(cts);
                if(verbose)
                    writefln("\tNumber of on channel tokens \t= %s.", cts.getNumberOfOnChannelTokens);

                // Specify our entry point
                auto rootContext = parser.file_input;
                
                if(!parser.getNumberOfSyntaxErrors)
                    {
                        // No syntax errors
                        auto baseListener = new TTSListener;
                        if(outputDir)
                            baseListener.setOutputFilename(outputDir);
                        auto walker = new ParseTreeWalker;
                        walker.walk(baseListener, rootContext);
                    }
                else
                    {
                        writefln("\t%s syntax errors", parser.getNumberOfSyntaxErrors);
                        parserFailed = true;
                    }
            }
        return parserFailed ? 1 : 0;
    }
    else {
        stderr.writeln("Error: missing DSL source");
        return 1;
    }
}

module ruleTranslator;

import RuleTranslatorLexer;
import RuleTranslatorParser: RuleTranslatorParser;
import RuleWriter: RuleWriter;
import TTSListener;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.tree.ParseTreeWalker;
import std.getopt;
import std.path;
import std.stdio;
import std.string;

string outputDir;
bool verbose;
string withPropertyName = "this";
string arguments;
enum Version {tts, iba};
Version grammar_version;

int main(string[] argv) {
    auto helpInformation = getopt(
                                  argv,
                                  "dsl-type|d", "DSL source type: tts (default) or iba", &grammar_version,
                                  "with|w", "the with (main) property", &withPropertyName,
                                  "arguments|a", "string of rule arguments", &arguments,
                                  "od", "Output directory name, otherwise print to standard output", &outputDir,
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
                if(verbose)
                    {
                        writefln("\nProcessing: %s as %s", filename, grammar_version);
                    }
                auto antlrInput = new ANTLRInputStream(File(filename, "r"));
                auto lexer = new RuleTranslatorLexer(antlrInput);
                auto cts = new CommonTokenStream(lexer);

                // Pass the tokens to the parser
                auto parser = new RuleTranslatorParser(cts);
                if(verbose) {
                    writefln("\tNumber of on channel tokens \t= %s.\n", cts.getNumberOfOnChannelTokens);
                    writefln("\ttokens:");
                    foreach(t; cts.getTokens)
                        writefln("\t\t%s", t);
                }

                // Specify our entry point
                auto rootContext = parser.file_input;

                if(!parser.getNumberOfSyntaxErrors)
                    {
                        // No syntax errors
                        auto base = baseName(filename);
                        auto outputName = base[0..lastIndexOf(base, '.')+1] ~ "d";
                        auto baseListener = new TTSListener;
                        auto writer = new RuleWriter;
                        if(outputDir)
                            {
                                writer.setOutputPath(outputDir);
                            }
                        writer.setOutputFilename(outputName);
                        baseListener.writer = writer;
                        baseListener.withPropertyName = withPropertyName;
                        baseListener.arguments = arguments;
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
        defaultGetoptPrinter("\nCommand line options", helpInformation.options);
        return 1;
    }
}

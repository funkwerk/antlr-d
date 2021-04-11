module TokenStreamRewriterTest;

import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.DiagnosticErrorListener;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.TokenStreamRewriter : TokenStreamRewriter;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.tree.ParseTreeWalker;
import dshould;
import RuleTranslatorLexer;
import RuleTranslatorParser: RuleTranslatorParser;
import RuleTranslatorBaseListener;
import std.array : join;
import std.conv : to;
import std.file;
import std.variant;
import unit_threaded : Tags;

auto input = [
    `# Text definition DEFAS`,
    `# for automatic announcements`,
    `# Version 2018-02-21`,

    `rule Delay as DELAY de`,
    `base de.Phrases`,

    `"Information zu"` ~ "\n"
    ];

string toString (in string[] source)
{
    return source.join("\n");
}

string getInput ()
{
    return(toString(input));
}


@Tags("TokenStreamRewriter")
@("replaceAll")
unittest
{
    class ReplaceAll : RuleTranslatorBaseListener
    {

        TokenStreamRewriter rewriter;
        Token firstToken;

        this(TokenStream tokens)
            {
                rewriter = new TokenStreamRewriter(tokens);
            }

        override public void enterFile_input(RuleTranslatorParser.File_inputContext ctx)
            {
                firstToken = ctx.start;
            }

        override public void exitStmt(RuleTranslatorParser.StmtContext ctx)
            {
                Variant parameter = "alpha";
                rewriter.replace(firstToken, ctx.stop, parameter);
            }
    }

    auto expected = "alpha";

    auto antlrInput = new ANTLRInputStream(getInput);
    auto lexer = new RuleTranslatorLexer(antlrInput);
    auto cts = new CommonTokenStream(lexer);
    cts.fill;
    auto parser = new RuleTranslatorParser(cts);
    // Specify entry point
    auto rootContext = parser.file_input;
    parser.numberOfSyntaxErrors.should.equal(0);
    auto extractor = new ReplaceAll(cts);
    auto walker = new ParseTreeWalker;
    walker.walk(extractor, rootContext);
    auto str = extractor.rewriter.getText.get!(string);
    str.should.equal(expected);
}


@Tags("TokenStreamRewriter")
@("replace_and_delete")
unittest
{
    class InsertTestListenerReplace : RuleTranslatorBaseListener
    {
        TokenStreamRewriter rewriter;

        this(TokenStream tokens)
            {
                rewriter = new TokenStreamRewriter(tokens);
            }

        override public void exitStmt(RuleTranslatorParser.StmtContext ctx)
            {
                rewriter.replace(ctx.start, ctx.stop, Variant("gamma"));
            }
    }

    auto expected = [
        "\nruleDelayasDELAYde",
        `basede.Phrases`,
        "gamma"
        ];

    auto antlrInput = new ANTLRInputStream(getInput);
    auto lexer = new RuleTranslatorLexer(antlrInput);
    auto cts = new CommonTokenStream(lexer);
    cts.fill;
    auto tokens = cts.getTokens;
    cts.getNumberOfOnChannelTokens.should.equal(15);
    auto parser = new RuleTranslatorParser(cts);
    // Specify entry point
    auto rootContext = parser.file_input;
    parser.numberOfSyntaxErrors.should.equal(0);
    auto extractor = new InsertTestListenerReplace(cts);
    auto walker = new ParseTreeWalker;
    walker.walk(extractor, rootContext);
    auto str = extractor.rewriter.getText.get!(string);

    str.should.equal(toString(expected));
    extractor.rewriter.deleteProgram;
    str = extractor.rewriter.getText.get!(string);
    expected = [
        "\nruleDelayasDELAYde",
        `basede.Phrases`,
        `"Information zu"` ~ "\n"
        ];
    str.should.equal(toString(expected));
}

@Tags("TokenStreamRewriter")
@("deleteT")
unittest
{
    class InsertTestListenerDelete : RuleTranslatorBaseListener
    {
        TokenStreamRewriter rewriter;

        this(TokenStream tokens)
            {
                rewriter = new TokenStreamRewriter(tokens);
            }

        override public void exitStmt(RuleTranslatorParser.StmtContext ctx)
            {
                rewriter.deleteT(ctx.start, ctx.stop);
            }
    }

    auto expected = [
        "\nruleDelayasDELAYde",
        "basede.Phrases\n"
        ];

    auto antlrInput = new ANTLRInputStream(getInput);
    auto lexer = new RuleTranslatorLexer(antlrInput);
    auto cts = new CommonTokenStream(lexer);
    cts.fill;
    auto tokens = cts.getTokens;
    cts.getNumberOfOnChannelTokens.should.equal(15);
    auto parser = new RuleTranslatorParser(cts);
    // Specify entry point
    auto rootContext = parser.file_input;
    parser.numberOfSyntaxErrors.should.equal(0);
    auto extractor = new InsertTestListenerDelete(cts);
    auto walker = new ParseTreeWalker;
    walker.walk(extractor, rootContext);
    auto str = extractor.rewriter.getText.get!(string);
    str.should.equal(toString(expected));
}

@Tags("TokenStreamRewriter")
@("insert after and before")
unittest
{
    class InsertTestListener : RuleTranslatorBaseListener
    {
        TokenStreamRewriter rewriter;

        this(TokenStream tokens)
            {
                rewriter = new TokenStreamRewriter(tokens);
            }

        override public void exitStmt(RuleTranslatorParser.StmtContext ctx)
            {
                Variant str_a = "alpha";
                Variant str_b = "beta";
                rewriter.insertBefore(ctx.start, str_a);
                rewriter.insertAfter(ctx.start, str_b);
            }
    }

    auto expected = [
        "\nruleDelayasDELAYde",
        `basede.Phrases`,
        `alpha"Information zu"beta` ~"\n",
        ];

    auto antlrInput = new ANTLRInputStream(getInput);
    auto lexer = new RuleTranslatorLexer(antlrInput);
    auto cts = new CommonTokenStream(lexer);
    cts.fill;
    auto tokens = cts.getTokens;
    cts.getNumberOfOnChannelTokens.should.equal(15);
    auto parser = new RuleTranslatorParser(cts);
    // Specify entry point
    auto rootContext = parser.file_input;
    parser.numberOfSyntaxErrors.should.equal(0);
    auto extractor = new InsertTestListener(cts);
    auto walker = new ParseTreeWalker;
    walker.walk(extractor, rootContext);
    auto str = extractor.rewriter.getText.get!(string);
    str.should.equal(toString(expected));
}

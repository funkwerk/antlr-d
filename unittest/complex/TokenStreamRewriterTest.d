module TokenStreamRewriterTest;

version(unittest) {

    import RuleTranslatorLexer;
    import RuleTranslatorParser: RuleTranslatorParser;
    import RuleTranslatorBaseListener;
    import antlr.v4.runtime.ANTLRInputStream;
    import antlr.v4.runtime.CommonToken;
    import antlr.v4.runtime.CommonTokenStream;
    import antlr.v4.runtime.TokenStream;
    import antlr.v4.runtime.DiagnosticErrorListener;
    import antlr.v4.runtime.LexerNoViableAltException;
    import antlr.v4.runtime.Token;
    import antlr.v4.runtime.TokenStreamRewriter : TokenStreamRewriter;
    import antlr.v4.runtime.atn.ParserATNSimulator;
    import antlr.v4.runtime.tree.ParseTreeWalker;
    import dshould : be, equal, not, should;
    import dshould.thrown;
    import std.conv : to;
    import std.stdio : File, writefln;
    import std.file;
    import std.variant;
    import unit_threaded;

    public class InsertTestListenerReplace : RuleTranslatorBaseListener {

        TokenStreamRewriter rewriter;

        this(TokenStream tokens)
        {
            rewriter = new TokenStreamRewriter(tokens);
        }
        /**
         * <p>The default implementation does nothing.</p>
         */
        override public void enterFile_input(RuleTranslatorParser.File_inputContext ctx) {
            writefln("enterFile");
        }
        /**
         * {@inheritDoc}
         *
         * <p>The default implementation does nothing.</p>
         */
        override public void exitStmt(RuleTranslatorParser.StmtContext ctx) {
            debug(TokenStreamRewriter) {
                import std.stdio : writefln;
                writefln("exitStmt ctx.start = %s", ctx.start);
            }
            Variant parameter = "gamma";
            rewriter.replace(ctx.start, ctx.stop, parameter);
        }
    }

    public class InsertTestListenerDelete : RuleTranslatorBaseListener {

        TokenStreamRewriter rewriter;

        this(TokenStream tokens)
        {
            rewriter = new TokenStreamRewriter(tokens);
        }
        /**
         * <p>The default implementation does nothing.</p>
         */
        override public void enterFile_input(RuleTranslatorParser.File_inputContext ctx) {
            writefln("enterFile");
        }

        /**
         * {@inheritDoc}
         *
         * <p>The default implementation does nothing.</p>
         */
        override public void exitStmt(RuleTranslatorParser.StmtContext ctx) {
            debug(TokenStreamRewriter) {
                import std.stdio : writefln;
                writefln("exitStmt ctx.start = %s", ctx.start);
            }
            rewriter.deleteT(ctx.start, ctx.stop);
        }
    }

    public class InsertTestListenerResult : RuleTranslatorBaseListener {

        struct Result { ushort indent; string text;}
        TokenStreamRewriter rewriter;

        this(TokenStream tokens)
        {
            rewriter = new TokenStreamRewriter(tokens);
        }

        /**
         * <p>The default implementation does nothing.</p>
         */
        override public void enterFile_input(RuleTranslatorParser.File_inputContext ctx) {
            writefln("enterFile");
        }
        /**
         * {@inheritDoc}
         *
         * <p>The default implementation does nothing.</p>
         */
        override public void exitStmt(RuleTranslatorParser.StmtContext ctx) {
            //auto str = "alpha";
            //rewriter.insertAfter(ctx.start, "beta");
            //rewriter.insertBefore(ctx.start, str);
        }
    }

    public class InsertTestListener : RuleTranslatorBaseListener {

        TokenStreamRewriter rewriter;

        this(TokenStream tokens)
        {
            rewriter = new TokenStreamRewriter(tokens);
        }
        /**
         * <p>The default implementation does nothing.</p>
         */
        override public void enterFile_input(RuleTranslatorParser.File_inputContext ctx) {
            writefln("enterFile");
        }
        /**
         * {@inheritDoc}struct Result { ushort indent; string text;}
         *
         * <p>The default implementation does nothing.</p>
         */
        override public void exitStmt(RuleTranslatorParser.StmtContext ctx) {
            Variant str_a = "alpha";
            Variant str_b = "beta";
            rewriter.insertAfter(ctx.start, str_b);
            rewriter.insertBefore(ctx.start, str_b);
        }
    }

    class Test {
        @Tags("TokenStreamRewriter")
        @("replace_and_delete")
        unittest {
            auto input =
                `# Text definition DEFAS
# for automatic announcements
# Version 2018-02-21

rule Delay as DELAY de
base de.Phrases

"Information zu"
`
                ;

            auto expected =
                `
ruleDelayasDELAYde
basede.Phrases
gamma`;

            auto antlrInput = new ANTLRInputStream(input);
            auto lexer = new RuleTranslatorLexer(antlrInput);
            auto cts = new CommonTokenStream(lexer);
            cts.fill;
            auto tokens = cts.getTokens;
            foreach (i, t; tokens) {
                writefln("token %s: %s", i, t);
            }
            cts.getNumberOfOnChannelTokens.should.equal(15);
            auto parser = new RuleTranslatorParser(cts);
            // Specify entry point
            auto rootContext = parser.file_input;
            parser.numberOfSyntaxErrors.should.equal(0);
            auto extractor = new InsertTestListenerReplace(cts);
            auto walker = new ParseTreeWalker;
            walker.walk(extractor, rootContext);
            auto str = extractor.rewriter.getText.get!(string);
            str.should.equal(expected);
            extractor.rewriter.deleteProgram;
            str = extractor.rewriter.getText.get!(string);
            expected =
                `
ruleDelayasDELAYde
basede.Phrases
"Information zu"
`;
            str.should.equal(expected);
        }

        @Tags("TokenStreamRewriter")
        @("insert after and before")
        unittest {
            auto input =
                `# Text definition DEFAS
# for automatic announcements
# Version 2018-02-21

rule Delay as DELAY de
base de.Phrases

"Information zu"
`
                ;

            auto expected =
                `
ruleDelayasDELAYde
basede.Phrases
alpha"Information zu"beta
`;

            auto antlrInput = new ANTLRInputStream(input);
            auto lexer = new RuleTranslatorLexer(antlrInput);
            auto cts = new CommonTokenStream(lexer);
            cts.fill;
            auto tokens = cts.getTokens;
            foreach (i, t; tokens) {
                writefln("token %s: %s", i, t);
            }
            cts.getNumberOfOnChannelTokens.should.equal(15);
            auto parser = new RuleTranslatorParser(cts);
            // Specify entry point
            auto rootContext = parser.file_input;
            parser.numberOfSyntaxErrors.should.equal(0);
            auto extractor = new InsertTestListener(cts);
            auto walker = new ParseTreeWalker;
            walker.walk(extractor, rootContext);
            auto str = extractor.rewriter.getText.get!(string);
            str.should.equal(expected);
        }
    }
    @Tags("TokenStreamRewriter")
        @("deleteT")
        unittest {
            auto input =
                `# Text definition DEFAS
# for automatic announcements
# Version 2018-02-21

rule Delay as DELAY de
base de.Phrases

"Information zu"
`
                ;

            auto expected =
                `
ruleDelayasDELAYde
basede.Phrases
`;

            auto antlrInput = new ANTLRInputStream(input);
            auto lexer = new RuleTranslatorLexer(antlrInput);
            auto cts = new CommonTokenStream(lexer);
            cts.fill;
            auto tokens = cts.getTokens;
            foreach (i, t; tokens) {
                writefln("token %s: %s", i, t);
            }
            cts.getNumberOfOnChannelTokens.should.equal(15);
            auto parser = new RuleTranslatorParser(cts);
            // Specify entry point
            auto rootContext = parser.file_input;
            parser.numberOfSyntaxErrors.should.equal(0);
            auto extractor = new InsertTestListenerDelete(cts);
            auto walker = new ParseTreeWalker;
            walker.walk(extractor, rootContext);
            auto str = extractor.rewriter.getText.get!(string);
            str.should.equal(expected);
        }
}

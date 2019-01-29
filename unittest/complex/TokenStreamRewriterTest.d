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
    import unit_threaded;

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
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	override public void exitStmt(RuleTranslatorParser.StmtContext ctx) {
            auto str = "alpha";
            rewriter.insertBefore(ctx.start, str);
            rewriter.insertAfter(ctx.start, "beta");
            writefln("exitStmt ctx.start = %s, %s", ctx.start, str);
        }
    }
        
    class Test {

        @Tags("TokenStreamRewriter")
        @("input is a simple rule")
        unittest {
            auto str =
                `# Text definition DEFAS
# for automatic announcements
# Version 2018-02-21

rule Delay as DELAY de

base de.Phrases

"Information zu"
`;

            auto antlrInput = new ANTLRInputStream(str);
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
            writefln(extractor.rewriter.getText);
            1.should.equal(9);
        }
    }
}

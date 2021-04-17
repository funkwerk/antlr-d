module CustomerTokenTest;

import RuleTranslatorLexer;
import RuleTranslatorParser: RuleTranslatorParser;
import RuleTranslatorBaseListener;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CommonTokenFactory;
import antlr.v4.runtime.TokenFactory;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.DiagnosticErrorListener;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.TokenStreamRewriter : TokenStreamRewriter;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.tree.ParseTreeWalker;
import dshould;
import std.conv : to;
import std.file;
import std.stdio : File, writefln;
import std.typecons;
import std.variant;

class ResultTokenFactory : CommonTokenFactory {
    CharStream input;

    this(CharStream input) {
        this.input = input;
    }

    override
    ResultToken create(int type, Variant text) {
        return new ResultToken(type, text);
    }

    override
    ResultToken create(TokenFactorySourcePair source, int type,
                       Variant text, int channel, size_t start, size_t stop,
                       int line, int charPositionInLine ) {
        auto t = new  ResultToken(source, type, channel,
                                  start, stop);
        t.setLine(line);
        t.setCharPositionInLine(charPositionInLine);
        t.srcName = input.getSourceName;
        return t;
    }
}

/**
 * A Token source with Result as additional attribute
 */

alias TokenFactorySourcePair = Tuple!(TokenSource, "a", CharStream, "b");

struct Result { ushort indent; string text;}
Result[] res;

ushort indent;

class ResultToken : CommonToken {

    public string srcName;

    this (int type, Variant text) {
        super(type, text);
    }

    this( TokenFactorySourcePair source, int type,
          int channel, size_t start, size_t stop) {
        super(source, type, channel, start, stop);
    }

    override string toString() {
        return srcName ~ ":" ~ super.toString;
    }

    override Variant getText() {
        return super.getText;
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
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitStmt(RuleTranslatorParser.StmtContext ctx) {
        debug(TokenStreamRewriter) {
            import std.stdio : writefln;
            writefln("exitStmt ctx.start = %s, ctx.stop = %s", ctx.start, ctx.stop);
        }
        rewriter.deleteT(ctx.start, ctx.stop);
    }
}

public class ResultListener : RuleTranslatorBaseListener {

    TokenStreamRewriter rewriter;

    this(TokenStream tokens)
    {
        rewriter = new TokenStreamRewriter(tokens);
    }
    /**
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFile_input(RuleTranslatorParser.File_inputContext ctx) {
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void exitStmt(RuleTranslatorParser.StmtContext ctx) {
        debug(TokenStreamRewriter) {
            import std.stdio : writefln;
            writefln("exitStmt ctx.start = %s, ctx.stop = %s", ctx.start, ctx.stop);
        }
        rewriter.deleteT(ctx.start, ctx.stop);
    }
}

@("add source name")
unittest
{
    auto expected =
        `
ruleDelayasDELAYde
basede.Phrases
`;
    auto antlrInput = new ANTLRInputStream(File("unittest/complex/rule.rul", "r"));
    auto lexer = new RuleTranslatorLexer(antlrInput);
    auto factory = new ResultTokenFactory(antlrInput);
    lexer.tokenFactory(factory);
    auto ln = lexer.getGrammarFileName;
    ln.should.equal("RuleTranslator.g4");
    auto cts = new CommonTokenStream(lexer);
    cts.fill;
    auto f = File("unittest/complex/customer_tokens.cmp");
    auto charRange = f.byLine();
    string s;
    int i;
    foreach (t; charRange) {
        s = cts.get(i++).to!string;
        s.should.equal(t);
    }
    f.close;
    auto parser = new RuleTranslatorParser(cts);
    parser.tokenFactory(factory);
    // Specify entry point
    auto rootContext = parser.file_input;
    parser.numberOfSyntaxErrors.should.be.equal(0);
    auto extractor = new InsertTestListenerDelete(cts);
    auto walker = new ParseTreeWalker;
    walker.walk(extractor, rootContext);
    auto str = extractor.rewriter.getText.get!(string);
    str.should.equal(expected);
}

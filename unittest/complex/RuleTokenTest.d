module RuleTokenTest;

import RuleTranslatorLexer;
import RuleTranslatorParser: RuleTranslatorParser;
import RuleTranslatorBaseListener;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CommonTokenFactory;
import antlr.v4.runtime.TokenFactory;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.TokenStreamRewriter : TokenStreamRewriter;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.tree.ParseTreeWalker;
import dshould : be, equal, not, should;
import dshould.thrown;
import std.conv : to;
import std.stdio : File, writefln;
import std.file;
import unit_threaded;
import std.typecons;
import std.variant;

class ResultTokenFactory : CommonTokenFactory {

    this(CharStream input) {
    }

    override
    ResultToken create(int type, Variant text) {
        return new ResultToken(type, text);
    }

    override
    ResultToken create(TokenFactorySourcePair source, int type,
                       Variant text, int channel, int start, int stop,
                       int line, int charPositionInLine ) {
        auto t = new  ResultToken(source, type, channel,
                                  start, stop);
        t.setLine(line);
        t.setCharPositionInLine(charPositionInLine);
        return t;
    }
}

/**
 * A Token source with Result as additional attribute
 */

alias TokenFactorySourcePair = Tuple!(TokenSource, "a", CharStream, "b");

struct Result { ushort indent; string text;}

ushort indent;

class ResultToken : CommonToken {

    public Result[] res;

    this (int type, Variant text) {
        super(type, text);
    }

    this( TokenFactorySourcePair source, int type,
          int channel, int start, int stop) {
        super(source, type, channel, start, stop);
        Result r;
        r.text = super.getText.to!string;
        res ~= r;
    }

    override string toString() {
        import std.format : format;
        return format("%s", res);
    }

    override Variant getText() {
        debug(TokenStreamRewriter) {
            import std.stdio;
            writefln("\ngetText: res = %s, type = %s", res, type);
        }
        Variant r = res;
        return r;
    }
}

public class ResultListener : RuleTranslatorBaseListener {

    private TokenStreamRewriter rewriter;

    private bool nextOfNewline = false;

    ushort indentText = 0;

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
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void visitTerminal(TerminalNode node) {
        debug (TokenStreamRewriter) {
            writefln("\nvisitTerminal -> \"%s\", node.symbol -> %s, indentText = %s",
                     node.getText,
                     node.getSymbol,
                     indentText
                     );
        }
        switch (node.getSymbol.getType) {

        case RuleTranslatorParser.INDENT:
            indentText++;
            break;
        case RuleTranslatorParser.DEDENT:
            indentText--;
            break;
        case RuleTranslatorParser.NEWLINE:
            nextOfNewline = true;
            import std.array : join;
            Result r;
            r.indent = indentText;
            break;
        case RuleTranslatorParser.EOF:
            debug(TokenStreamRewriter) {
                import std.stdio : writeln;
                writeln("\n+++ EOF +++");
            }
            break;
        default:
            debug(TokenStreamRewriter)
                writefln("\ndefault: node.getText.type = %s", node.getText.type);
            if (nextOfNewline) {
                auto r = node.getText.get!(Result[]);
                r[0].indent = indentText;
            }
            nextOfNewline = false;
            break;
        }
    }

}

@Tags("CustomerToken", "tt")
@("using result struct")
unittest {

    auto expected =
        `rule Delay as DELAY de
base de . Phrases
if a :
    "Information" "zu"
    "Zug" ZugNr "nach" "Berlin"
`;
    auto antlrInput = new ANTLRInputStream(File("unittest/complex/rule.rul", "r"));
    auto lexer = new RuleTranslatorLexer(antlrInput);
    auto factory = new ResultTokenFactory(antlrInput);
    lexer.tokenFactory(factory);
    auto ln = lexer.getGrammarFileName;
    auto cts = new CommonTokenStream(lexer);
    cts.fill;
    auto parser = new RuleTranslatorParser(cts);
    parser.tokenFactory(factory);
    // Specify entry point
    auto rootContext = parser.file_input;
    parser.numberOfSyntaxErrors.should.be.equal(0);
    auto extractor = new ResultListener(cts);
    auto walker = new ParseTreeWalker;
    walker.walk(extractor, rootContext);
    auto r = extractor.rewriter.getText.get!(Result[]);

    import std.array : appender;
    auto buf = appender!(string);
    auto nextOfNewline = false;

    foreach (i, s ; r) {
        auto t = cts.get(to!int(i));
        if (t.getType == RuleTranslatorParser.NEWLINE) {
            if (i)
                buf.put("\n");
            nextOfNewline = true;
            continue;
        }
        else if (t.getType == RuleTranslatorParser.INDENT ||
                 t.getType == RuleTranslatorParser.DEDENT) {
            continue;
        }
        else {
            if (nextOfNewline) {
                while (s.indent--)
                    buf.put("    ");
                buf.put(s.text);
            }
            else
                buf.put(" " ~ s.text);
            nextOfNewline = false;
        }
    }
    buf.data.should.equal(expected);
}

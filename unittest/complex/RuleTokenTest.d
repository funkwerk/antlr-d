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
import unit_threaded : Tags;

class ResultTokenFactory : CommonTokenFactory {

    this(CharStream input) {
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
        return t;
    }
}

/**
 * A Token source with Result as additional attribute
 */

alias TokenFactorySourcePair = Tuple!(TokenSource, "a", CharStream, "b");

struct Result { ushort indent; string text;}

ushort indent = 1; // 0 reserved for space

class ResultToken : CommonToken {

    public Result[] res;

    this (int type, Variant text) {
        super(type, text);
    }

    this( TokenFactorySourcePair source, int type,
          int channel, size_t start, size_t stop) {
        super(source, type, channel, start, stop);
        Result r;
        r.indent = 1;
        r.text = super.getText.to!string;
        res ~= r;
    }

    override string toString() {
        import std.format : format;
        return format("%s", res);
    }

    override Variant getText() {
        Variant r = res;
        return r;
    }
}

public class ResultListener : RuleTranslatorBaseListener {

    private TokenStreamRewriter rewriter;

    private bool nextOfNewline = false;

    ushort indentText = 1;

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
     *
     * <p>The default implementation does nothing.</p>
     */
    override public void enterFunct_stmt(RuleTranslatorParser.Funct_stmtContext ctx) {
        Result[] newText;
        Result r;
        r. indent = 2;
        r. text = `zug_function_number 3`;
        newText ~= r;
        r. indent = 3;
        r. text = `"von"`;
        newText ~= r;
        r. indent = 2;
        r. text = `"nach"`;
        newText ~= r;
        Variant v = newText;
        rewriter.replace(ctx.start, ctx.stop, v);
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
            auto r = node.getText.get!(Result[]);
            r[0].text = "";
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
unittest
{
    auto expected =
        `rule Delay as DELAY de
base de . Phrases
if a :
    "Information" "zu"
    "Zug"
    zug_function_number 3
        "von"
    "nach"
"Berlin"
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

    import std.array : appender;
    auto buf = appender!(string);

    import std.stdio;

    auto r = extractor.rewriter.getText.get!(Result[]);
    bool firstOnLine = true;

    foreach (i, el; r)
        {
            import std.string : strip;
            if (!i)
                continue;

            if (el.text == "\n") {
                firstOnLine = true;
                buf.put("\n");
                continue;
            }

            if (el.indent >1) {
                buf.put("\n");
                while (--el.indent)
                    buf.put("    ");
                buf.put(el.text);
            }
            else {
                if (firstOnLine) {
                    if (el.text.strip.length) {
                        buf.put(el.text);
                    }
                    else {
                        // DEDENT
                        firstOnLine = true;
                        continue;
                    }
                    firstOnLine = false;
                }
                else {
                    if (el.text.strip.length)
                        buf.put(" " ~ el.text.strip);
                }
            }
        }
    buf.data.should.equal(expected);
}

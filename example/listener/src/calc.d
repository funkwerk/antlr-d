module calc;

import antlr.v4.runtime.tree.ParseTree;
import antlr.v4.runtime.tree.ParseTreeProperty;
import antlr.v4.runtime.tree.ParseTreeWalker;
import ExprBaseListener : BaseListener = ExprBaseListener;
import ExprLexer : Lexer = ExprLexer;
import ExprParser : Parser = ExprParser;
import std.range;
import std.stdio;

version (unittest) import dshould;

void eval(File file)
{
    with (Setup(file))
    {
        auto ctx = parser.expr;

        if (parser.numberOfSyntaxErrors == 0)
        {
            walker.walk(listener, ctx);
            writeln(listener.getValue(ctx));
        }
    }
}

struct Setup
{
    Parser parser;

    Listener listener;

    ParseTreeWalker walker;

    this(T)(T input)
    {
        import antlr.v4.runtime.ANTLRInputStream : ANTLRInputStream;
        import antlr.v4.runtime.CommonTokenStream : CommonTokenStream;

        auto inputStream = new ANTLRInputStream(input);
        auto lexer = new Lexer(inputStream);
        auto commonTokenStream = new CommonTokenStream(lexer);

        parser = new Parser(commonTokenStream);
        listener = new Listener;
        walker = new ParseTreeWalker;
    }
}

class Listener : BaseListener
{
    ParseTreeProperty!int values;

    this()
    {
        values = new ParseTreeProperty!int;
    }

    override void exitLiteral(Parser.LiteralContext ctx)
    {
        import std.conv : to;

        putValue(ctx, ctx.INT.getText.get!string.to!int);
    }

    override void exitParens(Parser.ParensContext ctx)
    {
        putValue(ctx, getValue(ctx.expr));
    }

    override void exitBinaryExpr(Parser.BinaryExprContext ctx)
    {
        const lhs = getValue(ctx.lhs);
        const rhs = getValue(ctx.rhs);

        if (ctx.op.getText == "+")
            putValue(ctx, lhs + rhs);
        else if (ctx.op.getText == "-")
            putValue(ctx, lhs - rhs);
        else if (ctx.op.getText == "*")
            putValue(ctx, lhs * rhs);
        else if (ctx.op.getText == "/")
            putValue(ctx, lhs / rhs);
        else
            assert(0);
    }

    void putValue(ParseTree node, int value)
    {
        values.put(node, value);
    }

    int getValue(ParseTree node)
    {
        return values.get(node);
    }
}

@("evaluate expression")
unittest
{
    with (Setup("1 + 2 * 3"))
    {
        auto ctx = parser.expr;

        parser.numberOfSyntaxErrors.should.equal(0);
        walker.walk(listener, ctx);
        listener.getValue(ctx).should.equal(7);
    }
}

@("evaluate expression with parentheses")
unittest
{
    with (Setup("(1 + 2) * 3"))
    {
        auto ctx = parser.expr;

        parser.numberOfSyntaxErrors.should.equal(0);
        walker.walk(listener, ctx);
        listener.getValue(ctx).should.equal(9);
    }
}

@("evaluate invalid expression")
unittest
{
    with (Setup("1 + * 3"))
    {
        auto errorListener = new TestErrorListener;

        parser.addErrorListener(errorListener);

        auto ctx = parser.expr;

        parser.numberOfSyntaxErrors.should.equal(1);
        errorListener.msg.should.equal("extraneous input '*' expecting {'(', INT}");
    }
}

version (unittest)
{
    import antlr.v4.runtime.BaseErrorListener;
    import antlr.v4.runtime.InterfaceRecognizer;
    import antlr.v4.runtime.RecognitionException;

    class TestErrorListener : BaseErrorListener
    {
        string msg;

        override void syntaxError(InterfaceRecognizer recognizer, Object offendingSymbol, int line,
            int charPositionInLine, string msg, RecognitionException e)
        {
            this.msg = msg;
        }
    }
}

module calc;

import ExprBaseVisitor : BaseVisitor = ExprBaseVisitor;
import ExprLexer : Lexer = ExprLexer;
import ExprParser : Parser = ExprParser;
import std.stdio;
import std.variant;

version (unittest) import dshould;

void eval(File file)
{
    with (Setup(file))
    {
        auto ctx = parser.expr;

        if (parser.numberOfSyntaxErrors == 0)
        {
            const result = visitor.visit(ctx);

            writeln(result.get!int);
        }
    }
}

struct Setup
{
    Parser parser;

    Visitor visitor;

    this(T)(T input)
    {
        import antlr.v4.runtime.ANTLRInputStream : ANTLRInputStream;
        import antlr.v4.runtime.CommonTokenStream : CommonTokenStream;

        auto inputStream = new ANTLRInputStream(input);
        auto lexer = new Lexer(inputStream);
        auto commonTokenStream = new CommonTokenStream(lexer);

        parser = new Parser(commonTokenStream);
        visitor = new Visitor;
    }
}

class Visitor : BaseVisitor
{
    override Variant visitLiteral(Parser.LiteralContext ctx)
    {
        import std.conv : to;

        return Variant(ctx.INT.getText.get!string.to!int);
    }

    override Variant visitBinaryExpr(Parser.BinaryExprContext ctx)
    {
        auto lhs = visit(ctx.lhs);
        auto rhs = visit(ctx.rhs);

        if (ctx.op.getText == "+")
            return Variant(lhs + rhs);
        if (ctx.op.getText == "-")
            return Variant(lhs - rhs);
        if (ctx.op.getText == "*")
            return Variant(lhs * rhs);
        if (ctx.op.getText == "/")
            return Variant(lhs / rhs);
        assert(0);
    }

    override Variant visitParens(Parser.ParensContext ctx)
    {
        return visit(ctx.expr);
    }

}

@("evaluate expression")
unittest
{
    with (Setup("1 + 2 * 3"))
    {
        auto ctx = parser.expr;

        parser.numberOfSyntaxErrors.should.equal(0);

        const result = visitor.visit(ctx).get!int;

        result.should.equal(7);
    }
}

@("evaluate expression with parentheses")
unittest
{
    with (Setup("(1 + 2) * 3"))
    {
        auto ctx = parser.expr;

        parser.numberOfSyntaxErrors.should.equal(0);

        const result = visitor.visit(ctx).get!int;

        result.should.equal(9);
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

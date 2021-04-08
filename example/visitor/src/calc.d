module calc;

import ExprBaseVisitor : BaseVisitor = ExprBaseVisitor;
import ExprLexer : Lexer = ExprLexer;
import ExprParser : Parser = ExprParser;
import std.stdio;
import std.variant;

void eval(File file)
{
    auto context = parser(file).expr;
    auto visitor = new Visitor;
    auto result = visitor.visit(context);

    writeln(result);
}

Parser parser(File file)
{
    import antlr.v4.runtime.ANTLRInputStream : ANTLRInputStream;
    import antlr.v4.runtime.CommonTokenStream : CommonTokenStream;

    auto inputStream = new ANTLRInputStream(file);
    auto lexer = new Lexer(inputStream);
    auto commonTokenStream = new CommonTokenStream(lexer);

    return new Parser(commonTokenStream);
}

class Visitor : BaseVisitor
{
    override Variant visitExpr(Parser.ExprContext ctx)
    {
        import std.conv : to;

        if (auto op = ctx.op)
        {
            auto lhs = visit(ctx.lhs);
            auto rhs = visit(ctx.rhs);

            if (op.getText == "+")
                return Variant(lhs + rhs);
            if (op.getText == "-")
                return Variant(lhs - rhs);
            if (op.getText == "*")
                return Variant(lhs * rhs);
            if (op.getText == "/")
                return Variant(lhs / rhs);
        }
        else if (auto number = ctx.INT)
            return Variant(number.getText.get!string.to!int);
        return visitChildren(ctx);
    }
}

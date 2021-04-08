module calc;

import ExprBaseListener : BaseListener = ExprBaseListener;
import ExprLexer : Lexer = ExprLexer;
import ExprParser : Parser = ExprParser;
import std.range;
import std.stdio;

void eval(File file)
{
    import antlr.v4.runtime.tree.ParseTreeWalker : ParseTreeWalker;

    auto context = parser(file).expr;
    auto listener = new Listener;
    auto walker = new ParseTreeWalker;

    walker.walk(listener, context);
    if (!listener.stack.empty)
        writeln(listener.stack.back);
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

class Listener : BaseListener
{
    int[] stack;

    override void exitExpr(Parser.ExprContext ctx)
    {
        import std.conv : to;

        if (auto op = ctx.op)
        {
            const lhs = stack.back;

            stack.popBack;

            const rhs = stack.back;

            stack.popBack;

            if (op.getText == "+")
                stack ~= lhs + rhs;
            else if (op.getText == "-")
                stack ~= lhs - rhs;
            else if (op.getText == "*")
                stack ~= lhs * rhs;
            else if (op.getText == "/")
                stack ~= lhs / rhs;
        }
        else if (auto number = ctx.INT)
            stack ~= number.getText.get!string.to!int;
    }
}

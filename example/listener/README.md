## Building a Calculator Using a Listener

Use ANTLR to generate the parser for the grammar [Expr.g4].
Generate D code (`-Dlanguage=D`) in the source directory (`-o src`).

    antlr4 -Dlanguage=D -o src Expr.g4

You need [src/main.d] and [src/calc.d] to set up the parser
and to provide a listener implementation that evaluates arithmetic expressions.

Use [dub] to run, build, or test the application. For example:

    dub run -- test.expr
    echo '1 + 2 * 3' | dub run

Or build the application and then run it:

    dub build
    ./expr test.expr
    echo '1 + 2 * 3' | ./expr

If you want to see all the ANTLR debug output, build the application like this:

    dub build --build=antlr-debug

Build a unittest runner and let it run:

    dub test

[dub]: http://code.dlang.org/
[expr.g4]: Expr.g4
[src/calc.d]: src/calc.d
[src/main.d]: src/main.d

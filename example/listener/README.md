## Building a Calculator Using a Listener

Use ANTLR to generate the parser for the grammar [Expr.g4].
Generate D code (`-Dlanguage=D`) in the source directory (`-o src`).

    antlr4 -Dlanguage=D -o src Expr.g4

You need [src/main.d] and [src/calc.d] to set up the parser
and to provide a listener implementation that evaluates arithmetic expressions.

Use dub to build the application.
Do not build a debug version (for example, `--build=release`) to avoid unwanted output.

    dub build --build=release

Run the application like this:

    ./expr test
    echo '1 + 2 * 3' | ./expr

[expr.g4]: Expr.g4
[src/calc.d]: src/calc.d
[src/main.d]: src/main.d

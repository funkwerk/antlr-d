# Antlr4DTarget
The Antlr4DTarget presents an full featured and tested port of ANTLR 4.

This covers the runtime library, the tool to translate the syntax  into D code and the tests for the runtime library. See also [ANTLR version 4.7.3](http://www.antlr.org/) yet.

This D port of ANTLR 4 handle UTF-8 characters as input stream.

## Install
1. Download or clone the package
2. Change directory to the root of the package and call __dub__.
3. You will find the generated ATLR D runtime library in lib/libantlr-d.a
4. The ANTLR tool for D will generated be by __make build_examples__ (__./build.ps1 build_examples__ on windows)  
   in build/antlr4-4.7.2/tool/target/antlr4-4.7.2-complete.jar
### Dependencies
#### ANTLR tool
- java 1.8
- maven
- 7-Zip (Only on windows)
## Example
Put the

    grammar Expr;
    prog:	(expr NEWLINE)* ;
    expr:	expr ('*'|'/') expr
        |	expr ('+'|'-') expr
        |	INT
        |	'(' expr ')'
        ;
    NEWLINE : [\r\n]+ ;
    INT : [0-9]+ ;

in the file Expr.g4.

Now call

    java -jar -Dlanguage=D build/antlr4-4.7.2/tool/target/antlr4-4.7.2-complete.jar Expr.g4

and the correspondig Lexer, Parser and Listener D-Source files are generated. Use the
the _-visitor_ option in cli

    java -jar -visitor -Dlanguage=D build/antlr4-4.7.2/tool/target/antlr4-4.7.2-complete.jar Expr.g4

and additional ExprVisitor.d and ExprBaseVisitor.d sources are created.

## Externsion to other ANTLR runtime versions

The data type to store text is Variant. This is handy for the rewriting feature on an indent-based syntax like Python. In this case we need a structure representing the text as well as the number of indents.

## Restrictions
- not ported to the last version of antlr 4.8

# Antlr4DTarget
The D runtime library for ANTLR 4, mainly an adaption of original Java runtime library.

This Software is under development but tested on different grammars of [ANTLR
version 4.7.2](http://www.antlr.org/) yet.
This D version of ANTLR 4 supports UTF-8 character streams.
## Install
1. Download or clone the package
2. Change directory to the root of the package and call __dub__.
3. You will find the generated ATLR D runtime library in lib/libantlr-d.a
4. The ANTLR tool for D will generated by __make build_examples__ (__./build.ps1 build_examples__ on windows)  
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

and additional ExprVisitor.d and ExprBaseVisitor.d sources will be created.


## Restrictions
- ANTLR based tests not finished

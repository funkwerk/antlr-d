﻿# Antlr4DTarget
The D runtime library for ANTLR 4, mainly a adaption of original Java runtime library.

This Software is under development but tested on different grammars of [ANTLR
version 4.7.1](http://www.antlr.org/) yet.
## Install
1. Download or clone the package
2. Change directory to the root of the package and call __dub__.
3. You will find the generated ATLR D runtime library in lib/libantlr-d.a
4. The ANTLR tool for D will generated by __make build_examples__  
   in build/antlr4-4.7.1/tool/target/antlr4-4.7.1-complete.jar
### Dependencies
#### D runtime
- dshould 0.1
- unit-threaded 0.7.50
#### ANTLR tool
- java 1.8
- maven
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

    java -jar -Dlanguage=D build/antlr4-4.7.1/tool/target/antlr4-4.7.1-complete.jar Expr.g4

and the correspondig Lexer, Parser and Listener D-Source files are generated.
## Restrictions
- UTF-16 support not finished

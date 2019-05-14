grammar Expr;
prog:	(expr NEWLINE)* ;
expr:	expr '/' expr  # Div
    |   expr '*' expr  # Mul
    |	expr '-' expr  # Sub
    |   expr '+' expr  # Add
    |	INT            # Int
    |	'(' expr ')'   # BracketExpr
    ;
NEWLINE : [\r\n]+ ;
INT     : [0-9]+ ;

grammar Expr;

expr: lhs=expr op=('*'|'/') rhs=expr  # binaryExpr
    | lhs=expr op=('+'|'-') rhs=expr  # binaryExpr
    | INT                             # literal
    | '(' expr ')'                    # parens
    ;

INT : [0-9]+ ;

WS  : [ \t\r\n] -> skip ;

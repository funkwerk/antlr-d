grammar Expr;

expr:	lhs=expr op=('*'|'/') rhs=expr
    |	lhs=expr op=('+'|'-') rhs=expr
    |	INT
    |	'(' expr ')'
    ;

INT : [0-9]+ ;

WS  : [ \t\r\n] -> skip ;

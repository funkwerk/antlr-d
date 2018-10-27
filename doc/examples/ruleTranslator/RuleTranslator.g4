grammar RuleTranslator;
// mainly a modified python syntax

options {
    language=D;
}

import RuleLexer;

tokens {
    INDENT,
    DEDENT
}

@parser::members {public static bool isTTS;}

/*
 * parser rules
 */

file_input: rule_setting
            import_stmts
            (NEWLINE | funcdef)*
            (NEWLINE | ruledef?)
            EOF;

ruledef: stmt+;

import_stmts: import_stmt*;

rule_setting: NEWLINE* RULE (class_name AS)? rule_name language;

class_name : NAME;
rule_name : NAME;
language : NAME;

import_stmt: NEWLINE* BASE language ('.' base_rules)?;
base_rules : NAME;

//
funcdef: DEF functionName
          parameters ':' suite;

functionName: NAME;

parameters: '(' (typedargslist)? ')';
typedargslist: tfpdef (',' tfpdef)*;
tfpdef:
        dotted_name # tfpdef_name
      | NUMBER      # tfpdef_number
      | STRING      # tfpdef_string
      | funct_stmt  # tfpdef_funct_stm
      ;

// Suite
suite: simple_stmt | NEWLINE INDENT stmt+ DEDENT;
stmt: (simple_stmt | compound_stmt |flow_stmt);
simple_stmt: small_stmt+ NEWLINE;

small_stmt: (
    string_stmt
    |var_stmt
    |funct_stmt
);

string_stmt: STRING;

funct_stmt: funct_name funct_parameters (dot_e funct_stmt)*;
funct_name: NAME;
dot_e : DOT;
funct_parameters: parameters;

var_stmt: first_part_of_dotted_name (dot_e funct_stmt)?;

// For normal and annotated assignments, additional restrictions enforced
// by the interpreter
flow_stmt: break_stmt | continue_stmt;
break_stmt: 'break';
continue_stmt: 'continue';

dotted_as_name: dotted_name ('as' NAME)?;
dotted_as_names: dotted_as_name (',' dotted_as_name)*;
dotted_name: dotted_name_first_part ('.' dotted_name_part)*;
dotted_name_first_part : first_part_of_dotted_name trailer*;
dotted_name_part : NAME trailer*;
first_part_of_dotted_name: NAME;

compound_stmt: if_stmt | for_stmt | with_stmt | block_stmt;

// IF
if_stmt: if_condition_and_suite (elif_condition_and_suite)*
            (else_and_suite)?;

if_condition_and_suite: IF condition_and_suite;
elif_condition_and_suite:elif_e condition_and_suite;
else_and_suite: else_e COLON suite;

condition_and_suite :
           condition COLON suite;

condition:  open_paren test close_paren reduced_comperator atom  # condition_with_value
           | not? open_paren test close_paren     # condition_without_value
           | {isTTS}? test                        # condition_only
           ;
open_paren  : OPEN_PAREN;
close_paren : CLOSE_PAREN;

reduced_comperator: EQUALS     # r_equals
                   |NOT_EQ_1   # r_not_equal
                   |NOT_EQ_2   # r_not_equal
                   ;

elif_e: ELIF;
else_e: ELSE;

//
for_stmt: FOR for_exprlist IN for_testlist COLON suite (ELSE COLON suite)?;
for_testlist: testlist;
for_exprlist: exprlist;

// BLOCK
block_stmt: BLOCK COLON block_suite;

block_suite: NEWLINE INDENT simple_stmt+ DEDENT;

with_stmt: 'with' with_item (',' with_item)*  ':' suite;
with_item: test ('as' expr)?;

test: and_test (or_e and_test)*;
or_e: OR;
and_test: not_test (and_e not_test)*;
and_e: AND;
not_test: not not_test | comparison;
not: NOT;
comparison: expr (comp_op expr)*;

comp_op: LESS_THAN      # less_than
       |GREATER_THAN    # greater_than
       |EQUALS          # equals
       |GT_EQ           # greater_equal
       |LT_EQ           # less_equal
       |NOT_EQ_1        # not_equal
       |NOT_EQ_2        # not_equal
       ;

expr: xor_expr ('|' xor_expr)* | dotted_name;
xor_expr: and_expr ('^' and_expr)*;
and_expr: arith_expr ('&' arith_expr)*;
arith_expr: term ((add|minus) term)*;
term: factor (('*'|'@'|'/'|'%'|'//') factor)*;
factor: ('+'|'-'|'~') factor | atom;

atom:
      dotted_name   # atom_dotted_name
    | funct_stmt    # atom_funct_stmt
    | NUMBER        # number_e
    | STRING        # string_e
    | TRUE          # true_e
    | FALSE         # false_e
    | LAST          # last_e
    | FIRST         # first_e
    ;

add: ADD;
minus:MINUS;

testlist_comp: (test) ( (',' (test))* (',')? );
trailer: '[' subscriptlist ']' ;
subscriptlist: subscript (',' subscript)* (',')?;
subscript: test | (test)? ':' (test)? (sliceop)?;
sliceop: ':' (test)?;
exprlist: (expr) (',' (expr))* (',')?;
testlist: test (',' test)* (',')?;
dictorsetmaker: ( ((test ':' test | '**' expr)
                   ((',' (test ':' test | '**' expr))* (',')?)) |
                  ((test)
                   ((',' (test))* (',')?)) );

arglist: argument (',' argument)*  (',')?;

// The reason that keywords are test nodes instead of NAME is that using NAME
// results in an ambiguity. ast.c makes sure it's a NAME.
// "test '=' test" is really "keyword '=' test", but we have no such token.
// These need to be in a single rule to avoid grammar that is ambiguous
// to our LL(1) parser. Even though 'test' includes '*expr' in star_expr,
// we explicitly match '*' here, too, to give it proper precedence.
// Illegal combinations and orderings are blocked in ast.c:
// multiple (test comp_for) arguments are blocked; keyword unpackings
// that precede iterable unpackings are blocked; etc.

argument: test;

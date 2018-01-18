// Grammar for reduced time tables
// NSS-Format - Regionalverkehr der S-Bahn Berlin

grammar TimeTable;

linie : LINIE DELI ID
        gueltig_vom
        gueltig_bis
        liniendefinition+
        verkehrstag_legende?
        EOF ;

gueltig_vom : VOM DATUM ;
gueltig_bis : BIS DATUM ;

liniendefinition :  LINIENVERLAUF DELI
                    start
                    linien_teil+
                    default_zuglaenge
                    default_gleis
                    fahrten ;
fahrten : fahrt+;
linien_teil : verkehrstagesschluessel
              vias?
              ziel ;

fahrt :  FAHRT DELI NUMBER
            ((ankunftszeit? abfahrtszeit)
             | (ankunftszeit abfahrtszeit?)
            )+
            zuglaenge?
            gleis? ;

station : station_id text? ;
station_id : ID ;
text : TEXT ;
start : START DELI station ;
ziel  : ZIEL DELI station ;
via : station ;
vias : VIA DELI via (COMMA via)* ;
default_zuglaenge : zuglaenge ;
default_gleis : gleis ;

verkehrstag_legende :
            LEGENDE DELI (
                          days
                         | date_expression
                         )+ ;

condition : (FAEHRT | NICHT | AUCH | VOR | NACH);

datum : DATUM ;
day : DAY ;
wochenfeiertag : WOCHENFEIERTAG ;
date : datum | day | wochenfeiertag ;
cond_date : condition date
          (COMMA date)*;

range_of_days : FAEHRT? DAY BIS DAY;
days : date_key_legend DELI range_of_days (COMMA cond_date)* ;

date_expression : date_key_legend DELI cond_date (COMMA cond_date)* ;

date_key_legend : date_key ;

date_key: ID | KEY | NUMBER ;

gleis : GLEIS DELI (NUMBER | date_key) ;

zuglaenge : ZUGLAENGE DELI NUMBER ;

verkehrstagesschluessel  : VERKEHRSTAGESSCHLUESSEL DELI date_key ;

ankunftszeit : ANKUNFTSZEIT
               DELI ZEIT
               (IN station_id)? ; // default Ausgangsbahnhof
abfahrtszeit : ABFAHRTSZEIT
               DELI ZEIT
               (IN station_id)? ; // default Ausgangsbahnhof

SINGLE_LINE_COMMENT
  : ('//' Input_character*) -> channel(HIDDEN)
  ;
fragment Input_characters
  : Input_character+
  ;
fragment Input_character
  //'<Any unicode character except a NEW_LINE_CHARACTER>'
  : ~([\u000D\u000A\u0085\u2028\u2029]) ;

DELIMITED_COMMENT
  : ('/*' Delimited_comment_section* Asterisks '/') -> channel(HIDDEN)
  ;
fragment Delimited_comment_section
  : '/'
  | Asterisks? Not_slash_or_asterisk
  ;
fragment Asterisks
  : '*'+
  ;
//'<Any Unicode Character Except / Or *>'
fragment Not_slash_or_asterisk
  : ~( '/' | '*' )
  ;

// Tokens
ANKUNFTSZEIT : 'Ankunftszeit' ;
ABFAHRTSZEIT : 'Abfahrtszeit' ;
LINIE : 'Linie' ;
LINIENVERLAUF : 'Linienverlauf' ;
START : 'Start' ;
ZIEL : 'Ziel' ;
VIA : 'Via' ;
FAHRT : 'Fahrt' ;
LEGENDE : 'Legende' ;
DELI : ':' ;
AUCH : 'auch' ;
NICHT : 'nicht' ;
VOR : 'vor' ;
NACH : 'nach' ;
GUELTIG : 'gueltig' -> skip ;
FAEHRT : 'faehrt' ;
VOM : 'vom' ;
BIS : 'bis' ;
IN : 'in' ;
DAY : ('Montag' | 'Dienstag' | 'Mittwoch' | 'Donnerstag' |
       'Freitag' | 'Samstag' |'Sonntag');
DATUM : [0-3]? [0-9] '.' [0-1]? [0-9] '.20' [1-9] [0-9] ;
WOCHENFEIERTAG : 'Wochenfeiertag' ;
VERKEHRSTAGESSCHLUESSEL : 'Verkehrstagesschluessel' ;
GLEIS: 'Gleis' ;
ZUGLAENGE : 'Zuglaenge' ;
AM   : 'am' -> skip ; // only for better sentence
DEM   : 'dem' -> skip ; // only for better sentence
ZEIT : [1-2]* [0-9] '.' [0-5] [0-9] [0-9]* ;
NUMBER : [1-9] [0-9]* ;
fragment NAME_CHAR : ([A-Z] | [a-z] | [0-9]) ;
ID : NAME_CHAR+ ;
KEY : NAME_CHAR+
      (
        NAME_CHAR
        | '*' | '/' | '-' | '+'
        | OPEN_PARENS NAME_CHAR+ CLOSE_PARENS
      )*;
fragment TEXTF : NAME_CHAR | ' ' | '-' ;
TEXT : '"' NAME_CHAR (TEXTF)* '"';
COMMA : ',' ;
fragment OPEN_PARENS : '(' ;
fragment CLOSE_PARENS : ')' ;
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines

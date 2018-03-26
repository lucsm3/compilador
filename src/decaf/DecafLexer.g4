lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

TK_CLASS: 'class program';
LCURLY : '{';
RCURLY : '}';

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
		

CHARLITERAL: '\'' (' '..'!' | '#'..'&' | '('..'[' | ']'..'~' |ESC) '\'';

ID :
  ('a'..'z' | 'A'..'Z' | '0'..'9'|'_')+;

fragment
ESC :  '\\' ('n'|'t'|'\\'|'"');

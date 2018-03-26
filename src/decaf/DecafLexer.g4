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

ID  :
  ('a'..'z' | 'A'..'Z')+;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;


CHARLITERAL: '\'' (' '..'!' | '#'..'&' | '('..'[' | ']'..'~' |ESC) '\'';


fragment
ESC :  '\\' ('n'|'t'|'\\'|'"');

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

OP_MAT: ('+' | '*' | '/' |'%');

OP:('&&'|'<'|'>'|'>='|'<='|'=='|'!='|'||'|'&&');

WS_ : (' ' | '\n' | '\t') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
		
NUMBER: ('0'..'9')+;

LETTER: ('A'..'Z'|'a'..'z')+

STRINGLITERAL: "\""(ESC|ID|OP_MAT|CHARLITERAL|' '| ','|'.'|';'|':'|'?'|'!'|'\\'|',' ~('"')|NUMBER)*"\"";

CHARLITERAL: '\'' (' '..'!' | '#'..'&' | '('..'[' | ']'..'~' |ESC) '\'';

ID :
  ('-'LETTER)(LETTER|DIGIT)+;

NEGATIVO:('-');

fragment
ESC :  '\\' ('n'|'t'|'\\'|'"');

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

LETTER: ('A'..'Z'|'a'..'z')+;

STRINGLITERAL: '"' (ESC|ID|OP_MAT|' '|','|'.'|';'|':'|'?'|'!'|'\\'|',' ~('"')|NUMBER)* '"';

HEXADECIMAL: '0x' ('0..9'|'a'..'f'|'A'..'F')+;

CHARLITERAL: '\'' (' '..'!' | '#'..'&' | '('..'[' | ']'..'~' |ESC) '\'';

PV: ';';

VIRGULA: ',';

PE: '!';

P_RESERVADAS: ('if'|'else'|'callout'|'class'|'int'|'return'|'true'|'void'|'for'|'false'|'boolean'|'break'|'continue');

ID :
  ('-'LETTER)(LETTER|NUMBER)+;

NEGATIVO:('-');

fragment
ESC :  '\\' ('n'|'t'|'\\'|'"');

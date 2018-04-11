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

INT : 'int';

BOOLEAN: 'boolean';

IF: 'if';

ELSE: 'else';

FOR: 'for';

RETURN: 'return';

BREAK: 'break';

VOID: 'void';

CONTINUE: 'continue';

CALLOUT: 'callout';

TRUE: 'true';

FALSE: 'false';

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
		
NUMBER: ('0'..'9')+;

LETTER: ('A'..'Z'|'a'..'z')+;

STRINGLITERAL:  '"'(ID|OP_MAT|CHAR|CHARLITERAL)* '"';

HEXDIGIT: (NUMBER|'a'|'b'|'c'|'d'|'e'|'f'|'A'|'B'|'C'|'D'|'E'|'F');

HEXADECIMAL: '0x' (HEXDIGIT)(HEXDIGIT)*;

CHAR: (' '..'!' | '#'..'&' | '('..'[' | ']'..'~' |ESC);

CHARLITERAL: '\''CHAR'\'';

PV: ';';

VIRGULA: ',';

PE: '!';

ID : ('-'LETTER)(LETTER|NUMBER)*;

NEGATIVO:('-');

fragment
ESC :  '\\' ('n'|'t'|'\\'|'"');

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

OP_MAT: ('+'|'*'|'/'|'%');

OP:('&&'|'<'|'>'|'>='|'<='|'=='|'!='|'||');

CHARLITERAL: '\''(ESC|'a'..'z'|'A'..'Z'|'0'..'9'|~'\''|'\\t'|'\\\\') '\'';
	
NUMBER: ('0'..'9')+;

STRING:  '"'(ESC|ID|OP_MAT|OP|' '|','|'.'|';'|':'|'?'|'!'|'\\'|',' ~('"')|NUMBER)* '"';

HEXDIGIT: (NUMBER|'a'|'b'|'c'|'d'|'e'|'f'|'A'|'B'|'C'|'D'|'E'|'F');

HEXADECIMAL: '0x' (HEXDIGIT)(HEXDIGIT)*;

WS_: (' ' | '\n' | '\t') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

INT: 'int';

CLASS: 'class';

BOOLEAN: 'boolean';

BOOLEANLITERAL: ('true'|'false');

PROGRAM: 'Program';

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

PV: ';';

VIRGULA: ',';

PE: '!';

NEGATIVO:('-');

COLCHETEL: '[';

COLCHETER: ']';

PARENTESEL: '(';

PARENTESER: ')';

ID: ('a'..'z' | 'A'..'Z'|'_')('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

fragment
ESC :  '\\' ('n'|'"'|'\\'|'t'|'\'');

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

OPATRIBUIR: '=';

OPDECR: '-=';

OPINC: '+=';

OP_MAT: ('+'|'*'|'/'|'%');

OPCOMP: ('<'|'>'|'>='|'<=');

OPIGUALDADE: ('=='|'!=');

OPCOND: ('&&'|'||');

CHARLITERAL: '\''(ESC|'a'..'z'|'A'..'Z'|'0'..'9'|~'\''|'\\t'|'\\\\') '\'';
	
NUMBER: ('0'..'9')+;

STRING:  '"'(ESC|ID|OP_MAT|NUMBER|' '|','|'.'|';'|':'|'?'|'!'|'\\'|',' ~('"'))* '"';

HEXADECIMAL: '0x' ('0'..'9'|'a'..'f'|'A'..'F')+;

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

PONTOV: ';';

VIRGULA: ',';

PONTOE: '!';

NEGATIVO:('-');

COLCHETE_E: '[';

COLCHETE_D: ']';

PARENTESE_E: '(';

PARENTESE_D: ')';

ID: ('a'..'z'|'A'..'Z'|'_')('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

fragment
ESC :  '\\' ('n'|'"'|'\\'|'t'|'\'');

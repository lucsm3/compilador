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

LCURLY : '{';
RCURLY : '}';

OP_ATRIB: '=';

OP_ATR_DECR: '-=' ;

OP_ATR_INCR: '+=' ;

OP_ARIT: ('+'|'*'|'/'|'%');

OP_REL : ('>'|'<'|'>='|'<=');

OP_EQ : ('=='|'!=') ;

OP_COND: ('&&'|'||');

CHARLITERAL : '\'' (ESC|'a'..'z'|'A'..'Z'|'0'..'9'|~'\''|'\\t'|'\\\\') '\''; 

NUMBER: ('0'..'9')+;

STRING : '"' (ESC|ID|OP_ARIT|' '|','|'.'|';'|':'|'?'|'!'|'\\'|',' ~('"')|NUMBER)* '"';

HEXADECIMAL:'0x' ('0'..'9'|'a'..'f'|'A'..'F')+;

WS_ : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

NEGATIVO: ('-');

PV: ';';

VIRGULA: ',';

EXCLAMACAO: '!';

IF: 'if';

ELSE: 'else';

CALLOUT: 'callout';

CLASS: 'class';

PROGRAM: 'Program';

INT: 'int';

RETURN: 'return';

VOID: 'void';

FOR: 'for';

BOOLEAN : 'boolean';

BOOLEANLITERAL: ('true'|'false');

BREAK: 'break';

CONTINUE: 'continue';

LCOLCHETE: '[';
RCOLCHETE: ']';

LPARENTESE: '(';
RPARENTESE: ')';

ID :('a'..'z' | 'A'..'Z'|'_')('a'..'z' | 'A'..'Z'|'_'|'0'..'9')*;

fragment
ESC : '\\' ('n'|'"'|'\\' | 't' | '\'');

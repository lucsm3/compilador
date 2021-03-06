parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY field_decl* method_decl* RCURLY EOF;

field_decl: type ID (VIRGULA type ID)* PONTOV| type ID COLCHETE_E int_literal COLCHETE_D (VIRGULA type ID COLCHETE_E int_literal COLCHETE_D)* PONTOV;

method_decl: (type|VOID) ID PARENTESE_E (type ID (VIRGULA type ID)* )* PARENTESE_D block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type ID (VIRGULA (type ID | ID))*PONTOV;

int_literal: decimal_literal| hex_literal;

decimal_literal: NUMBER;

hex_literal: HEXADECIMAL;

type: INT|BOOLEAN;

statement: location assign_op expr PONTOV 
	   | method_call PONTOV
	   | IF PARENTESE_E expr PARENTESE_D block (ELSE block)*
	   | FOR ID OPATRIBUIR expr VIRGULA expr block
	   | RETURN expr* PONTOV
	   | BREAK PONTOV
	   | CONTINUE PONTOV
	   | block ;

assign_op: OPATRIBUIR | OPDECR | OPINC ;

method_call: method_name PARENTESE_E (expr (VIRGULA expr)*)* PARENTESE_D | CALLOUT PARENTESE_E string_literal (VIRGULA callout_arg)* PARENTESE_D;

method_name: ID;

location: ID | ID COLCHETE_E expr COLCHETE_D;

expr: location
	|method_call
	|literal
	|expr bin_op expr
	|NEGATIVO expr
	|PONTOE expr
	|PARENTESE_E expr PARENTESE_D;

callout_arg: expr | string_literal;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: OP_MAT | NEGATIVO;

rel_op : OPCOMP;

eq_op: OPIGUALDADE;

cond_op: OPCOND;

literal: int_literal | char_literal | bool_literal;

bool_literal: BOOLEANLITERAL;

char_literal: CHARLITERAL;

string_literal: STRING;

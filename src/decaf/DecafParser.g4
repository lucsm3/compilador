parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

//program: ID LCURLY RCURLY EOF;

program: CLASS PROGRAM LCURLY field_decl* method_decl*   RCURLY EOF; 

field_decl: type ID (VIRGULA type ID)* PV
			| type ID LCOLCHETE int_literal RCOLCHETE (VIRGULA type ID LCOLCHETE int_literal RCOLCHETE)* PV ;

method_decl: ( type | VOID ) ID LPARENTESE ( type ID (VIRGULA type ID)* )* RPARENTESE block ;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type ID (VIRGULA (type ID | ID))* PV;

type: INT | BOOLEAN;

int_literal: decimal_literal | hex_literal;

decimal_literal: NUMBER;

hex_literal: HEXADECIMAL;

statement: location assign_op expr PV
			| method_call PV
			| IF LPARENTESE expr RPARENTESE block (ELSE block)*
			| FOR ID OP_ATRIB expr VIRGULA expr block
			| RETURN expr* PV
			| BREAK PV
			| CONTINUE PV
			| block ;
			
assign_op: OP_ATRIB | OP_ATR_INCR | OP_ATR_DECR;
			
method_call: method_name LPARENTESE (expr (VIRGULA expr)*)* RPARENTESE
				| CALLOUT LPARENTESE string_literal (VIRGULA callout_arg)* RPARENTESE ;

method_name : ID;

location: ID | ID LCOLCHETE expr RCOLCHETE;

expr: location
		| method_call
		| literal
		| expr bin_op expr
		| NEGATIVO expr
		| EXCLAMACAO expr
		| LPARENTESE expr RPARENTESE;

callout_arg     : expr | string_literal ;

bin_op          : arith_op | rel_op | eq_op | cond_op ;

arith_op        : OP_ARIT | NEGATIVO ;

rel_op : OP_REL ;

eq_op : OP_EQ ;

cond_op : OP_COND ;

literal : int_literal | char_literal | bool_literal ;

bool_literal : BOOLEANLITERAL;

char_literal : CHARLITERAL ;

string_literal : STRING ;





















			
			


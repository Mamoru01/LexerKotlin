program
:   file EOF 
;

class_list
:   classDeclaration
    | class_list classDeclaration
;

func_list
:   functionDeclaration
    | func_list functionDeclaration
;

func_and_class_list: func_list
    | class_list
    ;

file
:   func_and_class_list
    | file_list func_and_class_list
    | /*empty*/
    | error_token
;

parameter
:   ID ':' type
;

type
:   TYPE_DOUBLE
    | TYPE_FLOAT
    | TYPE_LONG
    | TYPE_INT
    | TYPE_SHORT
    | TYPE_BYTE
    | TYPE_STRING
;

parameters_list_opt
:   parameters_list
    | /*empty*/
;

parameters_list
:   parameter
    | parameters_list ',' parameter
    | parameters_list ',' parameter '='  expression
;

functionParameters 
:   '(' parameters_list_opt ')'
;

functionDeclaration
:  FUN ID functionParameters ':' type functionBody
;

functionBody
:   block
    | '=' expression
;

functionCall:
:   ID '(' functionValueParameters_opt ')'
;

functionValueParameter
:   ID
    | literal
;

functionValueParameters
:   functionValueParameter
|   functionValueParameters ',' functionValueParameter
;

functionValueParameters_opt
:   functionValueParameters
|   /*empty*/
;

expression
:   literal
	| ID
	| functionCall
	| '(' expressionNumber ')'
	| expressionNumber '-' expressionNumber
	| expressionNumber '+' expressionNumber
	| expressionNumber '*' expressionNumber
	| expressionNumber '/' expressionNumber
	| expressionNumber '%' expressionNumber
	| expressionNumber '!' expressionNumber
	| expressionNumber '==' expressionNumber
	| expressionNumber '!=' expressionNumber
	| expressionNumber '===' expressionNumber
	| expressionNumber '!==' expressionNumber
	| expressionNumber ">" expressionNumber
	| expressionNumber "<" expressionNumber
	| expressionNumber ">=" expressionNumber
	| expressionNumber "<=" expressionNumber
	| expressionNumber "&&" expressionNumber
	| expressionNumber "||" expressionNumber
;

literal
:   INT_10
	| INT_16
	| INT_2
	| EXPONENT
	| REAL
    | STRING
    | SYMBOL
;

block
:   '{' statements_ots '}'
;

statements_ots
:   statements
    |/*empty*/
;

statements
:   statements
    | statements statement
;

statement
:   declaration 
    | assignment 
    | loopStatement 
    | expression
;

declaration 
:   classDeclaration
    | functionDeclaration
;

controlStructureBody 
: block
    | statement
;

loopStatement (used by statement)
:   forStatement
    | whileStatement
    | doWhileStatement
;

whileStatement (used by loopStatement)
: while '(' expression ')' controlStructureBody
    | while '(' expression ')' ';'
;

doWhileStatement (used by loopStatement)
:   do controlStructureBody while '(' expression ')'
;

forStatement 
:   for '(' variableDeclaration 'in' expression ')'
    controlStructureBody
;

variableDeclaration 
:   ID ':' type
;

assignment
:   ;

classDeclaration
:   ;



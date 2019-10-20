
# Grammar

```bison

program 
  : file EOF 
  ; 

func_and_class_list 
  : functionDeclaration 
  | classDeclaration 
  | func_and_class_list functionDeclaration 
  | func_and_class_list classDeclaration 
  ; 

file 
  : func_and_class_list 
  | /*empty*/ 
  | error_token 
  ; 

parameter 
  : ID ':' type 
  ;

type
  : TYPE_DOUBLE
  | TYPE_FLOAT
  | TYPE_LONG
  | TYPE_INT
  | TYPE_SHORT
  | TYPE_BYTE
  | TYPE_STRING
  ;

parameters_list_opt
  : parameters_list
  | /*empty*/
  ;

parameters_list
  : parameter
  | parameter '='  expression
  | parameters_list ',' parameter
  | parameters_list ',' parameter '='  expression
  ;

functionDeclaration
  : FUN ID '(' parameters_list_opt ')' ':' type functionBody
  ;

functionBody
  : block
  | '=' expression
  ;

functionCall:
  : ID '(' functionValueParameters_opt ')'
  ;

functionValueParameter
  : ID
  | literal
  | expression
  ;

functionValueParameters 
  : functionValueParameter
  | functionValueParameters ',' functionValueParameter
  ;

functionValueParameters_opt
  : functionValueParameters
  | /*empty*/
  ;

expression
  : REAL
  | EXPONENT
  | INT_10
  | INT_2
  | INT_16
  | SYMBOL
  | STRING
  | ID index_list
  | functionCall
  | ID
  | '(' expression ')'
  | expression '+' expression
  | expression '-' expression
  | expression '*' expression
  | expression '/' expression
  | expression '%' expression
  | expression '!' expression
  | expression '!=' expression
  | expression '!==' expression
  | expression '==' expression
  | expression '===' expression
  | expression '<' expression
  | expression '>' expression
  | expression '<=' expression
  | expression '>=' expression
  | expression "&&" expression
  | expression "||" expression
  | expression 'in' expression
  | expression '!in' expression
  ;

block
  : '{' statements_ots '}'
  ;

statements_ots
  : statements
  |/*empty*/
  ;

statements
  : statements
  | statements statement
  ;

statement 
  : declaration 
  | assignment 
  | loopStatement 
  | ifStatement
  | expression
  | block
  | returnStatement
  | assignableExpression ';'
  | assignableExpression
  ;

returnStatement
  : RETURN destructionAssignment;
  | RETURN expression;
  :

ifStatement
  : IF '(' expression ')' statement
  | IF '(' expression ')' statement ELSE statement
  ;

declaration 
  : classDeclaration
  | functionDeclaration
  ;

loopStatement 
  : forStatement
  | whileStatement
  | doWhileStatement
  ;

whileStatement
  : WHILE '(' expression ')' statement
  | WHILE '(' expression ')' ';'
  ;

doWhileStatement 
  : DO statement WHILE '(' expression ')'
  ;

forStatement 
  : FOR '(' parameter 'in' expression ')'  statement
  ;

assignment
  : directlyAssignableExpression '=' expression
  | assignableExpression assignmentAndOperator expression
  | indexAssignment expression;
  ;

directlyAssignableExpression
  : assignableExpression
  | ID
  ;

assignableExpression
  : VAL variableDeclaration
  | VAR variableDeclaration
  ;


classDeclaration
:  TODO: Мб сделаем ;

assignmentAndOperator 
  : '+='
  | '-='
  | '*='
  | '/='
  | '%='
  ;

indexAssignment
  : ID index_list '='
  | ID index_list assignmentAndOperator
  | destructionAssignment
  ;

index_list
  : '[' expression ']'
  | index_list '[' expression ']'
  ;

id_list
  : ID
  | id_list ',' ID
  ;

destructionAssignment
  :  '(' id_list ')' '=' ID
  |  '(' id_list ')' '=' functionCall
  ;

```

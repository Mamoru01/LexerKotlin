
# Grammar

```bison

program
  : file EOF 
  ;

class_list
  : classDeclaration
  | class_list classDeclaration
  ;

func_list
  : functionDeclaration
  | func_list functionDeclaration
  ;

func_and_class_list: func_list
    | class_list
    ;

file
  : func_and_class_list
  | file_list func_and_class_list
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
  | parameters_list ',' parameter
  | parameters_list ',' parameter '='  expression
  ;

functionParameters 
  : '(' parameters_list_opt ')'
  ;

functionDeclaration
  : FUN ID functionParameters ':' type functionBody
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
  ;

functionValueParameters 
  : functionValueParameter
  | functionValueParameters ',' functionValueParameter
  ;

functionValueParameters_opt
  : functionValueParameters
  | /*empty*/
  ;

literal
  : REAL
  | EXPONENT
  | INT_10
  | INT_2
  | INT_16
  | SYMBOL
  | STRING
  ;

expression
  : literal
  | ID
  | functionCall
  | '(' expressionNumber ')'
  | additiveOperator
  | multiplicativeOperator 
  | expressionNumber '!' expressionNumber
  | equalityOperator
  | comparisonOperator
  | expressionNumber "&&" expressionNumber
  | expressionNumber "||" expressionNumber
  ;

literal
  : INT_10
  | INT_16
  | INT_2
  | EXPONENT
  | REAL
  | STRING
  | SYMBOL
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
  | expression
  ;

declaration 
  : classDeclaration
  | functionDeclaration
  ;

controlStructureBody 
  : block
  | statement
  ;

loopStatement 
  : forStatement
  | whileStatement
  | doWhileStatement
  ;

whileStatement
  : while '(' expression ')' controlStructureBody
  | while '(' expression ')' ';'
  ;

doWhileStatement (used by loopStatement)
  : do controlStructureBody while '(' expression ')'
  ;

forStatement 
  : for '(' variableDeclaration 'in' expression ')'  controlStructureBody
  ;

variableDeclaration 
  : ID ':' type
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
  : val variableDeclaration
  | var variableDeclaration
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
equalityOperator 
  : '!='
  | '!=='
  | '=='
  | '==='
  ;
comparisonOperator 
  : '<'
  | '>'
  | '<='
  | '>='
  ;
inOperator 
  : 'in'
  | '!in'
  ;

additiveOperator 
  : '+'
  | '-'
  ;

multiplicativeOperator 
  : '*'
  | '/'
  | '%'
  ;

  indexAssignment
  : ID index_list '='
  | ID index_list assignmentAndOperator
  ;

  index_list
  : '[' functionValueParameter ']'
  | index_list '[' functionValueParameter ']'
  ;

```

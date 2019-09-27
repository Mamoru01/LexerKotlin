%option noyywrap
%option never-interactive
%option yylineno

%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	#include <conio.h>
	#include <locale.h> 

        void lexprint(char * lexem, char  token[15], int line); 
%}

%x STRING
%x SYMBOL
%x MLCOMMENT
%x LCOMMENT

ID		[a-z][_a-z0-9]*
CLASSNAME       [A-Z][_a-z0-9]*

WHITESPACE [ \t\r]
NEXTLINE [\n]

D2          	[01]
D_2				[_01]
D8          	[0-7]
D_8          	[_0-7]
D10          	[0-9]
D_10          	[_0-9]
D16				[0-9a-f]
D_16			[_0-9a-f]

INT_16 			0x({D16}{D_16}*)?{D16}
INT_10 			  ({D10}{D_10}*)?{D10}
INT_8 			0c({D8}{D_8}*)?{D8}
INT_2 			0b({D2}{D_2}*)?{D2}

NUM          	[0-9]+
REAL_0          (([0-9]*[\.]{NUM})|({NUM}[\.][0-9]*))
REAL          	((({INT_10})?[\.]{INT_10})|({INT_10}[\.]({INT_10})?))
EXPONENT	 	(({INT_10}|{REAL})e[+-]?{NUM})


%{
	int count = 0; 
        char str[100];
	char idHeredoc[100];

        void lexprint(char * lexem, char  token[15], int line){
                printf("%s\t%s\t%d\t%d\n", lexem, token, yylineno, count);
                count++;
        }
%}
%% 



as	{lexprint(yytext, "AS", yylineno);}
as\?	{lexprint(yytext, "AS?", yylineno);}
break 	{lexprint(yytext, "BREAK", yylineno);}
class 	{lexprint(yytext, "CLASS", yylineno);}
continue 	{lexprint(yytext, "continue", yylineno);}
do 	{lexprint(yytext, "DO", yylineno);}
else 	{lexprint(yytext, "ELSE", yylineno);}
false 	{lexprint(yytext, "FALSE", yylineno);}
for 	{lexprint(yytext, "FOR", yylineno);}
fun 	{lexprint(yytext, "FUN", yylineno);}
if 	{lexprint(yytext, "IF", yylineno);}
in	{lexprint(yytext, "IN", yylineno);}
\!in	{lexprint(yytext, "NOIN", yylineno);}
interface 	{lexprint(yytext, "INTERFACE", yylineno);}
is	{lexprint(yytext, "IS", yylineno);}
\!is	{lexprint(yytext, "NOIS", yylineno);}
null	{lexprint(yytext, "NULL", yylineno);}
object 	{lexprint(yytext, "OBJECT", yylineno);}
package 	{lexprint(yytext, "PACKAGE", yylineno);}
return 	{lexprint(yytext, "RETURN", yylineno);}
super	{lexprint(yytext, "SUPER", yylineno);}
this	{lexprint(yytext, "THIS", yylineno);}
throw 	{lexprint(yytext, "THROW", yylineno);}
true 	{lexprint(yytext, "TRUE", yylineno);}
try 	{lexprint(yytext, "TRY", yylineno);}
typealias 	{lexprint(yytext, "TYPEALIAS", yylineno);}
val 	{lexprint(yytext, "VAL", yylineno);}
var 	{lexprint(yytext, "VAR", yylineno);}
when 	{lexprint(yytext, "WHEN", yylineno);}
while 	{lexprint(yytext, "WHILE", yylineno);}



by 	{lexprint(yytext, "BY", yylineno);}
catch 	{lexprint(yytext, "CATCH", yylineno);}
constructor  	{lexprint(yytext, "CONSTRUCTOR", yylineno);}
delegate  	{lexprint(yytext, "DELEGATE", yylineno);}
dynamic  	{lexprint(yytext, "DYNAMIC", yylineno);}
field  	{lexprint(yytext, "FIELD", yylineno);}
file 	{lexprint(yytext, "FILE", yylineno);}
finally 	{lexprint(yytext, "FINALLY", yylineno);}
get 	{lexprint(yytext, "GET", yylineno);}
import  	{lexprint(yytext, "IMPORT", yylineno);}
init  	{lexprint(yytext, "INIT", yylineno);}
param  	{lexprint(yytext, "PARAM", yylineno);}
property 	{lexprint(yytext, "PROPERTY", yylineno);}
receiver 	{lexprint(yytext, "RECEIVER", yylineno);}
set  	{lexprint(yytext, "SET", yylineno);}
setparam  	{lexprint(yytext, "SETPARAM", yylineno);}
where  	{lexprint(yytext, "WHERE", yylineno);}



actual 	{lexprint(yytext, "ACTUAL", yylineno);}
abstract 	{lexprint(yytext, "ABSTRACT", yylineno);}
annotation  	{lexprint(yytext, "ANNOTATION", yylineno);}
companion  	{lexprint(yytext, "COMPANION", yylineno);}
const  	        {lexprint(yytext, "CONST", yylineno);}
crossinline  	{lexprint(yytext, "CROSSINLINE", yylineno);}
data 	        {lexprint(yytext, "DATA", yylineno);}
enum 	        {lexprint(yytext, "ENUM", yylineno);}
expect 	        {lexprint(yytext, "EXPECT", yylineno);}
extrnal  	{lexprint(yytext, "EXTERNAL", yylineno);}
final  	        {lexprint(yytext, "FINAL", yylineno);}
infix  	        {lexprint(yytext, "INFIX", yylineno);}
inline 	        {lexprint(yytext, "INLINE", yylineno);}
inner 	        {lexprint(yytext, "INNER", yylineno);}
internal  	{lexprint(yytext, "INTERNAL", yylineno);}
lateinit  	{lexprint(yytext, "LATEINIT", yylineno);}
noinline  	{lexprint(yytext, "NOINLINE", yylineno);}
open  	        {lexprint(yytext, "OPEN", yylineno);}
operator 	{lexprint(yytext, "OPERATOR", yylineno);}
out 	        {lexprint(yytext, "OUT", yylineno);}
override  	{lexprint(yytext, "OVERRIDE", yylineno);}
private  	{lexprint(yytext, "PRIVATE", yylineno);}
protected  	{lexprint(yytext, "PROTECTED", yylineno);}
public  	{lexprint(yytext, "PUBLIC", yylineno);}
reified 	{lexprint(yytext, "REIFIED", yylineno);}
sealed 	        {lexprint(yytext, "SEALED", yylineno);}
suspend  	{lexprint(yytext, "SUSPEND", yylineno);}
tailred  	{lexprint(yytext, "TAILRED", yylineno);}
vararg  	{lexprint(yytext, "VARARG", yylineno);}



field  	{lexprint(yytext, "FIELD", yylineno);}
it  	{lexprint(yytext, "IT", yylineno);}




"+"  	{lexprint(yytext, "SUM", yylineno);}
"-"  	{lexprint(yytext, "MINUS", yylineno);}
"*"  	{lexprint(yytext, "MULTIPLY", yylineno);}
"/"  	{lexprint(yytext, "DIV", yylineno);}
"%"  	{lexprint(yytext, "MOD", yylineno);}

 
"="  	{lexprint(yytext, "ASSIGN", yylineno);}

 
"+="  	{lexprint(yytext, "SUM_ASSIGN", yylineno);}
"-="  	{lexprint(yytext, "MINUS_ASSIGN", yylineno);}
"*="  	{lexprint(yytext, "MULTIPLY_ASSIGN", yylineno);}
"/="  	{lexprint(yytext, "DIV_ASSIGN", yylineno);}
"%="  	{lexprint(yytext, "MOD_ASSIGN", yylineno);}

 
"++"  	{lexprint(yytext, "INC", yylineno);}
"--"  	{lexprint(yytext, "DEC", yylineno);}

 
"&&"  	{lexprint(yytext, "AND", yylineno);}
"||"  	{lexprint(yytext, "OR", yylineno);}
"!"  	{lexprint(yytext, "NO", yylineno);}

 
"=="  	{lexprint(yytext, "EQUAL", yylineno);}
"!="  	{lexprint(yytext, "NOEQUAL", yylineno);}

 
"==="  	{lexprint(yytext, "EQUAL_LINK", yylineno);}
"!=="  	{lexprint(yytext, "NOEQUAL_LINK", yylineno);}

 
">"  	{lexprint(yytext, "MORE", yylineno);}
"<"  	{lexprint(yytext, "SMALLER", yylineno);}
">="  	{lexprint(yytext, "MORE_OR_EQUAL", yylineno);}
"<="  	{lexprint(yytext, "SMALLER_OR_EQUAL", yylineno);}

"!!"  	{lexprint(yytext, "ASSERT_NON_NULL", yylineno);}
"?."  	{lexprint(yytext, "SAFE_CALL", yylineno);}
"?:"  	{lexprint(yytext, "ELVIS_OPERATOR", yylineno);}
"::"  	{lexprint(yytext, "CLASS_REFERENCE_OPERATOR", yylineno);}
".."  	{lexprint(yytext, "CREATE_RANGE_OPERATOR", yylineno);}
":"  	{lexprint(yytext, "NAME_TYPE_SEPARATOR", yylineno);}
"?"  	{lexprint(yytext, "MARK_NULLABLE_TYPE", yylineno);}
"->"  	{lexprint(yytext, "LAMBDA_EXPRESSION", yylineno);}
"@"  	{lexprint(yytext, "ANNOTATION", yylineno);}
";"  	{lexprint(yytext, "SEPARATOR_MULTIPLE_STATEMENT", yylineno);}
"_"  	{lexprint(yytext, "SUBSTITUTE_AN_UNUSED_PARAMETER", yylineno);}
"$"  	{lexprint(yytext, "REFERENCES_A_VARIABLE_OR_EXPRESSION_IN_A_STRING_TEMPLATE", yylineno);}

{ID}       {lexprint(yytext, "ID", yylineno);}
{CLASSNAME} {lexprint(yytext, "CLASSNAME", yylineno);}
{EXPONENT} {lexprint(yytext, "EXPONENT", yylineno);}
{INT_10}   {lexprint(yytext, "INT_10", yylineno);}
{INT_16}   {lexprint(yytext, "INT_16", yylineno);}
{INT_8}	   {lexprint(yytext, "INT_8", yylineno);}
{INT_2}	   {lexprint(yytext, "INT_2", yylineno);}
{REAL}[^.] {lexprint(yytext, "REAL", yylineno);}


\/\*            { str[0]=0; BEGIN(MLCOMMENT); }
<MLCOMMENT>.     { strcat(str,yytext);}
<MLCOMMENT>\*\/   { lexprint(str, "MLCOMMENT", yylineno); BEGIN(INITIAL);}

\/\/            { str[0]=0; BEGIN(LCOMMENT); }
<LCOMMENT>.     { strcat(str,yytext);}
<LCOMMENT>\\n   { BEGIN(INITIAL); lexprint(str, "LCOMMENT", yylineno); BEGIN(INITIAL);}

{WHITESPACE}+ { /* skip {WHITESPACE} */ }
{NEXTLINE}   { /* skip {NEXTLINE} */ }

\' {str[0]=0; BEGIN(SYMBOL);}
<SYMBOL>\\\\ {strcat(str,"\\");}
<SYMBOL>\\\" {strcat(str, "\"");}
<SYMBOL>\\n {strcat(str,"\n");}
<SYMBOL>\\r {strcat(str,"\r");}
<SYMBOL>\\t {strcat(str,"\t");}
<SYMBOL>\\v {strcat(str,"\v");}
<SYMBOL>\\e {strcat(str,"\e");}
<SYMBOL>\\f {strcat(str,"\f");}
<SYMBOL>\\$ {strcat(str,"\$");}
<SYMBOL>[^\\\"\n]+ {strcat(str,yytext);}
<SYMBOL>\' {lexprint(str, "SYMBOL", yylineno); BEGIN(INITIAL);}

\" {str[0]=0; BEGIN(STRING);}
<STRING>\\\\ {strcat(str,"\\");}
<STRING>\\\" {strcat(str, "\"");}
<STRING>\\n {strcat(str,"\n");}
<STRING>\\r {strcat(str,"\r");}
<STRING>\\t {strcat(str,"\t");}
<STRING>\\v {strcat(str,"\v");}
<STRING>\\e {strcat(str,"\e");}
<STRING>\\f {strcat(str,"\f");}
<STRING>\\$ {strcat(str,"\$");}
<STRING>[^\\\"\n] {strcat(str,yytext);}
<STRING>\" {lexprint(str, "STRING", yylineno); BEGIN(INITIAL);}

. {fprintf(stderr, "%s Not Found in %d line \n", yytext, yylineno);}

%% 
  
void main(int argc, char **argv ){
	freopen("LexemTable.tsv", "w", stdout);
	freopen("err.log", "w", stderr);

        if (argc > 0){yyin = fopen( argv[1], "r" );} else yyin = stdin;
        
        printf("lexem\ttoken\tline\tnumber\n");
        
        yylex();
        return;
}

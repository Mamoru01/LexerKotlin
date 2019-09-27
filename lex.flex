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

/*Hard Keywords*/

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

/*Soft Keywords*/

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

/*Modifier Keywords*/

actual 	{lexprint(yytext, "ACTUAL", yylineno);}
abstract 	{lexprint(yytext, "ABSTRACT", yylineno);}
annotation  	{lexprint(yytext, "ANNOTATION", yylineno);}
companion  	{lexprint(yytext, "COMPANION", yylineno);}
const  	{lexprint(yytext, "CONST", yylineno);}
crossinline  	{lexprint(yytext, "CROSSINLINE", yylineno);}
data 	{lexprint(yytext, "DATA", yylineno);}
enum 	{lexprint(yytext, "ENUM", yylineno);}
expect 	{lexprint(yytext, "EXPECT", yylineno);}
extrnal  	{lexprint(yytext, "EXTERNAL", yylineno);}
final  	{lexprint(yytext, "FINAL", yylineno);}
infix  	{lexprint(yytext, "INFIX", yylineno);}
inline 	{lexprint(yytext, "INLINE", yylineno);}
inner 	{lexprint(yytext, "INNER", yylineno);}
internal  	{lexprint(yytext, "INTERNAL", yylineno);}
lateinit  	{lexprint(yytext, "LATEINIT", yylineno);}
noinline  	{lexprint(yytext, "NOINLINE", yylineno);}
open  	{lexprint(yytext, "OPEN", yylineno);}
operator 	{lexprint(yytext, "OPERATOR", yylineno);}
out 	{lexprint(yytext, "OUT", yylineno);}
override  	{lexprint(yytext, "OVERRIDE", yylineno);}
private  	{lexprint(yytext, "PRIVATE", yylineno);}
protected  	{lexprint(yytext, "PROTECTED", yylineno);}
public  	{lexprint(yytext, "PUBLIC", yylineno);}
reified 	{lexprint(yytext, "REIFIED", yylineno);}
sealed 	{lexprint(yytext, "SEALED", yylineno);}
suspend  	{lexprint(yytext, "SUSPEND", yylineno);}
tailred  	{lexprint(yytext, "TAILRED", yylineno);}
vararg  	{lexprint(yytext, "VARARG", yylineno);}

/*Special Identifiers*/

field  	{lexprint(yytext, "FIELD", yylineno);}
it  	{lexprint(yytext, "IT", yylineno);}

/*TODO: Add Operators and Special Symbols*/

\/\*            { str[0]=0; BEGIN(MLCOMMENT); }
<MLCOMMENT>.     { strcat(str,yytext);}
<MLCOMMENT>\*\/   { lexprint(str, "MLCOMMENT", yylineno); BEGIN(INITIAL);}

\/\/            { str[0]=0; BEGIN(LCOMMENT); }
<LCOMMENT>.     { strcat(str,yytext);}
<LCOMMENT>\\n   { BEGIN(INITIAL); lexprint(str, "LCOMMENT", yylineno); BEGIN(INITIAL);}
/*TODO: fix line comment*/

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

. {printf(yytext, "Not Found", yylineno);}

%% 
  
void main(int argc, char **argv )
{
	freopen("LexemTable.tsv", "w", stdout);
	freopen("tmp\err.log", "w", stderr);

        if (argc > 0){yyin = fopen( "argv[1]", "r" );} else yyin = stdin;
        
        printf("lexem\ttoken\tline\tnumber\n");
        
        yylex();
        return;
}

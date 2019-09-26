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
break 	{lexprint(yytext, "break", yylineno);}
class 	{lexprint(yytext, "AS", yylineno);}
continue 	{lexprint(yytext, "AS", yylineno);}
do 	{lexprint(yytext, "AS", yylineno);}
else 	{lexprint(yytext, "AS", yylineno);}
false 	{lexprint(yytext, "AS", yylineno);}
for 	{lexprint(yytext, "AS", yylineno);}
fun 	{lexprint(yytext, "AS", yylineno);}
if 	{lexprint(yytext, "AS", yylineno);}
in	{lexprint(yytext, "AS", yylineno);}
\!in	{lexprint(yytext, "AS", yylineno);}
interface 	{lexprint(yytext, "AS", yylineno);}
is	{lexprint(yytext, "AS", yylineno);}
\!is	{lexprint(yytext, "AS", yylineno);}
null	{lexprint(yytext, "AS", yylineno);}
object 	{lexprint(yytext, "AS", yylineno);}
package 	{lexprint(yytext, "AS", yylineno);}
return 	{lexprint(yytext, "AS", yylineno);}
super	{lexprint(yytext, "AS", yylineno);}
this	{lexprint(yytext, "AS", yylineno);}
throw 	{lexprint(yytext, "AS", yylineno);}
true 	{lexprint(yytext, "AS", yylineno);}
try 	{lexprint(yytext, "AS", yylineno);}
typealias 	{lexprint(yytext, "AS", yylineno);}
val 	{lexprint(yytext, "AS", yylineno);}
var 	{lexprint(yytext, "AS", yylineno);}
when 	{lexprint(yytext, "AS", yylineno);}
while 	{lexprint(yytext, "AS", yylineno);}

/*Soft Keywords*/

actual 	{lexprint(yytext, "AS", yylineno);}
abstract 	{lexprint(yytext, "AS?", yylineno);}
annotation  	{lexprint(yytext, "break", yylineno);}
companion  	{lexprint(yytext, "AS", yylineno);}
const  	{lexprint(yytext, "AS", yylineno);}
crossinline  	{lexprint(yytext, "AS", yylineno);}
/*TODO: */


\/\*            { str[0]=0; BEGIN(MLCOMMENT); }
<MLCOMMENT>.     { strcat(str,yytext);}
<MLCOMMENT>\*\/   { lexprint(str, "MLCOMMENT", yylineno); BEGIN(INITIAL);}

\/\/            { str[0]=0; BEGIN(LCOMMENT); }
<LCOMMENT>.     { strcat(str,yytext);}
<LCOMMENT>\\n   { BEGIN(INITIAL); lexprint(str, "LCOMMENT", yylineno); BEGIN(INITIAL);}

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

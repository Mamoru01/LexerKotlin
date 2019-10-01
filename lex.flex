%option noyywrap
%option never-interactive
%option yylineno

%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>
    #include <conio.h>
    #include <locale.h>

        voidlexprint(char* lexem, char  token[], int line, int *count);
        voidsqueeze (char* str, char symbol);
        int binaryToDecimal(char* strBin);
%}

%x STRING
%x SYMBOL
%x MLCOMMENT
%x LCOMMENT

ID              [A-Za-z0-9\_]*

WHITESPACE      [ \t\r]
NEXTLINE        [\n]

D2              [01]
D_2             [_01]
D8              [0-7]
D_8             [_0-7]
D10             [0-9]
D_10            [_0-9]
D16             [0-9a-fA-F]
D_16            [_0-9a-fA-F]

INT_16          0x({D16}{D_16}*)?{D16}
INT_10          ({D10}{D_10}*)?{D10}
INT_2           0b({D2}{D_2}*)?{D2}

NUM             [0-9]+
REAL            ((({INT_10})?[\.]{INT_10})|({INT_10}[\.]({INT_10})?))
EXPONENT        (({INT_10}|{REAL})e[+-]?{NUM})



%%

%{
	int count = 1;
    char str[100];
	char idHeredoc[100];
%}

as          {lexprint(yytext, "AS", yylineno, &count);}
as\?        {lexprint(yytext, "AS?", yylineno, &count);}
break       {lexprint(yytext, "BREAK", yylineno, &count);}
class       {lexprint(yytext, "CLASS", yylineno, &count);}
continue    {lexprint(yytext, "continue", yylineno, &count);}
do          {lexprint(yytext, "DO", yylineno, &count);}
else        {lexprint(yytext, "ELSE", yylineno, &count);}
false       {lexprint(yytext, "FALSE", yylineno, &count);}
for         {lexprint(yytext, "FOR", yylineno, &count);}
fun         {lexprint(yytext, "FUN", yylineno, &count);}
if          {lexprint(yytext, "IF", yylineno, &count);}
in          {lexprint(yytext, "IN", yylineno, &count);}
\!in        {lexprint(yytext, "NOIN", yylineno, &count);}
interface   {lexprint(yytext, "INTERFACE", yylineno, &count);}
is          {lexprint(yytext, "IS", yylineno, &count);}
\!is        {lexprint(yytext, "NOIS", yylineno, &count);}
null        {lexprint(yytext, "NULL", yylineno, &count);}
object      {lexprint(yytext, "OBJECT", yylineno, &count);}
package     {lexprint(yytext, "PACKAGE", yylineno, &count);}
return      {lexprint(yytext, "RETURN", yylineno, &count);}
super       {lexprint(yytext, "SUPER", yylineno, &count);}
this        {lexprint(yytext, "THIS", yylineno, &count);}
throw       {lexprint(yytext, "THROW", yylineno, &count);}
true        {lexprint(yytext, "TRUE", yylineno, &count);}
try         {lexprint(yytext, "TRY", yylineno, &count);}
typealias   {lexprint(yytext, "TYPEALIAS", yylineno, &count);}
val         {lexprint(yytext, "VAL", yylineno, &count);}
var         {lexprint(yytext, "VAR", yylineno, &count);}
when        {lexprint(yytext, "WHEN", yylineno, &count);}
while       {lexprint(yytext, "WHILE", yylineno, &count);}


by          {lexprint(yytext, "BY", yylineno, &count);}
catch       {lexprint(yytext, "CATCH", yylineno, &count);}
constructor {lexprint(yytext, "CONSTRUCTOR", yylineno, &count);}
delegate    {lexprint(yytext, "DELEGATE", yylineno, &count);}
dynamic     {lexprint(yytext, "DYNAMIC", yylineno, &count);}
field       {lexprint(yytext, "FIELD", yylineno, &count);}
file        {lexprint(yytext, "FILE", yylineno, &count);}
finally     {lexprint(yytext, "FINALLY", yylineno, &count);}
get         {lexprint(yytext, "GET", yylineno, &count);}
import      {lexprint(yytext, "IMPORT", yylineno, &count);}
init        {lexprint(yytext, "INIT", yylineno, &count);}
param       {lexprint(yytext, "PARAM", yylineno, &count);}
property    {lexprint(yytext, "PROPERTY", yylineno, &count);}
receiver    {lexprint(yytext, "RECEIVER", yylineno, &count);}
set         {lexprint(yytext, "SET", yylineno, &count);}
setparam    {lexprint(yytext, "SETPARAM", yylineno, &count);}
where       {lexprint(yytext, "WHERE", yylineno, &count);}


actual      {lexprint(yytext, "ACTUAL", yylineno, &count);}
abstract    {lexprint(yytext, "ABSTRACT", yylineno, &count);}
annotation  {lexprint(yytext, "ANNOTATION", yylineno, &count);}
companion   {lexprint(yytext, "COMPANION", yylineno, &count);}
const  	    {lexprint(yytext, "CONST", yylineno, &count);}
crossinline {lexprint(yytext, "CROSSINLINE", yylineno, &count);}
data 	    {lexprint(yytext, "DATA", yylineno, &count);}
enum 	    {lexprint(yytext, "ENUM", yylineno, &count);}
expect 	    {lexprint(yytext, "EXPECT", yylineno, &count);}
extrnal     {lexprint(yytext, "EXTERNAL", yylineno, &count);}
final  	    {lexprint(yytext, "FINAL", yylineno, &count);}
infix  	    {lexprint(yytext, "INFIX", yylineno, &count);}
inline 	    {lexprint(yytext, "INLINE", yylineno, &count);}
inner 	    {lexprint(yytext, "INNER", yylineno, &count);}
internal    {lexprint(yytext, "INTERNAL", yylineno, &count);}
lateinit    {lexprint(yytext, "LATEINIT", yylineno, &count);}
noinline    {lexprint(yytext, "NOINLINE", yylineno, &count);}
open  	    {lexprint(yytext, "OPEN", yylineno, &count);}
operator    {lexprint(yytext, "OPERATOR", yylineno, &count);}
out 	    {lexprint(yytext, "OUT", yylineno, &count);}
override    {lexprint(yytext, "OVERRIDE", yylineno, &count);}
private     {lexprint(yytext, "PRIVATE", yylineno, &count);}
protected   {lexprint(yytext, "PROTECTED", yylineno, &count);}
public      {lexprint(yytext, "PUBLIC", yylineno, &count);}
reified     {lexprint(yytext, "REIFIED", yylineno, &count);}
sealed      {lexprint(yytext, "SEALED", yylineno, &count);}
suspend     {lexprint(yytext, "SUSPEND", yylineno, &count);}
tailred     {lexprint(yytext, "TAILRED", yylineno, &count);}
vararg      {lexprint(yytext, "VARARG", yylineno, &count);}
field       {lexprint(yytext, "FIELD", yylineno, &count);}
it          {lexprint(yytext, "IT", yylineno, &count);}


Double      {lexprint(yytext, "TYPE_DOUBLE", yylineno, &count);}
Float       {lexprint(yytext, "TYPE_FLOAT", yylineno, &count);}
Long        {lexprint(yytext, "TYPE_LONG", yylineno, &count);}
Int         {lexprint(yytext, "TYPE_INT", yylineno, &count);}
Short       {lexprint(yytext, "TYPE_SHORT", yylineno, &count);}
Byte        {lexprint(yytext, "TYPE_BYTE", yylineno, &count);}
String      {lexprint(yytext, "TYPE_STRING", yylineno, &count);}


IntArray    {lexprint(yytext, "TYPE_INTARRAY", yylineno, &count);}
ByteArray   {lexprint(yytext, "TYPE_BYTEARRAY", yylineno, &count);}
ShortArray  {lexprint(yytext, "TYPE_SHORTARRAY", yylineno, &count);}
Array       {lexprint(yytext, "TYPE_ARRAY", yylineno, &count);}


{EXPONENT}  {strcpy(str,yytext); squeeze(str, '_');  printf("%e\t%s\t%d\t%d\n",atoll(str), "EXPONENT", yylineno, count); count++; str[0] = 0;}
{REAL}[^.]  {strcpy(str,yytext); squeeze(str, '_');  printf("%f\t%s\t%d\t%d\n",atof(str), "REAL", yylineno, count); count++; str[0] = 0;}
{INT_10}    {strcpy(str,yytext); squeeze(str, '_');  printf("%d\t%s\t%d\t%d\n",atoi(str), "INT_10", yylineno, count); count++; str[0] = 0;}
{INT_16}    {strcpy(str,yytext); squeeze(str, '_');  int n16; sscanf(str,"%i", &n16); printf("%i\t%s\t%d\t%d\n", n16, "INT_16", yylineno, count); count++; str[0] = 0;}
{INT_2}     {strcpy(str,yytext); squeeze(str, '_');  printf("%d\t%s\t%d\t%d\n",binaryToDecimal(str), "INT_2", yylineno, count); count++; str[0] = 0;}
{ID}        {lexprint(yytext, "ID", yylineno, &count);}


"+"         {lexprint(yytext, "SUM", yylineno, &count);}
"-"         {lexprint(yytext, "MINUS", yylineno, &count);}
"*"         {lexprint(yytext, "MULTIPLY", yylineno, &count);}
"/"         {lexprint(yytext, "DIV", yylineno, &count);}
"%"         {lexprint(yytext, "MOD", yylineno, &count);}
"="         {lexprint(yytext, "ASSIGN", yylineno, &count);}
"+="        {lexprint(yytext, "SUM_ASSIGN", yylineno, &count);}
"-="        {lexprint(yytext, "MINUS_ASSIGN", yylineno, &count);}
"*="        {lexprint(yytext, "MULTIPLY_ASSIGN", yylineno, &count);}
"/="        {lexprint(yytext, "DIV_ASSIGN", yylineno, &count);}
"%="        {lexprint(yytext, "MOD_ASSIGN", yylineno, &count);}
"++"        {lexprint(yytext, "INC", yylineno, &count);}
"--"        {lexprint(yytext, "DEC", yylineno, &count);}
"&&"        {lexprint(yytext, "AND", yylineno, &count);}
"||"        {lexprint(yytext, "OR", yylineno, &count);}
"!"         {lexprint(yytext, "NO", yylineno, &count);}
"=="        {lexprint(yytext, "EQUAL", yylineno, &count);}
"!="        {lexprint(yytext, "NOEQUAL", yylineno, &count);}
"==="       {lexprint(yytext, "EQUAL_LINK", yylineno, &count);}
"!=="       {lexprint(yytext, "NOEQUAL_LINK", yylineno, &count);}
">"         {lexprint(yytext, "MORE", yylineno, &count);}
"<"         {lexprint(yytext, "SMALLER", yylineno, &count);}
">="        {lexprint(yytext, "MORE_OR_EQUAL", yylineno, &count);}
"<="        {lexprint(yytext, "SMALLER_OR_EQUAL", yylineno, &count);}
"!!"        {lexprint(yytext, "ASSERT_NON_NULL", yylineno, &count);}
"?."        {lexprint(yytext, "SAFE_CALL", yylineno, &count);}
"?:"        {lexprint(yytext, "ELVIS_OPERATOR", yylineno, &count);}
"::"        {lexprint(yytext, "CLASS_REFERENCE_OPERATOR", yylineno, &count);}
".."        {lexprint(yytext, "CREATE_RANGE_OPERATOR", yylineno, &count);}
":"         {lexprint(yytext, "NAME_TYPE_SEPARATOR", yylineno, &count);}
"?"         {lexprint(yytext, "MARK_NULLABLE_TYPE", yylineno, &count);}
"->"        {lexprint(yytext, "LAMBDA_EXPRESSION", yylineno, &count);}
"@"         {lexprint(yytext, "ANNOTATION", yylineno, &count);}
";"         {lexprint(yytext, "SEPARATOR_MULTIPLE_STATEMENT", yylineno, &count);}
"_"         {lexprint(yytext, "SUBSTITUTE_AN_UNUSED_PARAMETER", yylineno, &count);}
"$"         {lexprint(yytext, "REFERENCES_A_VARIABLE_OR_EXPRESSION_IN_A_STRING_TEMPLATE", yylineno, &count);}
"."         {lexprint(yytext, "CALL_METHOD", yylineno, &count);}
","         {lexprint(yytext, "ENUMERATION_OPERATOR", yylineno, &count);}
"["         {lexprint(yytext, "OPENING_SQUARE_BRACKET", yylineno, &count);}
"]"         {lexprint(yytext, "CLOSING_SQUARE_BRACKET", yylineno, &count);}
"{"         {lexprint(yytext, "OPENING_OPERATOR_BRACKET", yylineno, &count);}
"}"         {lexprint(yytext, "CLOSING_OPERATOR_BRACKET", yylineno, &count);}
"("         {lexprint(yytext, "OPENING_PARENTHESIS", yylineno, &count);}
")"         {lexprint(yytext, "CLOSING_PARENTHESIS", yylineno, &count);}


\/\*                 {str[0]=0; BEGIN(MLCOMMENT); }
<MLCOMMENT>\t        {strcat(str,"\\t");}
<MLCOMMENT>\n        {strcat(str,"\\n");}
<MLCOMMENT>.         {strcat(str,yytext);}
<MLCOMMENT>\*\/      {lexprint(str, "MLCOMMENT", yylineno, &count); BEGIN(INITIAL);}


\/\/                 {str[0]=0; BEGIN(LCOMMENT);}
<LCOMMENT>\n         {lexprint(str, "LCOMMENT", yylineno, &count); BEGIN(INITIAL);}


{WHITESPACE}+        {/* skip {WHITESPACE} */}
{NEXTLINE}           {/* skip {NEXTLINE} */}


\'                   {str[0]=0; BEGIN(SYMBOL);}
<SYMBOL>\\\\         {strcat(str,"\\");}
<SYMBOL>\\\"         {strcat(str, "\"");}
<SYMBOL>\\n          {strcat(str,"\n");}
<SYMBOL>\\r          {strcat(str,"\r");}
<SYMBOL>\\t          {strcat(str,"\t");}
<SYMBOL>\\v          {strcat(str,"\v");}
<SYMBOL>\\e          {strcat(str,"\e");}
<SYMBOL>\\f          {strcat(str,"\f");}
<SYMBOL>\\$          {strcat(str,"\$");}
<SYMBOL>[^\\\'\n]    {strcat(str,yytext);}
<SYMBOL>\'           {if(strlen(str) == 1) {lexprint(str, "SYMBOL", yylineno, &count);}else {fprintf(stderr, "Too many characters in a character literal \'\'%s\'\' in %d line \n", str, yylineno); str[0] = 0;} BEGIN(INITIAL);}
<SYMBOL>[^"\n]\n     {strcat(str,yytext); fprintf(stderr, "%s Expecting \' in %d line \n", str, yylineno); str[0] = 0; BEGIN(INITIAL);}


\"                   {str[0]=0; BEGIN(STRING);}
<STRING>\\\\         {strcat(str,"\\");}
<STRING>\\\"         {strcat(str, "\"");}
<STRING>\\n          {strcat(str,"\n");}
<STRING>\\r          {strcat(str,"\r");}
<STRING>\\t          {strcat(str,"\t");}
<STRING>\\v          {strcat(str,"\v");}
<STRING>\\e          {strcat(str,"\e");}
<STRING>\\f          {strcat(str,"\f");}
<STRING>\\$          {strcat(str,"\$");}
<STRING>\${ID}       {
                      lexprint(str, "STRING", yylineno, &count);
                      lexprint("+", "SUM", yylineno, &count);
                      lexprint((yytext+1), "ID", yylineno, &count);
                      lexprint("+", "SUM", yylineno, &count);
                      str[0]=0;
}
<STRING>[^\\\"\n]    {strcat(str,yytext);}
<STRING>\"           {lexprint(str, "STRING", yylineno, &count); BEGIN(INITIAL);}
<STRING>[^"\n]*\n    {strcat(str,yytext);fprintf(stderr, "%s Expecting \" in %d line \n", str, yylineno); str[0] = 0; BEGIN(INITIAL);}


.                    {fprintf(stderr, "%s Not Found in %d line \n", yytext, yylineno, &count);}
%%



void main(int argc, char **argv ){
	freopen("LexemTable.tsv", "w", stdout);

        if (argc > 0){yyin = fopen( argv[1], "r" );} else yyin = stdin;
        
        printf("lexem\ttoken\tline\tnumber\n");
        
        yylex();
        return;
}

void lexprint(char * lexem, char  token[], int line, int *count){
        printf("%s\t%s\t%d\t%d\n", lexem, token, yylineno, *count);
        *count = *count + 1  ;
}

void squeeze (char* str, char symbol) {

        int i, j; 

        for (i = j = 0; str[i] != '\0'; i++) 
                if (str[i] != symbol) 
                        str[j++] = str[i];
        str[j] = '\0'; 
}

// Function to convert binary to decimal
int binaryToDecimal(char* strBin)
{
        char strBufer[100] = {0};
        strcpy(strBufer, strBin);
        int dec_value = 0;
        // Initializing base value to 1, i.e 2^0
        int base = 1;
        int len = strlen(strBufer);
        for (int i = len - 1; i > 1; i--) {
                if (strBufer[i] == '1')
                    dec_value += base;
                base = base * 2;
        }

        return dec_value;
}


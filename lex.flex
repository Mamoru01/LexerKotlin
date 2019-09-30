%option noyywrap
%option never-interactive
%option yylineno

%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>
    #include <conio.h>
    #include <locale.h>

        void lexprint(char* lexem, char  token[], int line);
        void squeeze (char* str, char symbol);
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

%{
	int count = 0; 
        char str[100];
	char idHeredoc[100];

 
%}

%%

as          {lexprint(yytext, "AS", yylineno);}
as\?        {lexprint(yytext, "AS?", yylineno);}
break       {lexprint(yytext, "BREAK", yylineno);}
class       {lexprint(yytext, "CLASS", yylineno);}
continue    {lexprint(yytext, "continue", yylineno);}
do          {lexprint(yytext, "DO", yylineno);}
else        {lexprint(yytext, "ELSE", yylineno);}
false       {lexprint(yytext, "FALSE", yylineno);}
for         {lexprint(yytext, "FOR", yylineno);}
fun         {lexprint(yytext, "FUN", yylineno);}
if          {lexprint(yytext, "IF", yylineno);}
in          {lexprint(yytext, "IN", yylineno);}
\!in        {lexprint(yytext, "NOIN", yylineno);}
interface   {lexprint(yytext, "INTERFACE", yylineno);}
is          {lexprint(yytext, "IS", yylineno);}
\!is        {lexprint(yytext, "NOIS", yylineno);}
null        {lexprint(yytext, "NULL", yylineno);}
object      {lexprint(yytext, "OBJECT", yylineno);}
package     {lexprint(yytext, "PACKAGE", yylineno);}
return      {lexprint(yytext, "RETURN", yylineno);}
super       {lexprint(yytext, "SUPER", yylineno);}
this        {lexprint(yytext, "THIS", yylineno);}
throw       {lexprint(yytext, "THROW", yylineno);}
true        {lexprint(yytext, "TRUE", yylineno);}
try         {lexprint(yytext, "TRY", yylineno);}
typealias   {lexprint(yytext, "TYPEALIAS", yylineno);}
val         {lexprint(yytext, "VAL", yylineno);}
var         {lexprint(yytext, "VAR", yylineno);}
when        {lexprint(yytext, "WHEN", yylineno);}
while       {lexprint(yytext, "WHILE", yylineno);}


by          {lexprint(yytext, "BY", yylineno);}
catch       {lexprint(yytext, "CATCH", yylineno);}
constructor {lexprint(yytext, "CONSTRUCTOR", yylineno);}
delegate    {lexprint(yytext, "DELEGATE", yylineno);}
dynamic     {lexprint(yytext, "DYNAMIC", yylineno);}
field       {lexprint(yytext, "FIELD", yylineno);}
file        {lexprint(yytext, "FILE", yylineno);}
finally     {lexprint(yytext, "FINALLY", yylineno);}
get         {lexprint(yytext, "GET", yylineno);}
import      {lexprint(yytext, "IMPORT", yylineno);}
init        {lexprint(yytext, "INIT", yylineno);}
param       {lexprint(yytext, "PARAM", yylineno);}
property    {lexprint(yytext, "PROPERTY", yylineno);}
receiver    {lexprint(yytext, "RECEIVER", yylineno);}
set         {lexprint(yytext, "SET", yylineno);}
setparam    {lexprint(yytext, "SETPARAM", yylineno);}
where       {lexprint(yytext, "WHERE", yylineno);}


actual      {lexprint(yytext, "ACTUAL", yylineno);}
abstract    {lexprint(yytext, "ABSTRACT", yylineno);}
annotation  {lexprint(yytext, "ANNOTATION", yylineno);}
companion   {lexprint(yytext, "COMPANION", yylineno);}
const  	    {lexprint(yytext, "CONST", yylineno);}
crossinline {lexprint(yytext, "CROSSINLINE", yylineno);}
data 	    {lexprint(yytext, "DATA", yylineno);}
enum 	    {lexprint(yytext, "ENUM", yylineno);}
expect 	    {lexprint(yytext, "EXPECT", yylineno);}
extrnal     {lexprint(yytext, "EXTERNAL", yylineno);}
final  	    {lexprint(yytext, "FINAL", yylineno);}
infix  	    {lexprint(yytext, "INFIX", yylineno);}
inline 	    {lexprint(yytext, "INLINE", yylineno);}
inner 	    {lexprint(yytext, "INNER", yylineno);}
internal    {lexprint(yytext, "INTERNAL", yylineno);}
lateinit    {lexprint(yytext, "LATEINIT", yylineno);}
noinline    {lexprint(yytext, "NOINLINE", yylineno);}
open  	    {lexprint(yytext, "OPEN", yylineno);}
operator    {lexprint(yytext, "OPERATOR", yylineno);}
out 	    {lexprint(yytext, "OUT", yylineno);}
override    {lexprint(yytext, "OVERRIDE", yylineno);}
private     {lexprint(yytext, "PRIVATE", yylineno);}
protected   {lexprint(yytext, "PROTECTED", yylineno);}
public      {lexprint(yytext, "PUBLIC", yylineno);}
reified     {lexprint(yytext, "REIFIED", yylineno);}
sealed      {lexprint(yytext, "SEALED", yylineno);}
suspend     {lexprint(yytext, "SUSPEND", yylineno);}
tailred     {lexprint(yytext, "TAILRED", yylineno);}
vararg      {lexprint(yytext, "VARARG", yylineno);}
field       {lexprint(yytext, "FIELD", yylineno);}
it          {lexprint(yytext, "IT", yylineno);}


Double      {lexprint(yytext, "TYPE_DOUBLE", yylineno);}
Float       {lexprint(yytext, "TYPE_FLOAT", yylineno);}
Long        {lexprint(yytext, "TYPE_LONG", yylineno);}
Int         {lexprint(yytext, "TYPE_INT", yylineno);}
Short       {lexprint(yytext, "TYPE_SHORT", yylineno);}
Byte        {lexprint(yytext, "TYPE_BYTE", yylineno);}
String      {lexprint(yytext, "TYPE_STRING", yylineno);}


IntArray    {lexprint(yytext, "TYPE_INTARRAY", yylineno);}
ByteArray   {lexprint(yytext, "TYPE_BYTEARRAY", yylineno);}
ShortArray  {lexprint(yytext, "TYPE_SHORTARRAY", yylineno);}
Array       {lexprint(yytext, "TYPE_ARRAY", yylineno);}


{EXPONENT}  {strcpy(str,yytext); squeeze(str, '_');  printf("%e\t%s\t%d\t%d\n",atoll(str), "EXPONENT", yylineno, count); count++; str[0] = 0;}
{REAL}[^.]  {strcpy(str,yytext); squeeze(str, '_');  printf("%f\t%s\t%d\t%d\n",atof(str), "REAL", yylineno, count); count++; str[0] = 0;}
{INT_10}    {strcpy(str,yytext); squeeze(str, '_');  printf("%d\t%s\t%d\t%d\n",atoi(str), "INT_10", yylineno, count); count++; str[0] = 0;}
{INT_16}    {strcpy(str,yytext); squeeze(str, '_');  int n16; sscanf(str,"%i", &n16); printf("%i\t%s\t%d\t%d\n", n16, "INT_16", yylineno, count); count++; str[0] = 0;}
{INT_2}     {strcpy(str,yytext); squeeze(str, '_');  printf("%d\t%s\t%d\t%d\n",binaryToDecimal(str), "INT_2", yylineno, count); count++; str[0] = 0;}
{ID}        {lexprint(yytext, "ID", yylineno);}


"+"         {lexprint(yytext, "SUM", yylineno);}
"-"         {lexprint(yytext, "MINUS", yylineno);}
"*"         {lexprint(yytext, "MULTIPLY", yylineno);}
"/"         {lexprint(yytext, "DIV", yylineno);}
"%"         {lexprint(yytext, "MOD", yylineno);}
"="         {lexprint(yytext, "ASSIGN", yylineno);}
"+="        {lexprint(yytext, "SUM_ASSIGN", yylineno);}
"-="        {lexprint(yytext, "MINUS_ASSIGN", yylineno);}
"*="        {lexprint(yytext, "MULTIPLY_ASSIGN", yylineno);}
"/="        {lexprint(yytext, "DIV_ASSIGN", yylineno);}
"%="        {lexprint(yytext, "MOD_ASSIGN", yylineno);}
"++"        {lexprint(yytext, "INC", yylineno);}
"--"        {lexprint(yytext, "DEC", yylineno);}
"&&"        {lexprint(yytext, "AND", yylineno);}
"||"        {lexprint(yytext, "OR", yylineno);}
"!"         {lexprint(yytext, "NO", yylineno);}
"=="        {lexprint(yytext, "EQUAL", yylineno);}
"!="        {lexprint(yytext, "NOEQUAL", yylineno);}
"==="       {lexprint(yytext, "EQUAL_LINK", yylineno);}
"!=="       {lexprint(yytext, "NOEQUAL_LINK", yylineno);}
">"         {lexprint(yytext, "MORE", yylineno);}
"<"         {lexprint(yytext, "SMALLER", yylineno);}
">="        {lexprint(yytext, "MORE_OR_EQUAL", yylineno);}
"<="        {lexprint(yytext, "SMALLER_OR_EQUAL", yylineno);}
"!!"        {lexprint(yytext, "ASSERT_NON_NULL", yylineno);}
"?."        {lexprint(yytext, "SAFE_CALL", yylineno);}
"?:"        {lexprint(yytext, "ELVIS_OPERATOR", yylineno);}
"::"        {lexprint(yytext, "CLASS_REFERENCE_OPERATOR", yylineno);}
".."        {lexprint(yytext, "CREATE_RANGE_OPERATOR", yylineno);}
":"         {lexprint(yytext, "NAME_TYPE_SEPARATOR", yylineno);}
"?"         {lexprint(yytext, "MARK_NULLABLE_TYPE", yylineno);}
"->"        {lexprint(yytext, "LAMBDA_EXPRESSION", yylineno);}
"@"         {lexprint(yytext, "ANNOTATION", yylineno);}
";"         {lexprint(yytext, "SEPARATOR_MULTIPLE_STATEMENT", yylineno);}
"_"         {lexprint(yytext, "SUBSTITUTE_AN_UNUSED_PARAMETER", yylineno);}
"$"         {lexprint(yytext, "REFERENCES_A_VARIABLE_OR_EXPRESSION_IN_A_STRING_TEMPLATE", yylineno);}
"."         {lexprint(yytext, "CALL_METHOD", yylineno);}
","         {lexprint(yytext, "ENUMERATION_OPERATOR", yylineno);}
"["         {lexprint(yytext, "OPENING_SQUARE_BRACKET", yylineno);}
"]"         {lexprint(yytext, "CLOSING_SQUARE_BRACKET", yylineno);}
"{"         {lexprint(yytext, "OPENING_OPERATOR_BRACKET", yylineno);}
"}"         {lexprint(yytext, "CLOSING_OPERATOR_BRACKET", yylineno);}
"("         {lexprint(yytext, "OPENING_PARENTHESIS", yylineno);}
")"         {lexprint(yytext, "CLOSING_PARENTHESIS", yylineno);}


\/\*                 {str[0]=0; BEGIN(MLCOMMENT); }
<MLCOMMENT>\t        {strcat(str,"\\t");}
<MLCOMMENT>\n        {strcat(str,"\\n");}
<MLCOMMENT>.         {strcat(str,yytext);}
<MLCOMMENT>\*\/      {lexprint(str, "MLCOMMENT", yylineno); BEGIN(INITIAL);}


\/\/                 {str[0]=0; BEGIN(LCOMMENT);}
<LCOMMENT>\n         {lexprint(str, "LCOMMENT", yylineno); BEGIN(INITIAL);}


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
<SYMBOL>\'           {if(strlen(str) == 1) {lexprint(str, "SYMBOL", yylineno);}else {fprintf(stderr, "Too many characters in a character literal \'\'%s\'\' in %d line \n", str, yylineno); str[0] = 0;} BEGIN(INITIAL);}
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
                      lexprint(str, "STRING", yylineno);
                      lexprint("+", "SUM", yylineno);
                      lexprint((yytext+1), "ID", yylineno);
                      lexprint("+", "SUM", yylineno);
                      str[0]=0;
}
<STRING>[^\\\"\n]    {strcat(str,yytext);}
<STRING>\"           {lexprint(str, "STRING", yylineno); BEGIN(INITIAL);}
<STRING>[^"\n]*\n    {strcat(str,yytext);fprintf(stderr, "%s Expecting \" in %d line \n", str, yylineno); str[0] = 0; BEGIN(INITIAL);}


.                    {fprintf(stderr, "%s Not Found in %d line \n", yytext, yylineno);}
%%



void main(int argc, char **argv ){
	freopen("LexemTable.tsv", "w", stdout);

        if (argc > 0){yyin = fopen( argv[1], "r" );} else yyin = stdin;
        
        printf("lexem\ttoken\tline\tnumber\n");
        
        yylex();
        return;
}

void lexprint(char * lexem, char  token[], int line){
        printf("%s\t%s\t%d\t%d\n", lexem, token, yylineno, count);
        count++;
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


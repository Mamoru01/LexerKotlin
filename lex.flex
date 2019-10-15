%option noyywrap
%option never-interactive
%option yylineno

%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>
    #include <conio.h>
    #include <locale.h>

        void lexprint(char* lexem, char  token[], char  tokenType[], int line, int *count);
        void squeeze (char* str, char symbol);
        int binaryToDecimal(char* strBin);
%}

%x TRIPLE_QUOTE_STRING
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
    char str[1000];
%}

as          {lexprint(yytext, "AS", "HARD_KEYWORD", yylineno, &count);}
as\?        {lexprint(yytext, "AS?", "HARD_KEYWORD", yylineno, &count);}
break       {lexprint(yytext, "BREAK", "HARD_KEYWORD", yylineno, &count);}
class       {lexprint(yytext, "CLASS", "HARD_KEYWORD", yylineno, &count);}
continue    {lexprint(yytext, "continue", "HARD_KEYWORD", yylineno, &count);}
do          {lexprint(yytext, "DO", "HARD_KEYWORD", yylineno, &count);}
else        {lexprint(yytext, "ELSE", "HARD_KEYWORD", yylineno, &count);}
false       {lexprint(yytext, "FALSE", "HARD_KEYWORD", yylineno, &count);}
for         {lexprint(yytext, "FOR", "HARD_KEYWORD", yylineno, &count);}
fun         {lexprint(yytext, "FUN", "HARD_KEYWORD", yylineno, &count);}
if          {lexprint(yytext, "IF", "HARD_KEYWORD", yylineno, &count);}
in          {lexprint(yytext, "IN", "HARD_KEYWORD", yylineno, &count);}
\!in        {lexprint(yytext, "NOIN", "HARD_KEYWORD", yylineno, &count);}
interface   {lexprint(yytext, "INTERFACE", "HARD_KEYWORD", yylineno, &count);}
is          {lexprint(yytext, "IS", "HARD_KEYWORD", yylineno, &count);}
\!is        {lexprint(yytext, "NOIS", "HARD_KEYWORD", yylineno, &count);}
null        {lexprint(yytext, "NULL", "HARD_KEYWORD", yylineno, &count);}
object      {lexprint(yytext, "OBJECT", "HARD_KEYWORD", yylineno, &count);}
package     {lexprint(yytext, "PACKAGE", "HARD_KEYWORD", yylineno, &count);}
return      {lexprint(yytext, "RETURN", "HARD_KEYWORD", yylineno, &count);}
super       {lexprint(yytext, "SUPER", "HARD_KEYWORD", yylineno, &count);}
this        {lexprint(yytext, "THIS", "HARD_KEYWORD", yylineno, &count);}
throw       {lexprint(yytext, "THROW", "HARD_KEYWORD", yylineno, &count);}
true        {lexprint(yytext, "TRUE", "HARD_KEYWORD", yylineno, &count);}
try         {lexprint(yytext, "TRY", "HARD_KEYWORD", yylineno, &count);}
typealias   {lexprint(yytext, "TYPEALIAS", "HARD_KEYWORD", yylineno, &count);}
val         {lexprint(yytext, "VAL", "HARD_KEYWORD", yylineno, &count);}
var         {lexprint(yytext, "VAR", "HARD_KEYWORD", yylineno, &count);}
when        {lexprint(yytext, "WHEN", "HARD_KEYWORD", yylineno, &count);}
while       {lexprint(yytext, "WHILE", "HARD_KEYWORD", yylineno, &count);}


by          {lexprint(yytext, "BY", "SOFT_KEYWORD", yylineno, &count);}
catch       {lexprint(yytext, "CATCH", "SOFT_KEYWORD", yylineno, &count);}
constructor {lexprint(yytext, "CONSTRUCTOR", "SOFT_KEYWORD", yylineno, &count);}
delegate    {lexprint(yytext, "DELEGATE", "SOFT_KEYWORD", yylineno, &count);}
dynamic     {lexprint(yytext, "DYNAMIC", "SOFT_KEYWORD", yylineno, &count);}
field       {lexprint(yytext, "FIELD", "SOFT_KEYWORD", yylineno, &count);}
file        {lexprint(yytext, "FILE", "SOFT_KEYWORD", yylineno, &count);}
finally     {lexprint(yytext, "FINALLY", "SOFT_KEYWORD", yylineno, &count);}
get         {lexprint(yytext, "GET", "SOFT_KEYWORD", yylineno, &count);}
import      {lexprint(yytext, "IMPORT", "SOFT_KEYWORD", yylineno, &count);}
init        {lexprint(yytext, "INIT", "SOFT_KEYWORD", yylineno, &count);}
param       {lexprint(yytext, "PARAM", "SOFT_KEYWORD", yylineno, &count);}
property    {lexprint(yytext, "PROPERTY", "SOFT_KEYWORD", yylineno, &count);}
receiver    {lexprint(yytext, "RECEIVER", "SOFT_KEYWORD", yylineno, &count);}
set         {lexprint(yytext, "SET", "SOFT_KEYWORD", yylineno, &count);}
setparam    {lexprint(yytext, "SETPARAM", "SOFT_KEYWORD", yylineno, &count);}
where       {lexprint(yytext, "WHERE", "SOFT_KEYWORD", yylineno, &count);}


actual      {lexprint(yytext, "ACTUAL", "MODIFIER_KEYWORD", yylineno, &count);}
abstract    {lexprint(yytext, "ABSTRACT", "MODIFIER_KEYWORD", yylineno, &count);}
annotation  {lexprint(yytext, "ANNOTATION", "MODIFIER_KEYWORD", yylineno, &count);}
companion   {lexprint(yytext, "COMPANION", "MODIFIER_KEYWORD", yylineno, &count);}
const  	    {lexprint(yytext, "CONST", "MODIFIER_KEYWORD", yylineno, &count);}
crossinline {lexprint(yytext, "CROSSINLINE", "MODIFIER_KEYWORD", yylineno, &count);}
data 	    {lexprint(yytext, "DATA", "MODIFIER_KEYWORD", yylineno, &count);}
enum 	    {lexprint(yytext, "ENUM", "MODIFIER_KEYWORD", yylineno, &count);}
expect 	    {lexprint(yytext, "EXPECT", "MODIFIER_KEYWORD", yylineno, &count);}
extrnal     {lexprint(yytext, "EXTERNAL", "MODIFIER_KEYWORD", yylineno, &count);}
final  	    {lexprint(yytext, "FINAL", "MODIFIER_KEYWORD", yylineno, &count);}
infix  	    {lexprint(yytext, "INFIX", "MODIFIER_KEYWORD", yylineno, &count);}
inline 	    {lexprint(yytext, "INLINE", "MODIFIER_KEYWORD", yylineno, &count);}
inner 	    {lexprint(yytext, "INNER", "MODIFIER_KEYWORD", yylineno, &count);}
internal    {lexprint(yytext, "INTERNAL", "MODIFIER_KEYWORD", yylineno, &count);}
lateinit    {lexprint(yytext, "LATEINIT", "MODIFIER_KEYWORD", yylineno, &count);}
noinline    {lexprint(yytext, "NOINLINE", "MODIFIER_KEYWORD", yylineno, &count);}
open  	    {lexprint(yytext, "OPEN", "MODIFIER_KEYWORD", yylineno, &count);}
operator    {lexprint(yytext, "OPERATOR", "MODIFIER_KEYWORD", yylineno, &count);}
out 	    {lexprint(yytext, "OUT", "MODIFIER_KEYWORD", yylineno, &count);}
override    {lexprint(yytext, "OVERRIDE", "MODIFIER_KEYWORD", yylineno, &count);}
private     {lexprint(yytext, "PRIVATE", "MODIFIER_KEYWORD", yylineno, &count);}
protected   {lexprint(yytext, "PROTECTED", "MODIFIER_KEYWORD", yylineno, &count);}
public      {lexprint(yytext, "PUBLIC", "MODIFIER_KEYWORD", yylineno, &count);}
reified     {lexprint(yytext, "REIFIED", "MODIFIER_KEYWORD", yylineno, &count);}
sealed      {lexprint(yytext, "SEALED", "MODIFIER_KEYWORD", yylineno, &count);}
suspend     {lexprint(yytext, "SUSPEND", "MODIFIER_KEYWORD", yylineno, &count);}
tailred     {lexprint(yytext, "TAILRED", "MODIFIER_KEYWORD", yylineno, &count);}
vararg      {lexprint(yytext, "VARARG", "MODIFIER_KEYWORD", yylineno, &count);}
field       {lexprint(yytext, "FIELD", "SPECIAL_IDENTIFIERS", yylineno, &count);}
it          {lexprint(yytext, "IT", "SPECIAL_IDENTIFIERS", yylineno, &count);}


Double      {lexprint(yytext, "TYPE_DOUBLE", "TYPE", yylineno, &count);}
Float       {lexprint(yytext, "TYPE_FLOAT", "TYPE", yylineno, &count);}
Long        {lexprint(yytext, "TYPE_LONG", "TYPE", yylineno, &count);}
Int         {lexprint(yytext, "TYPE_INT", "TYPE", yylineno, &count);}
Short       {lexprint(yytext, "TYPE_SHORT", "TYPE", yylineno, &count);}
Byte        {lexprint(yytext, "TYPE_BYTE", "TYPE", yylineno, &count);}
String      {lexprint(yytext, "TYPE_STRING", "TYPE", yylineno, &count);}


IntArray    {lexprint(yytext, "TYPE_INTARRAY", "TYPE_ARRAY", yylineno, &count);}
ByteArray   {lexprint(yytext, "TYPE_BYTEARRAY", "TYPE_ARRAY", yylineno, &count);}
ShortArray  {lexprint(yytext, "TYPE_SHORTARRAY", "TYPE_ARRAY", yylineno, &count);}
Array       {lexprint(yytext, "TYPE_ARRAY", "TYPE_ARRAY", yylineno, &count);}


{EXPONENT}  {strcpy(str,yytext); squeeze(str, '_');  printf("%e\t%s\t%s\t%d\t%d\n",atoll(str), "EXPONENT", "TYPE_NUMBER", yylineno, count); count++; str[0] = 0;}
{REAL}[^.]  {strcpy(str,yytext); squeeze(str, '_');  printf("%f\t%s\t%s\t%d\t%d\n",atof(str), "REAL", "TYPE_NUMBER", yylineno, count); count++; str[0] = 0;}
{INT_10}    {strcpy(str,yytext); squeeze(str, '_');  printf("%d\t%s\t%s\t%d\t%d\n",atoi(str), "INT_10", "TYPE_NUMBER", yylineno, count); count++; str[0] = 0;}
{INT_16}    {strcpy(str,yytext); squeeze(str, '_');  int n16; sscanf(str,"%i", &n16); printf("%i\t%s\t%s\t%d\t%d\n", n16, "INT_16", "TYPE_NUMBER", yylineno, count); count++; str[0] = 0;}
{INT_2}     {strcpy(str,yytext); squeeze(str, '_');  printf("%d\t%s\t%s\t%d\t%d\n",binaryToDecimal(str), "INT_2", "TYPE_NUMBER", yylineno, count); count++; str[0] = 0;}
{ID}        {lexprint(yytext, "ID", "IDENTIFIER", yylineno, &count);}


"+"         {lexprint(yytext, "SUM", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"-"         {lexprint(yytext, "MINUS", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"*"         {lexprint(yytext, "MULTIPLY", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"/"         {lexprint(yytext, "DIV", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"%"         {lexprint(yytext, "MOD", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"="         {lexprint(yytext, "ASSIGN", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"+="        {lexprint(yytext, "SUM_ASSIGN", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"-="        {lexprint(yytext, "MINUS_ASSIGN", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"*="        {lexprint(yytext, "MULTIPLY_ASSIGN", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"/="        {lexprint(yytext, "DIV_ASSIGN", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"%="        {lexprint(yytext, "MOD_ASSIGN", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"++"        {lexprint(yytext, "INC", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"--"        {lexprint(yytext, "DEC", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"&&"        {lexprint(yytext, "AND", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"||"        {lexprint(yytext, "OR", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"!"         {lexprint(yytext, "NO", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"=="        {lexprint(yytext, "EQUAL", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"!="        {lexprint(yytext, "NOEQUAL", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"==="       {lexprint(yytext, "EQUAL_LINK", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"!=="       {lexprint(yytext, "NOEQUAL_LINK", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
">"         {lexprint(yytext, "MORE", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"<"         {lexprint(yytext, "SMALLER", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
">="        {lexprint(yytext, "MORE_OR_EQUAL", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"<="        {lexprint(yytext, "SMALLER_OR_EQUAL", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"!!"        {lexprint(yytext, "ASSERT_NON_NULL", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"?."        {lexprint(yytext, "SAFE_CALL", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"?:"        {lexprint(yytext, "ELVIS_OPERATOR", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"::"        {lexprint(yytext, "CLASS_REFERENCE_OPERATOR", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
".."        {lexprint(yytext, "CREATE_RANGE_OPERATOR", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
":"         {lexprint(yytext, "NAME_TYPE_SEPARATOR", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"?"         {lexprint(yytext, "MARK_NULLABLE_TYPE", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"->"        {lexprint(yytext, "LAMBDA_EXPRESSION", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"@"         {lexprint(yytext, "ANNOTATION", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
";"         {lexprint(yytext, "SEPARATOR_MULTIPLE_STATEMENT", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"_"         {lexprint(yytext, "SUBSTITUTE_AN_UNUSED_PARAMETER", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"$"         {lexprint(yytext, "REFERENCES_A_VARIABLE_OR_EXPRESSION_IN_A_STRING_TEMPLATE", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"."         {lexprint(yytext, "CALL_METHOD", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
","         {lexprint(yytext, "ENUMERATION_OPERATOR", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"["         {lexprint(yytext, "OPENING_SQUARE_BRACKET", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"]"         {lexprint(yytext, "CLOSING_SQUARE_BRACKET", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"{"         {lexprint(yytext, "OPENING_OPERATOR_BRACKET", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"}"         {lexprint(yytext, "CLOSING_OPERATOR_BRACKET", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
"("         {lexprint(yytext, "OPENING_PARENTHESIS", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}
")"         {lexprint(yytext, "CLOSING_PARENTHESIS", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);}

{NEXTLINE} {lexprint("\\n", "NEXT_LINE", "SPECIAL_SYMBOL", yylineno, &count);}

\/\*                 {str[0]=0; BEGIN(MLCOMMENT); }
<MLCOMMENT>\t        {strcat(str,"\\t");}
<MLCOMMENT>\n        {strcat(str,"\\n");}
<MLCOMMENT>.         {strcat(str,yytext);}
<MLCOMMENT>\*\/      {lexprint(str, "MLCOMMENT", "MULTI-LINE_COMMENT", yylineno, &count); BEGIN(INITIAL);}


\/\/                 {str[0]=0; BEGIN(LCOMMENT);}
<LCOMMENT>\n         {lexprint(str, "LCOMMENT", "SINGLE_LINE_COMMENT", yylineno, &count); BEGIN(INITIAL);}

{WHITESPACE}+        {/* skip {WHITESPACE} */}

\"{3}                                    { str[0]=0; BEGIN(TRIPLE_QUOTE_STRING); }
<TRIPLE_QUOTE_STRING>\t                  {strcat(str,"\\t");}
<TRIPLE_QUOTE_STRING>\n                  {strcat(str,"\\n");}
<TRIPLE_QUOTE_STRING>(.|\n)              {strcat(str,yytext);}
<TRIPLE_QUOTE_STRING>\"{3}.*{NEXTLINE}   { lexprint(str, "TRIPLE_QUOTE_STRING", "STRING_CONSTANT", yylineno, &count); BEGIN(INITIAL);}

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
<SYMBOL>\'           {if(strlen(str) == 1) {lexprint(str, "SYMBOL", "CHARACTER_CONSTANT", yylineno, &count);}else {fprintf(stderr, "Too many characters in a character literal \'\'%s\'\' in %d line \n", str, yylineno); str[0] = 0;} BEGIN(INITIAL);}
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
                      lexprint(str, "STRING", "STRING_CONSTANT", yylineno, &count);
                      lexprint("+", "SUM", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);
                      lexprint((yytext+1), "ID", "IDENTIFIER", yylineno, &count);
                      lexprint("+", "SUM", "OPERATOR_SPECIAL_SYMBOL", yylineno, &count);
                      str[0]=0;
}
<STRING>[^\\\"\n]    {strcat(str,yytext);}
<STRING>\"           {lexprint(str, "STRING", "STRING_CONSTANT", yylineno, &count); BEGIN(INITIAL);}
<STRING>[^"\n]*\n    {strcat(str,yytext);fprintf(stderr, "%s Expecting \" in %d line \n", str, yylineno); str[0] = 0; BEGIN(INITIAL);}


.                    {fprintf(stderr, "%s Not Found in %d line \n", yytext, yylineno, &count);}
%%



void main(int argc, char **argv ){
	freopen("LexemTable.tsv", "w", stdout);

        if (argc > 0){yyin = fopen( argv[1], "r" );} else yyin = stdin;
        
        printf("lexem\ttoken\ttoken type\tline\tnumber\n");
        
        yylex();
        return;
}

void lexprint(char * lexem, char  token[], char  tokenType[], int line, int *count){
        printf("%s\t%s\t%s\t%d\t%d\n", lexem, token, tokenType, yylineno, *count);
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


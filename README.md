# LexerKotlin

This project is a Kotlin language lexer. Kotlin is a statically typed programming language that runs on top of the JVM and is developed by JetBrains. 

## Install 

[Installation guide](https://github.com/Mamoru01/LexerKotlin/blob/master/INSTALL.md) GCC and Flex GNU for Windows.

## Compilation 

To compile the lex.flex file, you need to run the run.bat file. If there were errors in the assembly of the .c file or a compilation error, then the stream of errors will lie in the .log file. All compilation files and temporary files are in the build folder after running the run.bat file.

## Run executable file

The program is a console utility. The input parameter is the path to the file to be analyzed.If the parameter is not entered, then the program waits for input of text for analysis.

The output file is a .tsv file:

| Lexem	        | Token               | Line  | Number lexem |
| ------------- |:-------------------:| -----:| ------------:|
|               |                     |       |              |


## Test

lexer_kotlin.exe ../test.txt

### Input file

```kotlin
//Kotlin code
class MyClass (val a: Int, var b: String){
    private val c = intArrayOf(2,0,1,9);
    private lateinit var str: String
    
    fun someFun(): Int {
        return a + c[1];
    }

    init {
        str = "sdf $b  faxs fasf $a sfas"
	str = "$n"
        someFun()
    }
}
```

### Output file

| Lexem         | Token               | Line  | Number lexem |
| ------------- |:-------------------:| -----:| ------------:|
|Kotlin code|LCOMMENT|2|0|
|class|CLASS|2|1|
|MyClass|ID|2|2|
|(|OPENING_PARENTHESIS|2|3|
|val|VAL|2|4|
|a|ID|2|5|
|:|NAME_TYPE_SEPARATOR|2|6|
|Int|ID|2|7|
|,|ENUMERATION_OPERATOR|2|8|
|var|VAR|2|9|
|b|ID|2|10|
|:|NAME_TYPE_SEPARATOR|2|11|
|String|TYPE_STRING|2|12|
|)|CLOSING_PARENTHESIS|2|13|
|{|OPENING_OPERATOR_BRACKET|2|14|
|private|PRIVATE|3|15|
|val|VAL|3|16|
|c|ID|3|17|
|=|ASSIGN|3|18|
|intArrayOf|ID|3|19|
|(|OPENING_PARENTHESIS|3|20|
|2|INT_10|3|21|
|,|ENUMERATION_OPERATOR|3|22|
|0|INT_10|3|23|
|,|ENUMERATION_OPERATOR|3|24|
|1|INT_10|3|25|
|,|ENUMERATION_OPERATOR|3|26|
|9|INT_10|3|27|
|)|CLOSING_PARENTHESIS|3|28|
|;|SEPARATOR_MULTIPLE_STATEMENT|3|29|
|private|PRIVATE|4|30|
|lateinit|LATEINIT|4|31|
|var|VAR|4|32|
|str|ID|4|33|
|:|NAME_TYPE_SEPARATOR|4|34|
|String|TYPE_STRING|4|35|
|fun|FUN|6|36|
|someFun|ID|6|37|
|(|OPENING_PARENTHESIS|6|38|
|)|CLOSING_PARENTHESIS|6|39|
|:|NAME_TYPE_SEPARATOR|6|40|
|Int|TYPE_INT|6|41|
|{|OPENING_OPERATOR_BRACKET|6|42|
|return|RETURN|7|43|
|a|ID|7|44|
|+|SUM|7|45|
|c|ID|7|46|
|[|OPENING_SQUARE_BRACKET|7|47|
|1|INT_10|7|48|
|]|CLOSING_SQUARE_BRACKET|7|49|
|;|SEPARATOR_MULTIPLE_STATEMENT|7|50|
|}|CLOSING_OPERATOR_BRACKET|8|51|
|init|INIT|10|52|
|{|OPENING_OPERATOR_BRACKET|10|53|
|str|ID|11|54|
|=|ASSIGN|11|55|
|sdf |STRING|11|56|
|+|SUM|11|57|
|b|ID|11|58|
|+|SUM|11|59|
|  faxs fasf |STRING|11|60|
|+|SUM|11|61|
|a|ID|11|62|
|+|SUM|11|63|
| sfas|STRING|11|64|
|str|ID|12|65|
|=|ASSIGN|12|66|
||STRING|12|67|
|+|SUM|12|68|
|n|ID|12|69|
|+|SUM|12|70|
||STRING|12|71|
|someFun|ID|13|72|
|(|OPENING_PARENTHESIS|13|73|
|)|CLOSING_PARENTHESIS|13|74|
|}|CLOSING_OPERATOR_BRACKET|14|75|
|}|CLOSING_OPERATOR_BRACKET|15|76|

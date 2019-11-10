rmdir build /s/q
mkdir build
cd build

flex ../lex.flex 2>>stderr.log

gcc ../lib/utf_encode.c lex.yy.c -o lexer_kotlin 2>>stderr.log

lexer_kotlin.exe ../test.txt 2>>parsing_errors.log
cd ..
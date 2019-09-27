rmdir build /s/q
mkdir build
cd build

flex ../lex.flex 2>>stderr.log

timeout 2

gcc lex.yy.c -o lexer_kotlin 2>>stderr.log

timeout 2 

lexer_kotlin.exe ../test.txt
cd ..
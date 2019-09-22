
flex lex.flex 2>>stderr.log

timeout 2

gcc lex.yy.c 2>>stderr.log

timeout 2 
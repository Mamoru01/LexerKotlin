
flex lex.flex 2>>tmp\stderr.log

timeout 2

gcc lex.yy.c 2>>tmp\stderr.log

timeout 2 
flex xref.l
gcc -o xref lex.yy.c -ll
./xref < test.c

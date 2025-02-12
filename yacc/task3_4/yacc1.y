
%{
int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%token PLUS MINUS MULT DIV
%token LPAR RPAR
%token IDENT EQ
%%

S       : E
        | IDENT EQ E
        ;

E       : E PLUS T
        | E MINUS T
        | T
        ;

T       : T MULT F
        | T DIV F
        | F
        ;

F       : NUMBER
        | IDENT
        | LPAR E RPAR
        ;
%%

#include "lex.yy.c"

int main(){
  yyparse();
  return 0;
}

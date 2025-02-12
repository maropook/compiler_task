
%{
int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%token PLUS MINUS MULT DIV
%token LPAR RPAR
%token IDENT EQ
%token PRINT
%token WHILE COND END
%token LT LE GT GE EQEQ NEQ
%%

Ss      : Ss S
        | WHILE C Ss END
        | S
        ;

S       : E
        | IDENT EQ E
        | PRINT E
        ;

C       : E N E
        ;

N       : LT
        | LE
        | GT
        | GE
        | NEQ
        | EQEQ
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

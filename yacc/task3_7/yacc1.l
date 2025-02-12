%%
[0-9]+  { return NUMBER; }
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MULT; }
"/"     { return DIV; }
"("     { return LPAR; }
")"     { return RPAR; }
"print"   { return PRINT; }
"while"   { return WHILE; }
"end"   { return END; }
"<"   { return LT; }
"<="   { return LE; }
">"   { return GT; }
">="   { return GE; }
"!="   { return NEQ; }
"=="   { return EQEQ; }
[a-z]     { return IDENT; }
"="     { return EQ; }
[\t\n ] { }
.       { printf("bad input character!!\n");
          printf("ignored!\n"); }
%%

%%
[0-9]+  { return NUMBER; }
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MULT; }
"/"     { return DIV; }
"("     { return LPAR; }
")"     { return RPAR; }
[a-z]     { return IDENT; }
"="     { return EQ; }
[\t\n ] { }
.       { printf("bad input character!!\n");
          printf("ignored!\n"); }
%%

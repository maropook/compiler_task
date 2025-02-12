%%
[0-9]+  { return NUMBER; }
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MULT; }
"/"     { return DIV; }
"("     { return LPAR; }
")"     { return RPAR; }
[\t\n ] { }
.       { printf("bad input character!!\n");
          printf("ignored!\n"); }
%%

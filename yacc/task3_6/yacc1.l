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
"cond"   { return COND; }
"end"   { return END; }
[a-z]     { return IDENT; }
"="     { return EQ; }
[\t\n ] { }
.       { printf("bad input character!!\n");
          printf("ignored!\n"); }
%%

%%
[0-9]+  { yylval = atoi(yytext); return NUM; }
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MULT; }
"/"     { return DIV; }
"\n"    { return NL;}
[ \t]+   { }
.       { }
%%

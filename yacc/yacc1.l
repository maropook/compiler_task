%%
[0-9]+  { return NUMBER; }
"+"     { return PLUS; }
[\t\n ] { }
.       { printf("bad input character!!\n");
          printf("ignored!\n"); }
%%

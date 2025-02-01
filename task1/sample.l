
%%
[0-9]+        { printf("Number!!\n"); }
[ ¥t\n]+      { /* do nothing */ }
.+            { printf("other!!\n"); }
%%
int main() {
    while (yylex()!=0) {
    }
    return 0;
}

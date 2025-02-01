%{
int line=0;
int count=0;
%}
%%
.    { count++; }
\n    { line++; count++; }
%%
int main(){
    while(yylex() != 0){
    }
    printf("%d lines\n", line);
    printf("%d 文字数\n", count);
    return 0;
}

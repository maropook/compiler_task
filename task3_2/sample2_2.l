%{
int line=0;
int count=0;
int words = 0;
%}
%%
[^ \n\t]+    { words++;
               count+=strlen(yytext); }
\n           { count++; line++; }
[ \t]        { count++; }
%%
int main(){
    while(yylex() != 0){
    }
    printf("%d lines\n", line);
    printf("%d 文字数\n", count);
    printf("%d 単語数\n", words);
    return 0;
}

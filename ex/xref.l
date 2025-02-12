%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXSIZE 1000

struct LNUM {
    int lineno;
    struct LNUM *next;
};

struct LIST {
    struct LIST *next;
    char *word;
    struct LNUM *h;
    struct LNUM *t;
};

int lineno = 1;
struct LIST *h, *t, *tmp, *tmp2;
struct LNUM *tmp3;
%}

%%

"auto"      { /* do nothing */ }
"break"     { /* do nothing */ }
"case"      { /* do nothing */ }
"char"      { /* do nothing */ }
"const"     { /* do nothing */ }
"continue"  { /* do nothing */ }
"default"   { /* do nothing */ }
"do"        { /* do nothing */ }
"double"    { /* do nothing */ }
"else"      { /* do nothing */ }
"enum"      { /* do nothing */ }
"extern"    { /* do nothing */ }
"float"     { /* do nothing */ }
"for"       { /* do nothing */ }
"goto"      { /* do nothing */ }
"if"        { /* do nothing */ }
"int"       { /* do nothing */ }
"long"      { /* do nothing */ }
"register"  { /* do nothing */ }
"return"    { /* do nothing */ }
"short"     { /* do nothing */ }
"signed"    { /* do nothing */ }
"sizeof"    { /* do nothing */ }
"static"    { /* do nothing */ }
"struct"    { /* do nothing */ }
"switch"    { /* do nothing */ }
"typedef"   { /* do nothing */ }
"union"     { /* do nothing */ }
"unsigned"  { /* do nothing */ }
"void"      { /* do nothing */ }
"volatile"  { /* do nothing */ }
"while"     { /* do nothing */ }

[_A-Za-z][_A-Za-z0-9]*  {
    for (tmp2 = h;
         tmp2->next != NULL;
         tmp2 = tmp2->next) {
        if (strcmp(tmp2->next->word, yytext) > 0) {
            break;
        }
    }

    tmp3 = (struct LNUM*) malloc(sizeof(struct LNUM));
    if (tmp3 == NULL) {
        perror("memory allocation error");
        exit(EXIT_FAILURE);
    }

    tmp3->lineno = lineno;
    tmp3->next = NULL;

    if (strcmp(yytext, tmp2->word) != 0) {
        tmp = (struct LIST*) malloc(sizeof(struct LIST));
        if (tmp == NULL) {
            perror("memory allocation error");
            exit(EXIT_FAILURE);
        }

        tmp->word = (char*) malloc(strlen(yytext) + 1);
        if (tmp == NULL) {
            perror("memory allocation error");
            exit(EXIT_FAILURE);
        }

        strcpy(tmp->word, yytext);
        tmp->h = tmp3;
        tmp->t = tmp3;

        tmp->next = tmp2->next;
        tmp2->next = tmp;
    } else {
        tmp2->t->next = tmp3;
        tmp2->t = tmp3;
    }
}

^#.*\n  { /* do nothing */ }
.       { /* do nothing */ }
\n      { lineno++; }

%%

int main() {

    /* for making dummy leading node */
    h = (struct LIST*) malloc(sizeof(struct LIST));
    if (h == NULL) {
        perror("memory allocation error");
        exit(EXIT_FAILURE);
    }

    t = h;
    h->next = NULL;
    h->word = "";

    while (yylex() != 0) {
    }

    for (tmp = h->next;
         tmp != NULL;
         tmp = tmp->next) {
        printf("%s : ", tmp->word);
        for (tmp3 = tmp->h;
             tmp3 != NULL;
             tmp3 = tmp3->next) {
            printf("%5d", tmp3->lineno);
        }
        printf("\n");
    }

    return 0;
}

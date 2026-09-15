%{
#include <stdio.h>

int count = 0;
%}

%%

[Aa][a-zA-Z]*    { count++; }
[ \t\n]+         { /* ignore whitespace */ }
.                { /* ignore all other characters */ }

%%

int main() {
    yylex();
    printf("Number of words starting with a/A: %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}

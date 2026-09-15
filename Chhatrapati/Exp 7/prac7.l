%{
#include <stdio.h>
int line_number = 0;
%}

%%

^.*con$ {
    line_number++;
    printf("Line %d ends with con: %s", line_number, yytext);
}

^.+$ { line_number++; }
\n { /* ignore newlines */ }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

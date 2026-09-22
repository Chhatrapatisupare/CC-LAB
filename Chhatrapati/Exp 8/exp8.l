%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

// Chhatrapati Supare 24070521202
%}

%%

[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}

[+\-*/()] {
    return yytext[0];
}

[ \t]+ {
    /* Skip whitespace */
}

\n {
    return '\n';
}

. {
    printf("Invalid character: %s\n", yytext);
}

%%


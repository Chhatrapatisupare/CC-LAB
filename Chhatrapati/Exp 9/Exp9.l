
[LEX FILE]

/* Chhatrapati 24070521202 */
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+(\.[0-9]+)?    { yylval = atof(yytext); return NUMBER; }
"++"                 { return INC; }
"--"                 { return DEC; }
[+\-*/%^()]          { return yytext[0]; }
[ \t\r]+             { /* Ignore spaces and tabs */ }
\n                   { return '\n'; }
.                    { return INVALID; }
%%

int yywrap(void)
{
    return 1;
}

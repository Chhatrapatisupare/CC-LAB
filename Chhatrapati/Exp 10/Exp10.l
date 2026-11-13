[LEX FILE]
/* Sanvi W 24070521191 */
%{
#include <stdio.h>
#include "forloop.tab.h"
%}

%%
"for"                    { return FOR; }
"("                      { return LPAREN; }
")"                      { return RPAREN; }
"{"                      { return LBRACE; }
"}"                      { return RBRACE; }
";"                      { return SEMICOLON; }
"="                      { return ASSIGN; }
[a-zA-Z_][a-zA-Z0-9_]*   { return IDENTIFIER; }
[0-9]+                   { return NUMBER; }
[ \t\n]+                 { /* ignore whitespace */ }
.                        { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}

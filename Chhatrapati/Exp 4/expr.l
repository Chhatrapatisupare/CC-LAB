%{
#include "y.tab.h"
%}
/*Chhatrapati Supare 24070521202*/
%%

[0-9]+      { return NUM; }
[ \t]       ;
\n          { return 0; }
.           { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}

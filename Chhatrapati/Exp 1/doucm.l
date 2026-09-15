%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {yylval = atoi(yytext);return NUMBER;}
[-+*/]  {return yytext[0];}
[\t]   ;/*Skip whitespace*/
\n    {return'\n';}
.      {print("invalid character:%s\n",yytext);}
%%

int yywrap(void){
return 1;
}

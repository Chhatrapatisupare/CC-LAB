-----------------------------------------------------------------------------------------
[YACC FILE]
-------------------------------------------------------------------------------------------

/* Chhatrapati Supare 24070521202 */
%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token FOR LPAREN RPAREN LBRACE RBRACE SEMICOLON ASSIGN IDENTIFIER NUMBER

%%
program:
    for_loop
    ;

for_loop:
    FOR LPAREN initialization SEMICOLON condition SEMICOLON update RPAREN LBRACE body RBRACE
    {
        printf("Valid FOR loop structure\n");
    }
    ;

initialization:
    IDENTIFIER ASSIGN NUMBER
    ;

condition:
    IDENTIFIER
    ;

update:
    IDENTIFIER
    ;

body:
    /* Empty body for simplicity */
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}

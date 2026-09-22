%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);

int step = 0;
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expr '\n'
      {
          printf("Result = %d\n", $1);
          printf("--------------------\n");
          step = 0;
      }
    ;

expr:
      NUMBER
      {
          $$ = $1;
          printf("Step %d: Read %d\n", ++step, $$);
      }

    | expr '+' expr
      {
          $$ = $1 + $3;
          printf("Step %d: %d + %d = %d\n",
                 ++step, $1, $3, $$);
      }

    | expr '-' expr
      {
          $$ = $1 - $3;
          printf("Step %d: %d - %d = %d\n",
                 ++step, $1, $3, $$);
      }

    | expr '*' expr
      {
          $$ = $1 * $3;
          printf("Step %d: %d * %d = %d\n",
                 ++step, $1, $3, $$);
      }

    | expr '/' expr
      {
          if ($3 == 0)
          {
              printf("Error: Division by zero\n");
              $$ = 0;
          }
          else
          {
              $$ = $1 / $3;
              printf("Step %d: %d / %d = %d\n",
                     ++step, $1, $3, $$);
          }
      }

    | '(' expr ')'
      {
          $$ = $2;
          printf("Step %d: Parentheses -> %d\n",
                 ++step, $$);
      }

    | '-' expr %prec UMINUS
      {
          $$ = -$2;
          printf("Step %d: -%d = %d\n",
                 ++step, $2, $$);
      }
    ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main(void)
{
    printf("Enter arithmetic expressions:\n");
    yyparse();
    return 0;
}


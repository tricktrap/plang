/* simplest version of interactive calculator, see Flex & Bison ch01 */
%{
#include <stdio.h>
%}

/* declare tokens */
/* Integer literals */
%token NUMBER

/* Numeric operators */
%token ADD SUB MUL DIV ABS

/* Parenthesis */
%token OP CP

/* end-of-line */
%token EOL

%%

calclist: /* nothing */
  | calclist exp EOL { printf("= %d (hex %#x)\n", $2, $2); }
  | calclist EOL     { /* Allow empty lines */ }
  ;

exp: factor /* default $$ = $1 */
  | exp ADD factor { $$ = $1 + $3; }
  | exp SUB factor { $$ = $1 - $3; }
  ;

factor: term
  | factor MUL term { $$ = $1 * $3; }
  | factor DIV term { $$ = $1 / $3; }
  ;

term: NUMBER
  | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
  | OP exp CP { $$ = $2; }
  ;

%%
main(int argc, char **argv)
{
  yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}

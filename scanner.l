/* recognize tokens for the calculator and print them out */
%{
#include "parser.tab.h"
%}

%%
"+"      { return ADD; }
"-"      { return SUB; }
"*"      { return MUL; }
"/"      { return DIV; }
[0-9]+   { yylval = atoi(yytext); return NUMBER; }
\n       { return EOL; }
[ \t]    { /* ignore whitespace */ }
"("      { return OP; }
")"      { return CP; }
"#".*    { /* ignore comments */ }
.        { printf("Mystery character %c\n", *yytext); }
%%

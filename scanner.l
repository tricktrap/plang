/* recognize tokens for the calculator and print them out */
%{
#include "parser.tab.h"
%}

%%
"+"      { return ADD; }
"-"      { return SUB; }
"*"      { return MUL; }
"/"      { return DIV; }
0x[0-9a-fA-F]+ { yylval = strtol(yytext, NULL, 16); return NUMBER; }
[0-9]+   { yylval = atoi(yytext); return NUMBER; }
\n       { return EOL; }
[ \t]    { /* ignore whitespace */ }
"("      { return OP; }
")"      { return CP; }
"#".*    { /* ignore comments */ }
.        { printf("Mystery character %c\n", *yytext); }
%%

%{
#include "y.tab.h"
%}
%%
"do" { return DO;}
\{  {return OB;}
\} {return CB;}
while {return WHILE;}
\( {return OP;}
\) {return CP;}
\; {return SC;}

[<|>|!=|==|<=|>=] {return RELOP;}

[0-9]* {yylval=atoi(yytext); return NUM;}
[a-zA-Z]([a-zA-Z0-9])* {return ID;}
%%


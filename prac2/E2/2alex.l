%{
#include "y.tab.h"
%}
%%
0 {yylval = 0; return ZERO;}
  
1 {yylval = 1; return ONE;}

.|\n {yylval = 2; return 0;}
%%
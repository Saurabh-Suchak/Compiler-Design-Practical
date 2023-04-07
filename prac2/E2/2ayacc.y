%{
#include<stdio.h>
#include<stdlib.h>
int answer=0;

%}
%token ZERO ONE

%%

final: S {printf("sequence accepted");}
;

S: onlyZeroOne | ZERO string | ONE string2;

string: onlyZeroOne string | ZERO;

string2: onlyZeroOne string2 | ONE;

onlyZeroOne:  ZERO | ONE; 

%%
int yyerror(char *msg)
{
printf("Invalid Expression \n");
exit(0);
}
main()
{
printf("Enter the expression : \n");
yyparse();
}
int yywrap(){return 1;}
%{
#include<stdio.h>
#include<stdlib.h>
int answer=0;

%}
%token DO OB CB WHILE OP CP RELOP SC ID NUM

%%

final: DO OB CB WHILE OP CONDEXP CP SC {printf("sequence accepted"); return 0;}
;

CONDEXP: IDNUM RELOP IDNUM
;

IDNUM: ID | NUM
;


// STMT : exp | exp1 
// ; 

// exp : exp '+' exp  	{$$=$1+$3;}
// | exp '-' exp		{$$=$1-$3;}
// | exp '*' exp		{$$=$1*$3;}
// | exp '/' exp		{$$=$1/$3;}
// | '(' exp ')'		{$$=$2;}
// | NUM 	

// ;

// exp1 : exp1 '+' exp1  	
// | exp1 '-' exp1		
// | exp1 '*' exp1	
// | exp1 '/' exp1		
// | '(' exp1 ')'
// | ID 
// ;


%%
int yyerror(char *msg)
{
printf("Invalid Syntax \n");
exit(0);
}
main()
{
printf("Enter the expression : \n");
yyparse();
}
int yywrap(){return 1;}
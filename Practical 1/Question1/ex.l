%{
#include<stdio.h>
#include<string.h>
int i = 0;
%}

%%
auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|float|short|unsigned {printf("\n%s is a keyword", yytext);}
[a-zA-Z]([a-zA-Z0-9])* {printf("\n%s is an identifier", yytext);}
[*+-/=] {printf("\n%s is an operator", yytext);}
[0-9]* {printf("\n%s is an integer", yytext);}
([0-9]*[.])?[0-9]+ {printf("\n%s is a float", yytext);}
[$&+,:;=?@#|<>.^*()%!-{}] {printf("\n%s is a special symbol", yytext);}  
\".*\" {printf("\n%s is a string", yytext);} 
%%
int yywrap(void){}
int main()
{

yyin = fopen("myfile.c", "r");
yylex();
return 0;
}
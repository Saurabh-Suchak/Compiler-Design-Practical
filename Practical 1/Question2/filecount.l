%{
#include<stdio.h>
int lines=0, words=0,s_letters=0,c_letters=0, num=0, spl_char=0,total=0,questions=0;
%}
%%
\n { lines++; words++;}
[' '] words++;
[A-Z] c_letters++;
[a-z] s_letters++;
[0-9] num++;
[$&+,:;=?@#|<>.^*()%!-{}] spl_char++; 
I|II|III|IV|V|VI|VII|VIII {printf("\n%s is a semester", yytext);}
(Question[0-9]*) {printf("\n %s is a question", yytext);}
((0[1-9]|[1-2][0-9]|[3][0-1])\/(0[1-9]|1[0-2])\/[0-9]{4}) {printf("\n %s is a date", yytext);}
%%
int yywrap(void){}
//strcmp
void main()
{
yyin= fopen("sample_file.txt","r");
yylex();
total=s_letters+c_letters+num+spl_char;
printf("\nThis File contains ...");
printf("\n\t%d lines", lines);
printf("\n\t%d words",words);
printf("\n\t%d small letters", s_letters);
printf("\n\t%d capital letters",c_letters);
printf("\n\t%d digits", num);
printf("\n\t%d special characters",spl_char);
printf("\n\tIn total %d characters.\n",total);
}





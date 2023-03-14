%{
#include<stdio.h>
#include<string.h>
int salesforce=0,appwrite=0;
int male=0, female=0;
int cse=0, ds=0, ec=0;
%}

%%
salesforce|appwrite {
    if(strcmp(yytext, "salesforce")==0)
        salesforce++;
    else if(strcmp(yytext, "appwrite")==0)
        appwrite++;
    }

Male|Female {if(strcmp(yytext, "Female")==0)
                female++;
             if(strcmp(yytext, "Male")==0)
                male++;   
                }

CSE|DS|EC {if(strcmp(yytext, "CSE")==0)
                cse++;
            else if(strcmp(yytext, "DS")==0)
                ds++; 
            
            else if(strcmp(yytext, "EC")==0)
                ec++;   
                }

[0-9]\.[0-9] {printf("\nCGPA: %s", yytext);}
[0-9]{10} {printf("\nMobile: %s", yytext);}
[0-9]* {printf("\nPackage: %s", yytext);}
[a-zA-Z][a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]* {printf("\nMail id: %s", yytext);}

[a-zA-Z]* {printf("\nName of the student: %s", yytext);}
%%

int yywrap(void){}
//strcmp
void main()
{
yyin= fopen("myfile.txt","r");
yylex();

printf("\nNumber of male students: %d", male);
printf("\nNumber of female students: %d", female);

printf("\n");

printf("\nNumber of students placed in salesforce: %d", salesforce);
printf("\nNumber of students placed in appwrite: %d", appwrite);


printf("\n");

printf("\nNumber of students from CSE: %d", cse);
printf("\nNumber of students from EC: %d", ec);
printf("\nNumber of students from DS: %d", ds);

}





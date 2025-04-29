%{
#include <stdio.h>
%}

%%

[ \t\n]+             /* ignore whitespace */;
i                    {printf("intdcl\n");}
f                    {printf("floatdcl\n");}
p                    {printf("print\n");}
[0-9]+               {printf("inum\n");}
\.[0-9]+             {printf("fnum\n");}
\+                   {printf("plus\n");}
\-                   {printf("minus\n");}
\*                   {printf("multiplication\n");}
\/                   {printf("division\n");}
[a-zA-Z][a-zA-Z0-9]* {printf("id\n");}
=                    {printf("assign\n");}
"//".*               {printf("COMMENT\n");}

%%

int yywrap(void){} 

int main(int argc, char **argv) {
    yylex();
    return 0;
}

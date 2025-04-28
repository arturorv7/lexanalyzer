%{
#include <stdio.h>
extern FILE *yyin; 
#define intdcl 401
#define floatdcl 402
#define inum 403
#define fnum 404
#define plus 405
#define minus 406
#define multiplication 407
#define division 408
#define id 409
#define assign 410
#define print 411
#define COMMENT 412
#define NEWLINE 413
%}

%%

[ \t]+      /* ignore whitespace */;
i           {return intdcl;}
f           {return floatdcl;}
[0-9]+      {return inum;}
\.[0-9]+    {return fnum;}
\+          {return plus;}
\-          {return minus;}
\*          {return multiplication;}
\/          {return division;}
[a-zA-Z][a-zA-Z0-9]* {return id;}
=           {return assign;}
p           {return print;}
#.*         {return COMMENT;}
\n          {return NEWLINE;}

%%

int main (int argc, char *argv[]){
    int val;
    FILE *output;

    yyin = fopen("input.txt", "r");
    output = fopen("output.txt", "w");

    while ((val = yylex())) {
        if (val == '\n') {
            fprintf(output, "\n"); 
            continue;
        }
        switch (val) {
            case intdcl:
                fprintf(out, "intdcl ");
                break;  
            case floatdcl:
                fprintf(out, "floatdcl ");
                break;
            case inum:
                fprintf(out, "inum ");
                break;        
            case fnum:
                fprintf(out, "fnum ");
                break;
            case plus:
                fprintf(out, "plus ");
                break;
            case minus:
                fprintf(out, "minus ");
                break;
            case multiplication:
                fprintf(out, "multiplication ");
                break;
            case division:
                fprintf(out, "division ");
                break;
            case id:
                fprintf(out, "id ");
                break;           
            case assign:
                fprintf(out, "assign ");
                break;   
            case print:
                fprintf(out, "print ");
                break;
            case COMMENT:
                fprintf(out, "COMMENT ");
                break;
            case NEWLINE:
                fprintf(out, "NEWLINE ");
                break;
        }
    }
    fclose(yyin);
    fclose(output);
    return 0;
}

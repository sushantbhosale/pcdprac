%{
#include<ctype.h>
#include<stdio.h>
%}

%token DIGIT

%%

line	:	expr '\n' { printf("%d\n",$1); }

expr	:	expr '+' expr1 { $$ = $1+$3; }
		|expr1
		;

expr1	:	expr1 '-' expr2 { $$ = $1-$3; }
		|expr2
		;

expr2	:	expr2 '*' expr3 { $$ = $1*$3; }
		|expr3
		;

expr3	:	expr3 '/' expr4 {
					if($3 == 0.0)
						printf("\nDivide by zero!");
					else
						$$ = $1/$3;
				}
		|expr4
		;
expr4	:	'-' DIGIT { $$ = -$2; }
		|DIGIT
		;

%%

yylex()
{
	int c;
	c = getchar();
	if(isdigit(c))
	{
		yylval = c-'0';
		return DIGIT;
	}
	return c;
}

main()
{
	printf("\nEnter Expression : ");
	yyparse();
}

int yyerror(char *error)
{
	fprintf(stderr,"%s\n",error);
}

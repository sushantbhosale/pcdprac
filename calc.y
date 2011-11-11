%token NAME NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%%
statement : 		NAME '=' expression
		|	expression	{ printf(" = %d\n",$1); }
		;

expression :		expression '+' expression	{ $$ = $1+$3; }
		|	expression '-' expression	{ $$ = $1-$3; }
		|	expression '*' expression	{ $$ = $1*$3; }
		|	expression '/' expression	{
							if($3==0.0)
								printf("\nDivide By Zero!");
							else
								$$ = $1/$3;
						}
		|	'-' expression %prec UMINUS		{ $$ = -$2; }
		|	NUMBER			{ $$ = $1; }
		;
%%

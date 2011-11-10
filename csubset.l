%{
int lineno = 1;
int cmnt = 0;

	/*
		This is a lex program to implement lexical analyzer for a subset of C.

		@@Author : Sushant Bhosale <sushantbhosale91@gmail.com>
	*/

%}

digit		[0-9]
letter		[a-zA-Z]
tab		[ \t]
ws		{tab}+
number		{digit}+
identifier	{letter}({letter}|{digit})*
operator	[+-\/*=]
preprocessor	^[tab]*#
string		\".\"
newline		[\n]+
another		.
invalid		['@'|'$']
invalidident	({invalid}|{number})+({letter}|{invalid})
relational	"<"|">"|"<="|">="|"!="|"=="
datatype	"int"|"char"|"float"|"long"|"void"|"boolean"|"double"
keyword		"goto"|"break"|"main"|"continue"|"case"|"switch"|"default"|"do"|"while"|"for"|"if"|"return"|"else"

%%
"/*"		{ cmnt=1; printf("\n%d\t%s\t\tComment Line\t",lineno,yytext); }
"*/"		{ cmnt=0; }
{datatype}	{ if(!cmnt) printf("\n%d\t%s\t\tDatatype\t",lineno,yytext); }
{keyword}	{ if(!cmnt) printf("\n%d\t%s\t\tKeyword\t",lineno,yytext); }
{preprocessor}	{ if(!cmnt) printf("\n%d\t%s\t\tPreprocessor\t",lineno,yytext); }
{number}	{ if(!cmnt) printf("\n%d\t%s\t\tNumber\t",lineno,yytext); }
{identifier}	{ if(!cmnt) printf("\n%d\t%s\t\tIdentifier\t",lineno,yytext); }
{operator}	{ if(!cmnt) printf("\n%d\t%s\t\tOperator\t",lineno,yytext); }
{string}	{ if(!cmnt) printf("\n%d\t%s\t\tString\t",lineno,yytext); }
{invalid}	{ if(!cmnt) printf("\n%d\t%s\t\tInvalid Character\t",lineno,yytext); }
{invalidident}	{ if(!cmnt) printf("\n%d\t%s\t\tInvalid Identifier\t",lineno,yytext); }
{relational}	{ if(!cmnt) printf("\n%d\t%s\t\tRelational Operator\t",lineno,yytext); }
{tab}		{}
{newline}	{ printf("\n"); if(!cmnt) lineno++; }
{another}	{ if(!cmnt) printf("\n%d\t%s\t\t##\t",lineno,yytext); }
%%

int main(int argc, char* argv[])
{
	if(argc>1)
	{
		FILE *file;
		file = fopen(argv[1],"r");
		if(file == NULL)
		{
			printf("\nCould Not Open File");
			exit(0);
		}
		yyin=file;
	}
	yylex();
	printf("\n\n");
	return 0;
}

%{
#include<stdio.h>

	/*
		This is a program to map countries to their continents.

		@@Author : Sushant Bhosale <sushantbhosale91@gmail.com>

	*/

%}

%%

[Ii][Nn][Dd][Ii][Aa] |
[Pp][Aa][Kk][Ii][Ss][Tt][Aa][Nn] |
[Cc][Hh][Ii][Nn][Aa]				{ printf("\n%s is in ASIA\n",yytext); }

[Uu][Ss][Aa] |
[Cc][Aa][Nn][Aa][Dd][Aa] |
[Mm][Ee][Xx][Ii][Cc][Oo]			{ printf("\n%s is in NORTH AMERICA\n",yytext); }

[Uu][Kk] |
[Ii][Tt][Aa][Ll][Yy] |
[Ss][Pp][Aa][Ii][Nn] |
[Gg][Ee][Rr][Mm][Aa][Nn][Yy]			{ printf("\n%s is in EUROPE\n",yytext); }

[Bb][Rr][Aa][Zz][Ii][Ll] |
[Aa][Rr][Gg][Ee][Nn][Tt][Ii][Nn][Aa] |
[Uu][Rr][Uu][Gg][Uu][Aa][Yy]			{ printf("\n%s is in SOUTH AMERICA\n",yytext); }

[Aa][Uu][Ss][Tt][Rr][Aa][Ll][Ii][Aa] |
[Nn][Ee][Ww][ ][Zz][Ee][Aa][Ll][Aa][Nn][Dd]	{ printf("\n%s is in AUSTRALIA\n",yytext); }

[a-zA-Z0-9]+					{ printf("\n%s is in IMAGINARY CONTINENT",yytext); }

%%

main()
{
	printf("\nEnter the name of the Country : \n");
	yylex();
}

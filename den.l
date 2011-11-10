%{
#include<stdio.h>
int i=0,cnt=0;
char *enc;

	/*
		This is a lex program to perform encryption and decryption.

		@@Author : Sushant Bhosale <sushantbhosale91@gmail.com>

	*/

%}

%%

[a-zA-Z]		{
				cnt = strlen(yytext);
				enc = (char*) malloc(sizeof(yytext));
				for(i=0;i<cnt;i++)
				{
					if(yytext[i]=='z')
						enc[i]='c';
					else if(yytext[i]=='Z')
						enc[i]='C';
					else if(yytext[i]=='y')
						enc[i]='b';
					else if(yytext[i]=='Y')
						enc[i]='B';
					else if(yytext[i]=='x')
						enc[i]='a';
					else if(yytext[i]=='X')
						enc[i]='A';
					else
						enc[i]=yytext[i]+3;
				}
				printf("%s",enc);
			}

.			//Ignore everything else

%%

main()
{
	yylex();
}

extern void* malloc();

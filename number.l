%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
char token[20];
char *temp;
char* reverse(char*);
int palindrome(char*);
int armstrong(char*);

	/*
		This is a program to accept a number from the user and determine whether the number is :
		1. Odd
		2. Even
		3. Decimal
		4. Real
		5. Palindrome
		6. Armstrong

		@@Author : Sushant Bhosale <sushantbhosale91@gmail.com>

	*/
%}

%%

[0-9]+.[0-9]+		{
				printf("\nEntered number : %s",yytext);
				if(strchr(yytext,'.')==NULL)
				{
					printf("\n1. Decimal : YES");
					printf("\n2. Real : NO");
					if(yytext[strlen(yytext)-1]%2)
					{
						printf("\n3. Odd : YES");
						printf("\n4. Even : NO");
					}
					else
					{
						printf("\n3. Odd : NO");
						printf("\n4. Even : YES");
					}
					if(palindrome(yytext))
						printf("\n5. Palindrome : YES");
					else
						printf("\n5. Palindrome : NO");
					if(armstrong(yytext))
						printf("\n6. Armstrong : YES");
					else
						printf("\n6. Armstrong : NO");

				}
				else
				{
					printf("\n1. Decimal : NO");
					printf("\n2. Real : YES");
					if(palindrome(yytext))
						printf("\n3. Palindrome : YES");
					else
						printf("\n3. Palindrome : NO");
				}
			}

[a-zA-Z]+		{ printf("\nEnter a number!!!"); }

%%

main()
{
	printf("\nEnter numbers : \n");
	yylex();
}

char* reverse(char *tmp)
{
	int len,i,j;
	len = strlen(tmp);
	i,j = 0;
	for(i=(len-1);i>=0;i--)
	{
		token[j]=tmp[i];
		j++;
	}
	token[j]='\0';
	return token;
}

int palindrome(char *tmp)
{
	temp = reverse(tmp);
	if(!strcmp(temp,tmp))
		return 1;
	else
		return 0;
}

int armstrong(char *tmp)
{
	int sum=0,num;
	int len,i;
	len = strlen(tmp);
	num = atoi(tmp);
	for(i=0;i<len;i++)
	{
		sum += (num%10)*(num%10)*(num%10);
		num = num/10;
	}
	if(sum==atoi(tmp))
		return 1;
	else
		return 0;
}

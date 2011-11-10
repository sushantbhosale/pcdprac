%{
#include<stdio.h>
#include<string.h>

char *word;
int choice=0,len=0;

int slength(char*);
char* reverse(char*);
int palindrome(char*);
char* concat(char*,char*);

	/*
		This is a simple lex program to implement simple string operations.

		@@Author : Sushant Bhosale <sushantbhosale91@gmail.com>

	*/

%}

%%

[a-zA-Z]+		{
				do
				{
					printf("\nEnter the the operation you want to perform : ");
					printf("\n1. Length.");
					printf("\n2. Reverse.");
					printf("\n3. Palindrome.");
					printf("\n4. Concatinate.");
					printf("\n0. Try out a new word.");
					printf("\nYour Choice : ");
					scanf("%d",&choice);
					switch(choice)
					{
						case 1:
							len = slength(yytext);
							printf("\nLength of %s = %d",yytext,len);
							break;
						case 2:
							word = reverse(yytext);
							printf("\nReverse of %s = %s",yytext,word);
							break;
						case 3:
							if(palindrome(yytext))
								printf("\n%s is a Palindrome.",yytext);
							else
								printf("\n%s is not a Palindrome.",yytext);
							break;
						case 4:
							printf("\nEnter the second word : ");
							word = (char*) malloc(20);
							scanf("%s",word);
							printf("\nFirst word : %s",yytext);
							printf("\nSecond word : %s",word);
							printf("\nConcatenation : %s",concat(yytext,word));
							break;
					}
				}
				while(choice);
			}

.			//Ignore rest

%%

main()
{
	yylex();
}

extern void* malloc();

int slength(char *wrd)
{
	printf("\n1 %s",wrd);
	int i=0;
	while(wrd[i]!='\0')
		i++;
	return i;
}

char* reverse(char *wrd)
{
	int l,i,j;
	char *tmp;
	tmp = (char*) malloc(sizeof(wrd));
	l = slength(wrd);
	j=0;
	for(i=l-1;i>=0;i--)
	{
		tmp[j] = wrd[i];
		j++;
	}
	tmp[j]='\0';
	return tmp;
}

int palindrome(char *wrd)
{
	char *tmp;
	tmp = (char*) malloc(sizeof(wrd));
	tmp = reverse(wrd);
	if(!strcmp(wrd,tmp))
		return 1;
	else
		return 0;
}

char* concat(char *wrd1,char *wrd2)
{
	char *tmp;
	int i=0,j=0,k=0;
	tmp = (char*) malloc(sizeof(wrd1)+sizeof(wrd2)+2);
	j = slength(wrd1);
	while(i<j)
	{
		tmp[i] = wrd1[i];
		i++;
	}
	k = slength(wrd2);
	j = j+k;
	k=0;
	while(i<j)
	{
		tmp[i] = wrd2[k];
		i++;
		k++;
	}
	tmp[i]='\0';
	return tmp;
}

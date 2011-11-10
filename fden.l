%{
#include<stdio.h>
#include<string.h>

void encrypt();
void decrypt();

char *fname;
FILE *fp1,*fp2;
char *file1,*file2;

	/*
		This is a simple encryption decryption program on files.

		@@Author : Sushant Bhosale <sushantbhosale91@gmail.com>

	*/

%}

%%

[a-zA-Z]+		{
				fname = (char *) malloc(sizeof(yytext));
				strcpy(fname,yytext);
				encrypt();
				decrypt();
			}

%%

main()
{
	yylex();
}

extern void* malloc();

void encrypt()
{
	int i=0;
	fp1 = fopen(fname,"r");

	file1 = (char *) malloc(200);
	file2 = (char *) malloc(200);

	for(i=0;i<200;i++)
	{
		file1[i]='\0';
		file2[i]='\0';
	}

	if(fp1==NULL)
	{
		printf("\nCannot open FILE!!");
		return;
	}
	else
	{
		while(fscanf(fp1,"%s",file2) == 1)
		{
			strcat(file1,file2);
			strcat(file1," ");
		}
		printf("\nRetrieved Data : %s",file1);
		fclose(fp1);
		for(i=0;i<strlen(file1);i++)
		{
			file2[i]=file1[i]+3;
		}

		fp2 = fopen("Encrypt","w");
		if(fp2==NULL)
			printf("\nCannot open Encrypt FILE!!");
		else
		{
			fprintf(fp2,"%s",file2);
			fclose(fp2);
		}

	}
}

void decrypt()
{
	int i=0;
	fp1 = fopen("Encrypt","r");

	file1 = (char *) malloc(200);
	file2 = (char *) malloc(200);

	for(i=0;i<200;i++)
	{
		file1[i]='\0';
		file2[i]='\0';
	}

	if(fp1==NULL)
	{
		printf("\nCannot open FILE!!!");
		return;
	}
	else
	{
		while(fscanf(fp1,"%s",file2) == 1)
		{
			strcat(file1,file2);
		}
		printf("\nEncrypted Data : %s",file1);
		fclose(fp1);
		for(i=0;i<strlen(file1);i++)
		{
			file2[i]=file1[i]-3;
		}

		printf("\nDecrypted Data : %s",file2);

	}
}

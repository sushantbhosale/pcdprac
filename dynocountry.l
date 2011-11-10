%{
#include<stdio.h>
#include<string.h>


enum
{
	LOOKUP = 0,
	ASIA,
	AFRICA,
	AUSTRALIA,
	NORTH_AMERICA,
	SOUTH_AMERICA,
	EUROPE
};

int state;

void add_country(int,char*);
int lookup_country(char*);
	/*
		This is a program to accept the country and continent names dynamically.

		@@Author : Sushant Bhosale <sushantbhosale91@gmail.com>

	*/

%}

%%

\n		{ state = LOOKUP; }

^asia		{ state = ASIA; }
^africa		{ state = AFRICA; }
^australia	{ state = AUSTRALIA; }
^namerica	{ state = NORTH_AMERICA; }
^samerica	{ state = SOUTH_AMERICA; }
^europe		{ state = EUROPE; }

[a-zA-Z]+	{
			if(state != LOOKUP)
			{
				printf("\n%s\n",yytext);
				add_country(state,yytext);
			}
			else
			{
				switch(lookup_country(yytext))
				{
					case ASIA:
						printf("\n%s is in ASIA!!!\n",yytext);
						break;
					case AFRICA:
						printf("\n%s is in AFRICA!!!\n",yytext);
						break;
					case AUSTRALIA:
						printf("\n%s is in AUSTRALIA!!!\n",yytext);
						break;
					case NORTH_AMERICA:
						printf("\n%s is in NORTH_AMERICA!!!\n",yytext);
						break;
					case SOUTH_AMERICA:
						printf("\n%s is in SOUTH_AMERICA!!!\n",yytext);
						break;
					case EUROPE:
						printf("\n%s is in EUROPE!!!\n",yytext);
						break;
					default:
						printf("\nDont Recognize the country name!!!\n");
				}
			}
		}

.		//ignore anything else

%%

main()
{
	yylex();
}

struct country
{
	char *name;
	int continent;
	struct country *next;
}*newnode,*start;

extern void* malloc();

void add_country(int state, char *name)
{
	struct country *tmp;
	if(lookup_country(name)!=0)
		printf("\n The name of the country is already in the list.");
	else
	{
		newnode = (struct country*) malloc(sizeof(struct country));
		newnode->next=NULL;
		newnode->name = (char *) malloc(strlen(name)+1);
		strcpy(newnode->name,name);
		newnode->continent=state;
		if(start==NULL)
		{
			start=newnode;
		}
		else
		{
			tmp=start;
			while(tmp->next)
				tmp=tmp->next;
			tmp->next=newnode;
		}
	}
}

int lookup_country(char *name)
{
	struct country *temp;
	temp=start;
	while(temp)
	{
		if(!strcmp(temp->name,name))
			return temp->continent;
		else
			temp=temp->next;
	}
	return 0;
}

%{
#include<string.h>
char *token;
	/*
		LEX program to determine the number of students in each department given their roll numbers in an specific format.
		C102(C for Computer) M102(M for Mechanical)

		@@Author : Sushant Bhosale <sushantbhosale91@gmail.com>

	*/
%}

%%

[\t ]+		//Ignore Whitespaces and Tabs

[Mm][0-9]+[\n]		{
				printf("\nMechanical Engineering Department : ");
				token = strtok(yytext,"M");
				token = strtok(token,"m");
				printf("%s\n",token);
			}
[Cc][0-9]+[\n]		{
				printf("\nComputer Engineering Department : ");
				token = strtok(yytext,"C");
				token = strtok(token,"c");
				printf("%s\n",token);
			}
[Ii][0-9]+[\n]		{
				printf("\nInformation Technology Engineering Department : ");
				token = strtok(yytext,"I");
				token = strtok(token,"i");
				printf("%s\n",token);
			}
[Ee][0-9]+[\n]		{
				printf("\nElectrical Engineering Department : ");
				token = strtok(yytext,"E");
				token = strtok(token,"e");
				printf("%s\n",token);
			}
[Ee][Tt][0-9]+[\n]	{
				printf("\nElectronics And Telecommunication Engineering Department : ");
				token = strtok(yytext,"ET");
				token = strtok(token,"et");
				printf("%s\n",token);
			}
[a-zA-Z0-9]+		{
				printf("\nInvalid format!!!");
			}

%%

main()
{
	yylex();
}

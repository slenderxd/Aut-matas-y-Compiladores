%option noyywrap
%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z]{2}[0-9]{6}@uaeh\.edu\.mx	{
	printf("	reconocido CORREO INSTITUCIONAL DE LA UAEH");}

[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}(\.[a-zA-Z]{2,3})?		{ printf("	reconocido CORREO INSTITUCIONAL");}
%%
int main()
{
	yylex();
	return 0;
}
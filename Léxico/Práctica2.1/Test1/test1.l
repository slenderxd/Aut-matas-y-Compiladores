%option noyywrap
%option noyywrap
%{
	#include<stdio.h>
%}

%%
[-+]?[0-9]+    { printf("reconocido NUMERO ENTERO");}
%%
int main()
{
	yylex();
	return 0;
}
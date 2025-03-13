%option noyywrap
%option noyywrap
%{
	#include<stdio.h>
%}

%%
[-+]?[0-9]*\.[0-9]+	{ printf("reconocido NUMERO DECIMAL");}
%%
int main()
{
	yylex();
	return 0;
}
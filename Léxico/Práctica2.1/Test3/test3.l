%option noyywrap
%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9_]*	{ printf("	reconocido VARIABLE(IDENTIFICADOR)");}
%%
int main()
{
	yylex();
	return 0;
}
%option noyywrap
%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z]{4}[0-9]{6}[HM]{1}[A-Z]{6}[0-9]{1} 	{ printf("	reconocido CURP");}
%%
int main()
{
	yylex();
	return 0;
}
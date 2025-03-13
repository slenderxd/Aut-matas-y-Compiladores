%option noyywrap
%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-ZÑñ][a-zA-ZÑñ]*[a-zA-ZÑñ0-9]{1}[0-9]{2}[0-1][0-9][0-3][0-9][a-zA-Z0-9]{3}		{ printf("	reconocido RFC");}
%%
int main()
{
	yylex();
	return 0;
}
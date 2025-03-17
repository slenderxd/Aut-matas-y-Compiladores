%option noyywrap
%{
#include<stdio.h>
#include <ctype.h>
%}

%%
[A-Z]    { putchar(tolower(yytext[0])); }
%%

int main(int argc, char **argv){
	if(argc > 1){
		FILE *file = fopen(argv[1], "r");
		if(!file){
			perror("No se pudo abrir el archivo");
			return 1;
		}
		yyin = file;
	}
	yylex();
	return 0;
}
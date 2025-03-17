%option noyywrap
%{
#include<stdio.h>
#include <ctype.h>
%}

%%
aplicar|ejecutar|utilizar|implementar|llevar[[:space:]]a[[:space:]]cabo|operar|emplear|practicar    { printf("Verbo de aplicacion encontrado: %s\n", yytext); }


[ \t\n]+    { /* no espacios*/ }

[a-zA-ZáéíóúÁÉÍÓÚñÑ]+    { printf("Otra palabra: %s\n", yytext); }

.          { /* no caracteres */ }
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
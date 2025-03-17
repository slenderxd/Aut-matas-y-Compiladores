%option noyywrap
%{
#include<stdio.h>
#include <ctype.h>
%}

%%
comparar|distinguir|organizar|atribuir|descomponer|estructurar|relacionar {
    printf("Verbo (Analizar): %s\n", yytext);
}

excelente|brillante|eficaz|eficiente|rápido|creativo|notable|destacado|valioso|genial {
    printf("Adjetivo positivo: %s\n", yytext);
}

aunque|sin|embargo|ni|y|o|pero {
    printf("Conjuncion: %s\n", yytext);
}

en|sobre|bajo|entre|tras|durante|hasta|desde|con|sin|por|para {
    printf("Preposicion: %s\n", yytext);
}
	

yo|tú|él|ella|nosotros|ustedes|ellos|ellas|me|te|se|nos|lo|la|le|les|los|las {
    printf("Pronombre: %s\n", yytext);
}

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
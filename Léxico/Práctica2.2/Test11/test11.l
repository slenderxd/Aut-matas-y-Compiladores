%option noyywrap
%{
#include <stdio.h>
%}

/*Variable usada para identificar comentarios multilinea */
%x COMMENT

%%

"//".*  { printf("Comentario de solo una linea: %s\n", yytext); }



"/*"   { 
          printf("Comentario de multi-linea: /*");
          BEGIN(COMMENT);
        }

<COMMENT>{
    "*/"   { printf("*/Fin comentario de multi-linea\n"); BEGIN(INITIAL); }
    (.|\n) { printf("%s", yytext); }
}



\"([^\"\n\\]|\\.)*\"  { printf("Texto en pantalla: %s\n", yytext); }

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
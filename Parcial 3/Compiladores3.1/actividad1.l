%option noyywrap 

%{
#include <stdio.h>

extern FILE *yyin;

int CONTADOR_LINEAS = 0; 
int CONTADOR_PALABRAS = 0; 
int CONTADOR_CARACTERES = 0; 
int CONTADOR_NI = 0; 
int CONTADOR_NUM = 0;
int CONTADOR_B_TO = 0; 
int CONTADOR_JO = 0;
int CONTADOR_DIGITOS = 0; 

%}

%%

[nN][iI][a-zA-ZáéíóúÁÉÍÓÚñÑ]*         { CONTADOR_NI++; CONTADOR_PALABRAS++; CONTADOR_CARACTERES+= yyleng; }
[nN][uUúÚ][mM][a-zA-ZáéíóúÁÉÍÓÚñÑ]*   { CONTADOR_NUM++; CONTADOR_PALABRAS++; CONTADOR_CARACTERES+= yyleng; }
[b][a-zA-ZáéíóúÁÉÍÓÚñÑ]*[tT][oO]     { CONTADOR_B_TO++; CONTADOR_PALABRAS++; CONTADOR_CARACTERES+= yyleng; }
[a-zA-ZáéíóúÁÉÍÓÚñÑ]*[jJ][oO]        { CONTADOR_JO++; CONTADOR_PALABRAS++; CONTADOR_CARACTERES+= yyleng; }

[0-9]+           { CONTADOR_DIGITOS++; CONTADOR_CARACTERES+= yyleng; }

\n               { CONTADOR_LINEAS++; } 

[a-zA-ZáéíóúÁÉÍÓÚñÑ]+ { CONTADOR_PALABRAS++; CONTADOR_CARACTERES += yyleng; } 

.               { CONTADOR_CARACTERES++; }  

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

    printf("\nTotal de Lineas: %d\n", CONTADOR_LINEAS); 
    printf("Total de Palabras: %d\n", CONTADOR_PALABRAS); 
    printf("Total de Caracteres: %d\n", CONTADOR_CARACTERES); 

    printf("\nPalabras que inician con NI: %d\n", CONTADOR_NI); 
    printf("Palabras que inician con NUM: %d\n", CONTADOR_NUM);
    printf("Palabras que inician con B y terminan con TO: %d\n", CONTADOR_B_TO); 
    printf("Palabras que terminan con JO: %d\n", CONTADOR_JO);
    printf("Digitos: %d\n", CONTADOR_DIGITOS);     

    if(argc > 1){
        fclose(yyin);
    }

    return 0;
}

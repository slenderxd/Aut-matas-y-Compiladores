%option noyywrap
%{
#include<stdio.h>
#include <ctype.h>
%}

%%
"auto"              { printf("Palabra reservada: auto\n"); }
"break"             { printf("Palabra reservada: break\n"); }
"case"              { printf("Palabra reservada: case\n"); }
"const"             { printf("Palabra reservada: const\n"); }
"continue"          { printf("Palabra reservada: continue\n"); }
"default"           { printf("Palabra reservada: default\n"); }
"do"                { printf("Palabra reservada: do\n"); }
"else"              { printf("Palabra reservada: else\n"); }
"enum"              { printf("Palabra reservada: enum\n"); }
"extern"            { printf("Palabra reservada: extern\n"); }
"for"               { printf("Palabra reservada: for\n"); }
"goto"              { printf("Palabra reservada: goto\n"); }
"if"                { printf("Palabra reservada: if\n"); }
"register"          { printf("Palabra reservada: register\n"); }
"return"            { printf("Palabra reservada: return\n"); }
"signed"            { printf("Palabra reservada: signed\n"); }
"sizeof"            { printf("Palabra reservada: sizeof\n"); }
"static"            { printf("Palabra reservada: static\n"); }
"struct"            { printf("Palabra reservada: struct\n"); }
"switch"            { printf("Palabra reservada: switch\n"); }
"typedef"           { printf("Palabra reservada: typedef\n"); }
"union"             { printf("Palabra reservada: union\n"); }
"unsigned"          { printf("Palabra reservada: unsigned\n"); }
"volatile"          { printf("Palabra reservada: volatile\n"); }
"while"             { printf("Palabra reservada: while\n"); }


"char"              { printf("Tipo de dato: char\n"); }
"double"            { printf("Tipo de dato: double\n"); }
"float"             { printf("Tipo de dato: float\n"); }
"int"               { printf("Tipo de dato: int\n"); }
"long"              { printf("Tipo de dato: long\n"); }
"short"             { printf("Tipo de dato: short\n"); }
"void"              { printf("Tipo de dato: void\n"); }


"main"              { printf("Funcion principal: main\n"); }
"printf"            { printf("Funcion: printf\n"); }
"scanf"             { printf("Funcion: scanf\n"); }


[a-zA-Z_][a-zA-Z0-9_]*   { printf("Variable: %s\n", yytext); }

[ \t\n]+    { /* no espacios*/ }

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



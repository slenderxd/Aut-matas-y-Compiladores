/*SECCION DE DECLARACIONES C*/
%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex(void);
	int yywrap(void);
	int yyerror(char* s);
%}

/*SECCION DE DECLARACIONES YACC*/

%union{
	int num;
}

%start statement
%token <num> NUMBER
%token PLUS MINUS MULTI DIV EOL
%type <num> expression

%% 

statement:  expression EOL {printf("= %d\n", $1); }

expression:
    NUMBER                { $$ = $1; printf("numero: %d\n", $$); }
    | expression PLUS NUMBER  { $$ = $1 + $3; printf("+: %d\n", $$); }
    | expression MINUS NUMBER  { $$ = $1 - $3; printf("-: %d\n", $$); }
    | expression MULTI NUMBER  { $$ = $1 * $3; printf("*: %d\n", $$); }
    | expression DIV NUMBER  { $$ = $1 / $3; printf("/: %d\n", $$); }
    ;
%%

/*CODIGO C*/

int main()
{
	yyparse();
	return 1;

int yyerror(char *s) {
    fprintf(stderr, "Error de Sintaxis! - %s\n", s);
    return 0;
}

	return 1;
}
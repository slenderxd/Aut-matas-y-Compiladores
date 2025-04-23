/* SECCION DE DECLARACIONES*/
%{
	#include<stdio.h>
	#include "calculator.tab.h"
	extern YYSTYPE yylval;
	int yyerror(char *s);
%}

/*SECCION DE REGLAS*/
%%
[0-9]+ { yylval.num = atoi(yytext); return NUMBER;}
"+" { return PLUS;}
"-" { return MINUS;}
"*" { return MULTI;}
"/" { return DIV;}
\n  { return EOL;}
[ \t\f\v] {}
. {return *yytext;}
%%

int yywrap(void)
{
	return 1;
}

/*MENSAJE DE ERROR */
int yyerror(char* s){
fprintf(stderr, "Error de Sintaxis! - %s\n", s);
return 0;
}
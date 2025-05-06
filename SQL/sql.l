%{
#include <stdio.h>
#include <string.h>
#include "struct.h"
#include "y.tab.h"
int numerorighe=0;
%}
%option noyywrap
%%
select			return SELECT;
delete			return DELETE;
insert			return INSERT;
into			return INTO;
values			return VALUES;
from			return FROM;
join			return JOIN;
on			return ON;
where			return WHERE;
group			return GROUP;
by			return BY;
having			return HAVING;
order			return ORDER;
limit			return LIMIT;
offset			return OFFSET;
and			return AND;
or			return OR;

[*]			return *yytext;
[,]			return *yytext;
[=]			return *yytext;
[<]			return *yytext;
[>]			return *yytext;
[(]			return *yytext;
[)]			return *yytext;
[a-zA-Z][a-zA-Z0-9]* 	{yylval.Mystr=strdup(yytext);
			return IDENTIFIER;}
[0-9]+			return CONST;
\n			{++yylval.numerorighe; return NL;}
[ \t]+			/* ignore whitespace */

%%

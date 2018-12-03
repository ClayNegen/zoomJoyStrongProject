%{
	#include "zoomjoystrong.tab.h"
	#include <stdio.h>
%}
%option yylineno
%option noyywrap
%%

end				{ return END; }
;				{ return END_STATEMENT; }
point			{ return POINT; }
line			{ return LINE; }
circle			{ return CIRCLE; }
rectangle		{ return RECTANGLE; }
set_color		{ return SET_COLOR; }
[0-9]+			{ yylval.intVal = atoi(yytext); return INT; }
[0-9]+.\[0-9]+		{ yylval.floatVal = atoi(yytext);  return FLOAT; }
[\n\t ]			{ ; }
.				{ printf("Un-recognized character '%s' on line %d\n", yytext, yylineno); }
			
%%

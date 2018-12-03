%{
	#include <stdio.h>
%}

%option yylineno

%%

END					{ printf("End program\n"), exit(1); }
[;]					{ printf("END CHARACTER \n") ; }
POINT					{ printf("POINT \n"); }
LINE					{ printf("LINE \n"); }
CIRCLE					{ printf("CIRCLE \n"); }
RECTANGLE				{ printf("RECTANLGE \n"); }
SET_COLOR				{ printf("SET COLOR \n"); }
[0-9]					{ printf("INT \n"); }
[0-9]+.\[0-9]+				{ printf("FLAOT \n"); } 
[\n\t ]					{ ; }
.					{ printf("NOT DEFINED \n"); }
			
%%

int main(int argc, char** rgv){
	yylex();
}

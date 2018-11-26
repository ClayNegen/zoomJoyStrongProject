%{
	#include <stdio.h>
	#include "zoomjoystrong.h"
	int yyerror(const char* err);
	int yylex();
%}

%token INT
%token END
%token EOL
%token FLOAT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR

%%

program:	body END;
body: statement
    | body statement
    ;
statement: LINE INT INT INT INT { line($2,$3,$4,$5); }
	 | POINT INT INT { point($2,$3); }
	 | CIRCLE INT INT INT { circle($2,$3,$4); }
	 | RECTANGLE INT INT INT INT { rectangle($2,$3,$4,$5); }
	 | SET_COLOR INT INT INT { set_color($2,$3,$4); }
	 ;
%%

int main (int argc, char** argv){
	yyparse();
	return 0;
}

int yyerror(const char* err){
	printf("%s\n", err);
	return 1;
}

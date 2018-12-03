%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.h"
	int yyerror(const char* err);
	int yylex();
	extern char* yytext;
%}
/**
* Declares what values allign with what token
**/
%union{
	int intVal;
	float floatVal;
}

%token END
%token END_STATEMENT
%token <intVal> INT
%token <floatVal> FLOAT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token ERROR

%%

/**
* Grammar section: defines what proper statements are
**/
program:	body end;
body: statement
    | body statement
    ;
statement: line
	 | point
	 | circle
	 | rectangle
	 | set_color
	 ;

line: LINE INT INT INT INT END_STATEMENT
{
	if($2 >= 0 && $2 <= WIDTH && $3 >= 0 && $3 <= HEIGHT) {
		line($2,$3,$4,$5);
	} else {
		printf("Error - points have to be between 0 and %d wide and between 0 and %d high", WIDTH, HEIGHT);
	}
};
point: POINT INT INT END_STATEMENT
{
	if($2 >= 0 && $2 <= WIDTH && $3 >= 0 && $3 <= HEIGHT) {
		point($2,$3);
	} else {
		printf("Error - points have to be between 0 and %d wide and between 0 and %d high", WIDTH, HEIGHT);
	}
};
circle: CIRCLE INT INT INT END_STATEMENT
{
	if($2 >= 0 && $2 <= WIDTH && $3 >= 0 && $3 <= HEIGHT) {
		circle($2,$3,$4);
	} else {
		printf("Error - points have to be between 0 and %d wide and between 0 and %d high", WIDTH, HEIGHT);
	}
};
rectangle: RECTANGLE INT INT INT INT END_STATEMENT
{
	if($2 >= 0 && $2 <= WIDTH && $3 >= 0 && $3 <= HEIGHT) {
		rectangle($2,$3,$4,$5);
	} else {
		printf("Error: points have to be between 0 and %d wide and between 0 and %d high", WIDTH, HEIGHT);
	}
};
set_color: SET_COLOR INT INT INT END_STATEMENT
{
	if($2 >= 0 && $2 <= 255 && $3 >= 0 && $3 <= 255 && $4 >= 0 && $4 <= 255) {
		set_color($2,$3,$4);
	} else {
		printf("Error - values must be between 0 and 255");
	}
};
end: END END_STATEMENT
{
	exit(1);
};
%%

extern FILE* yyin;

int main (int argc, char** argv){
	setup();
	yyin = fopen(argv[1], "r");
	yyparse();
	return 0;
}

int yyerror(const char* err){
	printf("%s\n", err);
	return 1;
}

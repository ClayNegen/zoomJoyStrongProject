%{
	#include "zoomjoystrong.tab.h"
	#include <stdio.h>
%}

%%

END					{ return END; }
[;]					{ return EOL; }
POINT					{ return POINT; }
LINE					{ return LINE; }
CIRCLE					{ return CIRCLE; }
RECTANGLE				{ return RECTANGLE; }
SET_COLOR				{ return SET_COLOR; }
[0-9]+					{ return INT; }
[0-9]+.\[0-9]+				{ return FLOAT; }
[\n\t ]					{ ; }
.					{ printf("Un-recognized character"); }
			
%%

%{
#include<stdio.h>
#include<math.h>
#include "y.tab.h"

extern double vbltable[26];
%}

%%
([0-9]+|([0-9]*\.[0-9]+))		{ yylval.dval = atoi(yytext); return NUMBER; }
[ \t]		;
[a-z]			{ yylval.vblno = yytext[0] - 'a'; return NAME; }
\n		return 0;
.		return yytext[0];
%%

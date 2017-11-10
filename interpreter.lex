import java_cup.runtime.Symbol;

%%
%unicode
%cup
%int
%line
%column

id 			=	[a-zA-Z][a-zA-Z0-9]*
and			=	"et" 	| 	"ET" 	| 	"and" 	| 	"AND"
or			=	"ou" 	| 	"OU"	| 	"or"	| 	"OR"
true		=	"vrai" 	|	"VRAI"	| 	"true"	|	"TRUE"
false		=	"faux"	|	"FAUX"	|	"false"	|	"FALSE"
not			=	"non"	|	"NON"	|	"not"	|	"NOT"
print 		=	"print"	|	"PRINT"
whitespace	=	[ \r\t\f]

%%

{and}				{return new Symbol(sym.and);}
{or}				{return new Symbol(sym.or);}
{true}				{return new Symbol(sym.True);}
{false}				{return new Symbol(sym.False);}
{not}				{return new Symbol(sym.not);}
{print}				{return new Symbol(sym.print);}
{id}				{return new Symbol(sym.id, new String(yytext()));}
"="		      		{return new Symbol(sym.assign);}
"("		      		{return new Symbol(sym.lbracket);}
")"		      		{return new Symbol(sym.rbracket);}
{whitespace}		{}
\n 					{return new Symbol(sym.NL);}
.					{System.err.println("Invalid token : " + yytext() + " line : " + yyline + " column: " + yycolumn);}
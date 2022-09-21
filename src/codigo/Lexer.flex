package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L = [a-zA-Z_]+
D = [0-9]+
d = [1-9]+
S = [+]+
R = [-]+
P = [;]+
Para = [(]
Parc = [)]
espacio=[ \t\r\n]+
%{
    public String lexeme;
%}
%%
int |
INT |
long|
LONG |
if |
IF |
else |
ELSE |
for |
FOR |
while |
WHILE {lexeme=yytext(); return Reservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
= {lexeme=yytext(); return Asignacion;}
{S} {lexeme=yytext(); return Suma;}
{R} {lexeme=yytext(); return Resta;} 
"," {lexeme=yytext();return Coma;}
{P} {lexeme=yytext(); return PuntoYComa;}
{Para} {lexeme=yytext(); return Paraper;}
{Parc} {lexeme=yytext(); return Parcier;}
{L} * {lexeme=yytext(); return Palabra;}
{L} ({L} | {D}) * {lexeme=yytext(); return Id;}
{d} ({D}) * {lexeme=yytext(); return Entero;}
 . {return Error;}
package codigo;
import static codigo.Tokens.*;
%%
%class lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[,\t,\r,\n]+

%{
    public String lexeme;
%}
%%

/* espacios */
{espacio} {/*ignore*/}

/*comments*/
( "//"(.)* ) {/*Ignore*/}
( "/*"(.)* ) {/*Ignore*/}
( "*/ *"(.)* ) {/*Ignore*/}
 "\n" {return Linea;}


/* para iniciar */
("inicio") {lexeme=yytext(); return Inicio;}

/*para terminar */
("fin") {lexeme=yytext(); return End;}

/*tipo de datos */
int |
string |
boolean |
char |
double |
float |
entero |
doble |
flotante |
caracter |
booleano |
cadena {lexeme=yytext(); return tipo_dato;}

/*palabras reservadas*/
ingresar |
como | 
con_valor |
si |
entonces |
fin_si |
de_lo_contrario |
o_si |
segun |
hacer |
de_lo_contrario |
fin_segun |
para |
hacer |
fin_para |
con |
incremental |
mientras |
fin_mientras |
repetir |
hasta_que |
retornar | 
metodo | 
fin_metodo |
con_parametros |
ejecutar |
imprimir |
imprimir_ln  {lexeme=yytext(); return Reservadas;}
{L}({L}|{D})* {lexeme = yytext(); return Identificador;}
("(-"{D}+")") | {D}+ {lexeme = yytext(); return Numero;}
. {return ERROR;}


/*simbolos*/
"->" { return asignar;}
"+" { return suma;}
"-" { return resta;}
"*" { return multi;}
"/" {return division;}
"=" {; return igual;}
"," { return coma;}
"." { return punto;}
";" { return puntocoma;}
"(" { return parentOpen;}
")" {return parenClose;}
"[" { return corchOpen;}
"]" {return corchClose;}
"{" {Return keyopen;}
"}" {return keyclose; } 
\" { return comillas;}
"_" { return guion_low;}
">"  { return mayor_que;}
"or" { return operadorOr;}
"and"  { return operadorAnd;}
"not"  { return operadorNot; lexeme = yytext();}
package codigo;
import static codigo.Tokens.*;
%%
%class lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t  \r \n]+

%{
    public String lexeme;
%}
%%

/* espacios */
{espacio} {/*ignore*/}

/*comments*/
\/\/.+ {lexeme=yytext(); return comentario1;}
\/\*.+(\n|.+)*\*\/  {lexeme=yytext(); return comentario2;}
 


/* para iniciar */
("inicio") {lexeme=yytext(); return inicio;}

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
potencia |
modulo|
imprimir_ln  {lexeme=yytext(); return Reservadas;}

("(-"{D}+")") | {D}+ {lexeme = yytext(); return Numero;}



/*simbolos*/
"->" {  lexeme = yytext(); return asignar;}
"," {  lexeme = yytext(); return coma;}
"." {  lexeme = yytext(); return punto;}
";" { lexeme = yytext();  return puntocoma;}
"(" {  lexeme = yytext(); return parentOpen;}
")" { lexeme = yytext(); return parenClose;}
"[" {  lexeme = yytext(); return corchOpen;}
"]" { lexeme = yytext(); return corchClose;}
"{" { lexeme = yytext(); return keyopen;}
"}" { lexeme = yytext(); return keyclose; } 
\" {  lexeme = yytext(); return comillas;}
"_" {  lexeme = yytext(); return guion_low;}
"=" {  lexeme = yytext(); return igual;}
"?" {  lexeme = yytext(); return interrogacionFin;}
"¿ " {  lexeme = yytext(); return interrogacionInicio;}
"imprimir_ln" {  lexeme = yytext(); return impresion_con_salto;}
/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
(< |>| mayor|menor|es_igual|mayor_o_igual|menor_o_igual|es_diferente) {lexeme = yytext(); return operadorRelacional;}
[+|\-|\/|*] {  lexeme = yytext(); return operadorAritmetico;}
(or|and|not) {  lexeme = yytext(); return operadorLogico;}

/* variable */
_[a-zA-Z0-9]+_ {  lexeme = yytext(); return variable;}
. {return ERROR;}
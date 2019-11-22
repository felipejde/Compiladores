package testmaven;
import java.util.Stack;
%%
%{
public int linea=1;
Stack<Integer> pila = new Stack<Integer>(); 

public void identacion(int a){
    if (pila.empty()){
        pila.push(a);
        System.out.println("INDENTA("+a+")");
    }else{
        if (a<=pila.peek()){
            while(!pila.empty() && pila.peek()!=a){
                pila.pop();
                }
            if (pila.empty()){
                System.out.println("Error identacion, linea "+linea);System.exit(0);
            }else{
                pila.pop();
                System.out.println("DEINDENTA("+a+")");
            }        
        }else{
            pila.push(a);
            System.out.println("INDENTA("+a+")");
        }
   }
} 
%}

%class AnalizadorPython
%public
%standalone
%unicode

OPERADOR = "+" | "-" | "*" | "**" | "/" | "//" | "%" | "+=" | "-=" | "="| ">" | "<" | "<=" | ">=" 
espacio = " "*
SEPARADOR = ":" | ";" 
FLOTANTE  = [1-9]*[0-9]"."[0-9]+[1-9]*
ENTERO  = [1-9]*[0-9]
COMENTARIO = #.*
RESERVADAS = "and" | "if" | "break" | "or" | "def" | "del" | "else" | "global" | "while" | "finally" | "for" | "elif" | "not" | "continue" | "in" | "is" | "from" | "try" | "exec" | "print" | "raise" | "lambda" | "class" | "import" | "assert" | "return" | "except" | "yield"
ID_PHYTHON = ([A-Z] | [a-z])([a-z] |[A-Z] |[0-9])*
CADENA = \"[^\"]*\" |\'[^\"]*\'
ERRORCADENA = \". | \'. 
ERROR = [^OPERADOR]| [^SEPARADOR] | [^FLOTANTE] | [^COMENTARIO] | [^RESERVADAS ] | [^ID_PHYTHON  ] 
salto=\n
%s otro 
%%

<otro>{
" "* {
     this.identacion(yylength());   
     }
}


{salto} { System.out.println("salto");linea+=1;yybegin(otro);}
{SEPARADOR}      { System.out.println("SEPARADOR("+yytext() + ")"); }
{OPERADOR}      { System.out.println("OPERADOR("+yytext() + ")"); }
{COMENTARIO}      {System.out.println("COMENTARIO("+yytext() + ")"); }
{RESERVADAS}      { System.out.println("RESERVADAS("+yytext() + ")"); }
{FLOTANTE}      { System.out.println("FLOTANTE("+yytext() + ")"); }
{ENTERO}      { System.out.println("ENTERO("+yytext() + ")"); }
{ID_PHYTHON}     {System.out.println("ID_PHYTHON("+yytext() + ")");}
{CADENA}     {System.out.println("CADENA("+yytext() + ")");}
{ERRORCADENA}      { System.out.println("Error cadena("+yytext() + "), linea "+ linea); System.exit(0);}
{ERROR}      { System.out.println("Error lexema("+yytext() + "), linea "+ linea); System.exit(0);}
.             { }
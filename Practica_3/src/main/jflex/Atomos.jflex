package asintactico;
%%
%{
    private Parser parser;


    public Nodos (java.io.Reader r, Parser p){
    	   this(r);
    	   parser = p;
    }


%}
%class Nodos
%standalone
%public
%unicode
ENTERO  = [1-9][0-9]* | 0+
MAS = "+" 
MENOS = "-"
MUL = "*"
DIV = "/"
%%
a               { parser.yylval = new ParserVal(yytext()); return parser.NODO; }
{ENTERO}        { parser.yylval = new ParserVal(yytext()); return parser.ENTERO; }
{MAS}       { parser.yylval = new ParserVal(yytext()); return parser.MAS; }
{MENOS}       { parser.yylval = new ParserVal(yytext()); return parser.MENOS; }
{MUL}       { parser.yylval = new ParserVal(yytext()); return parser.MUL; }
{DIV}       { parser.yylval = new ParserVal(yytext()); return parser.DIV; }
.             { }


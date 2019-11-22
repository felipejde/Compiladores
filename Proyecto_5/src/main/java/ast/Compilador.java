//import Parser;
package ast;
import java.io.*;
import ast.patron.compuesto.*;
import ast.patron.visitante.*;


public class Compilador{

    Parser parser;
    Nodo raízAST;
    //VisitorPrint v_print;
    VisitanteTipo v;
    VisitanteGenerador vg;
    VisitanteGenerador vg2;
    static String archivo;
    
    Compilador(Reader fuente){
        parser = new Parser(fuente);
       // v_print = new VisitorPrint();
        v= new VisitanteTipo();
        vg = new VisitanteGenerador();
    }

    public void ConstruyeAST(boolean debug){
        parser.yydebug = debug;
        parser.yyparse(); // análisis léxico, sintáctio y constucción del AST
        raízAST = parser.raíz;
    }

    public void imprimeAST(){
      // parser.raíz.accept(v_print);
        parser.raíz.accept(v);
        parser.raíz.accept(vg);
        String st = vg.Imprime();
        vg2 = new VisitanteGenerador(archivo,st);
        
        
    }

    public static void main(String[] args){
        archivo = "src/main/resources/test.p";
        try{
            Reader a = new FileReader(archivo);
            Compilador c  = new Compilador(a);
            c.ConstruyeAST(true);
            c.imprimeAST();
        }catch(FileNotFoundException e){
            System.err.println("El archivo " + archivo +" no fue encontrado. ");
        }catch(ArrayIndexOutOfBoundsException e){
            System.err.println("Uso: java Compilador [archivo.p]: ");
        }
    }
}
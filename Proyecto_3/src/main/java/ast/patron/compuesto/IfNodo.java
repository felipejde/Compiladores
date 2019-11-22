package ast.patron.compuesto;
import ast.patron.visitante.*;
import java.util.LinkedList;

public class IfNodo extends Compuesto
{
    //El compuesto esta contruido por Hijos
    public IfNodo(){
	super();
    }
    
    //Se obtine el total de hijos que estan en la lista tipo Nodo
    public LinkedList<Nodo> getTotal(){
        return hijos.getAll();
    }
    
    //Obtenenmos el numero de hijos para saber en que caso va a entrar.
    public int numeroHijos(){
        return hijos.size();
    }

    public void accept(Visitor v){
     	v.visit(this);
    }
}


package ast.patron.compuesto;
import ast.patron.visitante.*;

public class MenorNodo extends NodoBinario{

    public MenorNodo(Nodo l, Nodo r){
	super(l,r);
    }

    public void accept(Visitor v){
     	v.visit(this);
    }
}
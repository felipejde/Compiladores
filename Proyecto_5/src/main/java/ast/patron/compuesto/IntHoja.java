package ast.patron.compuesto;
import ast.patron.visitante.*;

public class IntHoja extends Hoja
{
    public IntHoja(int i){
	valor = new Variable(i);
	tipo = 1;
    }

    public int accept(Visitor v){
     	return v.visit(this);
    }
}

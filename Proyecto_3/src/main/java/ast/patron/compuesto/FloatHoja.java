package ast.patron.compuesto;
import ast.patron.visitante.*;

public class FloatHoja extends Hoja
{
    public FloatHoja(float   i){
	valor = new Variable(i);
                   tipo=1;
                    
    }

    public void accept(Visitor v){
     	v.visit(this);
    }
}
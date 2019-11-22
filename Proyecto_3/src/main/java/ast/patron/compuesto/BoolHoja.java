package ast.patron.compuesto;
import ast.patron.visitante.*;

public class BoolHoja extends Hoja
{
    public BoolHoja(String i){
        if (i.equals("False")){
            valor = new Variable(false);
        } else{
            valor = new Variable(true);
        }
        tipo = 1;
    }

    public void accept(Visitor v){
     	v.visit(this);
    }
}

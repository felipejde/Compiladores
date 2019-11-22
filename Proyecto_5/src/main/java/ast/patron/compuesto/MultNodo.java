/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ast.patron.compuesto;
import ast.patron.visitante.*;

/**
 *
 * @author hectorsama
 */
public class MultNodo extends NodoBinario{
    
    public MultNodo(Nodo l, Nodo r){
        super(l,r);
    }
    public int accept(Visitor v){
     	return v.visit(this);
    }

}

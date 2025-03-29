package Metodos;

public class Returnmajor {
    
    public static void main(String[] args) {
        int a = 265;
        int b = 230;
        int resultado = major(a, b);
        System.out.println(resultado);
    }
    
    public static int major(int a, int b){
        if (a<b){
            return b;   
        }
        else {
            return a;
        }
    }
}

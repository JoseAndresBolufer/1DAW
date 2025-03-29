package Metodos;
import java.util.*;

public class Exercici5 {
    
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        System.out.println("Escribe el carácter que quieres imprimir por pantalla");
        char a = lector.next().charAt(0);
        System.out.println("escribe el número de veces que quieres que se imprima ese carácter por pantalla");
        int b = lector.nextInt();
        System.out.println("Grácias, a continuación se procederá a imprimir el carácter seleccionado las veces seleccionadas:");
        A(a,b);
    }

    public static void A (char a, int b){
        for(int i=0;i<b;i++){
            System.out.println(a);
        }
    }
}

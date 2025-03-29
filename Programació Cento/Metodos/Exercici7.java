package Metodos;
import java.util.*;

public class Exercici7 {
    public static void main(String[] args) {
        menu();
        Scanner lector = new Scanner(System.in);
        int entero;
        System.out.println("Introduce el número entero del que deseas saber su factorial:");
        System.out.println("");
        entero = lector.nextInt();
        System.out.println("El factorial de "+entero+"és: "+numeroFactorial(entero));
    }

    public static void menu(){
        System.out.println("Hola amig@s! Vamos a calcular el factorial de un número entero! :) ");
    }

    public static long numeroFactorial(int entero){
        long factorial=1;
        for(int i=2;i<=entero;i++){
            factorial *=i;
        }
        return factorial;
    }
}

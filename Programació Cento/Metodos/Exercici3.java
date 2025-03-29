package Metodos;
import java.util.*;

public class Exercici3 {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        int num1;
        int num2;
        menu();
        System.out.println("A continuación, escribe dos números, y yo te daré el mayor de los dos:");
        System.out.println("");
        numeros(0, 0);
        System.out.println("Introduce el primer número:");
        num1 = lector.nextInt();
        System.out.println("Introduce el segundo número:");
        num2 = lector.nextInt();
        System.out.println("El número mayor és: " + numeros(num1, num2));
    }

    public static void menu(){
        System.out.println("Bienvenido al ejercicio 3.");
        System.out.println("");
    }

    public static int numeros (int num1, int num2){
        int major;
       if (num1<num2){
        major = num2;
       } else {
        major = num1;
       }
       return major;
    }
}

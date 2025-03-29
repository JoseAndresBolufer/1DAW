package Metodos;
import java.util.*;

public class Exercici31 {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        menu();
        int num1;
        int num2;
        int num3;
        int num4;
        System.out.println("A continuación escribe 4 números y el programa te dirá cual de ellos és mayor.");
        System.out.println("");
        System.out.println("Inserta el primer número:");
        System.out.println("");
        num1 = lector.nextInt();
        System.out.println("Inserta el primer segundo:");
        System.out.println("");
        num2 = lector.nextInt();
        System.out.println("Inserta el primer tercer:");
        System.out.println("");
        num3 = lector.nextInt();
        System.out.println("Inserta el primer cuarto:");
        System.out.println("");
        num4 = lector.nextInt();
        System.err.println("El número mayor és: " + numeros(num1, num2, num3, num4));
    }

    public static void menu(){
        System.out.println("Bienvenido al ejercicio 3.1.");
        System.out.println("");
    }

    public static int numeros(int num1, int num2, int num3, int num4){
        if (num1>num2&&num1>num3&&num1>num4){
            return num1;
        } else if (num2>num3&&num2>num4) {
            return num2;
        } else if (num3>num4){
            return num3;
        } else{
            return num4;
        }
    }
}

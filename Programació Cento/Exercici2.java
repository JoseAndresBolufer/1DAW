import java.util.*;

public class Exercici2 {
    public static void main(String[] args) {
        System.out.println("Bienvenido, te voy a pedir que introduzcas dos numeros. Inserta aqui el primero:");
        Scanner lector = new Scanner(System.in);
        int num1 = lector.nextInt();
        System.out.println("Gracias por insertar el primer numero.");
        System.out.println("Inserta aqui el segundo:"); 
        int num2 = lector.nextInt();
        if(num1<num2){
            System.out.println("El primer numero es menor que el segundo.");
        } else if(num1>num2){
                System.out.println("El primer numero es mayor que el segundo.");
        } else {
                System.out.println("El primer numero es igual que el segundo.");
        }
        System.out.println("Gracias por su dedicacion, señor Cento.");     
        }
    }    


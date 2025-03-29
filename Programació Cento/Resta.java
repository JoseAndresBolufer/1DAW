import java.util.Scanner;

public class Resta {
    
    public static void main(String[] args) {
        
        System.out.println("Bienvenidos al ejercicio 8, porfavor, inserta los números necesarios para hacer la operación:");
        Scanner lector = new Scanner(System.in);
        int minuendo;
        int sustraendo;
    
        minuendo = lector.nextInt();
        System.out.println("Inserta el segundo número:");
        //lector.nextInt();
        sustraendo = lector.nextInt();
        System.out.println("El resultado de la resta és:");
        System.out.println(minuendo-sustraendo);
        }
}

import java.util.*;

public class arrays {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        System.out.println("Introduce un número entero:");
        int valorArray = lector.nextInt();
        int[] arrayDeEnteros = new int[valorArray];
        int aux = 0;
        for(int i=0;i<valorArray;i++){
            arrayDeEnteros[i] = aux;
            System.out.println(arrayDeEnteros[i]);

            }
        
    }
}


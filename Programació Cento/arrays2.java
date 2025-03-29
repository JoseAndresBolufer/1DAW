import java.util.*;

public class arrays2 {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        System.out.println("Introduce el tamaño tendra nuestro querido array, teniendo en cuenta que vas a tener que rellenar cada campo, si és muy grande, tardaras mucho ;)");
        int valorArray = lector.nextInt();
        int [] arrayDeEnteros = new int[valorArray]; 
        for(int i=0;i<arrayDeEnteros.length;i++){
            System.out.println("Escribe ahora el valor de cada celda del array");
            arrayDeEnteros [i] = lector.nextInt();
            
        }
        System.err.println("Este és el resultado de tu array! Disfrutalo!");
        for(int i=0;i<arrayDeEnteros.length;i++){
            System.out.println(arrayDeEnteros[i]);   
        }
        
    }
}

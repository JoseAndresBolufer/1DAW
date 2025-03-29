import java.util.*;

public class Exercici2Arrays {
    
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        System.out.println("Introduce tu frase aquí, sin mayusculas: ");
        String frase = lector.nextLine();
        System.out.println(mayus(frase));
    }

    public static String mayus(String frase){
        String primeraLletra = frase.substring(0, 1);
        primeraLletra = primeraLletra.toUpperCase();
        String restaFrase = frase.substring(1);
        String fraseCompleta = primeraLletra+restaFrase;
        return fraseCompleta;
    }
}

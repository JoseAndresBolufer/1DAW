import java.util.Scanner;

public class Exercici4Arrays {
    
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        System.out.println("Escribe aquí tu frase y el programa te dira cuántas palabras tiene: ");
        String frase = lector.nextLine();
        System.out.println("Tu frase tiene "+numPalabras(frase)+" palabras.");
    }

    public static int numPalabras(String frase){
       String[] fraseSeparada = frase.split("[, .;:-]+"); 
       int numPalabras = fraseSeparada.length;
       return numPalabras;
    }
}

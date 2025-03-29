import java.util.Scanner;

public class Exercici14Arrays {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        char[] arrayDeCharmanders = new char[10];
        int recorridoPalabras = 0;
        System.out.println("Te voy a pedir que me metas 10 caracteres por el charmander.");
        for(int i=0;i<arrayDeCharmanders.length;i++){
            System.out.println("Mete el caracter numero "+recorridoPalabras+": ");
            arrayDeCharmanders[i] = lector.next().charAt(0);
            recorridoPalabras++;
        }
        recorridoPalabras = 1;
        System.out.println("Aquí te voy a mostrar los caracter en lugares pares.");
        for(int i=0; i<arrayDeCharmanders.length; i+=2){
            System.out.println(arrayDeCharmanders[i]);
        }
        System.out.println("Aquí te voy a mostrar los caracter en lugares impares.");
        recorridoPalabras = 1;
        for(int i=1; i<arrayDeCharmanders.length; i+=2){
            System.out.println(arrayDeCharmanders[i]);
        }
    }
}

package Metodos;
import java.util.Scanner;
public class Exercici13 {
    
    public static void main(String[] args) {
        Scanner lector = new Scanner (System.in);
        System.out.println("Escribe tu nombre sin acentos, porfavor:");
        String nombre = lector.nextLine();
        System.out.println("Ahora elige tu preferencia de idioma:");
        System.out.println("a) Valenciano");
        System.out.println("b) Castellano");
        System.out.println("c) Inglés");
        char idioma = lector.next().charAt(0);
        saludo(nombre, idioma);
    }

    public static void saludo(String nombre, char idioma){
        switch (idioma) {
            case 'a':
                System.out.println("Bon dia "+nombre+"!");
                break;
            case 'b':
                System.out.println("¡Buenos dias "+nombre+"!");
                break;
            case 'c':
                System.out.println("Good morning "+nombre+"!");
                break;
        }
    }
}

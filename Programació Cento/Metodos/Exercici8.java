package Metodos;

import java.util.*;

public class Exercici8 {
    public static void main(String[] args) {
        presentacion();
        Scanner lector = new Scanner(System.in);
        System.out.println("A continuación, introduce los números, primero el primero vale tronc?:");
        int primero = lector.nextInt();
        System.out.println("Ahora el segundo:");
        int segundo = lector.nextInt();
        System.out.println("ara el que hase 3:");
        int tercero = lector.nextInt();
        System.out.println("Y el cuarto y último:");
        int cuarto = lector.nextInt();
        if (esCapicua(primero, segundo, tercero, cuarto)){
            System.out.println("La secuencia és capicúa compi ;).");
        } else {
            System.out.println("No és capicúa, mentecato!");
        }
    }

    public static void presentacion(){
        System.out.println("Hola amego, voy a disirte si en un número de 4 cifras que tu me escrigas, la secuencia que me dise és capicúa. Let's go!");
    }
    public static boolean esCapicua(int primero, int segundo,int tercero, int cuarto){
        return (primero==cuarto&&segundo==tercero);
    }
}
package Metodos;

import java.util.*;

public class Exercici15 {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        mostrarMenu();
        int opcion = lector.nextInt();
        switch (opcion) {
            case 1:
                opcion1();
                break;
            case 2:
                opcion2();
                break;
            case 3:
                opcion3();
                break;
            case 0:
                System.out.println("Hasta luego");
                break;
        }

    }

    public static void mostrarMenu(){
        System.out.println("MENÚ PRINCIPAL");
        System.out.println("--------------");
        System.out.println("1. Palabra más larga.");
        System.out.println("2. Palabra mas corta.");
        System.out.println("3. Número de voacales.");
        System.out.println("___________________________________");
        System.out.println("0. Salir");
    }

    public static void opcion1(){
        Scanner lector = new Scanner(System.in);
        System.out.println("Escribe porfavor a continuación la primera de las 3 palabras para comparar cual és la más larga:");
        String palabra1Opcion1 = lector.nextLine();
        System.out.println("Ahora la segunda palabra:");
        String palabra2Opcion1 = lector.nextLine();
        System.out.println("Ahora la tercera y última:");
        String palabra3Opcion1 = lector.nextLine();
        if(palabra1Opcion1.length()>palabra2Opcion1.length()&&palabra1Opcion1.length()>palabra3Opcion1.length()){
            System.out.println("La palabra más larga és "+palabra1Opcion1);
        }else if(palabra2Opcion1.length()>palabra3Opcion1.length()){
            System.out.println("La palabra más larga és "+palabra2Opcion1);
        }else{
            System.out.println("La palabra más larga és "+palabra3Opcion1);
        }
    }

    public static void opcion2(){
        Scanner lector = new Scanner(System.in);
        System.out.println("Escribe porfavor a continuación la primera de las 3 palabras para comparar cual és la más larga:");
        String palabra1Opcion2 = lector.nextLine();
        System.out.println("Ahora la segunda palabra:");
        String palabra2Opcion2 = lector.nextLine();
        System.out.println("Ahora la tercera y última:");
        String palabra3Opcion2 = lector.nextLine();
        if(palabra1Opcion2.length()<palabra2Opcion2.length()&&palabra1Opcion2.length()<palabra3Opcion2.length()){
            System.out.println("La palabra más corta és "+palabra1Opcion2);
        }else if(palabra2Opcion2.length()<palabra3Opcion2.length()){
            System.out.println("La palabra más corta és "+palabra2Opcion2);
        }else{
            System.out.println("La palabra más corta és "+palabra3Opcion2);
        }
    }

    public static void opcion3(){
        int valor;
        Scanner lector = new Scanner(System.in);
        System.out.println("Escribe porfavor a continuación una palabra y el programa te dirá cuántas vocales tiene: ");
        String palabraOpcion3 = lector.nextLine();
        int numVocales=0;
        for(int i=0;i<palabraOpcion3.length();i++){
            char letras=palabraOpcion3.charAt(i);
            if (letras=='a'||letras=='A'||letras=='á'||letras=='Á'||letras=='e'||letras=='E'||letras=='é'||letras=='É'||letras=='i'||letras=='I'||letras=='í'||letras=='Í'||letras=='o'||letras=='O'||letras=='ó'||letras=='Ó'||letras=='u'||letras=='U'||letras=='ú'||letras=='Ú'){
                numVocales++;
            }
        }
        System.out.println("La palabra tiene "+numVocales+" vocales");
    }
}

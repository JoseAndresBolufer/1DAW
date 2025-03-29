package Metodos;

import java.util.*;

public class Exercici12 {
    public static void main(String[] args) {
        Random random = new Random();
        int [] calificaciones = new int[50];
        int aux = 1;
        for(int i=0;i<calificaciones.length;i++){
            int notaAleatoria = random.nextInt(11);
            calificaciones [i] = notaAleatoria;
        }
        String[] notasFinales = calificiacionAlfabetica(calificaciones);
        for(int i=0;i<notasFinales.length;i++){
            System.out.println("Tu nota de la asignatura número "+aux+" és "+notasFinales[i]);
            aux++;
        }
    }

    public static String[] calificiacionAlfabetica(int[] calificaciones){
        String[] notasLetras = new String[50];
        int aux=0;
        for(int i=0;i<calificaciones.length;i++){
            if (calificaciones[i]<5) {
                notasLetras[aux]="Insuficiente";
                aux++;
            } else if (calificaciones[i]>=5 && calificaciones[i]<=6){
                notasLetras[aux]="Suficiente";
                aux++;
            } else if (calificaciones[i]>=6 && calificaciones[i]<=7){
                notasLetras[aux]="Bien";
                aux++;
            }    else if (calificaciones[i]>=7 && calificaciones[i]<=9){
                notasLetras[aux]="Notable";
                aux++;
            }  else if (calificaciones[i]>=9 && calificaciones[i]<=10){
                notasLetras[aux]="Excelente";
                aux++;
            }  

        }
        return notasLetras;
    }
}
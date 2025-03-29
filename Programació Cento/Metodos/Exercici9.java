package Metodos;

import java.util.Scanner;

public class Exercici9 {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        System.out.println("Hola sosio, introduse un numerito y te hago la sumatoria bro:");
        int numeroDado = lector.nextInt();
        int numeroSumatorio=sumatorio(numeroDado);
        System.out.println("El sumatorio de " + numeroDado + " és: "+numeroSumatorio);

    }

    public static int sumatorio(int numeroDado){
        int numeroSumatorio=0;
        for (int i=1;i<=numeroDado;i++){
            numeroSumatorio +=i;
        }
        return numeroSumatorio;
    }
}

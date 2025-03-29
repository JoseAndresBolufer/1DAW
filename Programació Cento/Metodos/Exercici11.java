package Metodos;

import java.util.Random;

public class Exercici11 {
    
    public static void main(String[] args) {
        benvinguda();
        numQuiniela();
        System.out.println("Seguro que no has acertado, así que deja el juevo y invierte en criptos. Saludos terrícola!");
    }

    public static void benvinguda(){
        System.err.println("Hola usuario! Aquí vamos a generarte una quiniela aleatoria de los 15 partidos de esta jornada:");
    }
    public static int numeroAleatorio(){
        Random random = new Random();
        int numeroAleatorio = random.nextInt(4 - 1) + 1;
        return numeroAleatorio;
    }

    public static void numQuiniela(){
        int partido=1;
        for(int i=1;i<=15;i++){
            int resultadoQuiniela=numeroAleatorio();
            if (resultadoQuiniela==1){
                int resultado=1;
                System.out.println("Partido "+partido+" "+resultado);
            } else if (resultadoQuiniela==2){
                int resultado=2;
                System.out.println("Partido "+partido+" "+resultado);
            } else if (resultadoQuiniela==3){
                char resString='x';
                System.out.println("Partido "+partido+" "+resString);
            }
            partido++;
           }  
    }
}



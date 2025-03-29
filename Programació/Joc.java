import java.util.*;

public class Joc {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        int selector;
        int modoDeJuego;
        int[] intentosFacil = new int[20];
        int[] intentosMedio = new int[20];
        int[] intentosDificil = new int[20];
        int[] intentosExtremo =new int[20];
        int intentos = 0;
        int solucion;
        int partidaExtremo = 0;
        int partidaDificil = 0;
        int partidaMedio = 0;
        int partidaFacil = 0;
        do {
            System.out.println("");
            System.out.println("Bienvenido al juego aleatorio. Porfavor, selecciona una de las siguientes opciones:");
            System.out.println("");
            System.out.println("0.- Jugar una partida");
            System.out.println("1.- Resultados.");
            System.out.println("2.- Salir");
            System.out.println("");
            selector = lector.nextInt();
            System.out.println();
            if (selector==0){
                System.out.println("Has seleccionado jugar, elige a continuación un modo de juego: ");
                System.out.println("1.- Modo fácil.");
                System.out.println("2.- Modo medio.");
                System.out.println("3.- Modo difícil.");
                System.out.println("4.- Modo extremo.");
                System.out.println("");
                modoDeJuego = lector.nextInt();
                System.out.println("");
                if (modoDeJuego == 1 && partidaFacil<20) {
                    Random random = new Random();
                    int numeroAleatorioFacil = random.nextInt(10);
                    System.out.println("Este és el modo fácil. Elige un número entre 0 y 10. Tienes 20 intentos, y puedes rendirte en cualquier momento insertando 11. En cada intento, sabrás si el número insertado és mayor o menor. Empezemos!");
                    System.out.println("");
                    intentos = 0;
                    do {
                        System.out.println("Inserta el número:");
                        solucion = lector.nextInt();
                        intentos++;
                        System.out.println("");
                        if (solucion==numeroAleatorioFacil){
                            System.out.println("Enhorabuena! Has acertado! El número elegido era: " + solucion);
                            System.out.println("");
                        } else if (solucion<numeroAleatorioFacil && solucion!=11){
                            System.out.println("El número seleccionado és mayor. Prueba otra vez.");
                            System.out.println("");
                        } else if (solucion>numeroAleatorioFacil && solucion!=11){
                            System.out.println("el número seleccionado és menor. Prueba otra vez.");
                            System.out.println("");
                        }
                    } while (solucion!=11 && solucion!=numeroAleatorioFacil && partidaFacil!=20); 
                    if (partidaFacil==20){
                        System.out.println("Se han acabado tus intentos.");
                        System.out.println("");
                    } else if (solucion==11){
                        System.out.println("Te has rendido.");
                    } else if (solucion==numeroAleatorioFacil){
                        intentosFacil[partidaFacil] = intentos;
                        partidaFacil++;
                    }
                } else if (partidaFacil==20) {
                    System.out.println("Has excedido el número máximo de partidas por juego, que son 20. Prueba otro modo o sal del juego, gracias.");
                }else if (modoDeJuego == 2) {
                    Random random = new Random();
                    int numeroAleatorioMedio = random.nextInt(100);
                    System.out.println("Este és el modo medio. Elige un número entre 0 y 100. Tienes 20 intentos, y puedes rendirte en cualquier momento insertando 101. En cada intento, sabrás si el número insertado és mayor o menor. Empezemos!");
                    System.out.println("");
                    intentos = 0;
                    do {
                        System.out.println("Inserta el número:");
                        solucion = lector.nextInt();
                        intentos++;
                        if (solucion==numeroAleatorioMedio){
                            System.out.println("Enhorabuena! Has acertado! El número elegido era: " + solucion);
                            System.out.println("");
                        } else if (solucion<numeroAleatorioMedio && solucion!=101){
                            System.out.println("El número seleccionado és mayor. Prueba otra vez.");
                            System.out.println("");
                        } else if (solucion>numeroAleatorioMedio && solucion!=101){
                            System.out.println("el número seleccionado és menor. Prueba otra vez.");
                            System.out.println("");
                        }
                    } while (solucion!=numeroAleatorioMedio && solucion!=101 && partidaMedio!=20);    
                    if (partidaMedio==20){
                        System.out.println("Se han acabado tus intentos.");
                        System.out.println("");
                    } else if (solucion==101){
                        System.out.println("Te has rendido.");  
                    } else if (solucion==numeroAleatorioMedio){
                        intentosMedio[partidaMedio] = intentos;
                        partidaMedio++;
                    }
                } else if (partidaMedio==20) {
                    System.out.println("Has excedido el número máximo de partidas por juego, que son 20. Prueba otro modo o sal del juego, gracias.");
                }else if (modoDeJuego == 3) {
                    Random random = new Random();
                    int numeroAleatorioDificil = random.nextInt(10000);
                    System.out.println("Este és el modo difícil. Elige un número entre 0 y 10000. Tienes 20 intentos, y puedes rendirte en cualquier momento insertando 10001. En cada intento, sabrás si el número insertado és mayor o menor. Empezemos!");
                    System.out.println("");
                    intentos = 0;
                    do {
                        System.out.println("Inserta el número:");
                        solucion = lector.nextInt();
                        intentos++;
                        if (solucion==numeroAleatorioDificil){
                            System.out.println("Enhorabuena! Has acertado! El número elegido era: " + solucion);
                            System.out.println("");
                        } else if (solucion<numeroAleatorioDificil && solucion!=10001){
                            System.out.println("El número seleccionado és mayor. Prueba otra vez.");
                            System.out.println("");
                        } else if (solucion>numeroAleatorioDificil && solucion!=10001){
                            System.out.println("el número seleccionado és menor. Prueba otra vez.");
                            System.out.println("");
                        }
                    } while (solucion!=numeroAleatorioDificil && solucion!=10001 && partidaDificil!=20);     
                    if (partidaDificil==20){
                        System.out.println("Se han acabado tus intentos.");
                        System.out.println("");
                    } else if (solucion==10001){
                        System.out.println("Te has rendido.");  
                    } else if (solucion==numeroAleatorioDificil){
                        intentosDificil[partidaDificil] = intentos;
                        partidaDificil++;
                    }    
                } else if (partidaDificil==20) {
                    System.out.println("Has excedido el número máximo de partidas por juego, que son 20. Prueba otro modo o sal del juego, gracias."); 
                }else if (modoDeJuego == 4) {
                    Random random = new Random();
                    int numeroAleatorioExtremo = random.nextInt(10000);
                    System.out.println("Este és el modo extremo. Elige un número entre 0 y 10000. Tienes 20 intentos, y puedes rendirte en cualquier momento insertando 10001. Empezemos!");
                    System.out.println("");
                    intentos = 0;
                    do {
                        System.out.println("Inserta el número:");
                        solucion = lector.nextInt();
                        intentos++;
                        if (solucion==numeroAleatorioExtremo){
                            System.out.println("");
                            System.out.println("Enhorabuena! Has acertado! El número elegido era: " + solucion);
                            System.out.println("");
                        }
                        System.out.println("");
                    } while (solucion!=numeroAleatorioExtremo && solucion!=10001 && partidaExtremo!=20);
                    if (partidaExtremo==20){
                        System.out.println("Se han acabado tus intentos.");
                        System.out.println("");
                        System.out.println("el número era " +numeroAleatorioExtremo);
                    } else if (solucion==10001){
                        System.out.println("Te has rendido.");
                        System.out.println("el número era " +numeroAleatorioExtremo);
                    }  else if (solucion==numeroAleatorioExtremo){
                        intentosExtremo[partidaExtremo] = intentos; 
                        partidaExtremo++; 
                    }
                }else if (partidaFacil==20) {
                    System.out.println("Has excedido el número máximo de partidas por juego, que son 20. Prueba otro modo o sal del juego, gracias.");
                }
            } else if (selector==1){
                int contadorFacil = 1;
                System.out.println("");
                System.out.println("MODO FACIL");
                for(int i=0;i<intentosFacil.length;i++){
                    if(intentosFacil[i]!=0){
                        System.out.println("Partida: "+contadorFacil+" Intento: "+intentosFacil[i]);
                        contadorFacil++;
                    }                   
                }
                System.out.println("");
                int contadorMedio = 1;
                System.out.println("");
                System.out.println("MODO MEDIO");
                for(int i=0;i<intentosMedio.length;i++){
                    if(intentosMedio[i]!=0){
                        System.out.println("Partida: "+contadorMedio+" Intento: "+intentosMedio[i]);
                        contadorMedio++;
                    }                   
                }
                System.out.println("");
                int contadorDificil = 1;
                System.out.println("");
                System.out.println("MODO DIFICIL");
                for(int i=0;i<intentosDificil.length;i++){
                    if(intentosDificil[i]!=0){
                        System.out.println("Partida: "+contadorDificil+" Intento: "+intentosDificil[i]);
                        contadorDificil++;
                    }                   
                }
                System.out.println("");
                int contadorExtremo = 1;
                System.out.println("");
                System.out.println("MODO EXTREMO");
                for(int i=0;i<intentosExtremo.length;i++){
                    if(intentosExtremo[i]!=0){
                        System.out.println("Partida: "+contadorExtremo+" Intento: "+intentosExtremo[i]);
                        contadorExtremo++;
                    }                   
                }
                System.out.println("");
            } 
        } while (selector!=2);
        System.out.println("Gracias por jugar a este estupendo juego.");
    }    
}
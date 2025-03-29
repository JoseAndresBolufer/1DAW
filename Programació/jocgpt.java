import java.util.*;

public class jocgpt {

    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        int selector;
        int[] intentosFacil = new int[20];
        int[] intentosMedio = new int[20];
        int[] intentosDificil = new int[20];
        int[] intentosExtremo = new int[20];
        int partidaFacil = 0, partidaMedio = 0, partidaDificil = 0, partidaExtremo = 0;

        do {
            System.out.println("\nBienvenido al juego aleatorio. Selecciona una opción:");
            System.out.println("0.- Jugar una partida");
            System.out.println("1.- Ver resultados");
            System.out.println("2.- Salir");
            selector = lector.nextInt();

            if (selector == 0) {
                System.out.println("\nSelecciona un modo de juego:");
                System.out.println("1.- Modo fácil (0-10)");
                System.out.println("2.- Modo medio (0-100)");
                System.out.println("3.- Modo difícil (0-10000)");
                System.out.println("4.- Modo extremo (0-10000, sin pistas)");
                int modoDeJuego = lector.nextInt();

                switch (modoDeJuego) {
                    case 1:
                        partidaFacil = jugarModo(lector, 10, 11, intentosFacil, partidaFacil, "fácil");
                        break;
                    case 2:
                        partidaMedio = jugarModo(lector, 100, 101, intentosMedio, partidaMedio, "medio");
                        break;
                    case 3:
                        partidaDificil = jugarModo(lector, 10000, 10001, intentosDificil, partidaDificil, "difícil");
                        break;
                    case 4:
                        partidaExtremo = jugarModoSinPistas(lector, 10000, 10001, intentosExtremo, partidaExtremo, "extremo");
                        break;
                    default:
                        System.out.println("Modo no válido.");
                }
            } else if (selector == 1) {
                mostrarResultados("Fácil", intentosFacil);
                mostrarResultados("Medio", intentosMedio);
                mostrarResultados("Difícil", intentosDificil);
                mostrarResultados("Extremo", intentosExtremo);
            }

        } while (selector != 2);

        System.out.println("Gracias por jugar. ¡Hasta la próxima!");
    }

    private static int jugarModo(Scanner lector, int rango, int rendirse, int[] intentos, int partida, String modo) {
        Random random = new Random();
        int numeroAleatorio = random.nextInt(rango + 1);
        System.out.println("\nModo " + modo + ": Adivina un número entre 0 y " + rango + ". Tienes 20 intentos.");
        System.out.println("Introduce " + rendirse + " para rendirte.");
        int intentosUsados = 0;

        while (intentosUsados < 20) {
            System.out.print("Inserta un número: ");
            int solucion = lector.nextInt();
            intentosUsados++;

            if (solucion == rendirse) {
                System.out.println("Te has rendido. El número era: " + numeroAleatorio);
                break;
            } else if (solucion == numeroAleatorio) {
                System.out.println("¡Enhorabuena! Has acertado en " + intentosUsados + " intentos.");
                intentos[partida] = intentosUsados;
                return partida + 1;
            } else if (solucion < numeroAleatorio) {
                System.out.println("El número es mayor. Intenta de nuevo.");
            } else {
                System.out.println("El número es menor. Intenta de nuevo.");
            }
        }

        if (intentosUsados == 20) {
            System.out.println("Se han acabado tus intentos. El número era: " + numeroAleatorio);
        }

        return partida;
    }

    private static int jugarModoSinPistas(Scanner lector, int rango, int rendirse, int[] intentos, int partida, String modo) {
        Random random = new Random();
        int numeroAleatorio = random.nextInt(rango + 1);
        System.out.println("\nModo " + modo + ": Adivina un número entre 0 y " + rango + ". Tienes 20 intentos.");
        System.out.println("Introduce " + rendirse + " para rendirte.");
        int intentosUsados = 0;

        while (intentosUsados < 20) {
            System.out.print("Inserta un número: ");
            int solucion = lector.nextInt();
            intentosUsados++;

            if (solucion == rendirse) {
                System.out.println("Te has rendido. El número era: " + numeroAleatorio);
                break;
            } else if (solucion == numeroAleatorio) {
                System.out.println("¡Enhorabuena! Has acertado en " + intentosUsados + " intentos.");
                intentos[partida] = intentosUsados;
                return partida + 1;
            }
        }

        if (intentosUsados == 20) {
            System.out.println("Se han acabado tus intentos. El número era: " + numeroAleatorio);
        }

        return partida;
    }

    private static void mostrarResultados(String modo, int[] intentos) {
        System.out.println("\nResultados del modo " + modo + ":");
        for (int i = 0; i < intentos.length; i++) {
            if (intentos[i] > 0) {
                System.out.println("Partida " + (i + 1) + ": " + intentos[i] + " intentos.");
            }
        }
    }
}

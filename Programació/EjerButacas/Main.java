package EjerButacas;

import EjerButacas.FuncionesGenerales;
import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        butacasEstadio estadio = new butacasEstadio(9, 9); // Estadio de 8x8 butacas, pongo hasta 9 para que empieze a contar desde 1, y sea visualmente más cómodo para el usuario
        boolean salir = false;

            while (!salir) {
                System.out.println("\n--- Menú Principal ---");
                System.out.println("1. Comprar entrada");
                System.out.println("2. Vender entrada");
                System.out.println("3. Visualizar estadio");
                System.out.println("4. Salir");
                System.out.print("Seleccione una opción: ");
    
                int opcion = FuncionesGenerales.leerEntero(scanner);
    
                switch (opcion) {
                    case 1:
                        System.out.print("Ingrese fila: ");
                        int filaCompra = FuncionesGenerales.leerEntero(scanner);
                        System.out.print("Ingrese columna: ");
                        int columnaCompra = FuncionesGenerales.leerEntero(scanner);
                        estadio.comprarEntrada(filaCompra, columnaCompra);
                        break;
                    case 2:
                        System.out.print("Ingrese fila: ");
                        int filaVenta = FuncionesGenerales.leerEntero(scanner);
                        System.out.print("Ingrese columna: ");
                        int columnaVenta = FuncionesGenerales.leerEntero(scanner);
                        estadio.venderEntrada(filaVenta, columnaVenta);
                        break;
                    case 3:
                        estadio.visualizarEstadio();
                        break;
                    case 4:
                        salir = true;
                        System.out.println("Saliendo del programa...");
                        break;
                    default:
                        System.out.println("Opción no válida. Intente nuevamente.");
                }
            }
    
            scanner.close();
    }
}
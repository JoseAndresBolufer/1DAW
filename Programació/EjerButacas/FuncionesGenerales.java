package EjerButacas;

import java.util.Scanner;

public class FuncionesGenerales {
    public static int leerEntero(Scanner scanner){
         while (true) {
            try {
                return Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.print("Entrada no válida. Por favor, ingrese un número entero: ");
            }
        }   
    }
}

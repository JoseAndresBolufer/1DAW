package EjercicioButacas;

public class butacasEstadio {
    private char[][] estadio;

    public butacasEstadio(int filas, int columnas) {
        estadio = new char[filas][columnas];
        for (int i = 1; i < filas; i++) {
            for (int j = 1; j < columnas; j++) {
                estadio[i][j] = 'O'; // O indica que la butaca está libre
            }
        }
    }

    public void comprarEntrada(int fila, int columna) {
        if (esValida(fila, columna)) {
            if (estadio[fila][columna] == 'O') {
                estadio[fila][columna] = 'X';
                System.out.println("Entrada comprada exitosamente.");
            } else {
                System.out.println("Error: La butaca ya está ocupada.");
            }
        } else {
            System.out.println("Error: Coordenadas fuera de rango.");
        }
    }

    public void venderEntrada(int fila, int columna) {
        if (esValida(fila, columna)) {
            if (estadio[fila][columna] == 'X') {
                estadio[fila][columna] = 'O';
                System.out.println("Entrada devuelta exitosamente.");
            } else {
                System.out.println("Error: La butaca ya está libre.");
            }
        } else {
            System.out.println("Error: Coordenadas fuera de rango.");
        }
    }

    public void visualizarEstadio() {
        System.out.print("   ");
        for (int j = 1; j < estadio[1].length; j++) {
            System.out.print(j + " ");
        }
        System.out.println();

        System.out.print("    ");
        for (int j = 1; j < estadio[1].length; j++) {
            System.out.print("--");
        }
        System.out.println();

        for (int i = 1; i < estadio.length; i++) {
            System.out.print(i + " | ");
            for (int j = 1; j < estadio[i].length; j++) {
                System.out.print(estadio[i][j] + " ");
            }
            System.out.println();
        }
    }

    private boolean esValida(int fila, int columna) {
        return fila >= 1 && fila < estadio.length && columna >= 1 && columna < estadio[1].length;
    }
}


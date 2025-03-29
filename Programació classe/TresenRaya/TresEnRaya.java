import java.util.*;


public class TresEnRaya {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Introduce el tamaño del tablero(poner un número entero para generar el cuadrado): ");
        int tamaño = scanner.nextInt();
        System.out.print("Número de jugadores: ");
        int numJugadores = scanner.nextInt();
        scanner.nextLine();
        List<Jugador> jugadores = new ArrayList<>();

        for (int i = 0; i < numJugadores; i++) {
            System.out.print("Nombre del jugador " + (i + 1) + ": ");
            String nombre = scanner.nextLine();
            System.out.print("Símbolo del jugador " + nombre + ": ");
            char simbolo = scanner.next().charAt(0);
            scanner.nextLine();
            jugadores.add(new Jugador(nombre, simbolo));
        }

        Tablero juego = new Tablero(tamaño, jugadores);
        boolean juegoTerminado = false;
        int turno = 0;

        while (!juegoTerminado) {
            juego.imprimirTablero();
            Jugador jugadorActual = jugadores.get(turno % numJugadores);
            System.out.println(jugadorActual.nombre + " (" + jugadorActual.simbolo + ") elige fila (ten en cuenta que se cuentan desde 0): ");
            int fila = scanner.nextInt();
            System.out.println(jugadorActual.nombre + " (" + jugadorActual.simbolo + ") elige columna (ten en cuenta que se cuentan desde 0): ");
            int columna = scanner.nextInt();

            if (juego.hacerMovimiento(fila, columna, jugadorActual.simbolo)) {
                if (juego.verificarGanador(jugadorActual.simbolo)) {
                    juego.imprimirTablero();
                    System.out.println("¡" + jugadorActual.nombre + " ha ganado!");
                    juegoTerminado = true;
                } else if (juego.tableroLleno()) {
                    juego.imprimirTablero();
                    System.out.println("¡Empate!");
                    juegoTerminado = true;
                }
                turno++;
            } else {
                System.out.println("Movimiento inválido, intenta de nuevo.");
            }
        }
    }
}

class Jugador {
    String nombre;
    char simbolo;

    public Jugador(String nombre, char simbolo) {
        this.nombre = nombre;
        this.simbolo = simbolo;
    }
}

class Tablero {
    private char[][] tablero;
    private int tamaño;
    private List<Jugador> jugadores;
    private int movimientos;

    public Tablero(int tamaño, List<Jugador> jugadores) {
        this.tamaño = tamaño;
        this.jugadores = jugadores;
        this.tablero = new char[tamaño][tamaño];
        this.movimientos = 0;
        for (int i = 0; i < tamaño; i++) {
            for (int j = 0; j < tamaño; j++) {
                tablero[i][j] = '-';
            }
        }
    }

    public void imprimirTablero() {
        for (char[] fila : tablero) {
            for (char celda : fila) {
                System.out.print(celda + " ");
            }
            System.out.println();
        }
    }

    public boolean hacerMovimiento(int fila, int columna, char simbolo) {
        if (fila >= 0 && fila < tamaño && columna >= 0 && columna < tamaño && tablero[fila][columna] == '-') {
            tablero[fila][columna] = simbolo;
            movimientos++;
            return true;
        }
        return false;
    }

    public boolean verificarGanador(char simbolo) {
        for (int i = 0; i < tamaño; i++) {
            if (verificarFila(i, simbolo) || verificarColumna(i, simbolo)) {
                return true;
            }
        }
        return verificarDiagonales(simbolo);
    }

    private boolean verificarFila(int fila, char simbolo) {
        for (int j = 0; j < tamaño; j++) {
            if (tablero[fila][j] != simbolo) {
                return false;
            }
        }
        return true;
    }

    private boolean verificarColumna(int columna, char simbolo) {
        for (int i = 0; i < tamaño; i++) {
            if (tablero[i][columna] != simbolo) {
                return false;
            }
        }
        return true;
    }

    private boolean verificarDiagonales(char simbolo) {
        boolean diagonalPrincipal = true, diagonalSecundaria = true;
        for (int i = 0; i < tamaño; i++) {
            if (tablero[i][i] != simbolo) diagonalPrincipal = false;
            if (tablero[i][tamaño - 1 - i] != simbolo) diagonalSecundaria = false;
        }
        return diagonalPrincipal || diagonalSecundaria;
    }

    public boolean tableroLleno() {
        return movimientos == tamaño * tamaño;
    }
}
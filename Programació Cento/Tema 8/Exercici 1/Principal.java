import Coche.ModalidadSeguro;
import Coche.TipoCoche;

public class Principal {
    public static void main(String[] args) {
        Coche cocheEjemplo = new Coche();
        Coche coche = new Coche("Que tiene 4 ruedas", "Rojo", false, TipoCoche.MINI, 2022, ModalidadSeguro.TODO_RIESGO);
    }
}

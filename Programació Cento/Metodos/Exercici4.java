package Metodos;
import java.text.DecimalFormat;
import java.util.*;

public class Exercici4 {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        double radio;
        DecimalFormat df = new DecimalFormat("#.##");
        System.out.println("Introduce a continuación, el radio de la circumferéncia para poder calcular los valores del Area y la Longitud:");
        radio = lector.nextDouble();
        System.err.println("");
        System.out.println("El radio és: "+ df.format(calcularArea(radio)));
        System.out.println("La longitud és: "+df.format(calcularLongitud(radio)));
    }

    public static void menu(){
        System.out.println("Hola amigo! Bienvenido a la calculadora de áreas y longitudes de circumferéncias.");
    }

    public static double calcularArea (double radio){
        double area = Math.PI*Math.pow(radio, 2);
        return area;
    }

    public static double calcularLongitud (double radio){
        double longitud = 2*Math.PI*radio;
        return longitud;
    }
}

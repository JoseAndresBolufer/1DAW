import java.util.Scanner;

public class calculadora {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        int operacion;
        int num1;
        int num2;
        int resultado;
        do  {
            System.out.println("Elige la opción de la operación que desees:");
            System.out.println("1. Sumar");
            System.out.println("2. Restar");
            System.out.println("3. Multiplicar");
            System.out.println("4. Dividir");
            System.out.println("5. Resto división");
            System.out.println("------------------");
            System.out.println("0. Salir");
            operacion = lector.nextInt();
            System.out.println("");
            if (operacion == 1){
                System.out.println("Introduce 2 números para la operación que desees hacer");
                num1 = lector.nextInt();
                System.out.println("");
                num2 = lector.nextInt();
                resultado = num1+num2;
                System.out.println("");
                System.out.println("El resultado és: "+resultado);
            }
            else if (operacion == 2){
                System.out.println("Introduce 2 números para la operación que desees hacer");
                num1 = lector.nextInt();
                System.out.println("");
                num2 = lector.nextInt();
                resultado = num1-num2;
                System.out.println("");
                System.out.println("El resultado és: "+resultado);
            }
            else if (operacion == 3){
                System.out.println("Introduce 2 números para la operación que desees hacer");
                num1 = lector.nextInt();
                System.out.println("");
                num2 = lector.nextInt();
                resultado = num1*num2;
                System.out.println("");
                System.out.println("El resultado és: "+resultado);
            }
            else if (operacion == 4){
                System.out.println("Introduce 2 números para la operación que desees hacer");
                num1 = lector.nextInt();
                System.out.println("");
                num2 = lector.nextInt();
                resultado = num1/num2;
                System.out.println("");
                System.out.println("El resultado és: "+resultado);
            }
            else if (operacion == 5){
                System.out.println("Introduce 2 números para la operación que desees hacer");
                num1 = lector.nextInt();
                System.out.println("");
                num2 = lector.nextInt();
                resultado = num1%num2;
                System.out.println("");
                System.out.println("El resultado és: "+resultado);
            }
        } while (operacion!=0);
        
    }
        
}

import java.util.*;

public class Exercici1 {
    
    public static void main(String[] args) {
        System.out.println("Hola! selecciona un número par o impar");

        Scanner lector = new Scanner(System.in);

        int num = lector.nextInt();

        if(num%2==0){
            System.out.println("El número és par");
        } else if(num%2!=0){
            System.out.println("El número és impar");
        }
        System.out.println("Gràcias por usar este estupendo programa, hasta la vista!");
    }
}

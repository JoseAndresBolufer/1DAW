import java.util.*;

    public class Buclefactorial {
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        System.out.println("Introduce un número entero: ");
        int N = lector.nextInt();
        int factorial=1;
        for(int i=2;i<=N;i++){
            factorial *= i;
        }  
    }
}

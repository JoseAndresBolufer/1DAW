import java.util.*;

public class Exercici13Arrays {
    
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        int[] arrayNumericos = new int[10];
        int sumaArray = 0;
        double totalArray;
        for(int i=0; i<arrayNumericos.length; i++){
            arrayNumericos[i] = lector.nextInt();
            sumaArray += arrayNumericos[i];
        }
        for(int i=0; i<arrayNumericos.length; i++){
            System.out.println(arrayNumericos[i]);
        }
        totalArray = sumaArray/10.0;
        System.out.println(totalArray);
    }
}

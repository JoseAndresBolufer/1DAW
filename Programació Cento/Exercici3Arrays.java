// Este exercici és el "2. Escribe un programa que muestre el número de vocales y el número de consonantes de una frase." 
import java.util.*;

public class Exercici3Arrays {
    
    public static void main(String[] args) {
        Scanner lector = new Scanner(System.in);
        System.out.println("Introduce aquí tu frase: ");
        String frase = lector.nextLine().toLowerCase();
        System.out.println(vocales(frase));
    }

    public static String vocales(String frase){
        int vocales= 0;
        int consonantes = 0;
        char[] fraseArray = frase.toCharArray();
        for(int i=0;i<fraseArray.length;i++){
           char c = fraseArray[i]; //aquí me ha costado entender que necesito esta variable para recorrer la array profe, pero ya lo entiendo XD
           if("aeiou".indexOf(c) != -1){
            vocales++;
           } else if(Character.isLetter(c)){ //aqúi tenia dubte si podia fer un else i au, però clar, m'haguera contant espais i qualsevol cosa que no fora una lletra :(
            consonantes++;
           }
        }
        String resultado = "El resultado és "+vocales+" vocales y "+consonantes+" consonantes.";
        return resultado;
    }
}

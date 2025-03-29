public class Main {
    public static void main(String[] args) {
        Coche coche = new Coche();
        Coche cocheTopeFlama = new Coche("Maserati","Grecale",1516.2,"Negre");

        coche.mostrarCoche();
        cocheTopeFlama.mostrarCoche();

        cocheTopeFlama.setMarca("Fiat");
        cocheTopeFlama.setModelo("500");
        cocheTopeFlama.setKm(1565131.25);
        cocheTopeFlama.setColor("Fosforito");
        cocheTopeFlama.mostrarCoche();
        
        System.out.println(cocheTopeFlama.getMarca());
        System.out.println(cocheTopeFlama.getModelo());
        System.out.println(cocheTopeFlama.getKm());
        System.out.println(cocheTopeFlama.getColor());
    }
}

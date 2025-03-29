import java.sql.Date;

public class Main {
    public static void main(String[] args) {
        Persona persona = new Persona();
        Persona personaPersonalizada = new Persona("Juan", "Buigues", 34, Date.valueOf("1991-04-25"));

        persona.pantallazo();
        personaPersonalizada.pantallazo();
        persona.setNom("Pepe");
        personaPersonalizada.setNom("Toni");
        persona.pantallazo();
        personaPersonalizada.pantallazo();
        persona.setCognom("Campronero");
        personaPersonalizada.setCognom("Barlovento");
        persona.setEdad(58);
        personaPersonalizada.setEdad(84);
        persona.setFecha(Date.valueOf("1962-08-12"));
        personaPersonalizada.setFecha(Date.valueOf("1928-01-01"));
        persona.pantallazo();
        personaPersonalizada.pantallazo();
    }
}

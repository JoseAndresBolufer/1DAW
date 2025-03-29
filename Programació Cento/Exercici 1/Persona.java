import java.sql.Date;

public class Persona {
    private String nom;
    private String cognom;
    private int edad;
    private Date fecha;

    public Persona(){
        this.nom = "José Vicente";
        this.cognom = "Soler";
        this.edad = 53;
        this.fecha = Date.valueOf("1972-05-24");
    }

    public Persona(String nom, String cognom, int edad, Date fecha){
        this.nom = nom;
        this.cognom = cognom;
        this.edad = edad;
        this.fecha = fecha;
    }

    public String getNom(){
        return this.nom;
    }

    public void setNom(String nom){
        this.nom = nom;
    }

    public String getCognom(){
        return this.cognom;
    }

    public void setCognom(String cognom){
        this.cognom = cognom;
    }

    public int getEdad(){
        return this.edad;
    }

    public void setEdad(int edad){
        this.edad = edad;
    }

    public Date getFecha(){
        return this.fecha;
    }

    public void setFecha(Date fecha){
        this.fecha = fecha;
    }

    public void pantallazo(){
        System.out.println(this.nom+" "+this.cognom+" "+this.edad+" "+this.fecha.toString());
    }
}

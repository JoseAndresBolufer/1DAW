public class Coche {

    private String marca;
    private String modelo;
    private Double km;
    private String color;

    public Coche(){
        this.marca="Renault";
        this.modelo="Arkana";
        this.km=44100.60;
        this.color="Negre";
    }

    public Coche(String marca, String modelo, Double km, String color){
        this.marca=marca;
        this.modelo=modelo;
        this.km=km;
        this.color=color;
    }

    public String getMarca(){
        return this.marca;
    }

    public void setMarca(String marca){
        this.marca=marca;
    }

    public String getModelo(){
        return this.modelo;
    }

    public void setModelo(String modelo){
        this.modelo = modelo;
    }

    public Double getKm(){
        return this.km;
    }

    public void setKm(Double km){
        this.km = km;
    }

    public String getColor(){
        return this.color;
    }

    public void setColor(String color){
        this.color = color;
    }

    public void mostrarCoche(){
        System.out.println(this.marca+" "+this.modelo+" "+this.km+" "+this.color);
    }    
}

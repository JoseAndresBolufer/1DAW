public class Coche {
    
    public enum ModalidadSeguro {
        TERCEROS, TODO_RIESGO
    }
    public enum TipoCoche {
        MINI, UTILITARIO, FAMILIAR, DEPORTIVO
    }
    private String modelo;
    private String color;
    private boolean pinturaMetalizada;
    private String matricula;
    private TipoCoche tipo;
    private int anoFabricacion;
    private ModalidadSeguro seguro;

    public Coche(){
        this.modelo = "Kangoo";
        this.color = "Negro";
        this.pinturaMetalizada = true;
        this. matricula = "5160MAD";
        this.tipo = TipoCoche.UTILITARIO;
        this.anoFabricacion = 2013;
        this.seguro = ModalidadSeguro.TERCEROS;

    }

    public Coche(String modelo, String color, boolean pinturaMetalizada, TipoCoche tipo, int anoFabricacion, ModalidadSeguro seguro) {
        this.modelo = modelo;
        this.color = color;
        this.pinturaMetalizada = pinturaMetalizada;
        this.tipo = tipo;
        this.anoFabricacion = anoFabricacion;
        this.seguro = seguro;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isPinturaMetalizada() {
        return pinturaMetalizada;
    }

    public void setPinturaMetalizada(boolean pinturaMetalizada) {
        this.pinturaMetalizada = pinturaMetalizada;
    }

    public TipoCoche getTipo() {
        return tipo;
    }

    public void setTipo(TipoCoche tipo) {
        this.tipo = tipo;
    }

    public int getAnioFabricacion() {
        return anoFabricacion;
    }

    public void setAnioFabricacion(int anioFabricacion) {
        this.anoFabricacion = anioFabricacion;
    }

    public ModalidadSeguro getSeguro() {
        return seguro;
    }

    public void setSeguro(ModalidadSeguro seguro) {
        this.seguro = seguro;
    }

}

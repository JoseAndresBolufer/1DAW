public class MesesNotasCalificaciones {

    public enum Meses{

        Enero,
        Febrero,
        Marzo,
        Abril,
        Mayo,
        Junio,
        Julio,
        Agosto,
        Septiembre,
        Octubre,
        Noviembre,
        Diciembre
    }

    public enum Notas{
        Do,
        Re,
        Mi,
        Fa,
        Sol,
        La,
        Si
    }

    public enum Calificaciones{
        SUSPENSO,
        APROBADO,
        NOTABLE,
        SOBRESALIENTE,
        MATRÍCULA
    }

    public static void main(String[] args){

        Meses mesFavorito = Meses.Noviembre;
        System.out.println("Mi mes favorito es: " + mesFavorito);

        Notas notaFavorita = Notas.Do;
        System.out.println("Mi nota favorita es: " + notaFavorita);

        Calificaciones calificacionesFavoritas = Calificaciones.MATRÍCULA;
        System.out.println("Mi calificación favorita es: " + calificacionesFavoritas);
    }
}
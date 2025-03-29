
// Ejemplo de entrada:
// Introduce la marca del coche: Ferrari
// Introduce el modelo del coche: F8 Tributo
// Introduce la velocidad máxima del coche (km/h): 340
// Introduce el nombre del piloto: Charles Leclerc
//      Coche F8 Tributo de Charles Leclerc agregado correctamente.
// Lista de coches en la competición:
// Marca: Ferrari, Modelo: F8 Tributo, Piloto: Charles Leclerc, Velocidad Máxima: 340 km/h
// Marca: Mercedes, Modelo: AMG One, Piloto: Lewis Hamilton, Velocidad Máxima: 350 km/h
// Velocidades máx
// Velocidades máximas de los coches: [340, 350]
// Buscar
// Coche encontrado: Marca: Ferrari, Modelo: F8 Tributo, Piloto: Charles Leclerc, Velocidad Máxima: 340 km/h
// Coche rápido
// El coche más rápido es el AMG One de Lewis Hamilton con una velocidad máxima de 350 km/h




// Array para almacenar los coches
const coches = [];

function agregarCoche() {
    
}

function mostrarCoches() {
    
}

function listarVelocidades() {
    
}

function buscarCoche() {
    
}

function cocheMasRapido() {
    
}

// Menú interactivo
function menu() {
    let opcion;
    do {
        opcion = prompt(
            "Menú:\n" +
            "1. Agregar coche\n" +
            "2. Mostrar coches\n" +
            "3. Listar velocidades máximas\n" +
            "4. Buscar un coche\n" +
            "5. Mostrar el coche más rápido\n" +
            "6. Salir\n" +
            "Elige una opción:"
        );

        switch (opcion) {
            case "1":
                agregarCoche();
                break;
            case "2":
                mostrarCoches();
                break;
            case "3":
                listarVelocidades();
                break;
            case "4":
                buscarCoche();
                break;
            case "5":
                cocheMasRapido();
                break;
            case "6":
                console.log("Saliendo del programa...");
                break;
            default:
                console.log("Opción no válida. Inténtalo de nuevo.");
        }
    } while (opcion !== "6");
}

// Iniciar el programa
menu();

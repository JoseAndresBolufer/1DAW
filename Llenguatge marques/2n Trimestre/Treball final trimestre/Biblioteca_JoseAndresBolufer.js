function menu() {
    let opcion;
    do {
        opcion = prompt(`
            Menú de opciones:
            1. Añadir un nuevo libro
            2. Mostrar la lista de libros registrados
            3. Buscar un libro por su titulo
            4. Eliminar un libro por su titulo
            5. Mostrar el libro mas antiguo registrado
            6. Contar cuántos libros hay de cada genero
            7. Mostrar el promedio de paginas de los libros registrados
            8. Salir
        `);
        
        switch (opcion) {
            case '1':
                anadirLibro();
                break;
            case '2':
                mostrarLibros();
                break;
            case '3':
                buscarLibro();
                break;
            case '4':
                eliminarLibro();
                break;
            case '5':
                mostrarLibroAntiguo();
                break;
            case '6':
                contarLibrosPorGenero();
                break;
            case '7':
                mostrarPromedioPaginas();
                break;
            case '8':
                alert('Saliendo del programa...');
                break;
            default:
                alert('Opcion no valida');
        }
    } while (opcion !== '8');
}

function anadirLibro() {
    let titulo = prompt('Introduzca el titulo del libro:');
    let autor = prompt('Introduzca el autor del libro:');
    let año = parseInt(prompt('Introduzca el año de publicacion:'));
    let genero = prompt('Introduzca el genero del libro:');
    let numPaginas = parseInt(prompt('Introduzca el numero de paginas:'));

    if (isNaN(año) || isNaN(numPaginas) || año <= 0 || numPaginas <= 0) {
        alert('Por favor, ingrese valores numericos correctos para el año y el numero de paginas.');
        return;
    }

    let libro = {
        titulo: titulo,
        autor: autor,
        año: año,
        genero: genero,
        numPaginas: numPaginas
    };

    biblioteca.push(libro);
    alert('Libro anadido correctamente.');
}

function mostrarLibros() {
    if (biblioteca.length === 0) {
        alert('No hay libros registrados.');
        return;
    }

    let listado = 'Lista de libros registrados:\n';
    biblioteca.forEach(libro => {
        listado += `Titulo: ${libro.titulo}\nAutor: ${libro.autor}\nAño: ${libro.año}\nGenero: ${libro.genero}\nPaginas: ${libro.numPaginas}\n\n`;
    });
    alert(listado);
}

function buscarLibro() {
    let tituloBuscar = prompt('Introduzca el titulo del libro que desea buscar:');
    let libroEncontrado = biblioteca.find(libro => libro.titulo.toLowerCase() === tituloBuscar.toLowerCase());

    if (libroEncontrado) {
        alert(`Libro encontrado:\nTitulo: ${libroEncontrado.titulo}\nAutor: ${libroEncontrado.autor}\nAño: ${libroEncontrado.año}\nGenero: ${libroEncontrado.genero}\nPaginas: ${libroEncontrado.numPaginas}`);
    } else {
        alert('El libro no se encuentra registrado.');
    }
}

function eliminarLibro() {
    let tituloEliminar = prompt('Introduzca el titulo del libro que desea eliminar:');
    let index = biblioteca.findIndex(libro => libro.titulo.toLowerCase() === tituloEliminar.toLowerCase());

    if (index !== -1) {
        biblioteca.splice(index, 1);
        alert('Libro eliminado correctamente.');
    } else {
        alert('El libro no se encuentra registrado.');
    }
}

function mostrarLibroAntiguo() {
    if (biblioteca.length === 0) {
        alert('No hay libros registrados.');
        return;
    }

    let libroAntiguo = biblioteca.reduce((antiguo, libro) => (libro.año < antiguo.año ? libro : antiguo));
    alert(`El libro mas antiguo es:\nTitulo: ${libroAntiguo.titulo}\nAutor: ${libroAntiguo.autor}\nAño: ${libroAntiguo.año}\nGenero: ${libroAntiguo.genero}\nPaginas: ${libroAntiguo.numPaginas}`);
}

function contarLibrosPorGenero() {
    let generos = {};

    biblioteca.forEach(libro => {
        if (generos[libro.genero]) {
            generos[libro.genero]++;
        } else {
            generos[libro.genero] = 1;
        }
    });

    let resumen = 'Resumen de libros por genero:\n';
    for (let genero in generos) {
        resumen += `${genero}: ${generos[genero]} libro(s)\n`;
    }

    alert(resumen);
}

function mostrarPromedioPaginas() {
    if (biblioteca.length === 0) {
        alert('No hay libros registrados.');
        return;
    }

    let totalPaginas = biblioteca.reduce((total, libro) => total + libro.numPaginas, 0);
    let promedio = totalPaginas / biblioteca.length;

    alert(`El promedio de paginas de los libros registrados es: ${promedio.toFixed(2)} paginas.`);
}

// Ejecutar el programa
menu();

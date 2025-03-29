
console.log("¡Hola desde JavaScript!");
document.querySelector("h1").style.color = "blue";  


const paises = ['Finlandia', 'Suecia', 'Dinamarca', 'Noruega', 'Islandia'];
const nombres = ['Juan', 'Matías', 'Elías', 'Brook'];
const numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const productos = [
{ nombre: 'plátano', precio: 3 },
{ nombre: 'mango', precio: 6 },
{ nombre: 'patata', precio: ' ' },
{ nombre: 'aguacate', precio: 8 },
{ nombre: 'café', precio: 10 },
{ nombre: 'té', precio: '' },
];

//1. Muestra por consola cada país del array paises utilizando forEach.

paises.forEach(function(pais){
    console.log(pais)
});

//2. Utiliza map para crear un array con la longitud de cada país.

const longitudPais = paises.map(function(pais){
    return pais.length;
});

longitudPais.forEach(function(longitud){
    console.log(longitud)
})

// 3. Convierte todos los nombres del array nombres a mayúsculas con map.
const nombresMayusculas = nombres.map(nombre => nombre.toUpperCase());

console.log(nombresMayusculas);

//4. Filtra los países cuyo nombre comienza por la letra D.

const paisesConD = paises.filter(pais => pais.startsWith('D'));

console.log(paisesConD);
//5. Filtra los productos que tienen un precio numérico válido.

const productosPorPrecio = productos.filter(producto => Number.isFinite(producto.precio));

console.log(productosPorPrecio);
//6. Crea una función obtenerCadenas que reciba un array y devuelva solo los elementos de tipo string.

function obtenerCadenas(array){
    return array.filter(elemento => typeof elemento === 'string');
} 

const cadenasPaises = obtenerCadenas(paises);
const nombreProdcutos = productos.map(productos => productos.nombre); //como no definia de que array, lo he hecho de esas 2.
const cadenasProductos = obtenerCadenas(nombreProdcutos);

console.log(cadenasPaises);
console.log(cadenasProductos);
//7. Usa una función de orden superior para sumar todos los elementos del array numeros.

const sumaNumeros = numeros.reduce((acumulador, numero) => acumulador + numero, 0);
console.log(sumaNumeros);

//8. Utiliza reduce para concatenar todos los países y formar la frase:"Finlandia, Suecia, Dinamarca, Noruega e Islandia son países del norte de Europa."

const norteEuropa = paises.reduce((frase, pais, index) => {

})

const frasePaises = paises.reduce((frase, pais, index) => {
    if (index === paises.length - 1) {
      return `${frase}e ${pais} son países del norte de Europa.`; 
    } else {
      return `${frase}${pais}, `;
    }
  }, "");
// aquí si que he tenido que pedir ayuda a ChatGPT porque no sabía como intercalar la e en medio del array.
  console.log(frasePaises);

//9. Verifica si hay algún nombre con más de 7 caracteres en el array nombres.

const masDeSiete = nombres.filter(function(nombre) {
    return nombre.length > 7;
});

console.log(masDeSiete);
//10. Comprueba si todos los países contienen la palabra "land".

console.log(paises.some(pais => pais.includes ('land')));
//11. Encuentra el primer país que tenga exactamente 6 letras.

console.log(paises.find(pais => pais.length === 6));

//12. Busca la posición de 'Noruega'. Si no está, se devuelve -1.

console.log(paises.indexOf('Noruega'));
//13. Busca la posición de 'Rusia'. Si no está, se devuelve -1.

console.log(paises.indexOf('Rusia'));
//14. Calcula el precio total de los productos combinando métodos como filter y reduce.

function obtenerPrecios(array){
    return array.filter(producto => typeof producto.precio === 'number' && producto.precio > 0);
}

const precioTotal = obtenerPrecios(productos).reduce((acumulador, producto) => acumulador + producto.precio, 0);

console.log(precioTotal);

//15. Calcula la suma total de los precios utilizando únicamente reduce.

const precioTotalReduce = productos.reduce((acumulador, producto) => {
    return acumulador + (typeof producto.precio === 'number' ? producto.precio : 0);
}, 0);

console.log(precioTotalReduce);



//Ejercicios con países europeos

const paisesEuro = [
    { nombre: 'Austria', idioma: 'Alemán' },
    { nombre: 'Bélgica', idioma: 'Neerlandés' },
    { nombre: 'Bulgaria', idioma: 'Búlgaro' },
    { nombre: 'Croacia', idioma: 'Croata' },
    { nombre: 'Chipre', idioma: 'Griego' },
    { nombre: 'República Checa', idioma: 'Checo' },
    { nombre: 'Dinamarca', idioma: 'Danés' },
    { nombre: 'Estonia', idioma: 'Estonio' },
    { nombre: 'Finlandia', idioma: 'Finés' },
    { nombre: 'Francia', idioma: 'Francés' },
    { nombre: 'Alemania', idioma: 'Alemán' },
    { nombre: 'Grecia', idioma: 'Griego' },
    { nombre: 'Hungría', idioma: 'Húngaro' },
    { nombre: 'Irlanda', idioma: 'Inglés' },
    { nombre: 'Italia', idioma: 'Italiano' },
    { nombre: 'Letonia', idioma: 'Letón' },
    { nombre: 'Lituania', idioma: 'Lituano' },
    { nombre: 'Luxemburgo', idioma: 'Francés' },
    { nombre: 'Malta', idioma: 'Inglés' },
    { nombre: 'Países Bajos', idioma: 'Neerlandés' },
    { nombre: 'Polonia', idioma: 'Polaco' },
    { nombre: 'Portugal', idioma: 'Portugués' },
    { nombre: 'Rumanía', idioma: 'Rumano' },
    { nombre: 'Eslovaquia', idioma: 'Eslovaco' },
    { nombre: 'Eslovenia', idioma: 'Esloveno' },
    { nombre: 'España', idioma: 'Español' },
    { nombre: 'Suecia', idioma: 'Sueco' },
    ];

// 16. Crea una función primerosDiezPaises que devuelva un array con los primeros 10 países.

function primerosDiezPaises(array) {
    return array.slice(0, 10);
}

console.log(primerosDiezPaises(paisesEuro));
// 17. Crea una función ultimosDiezPaises que devuelva los últimos 10.

function ultimosDiezPaises(array){
    return array.slice(-10);
}
console.log(ultimosDiezPaises(paisesEuro));
// 18. Averigua cuál es la letra inicial más repetida entre los nombres de los países europeos.
// 19. Ordena los países según el idioma oficial.
// 20. Crea un array con los idiomas que aparecen en más de un país.
//Estos 3 ultimos necesito que me los expliques en clase porque no los entiendo. Los otros los he ido corrigiendo con ChatGPT, peró necesito más practica aún 
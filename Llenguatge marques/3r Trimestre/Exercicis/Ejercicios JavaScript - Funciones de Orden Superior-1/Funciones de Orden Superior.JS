
console.log("�Hola desde JavaScript!");
document.querySelector("h1").style.color = "blue";  


const paises = ['Finlandia', 'Suecia', 'Dinamarca', 'Noruega', 'Islandia'];
const nombres = ['Juan', 'Mat�as', 'El�as', 'Brook'];
const numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const productos = [
{ nombre: 'pl�tano', precio: 3 },
{ nombre: 'mango', precio: 6 },
{ nombre: 'patata', precio: ' ' },
{ nombre: 'aguacate', precio: 8 },
{ nombre: 'caf�', precio: 10 },
{ nombre: 't�', precio: '' },
];

//1. Muestra por consola cada pa�s del array paises utilizando forEach.

paises.forEach(function(pais){
    console.log(pais)
});

//2. Utiliza map para crear un array con la longitud de cada pa�s.

const longitudPais = paises.map(function(pais){
    return pais.length;
});

longitudPais.forEach(function(longitud){
    console.log(longitud)
})

// 3. Convierte todos los nombres del array nombres a may�sculas con map.
const nombresMayusculas = nombres.map(nombre => nombre.toUpperCase());

console.log(nombresMayusculas);

//4. Filtra los pa�ses cuyo nombre comienza por la letra D.

const paisesConD = paises.filter(pais => pais.startsWith('D'));

console.log(paisesConD);
//5. Filtra los productos que tienen un precio num�rico v�lido.

const productosPorPrecio = productos.filter(producto => Number.isFinite(producto.precio));

console.log(productosPorPrecio);
//6. Crea una funci�n obtenerCadenas que reciba un array y devuelva solo los elementos de tipo string.

function obtenerCadenas(array){
    return array.filter(elemento => typeof elemento === 'string');
} 

const cadenasPaises = obtenerCadenas(paises);
const nombreProdcutos = productos.map(productos => productos.nombre); //como no definia de que array, lo he hecho de esas 2.
const cadenasProductos = obtenerCadenas(nombreProdcutos);

console.log(cadenasPaises);
console.log(cadenasProductos);
//7. Usa una funci�n de orden superior para sumar todos los elementos del array numeros.

const sumaNumeros = numeros.reduce((acumulador, numero) => acumulador + numero, 0);
console.log(sumaNumeros);

//8. Utiliza reduce para concatenar todos los pa�ses y formar la frase:"Finlandia, Suecia, Dinamarca, Noruega e Islandia son pa�ses del norte de Europa."

const norteEuropa = paises.reduce((frase, pais, index) => {

})

const frasePaises = paises.reduce((frase, pais, index) => {
    if (index === paises.length - 1) {
      return `${frase}e ${pais} son pa�ses del norte de Europa.`; 
    } else {
      return `${frase}${pais}, `;
    }
  }, "");
// aqu� si que he tenido que pedir ayuda a ChatGPT porque no sab�a como intercalar la e en medio del array.
  console.log(frasePaises);

//9. Verifica si hay alg�n nombre con m�s de 7 caracteres en el array nombres.

const masDeSiete = nombres.filter(function(nombre) {
    return nombre.length > 7;
});

console.log(masDeSiete);
//10. Comprueba si todos los pa�ses contienen la palabra "land".

console.log(paises.some(pais => pais.includes ('land')));
//11. Encuentra el primer pa�s que tenga exactamente 6 letras.

console.log(paises.find(pais => pais.length === 6));

//12. Busca la posici�n de 'Noruega'. Si no est�, se devuelve -1.

console.log(paises.indexOf('Noruega'));
//13. Busca la posici�n de 'Rusia'. Si no est�, se devuelve -1.

console.log(paises.indexOf('Rusia'));
//14. Calcula el precio total de los productos combinando m�todos como filter y reduce.

function obtenerPrecios(array){
    return array.filter(producto => typeof producto.precio === 'number' && producto.precio > 0);
}

const precioTotal = obtenerPrecios(productos).reduce((acumulador, producto) => acumulador + producto.precio, 0);

console.log(precioTotal);

//15. Calcula la suma total de los precios utilizando �nicamente reduce.

const precioTotalReduce = productos.reduce((acumulador, producto) => {
    return acumulador + (typeof producto.precio === 'number' ? producto.precio : 0);
}, 0);

console.log(precioTotalReduce);



//Ejercicios con pa�ses europeos

const paisesEuro = [
    { nombre: 'Austria', idioma: 'Alem�n' },
    { nombre: 'B�lgica', idioma: 'Neerland�s' },
    { nombre: 'Bulgaria', idioma: 'B�lgaro' },
    { nombre: 'Croacia', idioma: 'Croata' },
    { nombre: 'Chipre', idioma: 'Griego' },
    { nombre: 'Rep�blica Checa', idioma: 'Checo' },
    { nombre: 'Dinamarca', idioma: 'Dan�s' },
    { nombre: 'Estonia', idioma: 'Estonio' },
    { nombre: 'Finlandia', idioma: 'Fin�s' },
    { nombre: 'Francia', idioma: 'Franc�s' },
    { nombre: 'Alemania', idioma: 'Alem�n' },
    { nombre: 'Grecia', idioma: 'Griego' },
    { nombre: 'Hungr�a', idioma: 'H�ngaro' },
    { nombre: 'Irlanda', idioma: 'Ingl�s' },
    { nombre: 'Italia', idioma: 'Italiano' },
    { nombre: 'Letonia', idioma: 'Let�n' },
    { nombre: 'Lituania', idioma: 'Lituano' },
    { nombre: 'Luxemburgo', idioma: 'Franc�s' },
    { nombre: 'Malta', idioma: 'Ingl�s' },
    { nombre: 'Pa�ses Bajos', idioma: 'Neerland�s' },
    { nombre: 'Polonia', idioma: 'Polaco' },
    { nombre: 'Portugal', idioma: 'Portugu�s' },
    { nombre: 'Ruman�a', idioma: 'Rumano' },
    { nombre: 'Eslovaquia', idioma: 'Eslovaco' },
    { nombre: 'Eslovenia', idioma: 'Esloveno' },
    { nombre: 'Espa�a', idioma: 'Espa�ol' },
    { nombre: 'Suecia', idioma: 'Sueco' },
    ];

// 16. Crea una funci�n primerosDiezPaises que devuelva un array con los primeros 10 pa�ses.

function primerosDiezPaises(array) {
    return array.slice(0, 10);
}

console.log(primerosDiezPaises(paisesEuro));
// 17. Crea una funci�n ultimosDiezPaises que devuelva los �ltimos 10.

function ultimosDiezPaises(array){
    return array.slice(-10);
}
console.log(ultimosDiezPaises(paisesEuro));
// 18. Averigua cu�l es la letra inicial m�s repetida entre los nombres de los pa�ses europeos.
// 19. Ordena los pa�ses seg�n el idioma oficial.
// 20. Crea un array con los idiomas que aparecen en m�s de un pa�s.
//Estos 3 ultimos necesito que me los expliques en clase porque no los entiendo. Los otros los he ido corrigiendo con ChatGPT, per� necesito m�s practica a�n 
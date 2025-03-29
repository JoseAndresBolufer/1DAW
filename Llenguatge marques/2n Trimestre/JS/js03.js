//He separado cada partre de cada ejercicio para que sea más fácil de leer. Tengo la duda de si tanto aquí en estos ejercicios, como en un futuro trabajo, cuándo escriba código, tendré que hacer comentarios del código explicado.
//Ejercicio 1
let frutas = ['Manzana','Banana','Naranja'];
console.log(frutas[0]);
console.log(frutas.length);

frutas[2]='Fresa';
console.log(frutas);

frutas[0]='Uva';
console.log(frutas);

frutas.pop();
console.log(frutas);

frutas.shift();
console.log(frutas);

//Ejercicio 2
let numeros = [10,20,30,40,50];

let dobles = numeros.map(num => num*2);
console.log(dobles);

let mayores = numeros.filter((numero)=numero>25);
console.log(mayores);

let suma = numeros.reduce((acumulador, numero)=> acumulador+numero,0);
console.log(suma);

let encontrado = numeros.find((numero)=>numero>30);
console.log(encontrado);

//Ejercicio 3
let matriz = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
];
console.log(matriz[1][1]);
for (let i = 0; i < matriz.length; i++){
    for (let j = 0; j < matriz[i].length; j++)
        console.log(matriz[i][j]);
}
let matrizModificada = matriz.map(fila =>
    fila.map(numero => numero+10)
); 
console.log(matrizModificada);

//Ejercicio 4
const estudiantes = [
    {nombre: "Ana", calificacion:8}, 
    {nombre: "Arantxa", calificacion:10},
    {nombre: "Luis", calificacion:5},
    {nombre: "Eduardo", calificacion:7},
    {nombre: "José Vicente", calificacion:1}  
]
let estudiantesExcelentes = estudiantes.filter(estudiante => estudiante.calificacion > 8);
console.log(estudiantesExcelentes);

let nombresAprobados = estudiantes.map(estudiantes => estudiantes.calificacion > 5);
console.log(nombresAprobados);

let sumaCalificaciones = estudiantes.reduce((acumulador, estudiantes) => acumulador + estudiantes.calificacion, 0);
console.log(sumaCalificaciones)
let promedio = sumaCalificaciones / estudiantes.length;
console.log(promedio);

//Ejercicio 5
let ventas = [
    { producto: "Laptop", precio: 1200, unidades: 4 },
    { producto: "Smartphone", precio: 800, unidades: 10 },
    { producto: "Tablet", precio: 600, unidades: 5 },
    { producto: "Auriculares", precio: 200, unidades: 15 }
];

let ingresosTotalesPorProducto = ventas.map(venta => venta.precio * venta.unidades);
console.log(ingresosTotalesPorProducto);

let ingresosMayores5000 = ingresosTotalesPorProducto.filter(ingresosTotalesPorProducto => ingresosTotalesPorProducto>5000);
console.log(ingresosMayores5000);

let ingresosTotales = ingresosTotalesPorProducto.reduce((acumulador, ingresosTotalesPorProducto) => acumulador + ingresosTotalesPorProducto);
console.log(ingresosTotales);

//En este ejercicio, al pasarlo por chatGPT para corregirlo, me dice que reduzca los parámetros dentro de .map, .filter, .reduce, por ejemplo:
//el de venta lo he puesto como me dice, en vez de "ventas", peró me dice que el de "ingresosTotalesPorProducto" ponga "ingresos" solamente, me gustaría saber si eso afecta al código y si se puede hacer sin problema y és más limpio
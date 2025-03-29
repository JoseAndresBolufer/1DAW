//1. Declara una variable y asígnale una cadena de texto.
    let cadenaDeTexto = "Cadena de Texto"
//2. Imprime el valor de la cadena anterior en la consola del navegador.
    console.log(cadenaDeTexto);
//3. Imprime la longitud de la cadena en la consola del navegador.
    console.log(cadenaDeTexto.length)
//4. Cambia todos los caracteres de la cadena a mayúsculas.
    console.log(cadenaDeTexto.toLocaleUpperCase());
//5. Cambia todos los caracteres de la cadena a minúsculas.
console.log(cadenaDeTexto.toLocaleLowerCase());
//6. Elimina los espacios en blanco al principio y al final de ¡Hola mundo! .
    console.log("Hola Mundo".trim());
//7. Extrae la primera palabra de la cadena anterior usando dos métodos diferentes.
    console.log(cadenaDeTexto.slice(0, 6));
    console.log(cadenaDeTexto.substring(0, 6));
//8. Obtén la frase "Days Of JavaScript" a partir de "I Love Days Of JavaScript".
    console.log("I Love Days of JavaScript".slice(7));
//9. Comprueba si la cadena contiene la palabra "Days".
    console.log("I Love Days of JavaScript".search("Days"));
//10. Divide la cadena en un array.
    let daysOf = "I Love Days of JavaScript";
    let arrayPalabras = daysOf.split(" ");
//11. Divide la cadena "I Love Days Of JavaScript" por los espacios.
    console.log(cadena.replaceAll(" ", "\n"))
//12. Divide la cadena 'Facebook, Google, Microsoft, Apple, IBM, Oracle, Amazon' por, en un array.
    let cadena = "Facebook, Google, Microsoft, Apple, IBM, Oracle, Amazon";
    let array = cadena.split(", ");
//13. Cambia "I Love Days Of JavaScript" por "I Love Weeks Of JavaScript".
    let daysOfJava = "I Love Days of JavaScript";
    console.log(daysOfJava.replace("Days", "Weeks"));
//14. Encuentra el carácter en el índice 15 de la cadena "I Love Days Of JavaScript".
    console.log(daysOfJava.charAt(15));
//15. Determina la posición de la primera aparición de la letra a en "I Love Days OfJavaScript".
    console.log(daysOfJava.indexOf(a));
//16. Determina la posición de la última aparición de la letra a en "I Love Days OfJavaScript".
    console.log(daysOfJava.lastIndexOf(a));
//17. Encuentra la posición de la primera aparición de la palabra because en la frase: 'You cannot end a sentence with because, because it is a conjunction'.
    let sentence = "You cannot end a sentence with because, because it is a conjunction";
    console.log(sentence.indexOf("because"));
//18. Encuentra la posición de la última aparición de la palabra because en la fraseanterior.
    console.log(sentence.lastIndexOf("because"));
//19. Combina las cadenas 'I love' y 'sunny days' en una sola: 'I love sunny days'.
    let love = "I Love";
    let sunny = "sunny days";
    let resultado = love+" "+sunny;
    console.log(resultado);
//20. Usa startsWith() con la cadena 'These Are Days Of JavaScript' para que el resultado sea true.
    let these = "These are days of javascript";
    console.log(these.startsWith("These"));
//21. Usa endsWith() con la cadena 'These Are Days Of JavaScript' para que el resultado sea true.
    console.log(these.endsWith("JavaScript"));
//22. Usa el método repeat() para imprimir 'I love sunny days' 10 veces.
    console.log(resultado.repeat(10));
//23. Usa console.log() para imprimir la siguiente frase: La cita 'No hay mejor ejercicio para el corazón que ayudar a levantar a las personas.' de John Holmes nos enseña a ayudarnos mutuamente.
    console.log("La cita 'No hay mejor ejercicio para el corazón que ayudar a levantar a las personas.' de John Holmes nos enseña a ayudarnos mutuamente.");
//24. Usa console.log() para imprimir la siguiente cita de Madre Teresa:"El amor no es condescendencia, y la caridad no es lástima. La caridad y el amor son lo mismo; con caridad das amor, así que no des solo dinero, extiende también tu mano."
    console.log("El amor no es condescendencia, y la caridad no es lástima. La caridad y el amor son lo mismo; con caridad das amor, así que no des solo dinero, extiende también tu mano.")
//25. Haz que el tipo de '10' sea exactamente igual al tipo de 10.
    let diez = '10';
    let numero = 10;
//26. Haz que la cadena '9.8' sea exactamente igual al número 10.
    let casi = "9.8";
    let redondeo = Math.round(Number(casi)) === numero;
    console.log(redondeo);
//27. Genera un número aleatorio entre 0 y 255 (incluidos).
    const numeroRandom = Math.floor(Math.random()*256)
//28. En la frase 'El trabajo es una cosa difícil en este mundo. A algunas personas les gusta trabajar, pero muchas aún buscan fuerza para trabajar todos los días.'cuenta cuántas veces aparece la palabra trabajo.
    let frase = "En la frase 'El trabajo es una cosa difícil en este mundo. A algunas personas les gusta trabajar, pero muchas aún buscan fuerza para trabajar todos los días.";
    let coincidendcias = frase.match(/trabajo|trabajar/g);
    let cantidad = coincidendcias.length;

    console.log(cantidad);


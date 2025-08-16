Para el front -> **React**
Para el backend -> **nodejs**

___
## JavaScript
Busca darle dinamismo e interactividad a las interfaces web. Al igual que Java, pertenece a oracle. La especificacion de JavaScript se da en ECMAScript para que todos los navegadores puedan seguir el standard. Las implementaciones mas vigentes son:
- V8 -> para chrome
- SpiderMonkey -> para firefox
##### Lenguaje de scripting
Es dinamico (en tipado) e interpretado(no compila, se lee linea por linea). 


- Tiene tipado debil -> puede cambiar el tipo de las variables en runtime
- Tiene tipado dinamico -> los tipos se verifican al correr la aplicacion
- Multiparadigma -> objetos, funcional y estructurado
- Es un modelo de objetos basado en prototipos. Las clases no existen, existen objetos prototipo y se hacen copias del mismo para *simular clases*
```js
//clase con constructor -> el prototipo
function Alojamiento(nombre, precioPorNoche){
	this.nombre = nombre;
	this.precioPorNoche = precioPorNoche;
}

//definir un metodo -> setearle metodos al prototipo
Alojamiento.prototype.getNombre = function(){
	return `${this.nombre}`;
}
```
- Es monohilo -> es asincronico, se ejecuta todo en un solo hilo.
##### Interacion con html
Utilizando un DOM podes interactuar con un html. Tambien se puede hacer con un .js


##### Lado del servidor
Existen varios runtimes en el server.


#### JS
Imprimir en pantalla
```js
console.log("algo");

```

Ejecutar en backend
```js
node miArchivo.js
```


Sintaxis de clases
```js
class Alojamiento{

    constructor(nombre, precioPorNoche, categoria){

        this.nombre = nombre;

        this.precioPorNoche = precioPorNoche;

        this.categoria = categoria;

    }

  

    getDescripcion(){

        return `${this.nombre} - ${this.categoria} - $${this.precioPorNoche}`;

    }

}
```

Enum
Se crea un objeto nuevo y con *freeze* se le congelan los atributos para que sean solo esos atributos.
```js
  

const Categoria = Object.freeze({

    HOTEL: "hotel",

    DEPARTAMENTO: "departamento",

    CABANA: "cabaña",

    APART: "apart"

});
//la magia esta en que puedo hacer
Categoria.Hotel = algo
// esto es valido porque Hotel existe. No es valido en cambio hacer
Categoria.Casa = algo

```

Lanzar error

```js
throw new Error("Esto es un error");
```

Variables y constantes
```js
const algo = "hola";

let variable = "hola;
```

Exportar constantes y Clases de un archivo
```js
module.exports = {

    Alojamiento,

    Reserva,

    Categoria

}

//para importar
const { Alojamiento, Reserva, Categoria } = require ('./domain.js');
```


#### Documentacion de js, html, css
[https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil](https://developer.mozilla.org/es/docs/Web)

# Modelo async de JS
Es el modelo asíncrono de JS. Entrada/salida (llamar scio externo, base de datos) no bloqueante. Existe *un solo hilo de ejecucion* para manejar multiples operaciones a la vez. Los programas lineales pueden volverse mas dificiles de representar.
### Event Loop de JS
Existe el **call stack** que es el lugar donde se apilan las operaciones y llamadas sincrónicas de operaciones. Sin embargo, pueden aparecer operaciones de entrada/salida que node va a enviar a una **task queue** donde se ejecuta esa tarea por su parte. Luego, al finalizar, se manda al **callback queue** donde vemos el resultado de mi operacion de entrada/salida. Ahora hasta que no se vacíe el **call stack**, no se ejecuta el callback queue.
## Async en JS
#### Callbacks
Funciones que se pasan a tareas asincronas
```js
console.log("esto va antes de lo asincrono");
set.timeout(function(){
	console.log("tarea asincrona finalizada")
}, 1000)
console.log("esto va despues de la tarea asincrona")
```
Mientras que se espera por la funcion con *callback* se ejecuta lo demas. El por que es por que los console log y el `set.timeout` se meten en el call stack mientras que la funcion va al task queue y luego de finalizar se mete al call stack donde debe esperar a que ejecute lo demas para mostrarse.
#### Promesas
Son objetos que representan un posible resultado futuro. A este se le puede concatenar con `then` para que se ejecuten una vez finalizada la operacion. Por ejemplo
```js
function tareaAsincrona(){
	return new Promise((resolve, reject) => {
		if(Math.random() > 0,5){
			resolve("datos obtenidos")
		}
		else{
			reject("datos rechazados")
		}
	})
}

tareaAsincrona()
	.then((d) => {
		console.log("1." + d)
	})
	.catch((e) => {
		console.log("consulta fallida") // si la tarea se rechaza, va al catch
	})
	.finnally(() => {
		console.log("esto se ejecuta siempre")
	})
```
#### Funciones asincronas
El `await` espera a la finalizacion de otra cosa para seguir ejecutando. El async indica que el resultado de la funcion es una *promise* y se puede tratar como tal.
```js
async function obtenerUsuarios(pagina){
	let data;
	try{
		const response = await fetch("https://url")
		data = await response.json()
	}catch{
		data = {error: "error al obtener los datos"}
	}
	return data
}

async function imprimirUsuarios(){
	const usuarios = await obtenerUsuarios();
	console.log(usuarios)
}

imprimirUsuarios();
```
## Manejo de errores
Los errores bien manejados permiten:
- Dividir bien en capas
- Mejorar debugging
- Dar respuestas al usuario API/client
- Loggear errores
#### Declaracion de errores
Deben extender de la clase `error` y deben extender/darle valor al error
```js
export class AlojamientoDoesNotExist extends Error{
	constructor(id){
		super();
		this.message = "Alojamiento con Id: " + id + " no existe"
	}
}
```
#### Manejo de errores
Debo hacer un try/catch en el router
```js
try{
	await getController(AlojamientoController).findById(id)
}catch(err){
	console.log(err);
}
```
###### Middlewares
Debo hacer los `errorHandler` necesarios para manejar todo error relativo a ese stack(router, controller, service, repo)
```js
export function alojamientosErrorHandler(err,req,res,next){
	console.log(err)
	if(err.constructor.name == AlojamientoDoesNotExist.name){
		res.status(400).json({id: err.id, message: err.message})
		return
	}
	
	//si salto un error que no previne
	res.status(500).json({error: "algo salio mal..."})
}
```
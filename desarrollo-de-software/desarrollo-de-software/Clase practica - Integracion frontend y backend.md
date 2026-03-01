### Eventos disparadores a llamadas de backend
- Cargar una pagina
- Cliquear un boton
- Un loggin
- Cambiar el estado de algo
- El paso del tiempo
### Archivos service
De aca se van a hacer los llamados a las API. Suelen usar distintos services segun el nivel de utilidad requerido.
#### Cuestiones de estado
Siempre hay que mostrar el estado del sistema al usuario para que pueda ver como esta el sistema ahora. Tambien si hay error con la llamada. 
## Axios
Es un cliente http basado en promesas para nodejs y el navegador.
- Se maneja con promises
- Protege al cliente de cross-side
```js
export const getHoteles = async () => {
	try{
		const response = await axios.get(`http://localhost:3000/hoteles`,       
			{headers:'cache-control', 'no-cache'})
		return response.data;
	}catch(e){
		console.error("error agarrando hoteles")
		throw error
	}
}
```
## Cors
Intercambio de recursos de origen cruzado. Lo que hago es permitir al navegador la carga de un nuevo recurso. Entonces se fija si el servidor aceptaria dicha peticion. En caso de que asi sea devuelve que metodos http acepta y desde que origen.
Se maneja desde el lado del servidor
```js
	constructor(){
		this.#app.use(cors({
				origin: `http://localhost:3001`
				methods: ['post','put','patch','delete']
				credentials: true
			}
		))
	}
```
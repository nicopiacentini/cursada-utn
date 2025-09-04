### Persistencia
Cada objeto se guarda como quiere, quizas con una estructura distinta. Luego se pueden recuperar y se guardan como `JSON`. 
##### ObjectID
Es el identificador de los objetos que persisto en mongo. En persistencia relacional es un id autoincremental. Se puede usar para indexar. En el caso de mongo tambien existe este identificador y es como un UUID que incluye entre otras cosas las fechas de creacion.

#### Formato
Parece un Json pero no lo es. En realidad es `BSON` que tiene tipos de datos adicionales 
### Lenguaje de consulta
Se utiliza JS y su interprete esta basado en este lenguaje.
```js
db.tabla.find() // es el comando para recuperar objetos
```
Incluso puedo anidar documentos y listas, insertando informacion multivaluada o *multiples items de una*
```json
{
	mesa : 5,
	items[
		{"nombre" : "hola"},
		{"nombre" : "cafe"}
	]
}
```

##### Sistema `orden - item - producto`
- Orden -> Es la compra
- Item -> representa cada tipo de producto en la orden y la cantidad comprada. Apunta a la orden para indicar a que orden pertenece.
- Producto -> el producto que se vende y es apuntado por el item
Esto NO se respeta en el modelo no relacional y pueden pasar cosas como 
```json
{
	mesa : 5,
	items[
		{"nombre" : "Cafe"},
		{"nombre" : "cafe"}
	]
}
```
Ver como 'Cafe' y 'cafe' son distintos pero intentan representar la misma idea. Pero esto si pasa en el modelo *relacional* porque:
- Limitaciones del modelo
- normalizacion
- reutilizar almacenamiento.
En el mundo documental, esto no hace falta porque:
- El modelo lo permite (permite elementos multivaluados en forma de arrays/listas)
- El modelo permite embeber otros modelos (un producto embebido en otro item)
- El almacenamiento a veces no es un problema y no requiere de una extensa normalizacion.
Ahora la inconsistencia de datos sigue siendo un problema. Para evitar este problema *por defecto*
se almacena de forma normalizada.
#### Esquema
A la larga no tenerlo genera problemas para hacer migraciones o integrar mongo con otras aplicaciones utilziando `mongoose`.

##### Find
Soporta parametros:
1. Uno para el *where*
2. Otro para el *select*
```js
db.tabla.find({},{mesa : 1})
```

Mongo realiza una busqueda por ejemplo, es decir, *le paso una estructura buscada y mongo compara con sus documentos alguna estructura similar. Luego la retorna*.

##### MongoDB
es el driver/conector a base de datos. Como el jdbc para java. Sirve para conectarse a la base de datos
##### Mongoose
es el ODM (object - document -mapper). Resuelve el impedance mismatch.
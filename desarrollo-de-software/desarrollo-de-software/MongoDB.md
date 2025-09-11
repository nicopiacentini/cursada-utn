# Persistencia
- Mantener datos sin perderlos -> durabilidad
	- Existe la persistencia no durable -> en memoria
- Existe un medio para mantener ***volumenes de datos grandes***
	- Donde se guardan los datos -> en memoria/disco
	- Como se almacenan los datos -> archivos binarios o textual
- Operaciones CRUD sobre elementos realizadas de forma eficiente
## Organizacion Logica de la persistencia
### Modelo relacional 
- Entidades o *tablas* y relaciones. Integridad referencial, pk, fk.
- Utiliza el DER para modelar las tablas 
- Formas normales -> redundancia minima, consistencia de datos y operaciones CRUD
### Modelos NO relacionales
Son modelos que no se manejan con tablas y relaciones. Tienen ventajas y desventajas para utilizarlos con distintos enfoques.
##### Documental
Se basa en **documentos**. Estos contienen una serie de elementos `clave-valor` organizados en **colecciones**. Las colecciones hacen que los elementos clave-valor sean de un *tipo* mas o menos similar.
Tiene operaciones CRUD simples y rapdas, consistencia a medias. Introduce cierto nivel de duplicacion de datos.
##### Clave-Valor
Representa la informacion en forma de diccionarios *key* : `value`. Esta hecho para operar de forma muy veloz (no hace falta burocracia de creacion de tablas, etc)
## Bases de datos
Implementacion concreta de una base de datos siguiendo un paradigma:
- Documental
- Relacional
- etc
Persiste en un medio particular (memoria, disco, etc). Sigue ciertos requerimientos NO funcionales.
Siguen un *lenguaje de consulta*. En relacional esta SQL, por ejemplo.
##### Embebidas
Corren como un proceso -> no van en un servidor/nodo aparte
# MongoDB
Es documental y es ideal para arquitecturas monoliticas con:
- 1 cliente
- 1 servidor
- 1 base de datos
Utiliza JS como lenguaje de consulta y es de codigo abierto.
## Server side
Ejecutas el contendedor de docker. En su defecto, se usa el `mongod` que es el servidor.
##### ObjectID
Es el identificador de los objetos que persisto en mongo. En persistencia relacional es un id autoincremental. Se puede usar para indexar. En el caso de mongo tambien existe este identificador y es como un UUID que incluye entre otras cosas las fechas de creacion. Lo maneja mongo sin nosotros hacer nada de la forma mas eficiente posible.
Incluye *metadatos* relacionados a su creacion como su fecha de creacion y otros campos incrementales necesarios para su manejo.
#### Persistencia en documentos
Se persiste en archivos `Bson` que es similar a Json con diferencia en algunos tipos de datos.

#### Informacion multivaluada y normalizacion
Puedo insertar LISTAS en valores, es decir **informacion multivaluada**. No busca la normalizacion cosa que trae ventajas y desventajas. Esto lo que provoca es embeber identidades una dentro de otra rompiendo con la idea relacional de una tabla por entidad. Esto es posible si no importa tanto el almacenamiento pero si la velocidad. La repeticion nos da velocidad debido a que es mas rapido de encontrar.
#### Desnormalizacion?
Se busca desnormalizar hasta cierto punto. Luego se pueden usar por cuestiones de cosistencia referencias a *objectID* para mantener cierta integridad y no pelear con mayusculas por ejemplo.

## Client side
Se conoce como `mongosh` y se obtiene ejecutando exec en el contenedor docker
```bash
docker exec -it mongo-kommanda mongosh kommanda
```
basicamente se esta ejecutando el comando *mongosh* con el parametro *kommanda* en el contenedor mongo-kommanda desde la terminal, por eso el `-it`.

Lenguaje de consulta -> *interprete basado en js*

### Colecciones
Son las tablas del mundo documental. Es un repositorios de clave-valor. Para crear una coleccion hago:
```js
db.nombreDeLaColeccion
```
Importante! Las elementos de la coleccion no respetan una estructura determinada sino que solo guardan conjuntos clave-valor. Esto me permite hacer cosas como:
```json
db.nombreDeLaColeccion.insertOne({descripcion: "Milanesa"})
db.nombreDeLaColeccion.insertOne({descripcion: "Milanesa", mesa: 5})
```
La segunda insercion no respeta la misma estructura que la primera y aun asi se puede!

##### InsertOne()
```js
db.nombreDeLaColeccion.insertOne({descripcion: "Milanesa"})
```
### Find
Me da todos los elementos de una coleccion
```js
db.coleccion.find()
db.coleccion.find(campo: "valor")
```
Busqueda por ejemplo -> mongo busca cosas que cumplan con la estructura pedida. A veces se incluyen operadores para reducir al ejemplo.

# Persistencia
Es el estado en el que sistema sobrevive. Los repositorios se van a encargar de trabajar con esta parte. Existen distintos tipos de almacenamientos. *El sistema siempre arranca con un minimo de informacion*.
#### Estrategias
- En memoria -> todo en ejecucion. Se muere el programa y pierdo todo. Es muy rapida
- En Archivos -> si reinicio el sistema no pierdo nada. Se usa para sistemas pequeños
- Persistencia en bases de datos:
	- Bases de datos de objetos -> guarda los documentos como si fuecen los objetos del lenguaje directamente
	- Bases de datos relacionales
	- Bases de datos NoSQL -> son muy flexibles y no requieren un esquema. Son en ocaciones menos consistentes y no respetan los principios ACID. Estan pensadas para volumenes muy grandes de datos.
## Persistencia en NoSQL
No sigue estrcitamente el modelo relacional. Prioriza la flexibilidad, es decir, en cada campo segun fila puede cambiar que se guarda. Por ej, una persona puede tener edad y telefono y otra edad y mail. Prioriza la:
- Escalabilidad -> distribuible en varios servidores
- Flexibilidad
- Velocidad -> Es muy rapida.
### Existen distintos tipos
##### Orientada a grafos
Puntos conectados de un lado a otro. Se generan conexiones entre elementos
##### Documentales
Son muy flexibles y usan JSON como formato nativo
##### Clave - Valor
Son muy rapidas y se usan mucho para *cache* y *sesiones*.
##### Columnas
Esta optimizado para volumenes grandes de informacion y/o analisis de datos. Por ejemplo para IoT o sensores.
## Persistencia en documentales
Se pierde la integridad en cierto punto por no mantener un esquema o estructura fija.
#### Terminologia
- Base de datos -> conjunto de colecciones
- Coleccion -> Es similar a una tabla, pero no tiene esquema.
- Documento -> es una fila/registro especifico en si. Cuenta con estructura JSON.
Por ejemplo, en una coleccion *personas*
```js
{
	nombre : "juan",
	edad : 20,
	inventario : [
	{nombre : "taza", usos : 3}
	]
}
```
### Conveniencia de uso 
Me conviene usar bases de datos documentales cuando:
- No hay relaciones complejas entre datos
- Cuando se prioriza la velocidad y escalabilidad
- Cuando los datos tienen estructura semiestrcucturada y anidada
- Cuando las relaciones entre datos cambian con frecuencia.
- No existen transacciones complejas
- No se pide un nivel de integridad importante
### MongoDB
Es la base documental mas popular. Es flexible, escalable horizontalmente, usa indices y soporta consultas complejas. Trabaja con JSON nativo entonces es facil de trabajar con apis, node, etc.
##### Ventajas
- Adaptable a cambios rapidos
- Buena respuesta a queries complejas y/o lecturas rapidas
- Se integra muy bien con microservicios y el entorno JS.
##### Caracteristicas
- Flexible -> los documentos no necesariamente tienen un esquema
- Anidado -> existen jerarquia/ documentos que envuelven otros
- Autoidentificado -> por el *objectID*
- Autonomo -> Tiene toda la informacion necesaria para representar la entidad
##### Identificador unico de los documentos
Se llama *_id* y su tipo por defecto es el **objectID**. Identifica univocamente a ese objeto en la base de datos. Es un tipo especial de BSON. Esta hecho de 12 bytes de los cuales:
- 4 bytes: timestamp
- 5 bytes: identificador unico de host
- 3 bytes: contador aleatorio
### Operaciones basicas CRUD
La sintaxis basica es `db.coleccion.accion`
```js
{
  // Inserta un documento con nombre "Carlos" y edad 28
  "insert": "db.usuarios.insertOne({ nombre: 'Carlos', edad: 28 });",

  // Busca un documento por su ObjectId específico
  "findById": "db.usuarios.findOne({ _id: new ObjectId('507f1f77bcf86cd799439011') });",

  // Devuelve todos los documentos de la colección
  "findAll": "db.usuarios.find();",

  // Busca usuarios con edad mayor o igual a 25
  "findEdad25+": "db.usuarios.find({ edad: { $gte: 25 } });",

  // Busca usuarios con edad mayor o igual a 18 y que sean de Argentina (AR)
  "findEdad18+AR": "db.usuarios.find({ edad: { $gte: 18 }, pais: 'AR' });",

  // Busca usuarios que cumplan ambas condiciones: edad >= 18 y país AR
  "findAnd": "db.usuarios.find({ $and: [ { edad: { $gte: 18 } }, { pais: 'AR' } ] });",

  // Busca usuarios que cumplan al menos una condición: edad < 18 o país AR
  "findOr": "db.usuarios.find({ $or: [ { edad: { $lt: 18 } }, { pais: 'AR' } ] });",

  // Devuelve los primeros 5 usuarios ordenados por edad descendente
  "findSortLimit": "db.usuarios.find().sort({ edad: -1 }).limit(5);",

  // Actualiza la edad de Carlos a 29 (solo la primera coincidencia)
  "update": "db.usuarios.updateOne({ nombre: 'Carlos' }, { $set: { edad: 29 } });",

  // Elimina un documento cuyo nombre sea "Carlos"
  "delete": "db.usuarios.deleteOne({ nombre: 'Carlos' });"
}

```
### Relacionar documentos
Tengo la opcion de:
- Embebido -> tengo un objeto dentro de otro. 
- Referenciado -> Tengo un identificador referenciando a lo que necesite
##### Embebido
Hace crecer la coleccion. Conviene usar cuando:
- Hay una relacion uno a pocos. Porque es mas rapido de manejar 
- Se consulta todo junto
- El tamaño no crece mucho
##### Referenciado
Existe un Id que me lleva a otra coleccion con lo que preciso. Guardo solo el ObjectID de un documento en otro. Se usa cuando:
- Hay una relacion muchos a muchos
- Existe independencia entre colecciones
- Consulto datos por separado
#### Tabla resultado
|                 | **Embeido**                                                                                                                                    | **Referencia**                                                                                      |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| **personas**    | ```js<br>{<br>  "_id": 1,<br>  "nombre": "Lucía",<br>  "direccion": {<br>    "calle": "Calle Paunero",<br>    "numero": 123<br>  }<br>}<br>``` | ```js<br>{<br>  "_id": 1,<br>  "nombre": "Lucía",<br>  "direccion_id": ObjectId("X")<br>}<br>```    |
| **direcciones** |                                                                                                                                                | ```js<br>{<br>  "_id": ObjectId("X"),<br>  "calle": "Calle Paunero",<br>  "numero": 123<br>}<br>``` |
## Mongoose
Es el ODM en JS de mongo. Mappea objetos de JS a documentos de mongo. Usa una interfaz *orientada a objetos* para interactuar con la base. Valida, estructura y manipula datos con facilidad.
Se suele utilizar porque:
- Define esquemas de datos
- Nos abstrae de consultas complejas, evita escribir consultas de mongo *a mano* constantemente.
- Maneja relaciones y validaciones
- Permite usar objetos personalizados, middleware, etc.
#### Config
Necesito una clase `mongoDBClient` para conectarme con el metodo connect(). En los modelos *los atributos deben ser publicos, no privados ni protegidos*. Tampoco puedo tener getters o setters. Ahora las entidades de dominio necesitan tener un campo *id*.
Los controller y services deben manejarse con `async` y `wait`
#### Schemas
Los vamos a usar para negociar con la base datos y hacer validaciones de que se guarda y que no. Por ejemplo
```js
const alojamientoSchema = new mongoose.Schema({
  nombre: {
    type: String,
    required: true,
    trim: true
  },
  precioPorNoche: {
    type: Number,
    required: true,
    min: 0
  }
},{
	timestamps: true,
	collection: "alojamientos" //
});

alojamientoSchema.loadClass(Alojamiento);

export const AlojamientoModel = mongoose.model('Alojamiento', alojamientoSchema);

```

```js
const reservaSchema = new mongoose.Schema({
  diaInicio: {
    type: Date,
    required: true
  },
  diaFin: {
    type: Date,
    required: true
  },
  nombreHuesped: {
    type: String,
    required: true,
    trim: true,
    validate: {
      validator: function (v) {
        return v && v.length >= 3;
      }
    }
  },
  alojamiento: {
	  type: mongoose.Schema.Types.ObjectID,// referencia al objeto
	  ref: 'Alojamiento',// es el nombre de la clase de dominio y la usa el schema 
	  required : false
  }
},{
	timestamps: true,
	collection: "reservas" 
});
```
En `collection` estoy pidiendo que la cree si no existe. Tambien el schema pone limitaciones sobre dominio. Ahora el repositorio trabaja con el schema directamente y no trabajo mas en memoria.
```js
import AlojamientoModel from "../../schemas/alojamientoSchema.js"

export class AlojamientoRepository {
  // Este es el modelo que previamente dijimos que usábamos en el constructor
  constructor() {
    this.model = AlojamientoModel;
  }

  async findAll() {
    return await this.model.find();
  }

  async findById(id) {
    return await this.model.findById(id);
  }

  async findByName(nombre) {
    return await this.model.findOne({ nombre });
  }

  async save(alojamiento) {
    const nuevoAlojamiento = new this.model(alojamiento);
    return await nuevoAlojamiento.save();
  }
}

```
#####  Mappeo con schema
Puedo pedirle al odm que cuando busque un documento y lo obtenga me devuelva una instancia de una clase que yo necesite:
```js
reservaSchema.pre(/^find/, function (next) {
  this.populate('alojamiento');
  next();
});
```
###### Populate
Busca por id cuando tengo un documento referenciado y me instancia la clase que debe popular. Requiere un schema

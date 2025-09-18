
# HTTP
Protocolo de comunicacion para transferencia de texto plano. Sirve para comunicacion cliente-Servidor. Funciona sobre TCP (puerto 80). Define comunicacion en la web.
#### Funcionamiento
1. Cuando un cliente requiere un recurso envia la solicitud http al servidor web.
2. El servidor responde con el recurso o no.
#### HTTPs
HTTP con confidencialidad utilizando TSL/SSL como tecnica de cifrado de datos.
#### Formato
###### Solicitud
`Verbo` *http://miurl.com*
###### Encabezados
- Cookies
- Host
- autorizacion
- Accept -> es lo que estoy dispuesto a recibir como cliente. La api puede o no devolver lo que pid
- Content-Type -> indica que es lo que se esta mandando (html, json)
###### Cuerpo
Lo que se envia en la solicitud http
#### Los Verbos
- Get -> operacion de lectura sin modificacion. Obtiene algo
- Post -> operacion de escritura con modificacion
- Put -> Modifica completamente un recurso en especifico
- Patch -> Modifica parcialmente un recurso en especifico
- Delete -> borra un recurso
#### Codigos de estado/respuestas
- 1XX -> respuesta informativa
- 2XX -> respuesta correcta
- 3XX -> Redireccion
- 4XX -> error en cliente
- 5XX -> error en servidor

# API REST
Se basa en http y son una serie de buenas practicas para que tenga sentido a nivel industrial. Es una *interfaz de programacion de aplicaciones*. El servidor expone la interfaz y el cliente la consume. La idea esta en que el cliente desconoce la funcion interior de la interfaz solo lo que hace.
La parte REST implica la manipulacion de objetos mediante URI (identificador uniforme de recursos) y los verbos HTTP.
*El formato de los archivos que devuelve es json y xml*.
### Recursos Web
Como se acceden a los recursos del servidor segun REST. Ejemplo con usuarios
- `Get /users` -> obtiene todos los usuarios
- `Get /users/1` -> el usuario con id 1
- `Post /users` -> se genera un nuevo usuario
- `PUT /users/1` -> modifica un usuario
- `DELETE /users/1` -> se borra un usuario
#### URL
Tiene 3 partes y son los endpoint a los que les aplico los verbos http.
`dominio`/`base`/`queryParams`
- Dominio -> *http://nombreDelServer*
- Base -> Parte que hace referencia al recurso /usuario/1
- QueryParams -> es un key value opcional para aplicar flitros`?color=azul`

## Backend con Express, HTTP, JSON y Validación

### Levantar el servidor
Tenemos que indicar en que puerto esperamos las cosas
```js
import express from "express"
app.listen(3000, () => {
	console.log("app funcionando y escuchando en 3000")
})
```

### Express y manejo de rutas

Se utiliza **Express** para crear el servidor y definir rutas (endpoints) que responden a distintos verbos HTTP.  
Por ejemplo, para obtener todos los alojamientos:

```javaScript
import express from "express"
const app = express();
app.get("/alojamientos", (req, res) => {
	res.json(alojamientos);
})
```

#### QueryParams
```js
app.get("/api/v1/alojamientos", (req,res) => {
	const valorDeQueryParam = req.query.unQueryParam
	if(!valorDeQueryParam){
		res.send(alojamientosADTO(alojamientos))
		return
	}else{
		const alojamientosADevolver = 
		alojamientosADTO(alojamientos.filter(a => a.precio < 5))
		res.json(alojamientosADevolver)
		return 
	}
})
```
Donde dice `unQueryParam` tiene que ir el nombre del queryParam en la *URI*.
#### RequestParams
```js
app.get("/api/v1/alojamientos:id", (req,res) => {
	const valorDeRequestParam = req.params.unQueryParam
	const alojamientosADevolver = 
	alojamientosADTO(alojamientos.filter(a => a.id = valorDeRequestParam))
	res.json(alojamientosADevolver)
	return 
})
```
##### Interpretacion de bodies
Puedo hacer que la app siempre interprete el body que llegue de una forma u otra. Por ejemplo:
```js
import express from "express"
const app = express()
app.use(express.json())
```
### Zod – Validación y tipado en JavaScript

Zod es una librería para **definir esquemas** y **validar datos** en JavaScript/TypeScript.  
Se usa mucho cuando recibís información de un **formulario**, una **API**, o cualquier fuente externa,  
y querés asegurarte de que cumple con la forma esperada.

---

### Instalación

```bash
npm install zod
```
Definir un esquema básico
```js

import { z } from "zod";

const userSchema = z.object({
  name: z.string(),
  age: z.number().int().positive(),
});
```
En este ejemplo:
- name debe ser un string.
- age debe ser un número entero y positivo.

Validar datos
```js
// Dato válido
userSchema.parse({ name: "Ana", age: 25 }); // ✅ OK

// Dato inválido
userSchema.parse({ name: "Ana", age: -5 }); // ❌ Error
//.parse(data) → devuelve los datos válidos o lanza un error.

//.safeParse(data) → devuelve { success: true, data } o { success: false, error }.
```
##### Funcionalidades útiles
.`optional()` → campo opcional.

`.nullable()` → permite null.

`.array(schema`) → valida arrays.

`.enum([...])` → restringe valores a un conjunto.

`.min(n) / .max(n)` → restricciones en strings y arrays.

### Manejo de errores y respuestas

El servidor responde con códigos HTTP apropiados y mensajes claros:

- **400 Bad Request**: Cuando el id no es un número o la validación falla.
- **404 Not Found**: Cuando el recurso no existe.
- **201 Created**: Cuando se crea un recurso.
- **204 No Content**: Cuando se elimina un recurso.

---

Este backend implementa una API RESTful moderna, usando Express para el manejo de rutas y verbos HTTP, JSON para la comunicación, Zod para la validación y buenas prácticas en el manejo de errores y respuestas
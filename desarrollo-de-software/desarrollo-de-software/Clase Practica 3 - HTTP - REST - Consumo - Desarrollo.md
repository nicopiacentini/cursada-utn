
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
- Acept
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
El formato de los archivos es json y xml.
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

### Express y manejo de rutas

Se utiliza **Express** para crear el servidor y definir rutas (endpoints) que responden a distintos verbos HTTP.  
Por ejemplo, para obtener todos los alojamientos:

- 
- 
- 
- 

### Verbos HTTP

- **GET**: Obtiene recursos.
- **POST**: Crea nuevos recursos.
- **PUT**: Modifica recursos existentes.
- **DELETE**: Elimina recursos.

Ejemplo de POST para crear un alojamiento:

- 
- 
- 
- 

### Manejo de JSON

Express permite recibir y enviar datos en formato **JSON** fácilmente:

- 
- 
- 
- 

Las respuestas también se envían en JSON usando [res.json()](vscode-file://vscode-app/c:/Users/nicol/AppData/Local/Programs/Microsoft%20VS%20Code/resources/app/out/vs/code/electron-browser/workbench/workbench.html).

### Validación con Zod

Se usa **Zod** para validar los datos recibidos en el cuerpo de la solicitud:

- 
- 
- 
- 

### Manejo de errores y respuestas

El servidor responde con códigos HTTP apropiados y mensajes claros:

- **400 Bad Request**: Cuando el id no es un número o la validación falla.
- **404 Not Found**: Cuando el recurso no existe.
- **201 Created**: Cuando se crea un recurso.
- **204 No Content**: Cuando se elimina un recurso.

Ejemplo de manejo de error:

- 
- 
- 
- 

### DTOs y estructura de datos

Se usan funciones para transformar los objetos internos en **DTOs** (Data Transfer Objects) antes de enviarlos al cliente:

- 
- 
- 
- 

---

Este backend implementa una API RESTful moderna, usando Express para el manejo de rutas y verbos HTTP, JSON para la comunicación, Zod para la validación y buenas prácticas en el manejo de errores y respuestas
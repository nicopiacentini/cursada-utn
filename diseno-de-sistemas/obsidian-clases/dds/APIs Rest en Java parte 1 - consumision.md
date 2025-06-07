Es una interfaz de programacion 

### Esta basado en
- Arquitectura cliente-servidor
- HTTP -> protocolo
- JSON -> representar objetos como texto
#### Arquitectura cliente-servidor
Existe un componente en mi arquitectura (puede ser un objeto, servidor, maquina fisica) que sirve informacion o capacidades (es decir un servidor), para que consuman los clientes. Este **servidor** tiene una gran capacidad de computo y atiende a varios clientes en simultaneo. El cliente pide algo, el servidor se activa y responde.
Los clientes no son confiables porque NO son confiables. 

### HTTP
Hypertext Transfer Protocol. Es apoyado por el protocolo **TCP/IP**. Mas especificamente, se va a encontrar en la capa de **Aplicacion** o Aplication layer. Transmite texto plano entre un punto y otro. La ventaja es que lo que es enviado y recibido es legible por el humano. Tiene 3 partes
- Cabecera -> titulo
		Aca van los get, delete, post de la ruta. Es decir, que quiero con ese archivo
- metadatos -> headers clave : valor
		Aca son caracteristicas que quiero que cumpla la respuesta, por ejemplo, lenguaje, formato de compresion, etc.
- cuerpo -> el mensaje que quiero transmitir
		Aca es un depende, si es del cliente puede ser un filtro. Si es del servidor es la respuesta como tal
Los paquetes de informacion enviados no tienen relacion entre si. Hay algo que mantiene mi sesion en el tiempo incluso si me voy.
Las cabeceras son muchas pero pueden ser
- Get -> pido algo y va del palo Get ruta
- Delete -> pido al host que borre algo
- Post -> Le envio algo al host
##### Status de respuesta en http 
100 -> informativo
200 -> exito
300 -> redirecciones
400 -> error del cliente
500 -> error del servidor

##### Secuencia
Cuando abro una pagina, hago un get de lo principal. Esto me llega y empieza a llamar otros paquetes para darle imagenes, fotos, etc. Todo esto carga de a poco.

##### Postman
Es un cliente mas pero que me da vistas de request-responce. Para agregarle body a mi request, se hace en formato .json

### URL
Es a donde voy a hacer la request, lo que va despues del post o get

##### Formato
*protocolo*://**host**/path?QueryParams

https://www.google.com/search?q=como+niggers&lang=en

Los Queryparams son del formato **clave=valor** y se separan con un **&**

El protocolo puede ser http o https y es como nos comunicamos. El host es el servidor, a quien le pido lo que le pido. El path es para navegar archivos dentro del servidor. Luego los query params afinan mi pedido para que me llegue lo que necesito.

### Estructura de una pagina

#### HTML
Me va a dar la estructura de la pagina con 
- botones
- estructuras
#### CSS
Son archivos de texto con sintaxis para definir formatos visuales, colores, transiciones, etc

#### JavaScript
Es el lenguaje de programacion que le da soporte a mi pagina

### Json
JavaScript Object notation.
Es el formato utilizado para intercambiar objetos a traves del formato http. Estoy representando **objetos** como texto. Los espacios no importan. Representa objetos, arrays, strings, etc. Ejemplo: 
```json
{//esto es un objeto
	"status"{
		"verified" : true
		"sentCount" : true
	}
	//aca van los mismos objetos y strings y etc
	"miArray" : [1,2,3],
	"deleted" : false,
	"id" : "58e234243ece324",
}
```
Este formato esta estandarizado entre cliente-servidor. Tanto el cliente como el servidor interpretan como corresponde cada una de las cosas que se envian.

### Cookies
Es un mecanismo usado para mantener la sesion de mi cliente o aparentar que lo hacen.
Son pedazos de informacion relativos a la sesion del cliente en mi pagina. Se guardan del lado del cliente.
Ejemplo: 
![[Pasted image 20250523101744.png]]
La respuesta le llega con un *Set-Cookie* para que se la guarde el cliente. Cuando el cliente se vuelve a comunicar con el servidor, le manda la cookie para "restaurar la sesion". El cliente puede aceptar o rechazar la cookie. Si la acepta la guarda en memoria o en disco, pero en algun lado queda. Lo que guarda el cliente es textualemte "session_id = 12345". El servidor guarda la sesion.

## REST
Representational rest transfer. Representa recursos de http de manera jerarquica. Sirve recursos de http. Es una abstraccion de http. Aca las operaciones son los metodos de HTTP.
PUT -> sirve para pisar recursos. Indico donde quiero que me llegue algo
PATCH -> sirve para "parchear" un recurso. 
Como trabaja sobre http, no tiene estado. Lo unico que puede tener es un header.

### Practicas de una API REST

##### Usar sustantivos y no verbos
/obtenerMascotas esta mal tendria que ser GET/mascotas o POST/mascotas

##### Usar nombres en plural
Necesito poder inferir que hace mi api sin leer la documentacion
/mascotas/10
El '10' es un identificador
##### Usar correctamente los metodos HTTP
El GET no tiene body porque no mando informacion
El PUT si tiene informacion

##### No actualizar recursos con el metodo GET

##### Usar sub-recursos para las relaciones
Estructurar las url con carpetas y subcarpetas
/dueños/32425342/mascotas -> me trae las mascotas del dueño con ese dni
/organizaciones/walmart/areas/CONT/empleados

### Ejercitacion
Aclaracion: en cada post, antes de pasajeros o billetes va el host
```json
	POST:/pasajeros
	BODY{
	"nombre" : "jaimito"
	}
	statusPosibles -> 200 o 404
```
```json
GET:/pasajeros?page=1
```
```json
GET:/pasajeros?nombreEmpiezaCon=m
status 404 o 200
```
```json
PUT:/billetes?id=34243
BODY{
	"estado" : "cancelado"
}
```

TAREA -> modificar el repo de apis para que en vez de que aparezcan los usuarios, aparezcan los repos.
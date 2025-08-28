###### Apuntes para leer
- Apunte de express
- Biblioteca vs. Framework
- Bitacoras(1 a 4) + apuntes de bitacora
- Frameworks pesados y livianos.
___
### Express
Framework para backend en nodejs. Estructura de forma sencilla el codigo de las rutas en una arquitectura cliente-servidor web.
### Servidor en cliente pesado vs en cliente liviano.
El servidor expone cosas de forma distinta segun si es cliente liviano o pesado
##### Cliente liviano
Se expone el formato en html ya armado y posible de renderizar de forma nativa. Entonces **se expone informacion para generar una UI**. Se recarga con cada cambio que hay en la pagina.
##### Cliente pesado
Se utiliza un formato mas estructurado (json, xml) para que sea consumido por un cliente programatico (navegador). **Se expone informacion para ser consumida programaticamente.** Para poder hacer esto, el servidor expone una *API*, sea http, rest, xml, etc. La consumision de api se hace en background y renderiza la diferencia. Entonces parece mas veloz. Supuestamente, da mas interactividad que liviano al poder ejecutar codigo js. Se suele usar mucho por tendencia.

###### Api HTTP
Es una interfaz para aplicacion que se utiliza en cliente pesado. Para cliente liviano directamente se envia el html/css/js.

## Arquitecturas logicas
Organizan los componentes logicos de mi sistema. Se suelen solapar/complementar entre sí.
### Patrones de interacción
#### MVC
Es un patron de interacción. Es una arquitectura logica para organizar los componentes del sistema y delimitar con que parte de mi sistema interactua el exterior, a veces el usuario. Es decir, separa los componentes que hacen cosas de aquellos que se dedican a mostrar cosas. 
Para realizar esto divide los componentes logicos en modelo, vista y controlador
###### Controlador
Gestiona la relacion entre el modelo y la vista
###### Vista
muestra y administra respuestas para con el usuario y mi sistema
###### Modelo
Presenta/realiza la logica de negocio de mi sistema.
#### Orientacion de patrones de interaccion
Pueden ser encontrada tanto en el cliente como en el servidor y a veces en ambos. Segun la utilización de cada una estan o responden a un problema u otro, por ende su ubicacion.
- MVC -> cliente, servidor
- MVVM -> cliente
- MVP -> cliente
- VIF -> servidor
- `React` -> cliente
### Arquitecturas de Servidor
#### Arquitectura de capas
No solo resuelve el problema de interaccion con vista sino que ademas resuelve temas de persistencia y comunicacion con otros sistemas. La organizacion es mucho mas estructurada y rigida. Define interacción y relacion/consumicion de servicios entre capas.
Se organiza como un *stack* y en las capas superiores estan cosas como el *enrutamiento*. Luego, mas abajo esta la idea de *controller*. Abajo la idea de *servicio* y abajo de todo *persistencia*. Plantea la idea de que *"El de arriba conoce y consume los servicios del de abajo pero el de abajo desconoce lo que esta arriba"*. Los componentes de una misma capa interactuan entre si.
En cada capa aparecen distintos objetos:
- En persistencia aparece el objeto **repositorio/managers/DAO** para hablar con la base de datos y modelos(anemicos)/entidades (conjunto de datos a persistir). **Define la estructura de los datos y la forma de persistirlos**
- En Servicios hay servicios a consumir. Aca es donde esta la l**ogica de negocios implementada**. 
- En la capa de controllers hay controladores. Realiza la coordinacion entre los servicios y el enrutamiento. Manda mensajes a los objetos correspondientes de servicio
- En la capa de enrutamiento hay rutas/routers. Establece el vinculo entre una ruta (puede ser http) y el mensaje del controlador para hacer lo que pide la peticion. Luego el controlador responde y el enrutamiento devuelve al cliente. Es decir vincula un `GET /ventas` con un `ventasController.darVentas()` Cada enrutamiento distinto elige crear una instancia nueva del controller o usar siempre la misma. Osea realiza el vinculo http-java/js. Asimismo, en cliente pesadretorna el resultado como json, xml, html, etco envolver los objetos en archivos suele hacerse en enrutamiento pero puede hacerse tambien en controller.
#### Concerns/Incumbencias
Entiende la idea de repeticion de **problemas** como persistencias, modelo, vistas o comunicacion. Se suele mezclar con MVC.
#### OO -> Arquitectura orientada a objetos
Se basa en la idea de modelar responsabilidades y clases para hacer todo tipo de cosas. Es muy afin a objetos.
### Rest Http
Es una formalizacion/convenciones de http para usarlo con buen uso. Estandariza los verbos y usarlos de forma responsable.
- el carácter orientado a recursos: cada ruta representa un ente que puede ser accedido y operado.
	>Esto contrasta con otra posible forma de modelar las rutas: RPC (_remote procedure call_ o llamada a procedimiento remoto), en la que cada ruta ruta representa una acción
- la distinción entre recursos individuales (aquellos para los que existe una única instancia) y colecciones (aquellos para los que existen múltiples)
- el aprovechamiento de la semántica de los verbos HTTP, las cabeceras y códigos de respuesta
Como la aplicacion la mantengo yo, puedo deformar un poco las interfaces alejandome de Rest siempre y cuando sepa lo que este haciendo. Ahora cuando mi http es consumible en internet necesito cumplir con Rest para entenderse con demas personas.
Las convenciones pueden no respetarse y puede pasar que si esta mal hecho un Delete haga un get. 
##### Rutas
Los verbos se aplican a las rutas `http://localhost:8080/ventas` . Las rutas suelen quedar loggeadas. Los body no. Entonces poner ids en la ruta *es recomendable*. **Se pueden usar en cliente pesado y cliente liviano**. Las rutas/url de muchos programas y las usan en UI y en APIs en simultaneo.
- Singulares -> devuelven un solo elemento: `http://localhost:8080/promocion-del-dia`
- Plurales -> devuelven mas de un elemento: `http://localhost:8080/ventas`
Esto es un standard y se intenta respetar.
###### Rutas orientadas a eventos
Son rutas con verbos dentro de si. NO respetan rest pero se pueden usar.
Los **verbos** son:
#### Get
Trae datos del sistema *SIN EFECTO*. El sin efecto es una promesa del que hace el sistema, esto no implica que deba respetarse a rajatabla
#### Delete
Borra elementos de mi sistema. Tiene efecto.
#### Put
Modificacion total del elemento. Los atributos que no agrego quedan en vacio
#### Patch
Modificacion parcial del elemento. Solo se modifican los atributos que yo estoy modificando.
###### Query Params
Son parametros de busqueda que pueden sumarse a una petición `GET` para especificar aquello que se quiere traer.
##### Codigos de estado
Son los posibles codigos que nos da la respuesta http. Es la respuesta que da el servidor
- 5XX -> Error en servidor
- 4XX -> Error en el cliente
- 2XX -> Salio bien
- 3XX -> Redirecciones
- 1XX -> Cuestiones de configuracion
##### Headers
Las no Standard existen como `Xalgo`. Se utilizan para comunicar metadatos.

##### Cuerpo
Es lo que se manda de informacion como agregado en la solicitud http.
- Curl:
``` bash
curl http://localhost:8080/ventas --#body
```
- Postman -> Hay un espacio abajo para agregarlo
- Navegador -> No suele mandar body a menos que se este enviando un fromulario.

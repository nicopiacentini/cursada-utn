Los patrones no se fuerzan, salen naturalmente.

#### Patron Observer
Es un disparador de eventos. Ante un estimulo se dispara tal o cual evento. Normalmente se piensa que todo lo empieza el usuario. Ahora esto no es así debido a que existen dispositivos enbevidos y procesos automáticos. Hay clases que deben estar *observando* a otras para cambiar su estado segun cambia el estado de la primera. Surge la idea de un objeto *subscripto* a otro. Estos son el *sujeto* y el *observador* que cuando cambie el estado del sujeto, se informe y actualize el observador. Ahora el sujeto *conoce* al observador pero no los define. Cuando se actualiza le avisa a cada uno de ellos porque los tiene en una lista.
El observador tiene un metodo que se llama actualizar y la lista observados hace algo del palo. 
```java
class Sujeto{
	private List<Observer> observadores;
	private void actualizarEstado{
		...codigo
		notify()
	} 
	private void notify() = observadores.stream().foreach(observador -> 
				observador.update())
	private void attach(observer)....
	private void deattach(observer)

}
```


![[Pasted image 20250704091518.png]]

### Arquitectura
Determina los componentes de un sistema y la relacion entre los mismos. Segun el modelo de *4 + 1* Existen las vistas:
- Logica -> datos
- Fisica -> componentes
- Proceso
- Despliegue -> que sw en cada componente
Todas estas relacionadas por los casos de uso.

Ahora pueden haber arquitecturas de:
- Datos -> DER
- Logica/Negocio (Diagrama de clases)
- Componentes -> Diagrama de componentes, tiene que ver con los atributos de calidad que entran en conflicto entre si.
- Nodos -> Diagrama de despliegue
Dentro de el diagrama de clases existe la capa de datos, es decir **clases que solo acceden a la base de datos**. Pero como no se trabaja con bases de datos orientadas a objetos necesito adaptarme a la misma. Existen herramientas que hacen esto llamadas ORM.(como hybernate) Estas construyen las capas de acceso a datos. Asi me desligo de tener que construir/deconstruir el objeto/insert. Para poder hacer todo esto tengo que trabajar con *@annotations* 
Asimismo aparecen las clases de interfaz de usuario, de controller y de logica de negocio.
##### Controller
Es cada una de las maneras en las que el usuario accede al sistema. Tiene la logica de ver que le entrega al usuario o que le muestra. El controller debe tener un metodo para llamarse.
Es accedido por una o muchas url y se cumple que por un url hay un controller.

Modelo MVC
- capa modelo
-  capa controller
-  capa vista

#### App ext
La arquitectura tambien define como interactua el usuario con  mi sistema y como se integran a las aplicaciones externas. En el mvvm el usuario entra a la vista de una. Aca el patron de interaccion es un observer.

### Patrones de arquitectura
Como pienso la arquitectura de los componentes. Determino si hay algunos con mas responsabilidad que otros. Tambien analizo el nivel de centralizacion.
##### Cliente - Servidor
Tengo un cliente y un servidor. El cliente pide al servidor y el servidor responde. Tengo identificado quien es el cliente y quien el servidor. Tengo multiples clientes para un servidor. 

##### Peer to Peer 
Todos los nodos interactúan al mismo nivel

##### Arquietectura de capas
Hay una interaccion entre capas adyacentes. Existen capas. Pueden haber muchas o pocas segun lo que necesite o requiera. Puedo priorizar centralizacion o descentralizacion.

### Arquitectura de flujo de datos
Representacion de como se manejan los datos dentro del sistema.
#### ETL
Es extraer, transformar y cargar. Son componentes o clases separados. De esos componentes o clases me importa que sean intercambiables. Existe un flujo de datos con esta arquitectura
		Extract -> Transform -> Load
Hace de filtro con su propia responsabilidad.

#### Centrada en Datos
Tengo una base de datos y todos los sistemas acceden a la misma. Ahora centralizar es un problema porque todos los sistemas tocan la misma base de datos. Esto me puede generar condiciones de carrera. Es importante determinar el momento de carga de datos. No es lo mismo hacerlo de forma *lazy* (que recibo datos a medida que los pido) o eager (mando todos los datos a memoria ni bien levanto la app). **Se usa cuando los datos son confiables en tiempo real**.

#### Call & Return 
Llaman datos y devuelven la llamada. Dentro de estas Estan:
- arquitectura de capas
- arquitectura cliente-servidor
- SOA -> Service oriented Arquitecture. Es una arquitectura orientada a servicios.

## Patrones de integracion
Como me integro con sistemas externos. 

#### Middleware o Broker
Puede surgir la idea de **middleware** como puente entre mi aplicacion y componentes externos de tal forma que mi aplicacion consuma la interfaz del middleware que al mismo tiempo consuma de los sistemas externos. El middleware es parte de mi sistema. En mi diagrama de clases necesito tener la interfaz del middleware. 

#### API's 
Hago llamadas a la api
#### Cola de mensajes
Es un broker mas direccional que no espera retorno

#### Publisher and Suscribe o Suscriber
Hay uno que publica y otros que se suscriben. Es un patron observer en arquitectura. Necesita usar un broker.

#### Replicador de datos
Existe una instancia principal y una instancia *espejo* que va replicando datos de la instancia principal.


### Patrones de Concurrencia
 Determinan patrones arquitectonicos que me sirven para concurrir/sincronizar procesos, recursos, etc.
 
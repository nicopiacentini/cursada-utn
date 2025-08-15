Prof Federico Koval
4 parciales -> 2 de teoria y 2 de practica
Bibliografia -> stallings, castro y fusario.
___
# Normas
Son basicamente las recomendaciones para aplicar/usar determinadas tecnologicas
- ISO
- IEEE
- ITU -> se las suele identificar como una *letra*.**numero**
- ISOC / IETF -> Generan recomendaciones para el uso de la internet. Generan las RFC (*request for comment*)
- ATM Forum

# Redes
Se conectan dispositivos en una red para que puedan compartir recursos. Clasificacion segun el alcance/extencion que manejan:
- Red de area local (LAN)-> Ocupa un piso, oficina o como mucho un edificio
- Red de Area extensa(WAN) -> Interconecta redes de area local. Puede ser del tamaño de un campus, provincia o hasta un pais. 
- Red de area Global -> Es el internet.
En el medio entre LAN y WAN esta la MAN

## Diferencias entre LAN y MAN

##### Privacidad
Cuando hago una red LAN consigo los dispositivos, el cableado y el activo de red (switch, hub, mainframe). Todo lo obtengo yo es decir la infraestructura es **privada**.
Cuando armo una red WAN porque debo interconectar 2 lugares y cada uno tiene su propia LAN, debo contratar los servicios de un proveedor de telecomunicaciones porque no puedo comprar un cable largo para intercomunicarlos.

##### Anchos de banda, velocidades de transferencia y BER
Recordemos que al cambiar uno de estos 3 cambian los otros 2.
Para una LAN, generalmente todo esta protegido, no a la interperie, con una capacidad de cable de red y capacidad de placa de red de las computadoras podría alcanzar un maximo de 1 o 10 Gbps. El ancho de banda esta en los Gbps. La tasa de error es baja
Para una WAN tengo que comprar yo la velocidad de transferencia al proveedor de telecomunicaciones. El ancho de banda esta en los Mbps. La tasa de error es un poco mas alta


##### Gestion del enlace
Para LAN, si se cae el enlace (cable/red) lo reparo yo porque es mio.
En WAN debo hablar con el proveedor si se cae el enlace y depende de el

##### Protocolos 
Se utilizan protocolos de comunicacion distintos en LAN y en WAN. Por ejemplo, en una LAN si tengo que comunicarme puedo transmitir a mucha velocidad y tasa de error baja puedo usar un protocolo que asuma velocidad y poco error. Para una WAN ante una tasa de error mayor, debo chequear que llego el mensaje y por eso existe protocolo especifico para eso 

##### Tipo de conmutacion
En una LAN se usa conmutacion de paquetes y en una WAN puede usar conmutacion de circuitos y o de paquetes

### Conmutacion
##### Conmutacion de circuitos (Reales)
Es un circuito hecho por varios repetidores en el medio de la nube. La red es digital pero mando cosas analogicas. Manda 64kbps. **El circuito es de uso exclusivo -> circuito real**
##### Conmutacion de paquetes (Virtuales)
Hay una red de conmutadores que manda paquetes(grupo de bits) entre si hasta llegar al destino. Es un circuito virtual compartido por demas conexiones. Cada repetidor tiene una regla sobre donde mandar cada cosa en caso de que le llegue un paquete que quiere ir a determinado lugar.


## Topologias
Formas de comunicacion/conexion que tienen las redes

#### Bus
Es la que se usa para representar redes LAN. Es basicamente el medio de comunicaciones (cable UTP) compartido entre dispositivos. Estan conectados en linea recta
#### Anillo
Hay 2 formas de llegar a un mismo dispositivo. Se conectan como anillo

#### Estrella
Hay un nodo central que controla y distribuye las comunicaciones. Es la que mas utilizan las redes LAN (cableado estructurado). Todos los usuarios se conectan al gabinete (nodo principal) de piso y los gabinetes se conectan entre si. El nodo principal tendra un patch panel que determina si la red puede ser bus o anillo.

##### Hibrida
Mezcla de cualquiera de las anteriores

# Modelo OSI
Interconexion de  sistemas abiertos. Es una norma ISO.
- Cada capa tiene sus propias funciones
- Funciones similares dentro de una misma capa
- Interaccion minima entre capas a partir de interfaces
- Permite la implementacion parcial
Es basicamente la forma en la que se unificaron las soluciones de los fabricantes de productos/soluciones de red/dispositivos. Existen 7 capas que se comunican las que estan al lado.

### La capa
La entidad de la capa N consume los servicios de la capa inferior y brinda servicios a la capa superior. Cada capa *dialoga* con su capa par en el otro lado de la comunicacion. Cada capa sabe que servicios consumir, como los consume y que servicios expone

![[Pasted image 20250814200250.png]]

Cuando conecto 2 computadoras por ejemplo, el usuario A tiene su pila de protocolos y B lo mismo. A habla con su capa de aplicacion que va consumiendo servicios hasta la fisica que manda datos hacia la otra capa fisica (cables). Luego en B los datos van subiendo capa por capa hasta llegar a aplicacion para que B pueda ver lo que le llego. 

Cada capa tiene un PDU (lo que le llega de la capa que consume sus servicios) y un agregado de informacion que agrega esta capa. Del otro lado, la misma capa pero de la otra computadora debe sacar la informacion extra para procesar los datos que le llegaron y quedarse solo con el PDU. La informacion extra/redundante es necesaria para este proceso. Esta informacion extra se llama **cabezera** y es agregada por el **protocolo de capa**.
La cabezera es necesaria por que cada capa *transforma* la informacion que le llega y su capa par de la otra maquina debe *destransformar* lo que le llega segun el header de su capa.
### Fisica
Es la capa mas baja de todas. Es la forma *fisica* en la que se conectan los dispositivos que se comunican. Puede usar cables como el UTP con rj-45, o fibra optica o inalambrica. Es todo aquello que se dio en comunicaciones. La **interfaz física** entre dispositivos y las **reglas de transmisión de bits** se definen a través de cuatro aspectos clave.

Las propiedades **mecánicas** se refieren a las características físicas, como la forma de los conectores y el número de pines. Las **eléctricas** establecen las reglas de la señal, incluyendo el voltaje para representar los bits y la velocidad de transmisión. Las especificaciones **funcionales** describen lo que hace cada circuito o pin, por ejemplo, cuáles son para transmitir y cuáles para recibir. Finalmente, las reglas **de procedimiento** dictan la secuencia de eventos necesarios para iniciar, llevar a cabo y finalizar una transmisión de datos.

###### Caso UTP
Es un cable de 8 hilos 4 pares. Usa entradas y fichas *rj-45*.

### Enlace
La **capa de enlace de datos** busca crear un enlace seguro y cuenta con mecanismos para activarlo, mantenerlo y desactivarlo. Para ello, agrupa los bits en **tramas** para delimitar el flujo de datos. A través de la **detección y corrección de errores**, asegura que la información llegue correctamente, solicitando retransmisiones si es necesario. El **control de flujo** evita que un emisor rápido sobrecargue a un receptor lento, y se encarga de la **recuperación de datos** perdidos, duplicados o erróneos para garantizar la integridad de la comunicación.

### Red
Permite la interconexion entre dispositivos, es decir, que un dispositivo hable con otros 2 en simultaneo. Esto sirve para hablar con dispositivos fuera de la red local/LAN. Da identificacion a el emisor y al receptor del mensaje. Busca la ubicacion y como llegar al receptor. Sirve para comunicarse con dispositivos fuera de mi red. Aca se empieza a hablar de direcciones IP.
- Encaminamiento -> como llego del emisor al receptor y como vuelvo del mismo.
- Direccionamiento -> determina quien habla con quien.

### Transporte
Permite la comunicacion extremo a extremo. Esto implica que cuando pasa por la red nadie lo *abre* hasta no llegar a su receptor. De red para atras, cada repetidor/cablemodem/nodo que sea intermediario de la red se comunica con su determinado stack de Fisica/Enlace/Red. En esta capa se rehace el control de errores. Es el control de errores extremo a extremo.

##### Sniffer
Muestra/intercepta todos los paquetes que entran y salen por una interfaz de red. Solo intercepta paquetes de la capa fisica


## TCP/IP
Es la arquitectura mas utilizada hoy en dia. Esta compuesta en 4 capas que agrupan otras del modelo osi. Esta la capa interfaz que agrupa a fisica y enlace, internet que es el simil a red, transporte simil a transporte y aplicacion que agrupa presentacion sesion y aplicacion. Similar a OSI, cada una tiene sus header y consumen servicios de capas bajas.
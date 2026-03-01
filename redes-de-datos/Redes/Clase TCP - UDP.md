Son protocolos de capa 4
# TCP
Transmision control protocol. Es de capa de transporte y es la parte confiable. 
### Caracteristicas
- Es punto a punto. Un cliente se conecta a un servidor
- Orientado a la conexion. Primero se establece la conexion previo al intecambio de informacion
- Utiliza segmentos como la pdu contenidos en un unico datagrama IP
- Llega a la confiabilidad con retransmisiones, checksum, ack de cabecera y cuerpo y timeouts.
##### Confirmaciones
Un extremo envia un datagrama y el otro devuelve un ack indicando que llego bien
##### Timeout
Si la confirmacion no llega en determinado tiempo pide retransmision
##### Checksum
Da integridad de la cabecera y del cuerpo.
## El datagrama
![[Pasted image 20251024191352.png]]
#### Puertos origen y destino
Identifican la aplicacion del enviante y receptor respectivamente. Cada aplicacion escucha en cada puerto determinado.
##### Conexion y puertos
Esta hecha entre 2 dispositivos. Compuesta por ip local + puerto local con ip remoto + puerto remoto. Es individual para cada conexion en el cliente. Es decir, si un cliente establece 2 conexiones con un servidor, el cliente dispone 2 puertos para hablar con el servidor mientras que el servidor solo 1. Entonces un puerto TCP puede ser compartido por muchas conexiones. Definiciones:
- **End-point**: Direccion IP  + puerto
- **Conexion**: Par de endpoints cliente y servidor.
Un cliente puede tener varias conexiones con el servidor. Lo que cambia es el puerto del cliente.
#### Numeros de secuencia y confirmacion
- Numero secuencia: Es el numero de secuencia del primer byte que se envia en la transmision hacia el otro lado. Son relativos a la pdu, es decir, si envio del byte 51 a 58, envia el primero de esa secuencia de envio, en este caso, 51. En la proxima, manda 59. En realidad, se suma esto al numero de secuencia
- Numero confirmacion: Es el ack. Lo que devuelve es el numero de secuencia proximo a recibir. En este caso, devuelve 59. Es el proximo numero de secuencia que espera recibir. Indica que se recibió bien la trama anterior. **Solo valido si el flag ACK esta encendido**.

#### Header Length + Flags
- Header length: largo de cabezera + opciones.
- FLAGS
	- ACK = Esta en 1 cuando estoy confirmando realmente que el mensaje llego bien
	- URG = Estoy mandando datos urgentes en mi bloque de datos
	- SYN = Se pone en uno para sincronizar numeros de secuencia.
	- PSH = Esta en 1 cuando NO SOPORTA PIGGYBACKING. Se pide procesar y devoler ack tan pronto como se pueda.
	- FIN = El emisor no envia mas datos
	- RST = Cuando un extremo pierde el estado de la conexion, envia un reset pidiendo que se reinicie la conexion. Es lo que responde un host cuando no esta escuchando en esa conexion.
#### Window, Checksum y puntero a urgente
- Window: cantidad de bytes que el receptor esta dispuesto a recibir en la proxima transmision. Depende de que tan lleno tenga el buffer. Si tengo ACK en `i` y Window en `w` entonces puedo recibir desde `i` hasta `i - 1 + w`
- Checksum
- Puntero urgente: indica cual es el ultimo byte de datos urgentes en mi bloque de datos. Basicamente, si quiero mandar datos de forma urgente que no formen parte de la secuencia como si fuese un canal paralelo donde los mensajes no se secuencian ni se reciben. Se ponen al comienzo del bloque de datos y el puntero apunta al ultimo byte de los datos urgentes. Se usa el Flag URG y el puntero urgente. Luego de finalizar el mensaje urgente, siguen los datos como siempre con secuenciamiento y confirmacion

### Handshake o establecimiento de la conexion
Asi se establece la conexion en TCP. `A` es el cliente y `B` el servidor
![[Pasted image 20251024194329.png]]
1. El cliente envia el segmento SYN. Es el primer segmento en una conexion TCP. Es la peticion de establecimiento de conexion. El flag de SYN esta encendido
2. Si B acepta la conexion responde con un SYN + ACK. Ambos flags SYN y ACK estan encendidos
3. A recibe la conexion y responde con un ACK. Como B ya acepto la conexion, podria enviarse con datos pero no se suele hacer. El flag ACK esta encendido
Estos 3 segmentos suelen estar vacios y suelen llevar las opciones. Entonces suelen medir 20 bytes.
X, que es el valor que toma SEQ. Es el numero de secuencia inicial. Es el 0 relativo (numero aleatorio que no representa realmente ese numero de byte). Y es lo mismo  para el servidor. Basicamente, la idea es que cliente y servidor elijan un 0 relativo y se sumen mutuamente segun se van mandando tramas y se confirman.
###### Tema firewall
Limita el establecimiento de conexiones TCP y se debe configurar.
#### Ciclo de vida de la conexion
![[Pasted image 20251024200016.png]]
1. La aplicacion cliente pide a tcp que cree una conexion y se manda el syn
2. Servidor responde con un syn + ack y cliente responde con un ACK. La conexion queda establecida. 
3. Luego de que finaliza el intercambio de informacion, el cliente tcp envia un FIN
4. Se realiza el cierre del lado del cliente reciviendo un ack del servidor
5. El servidor envia un fin y recive un ack par cerrar definitivamente la conexion
6. Espero el timeout y luego se cierra
##### Del lado del servidor
![[Pasted image 20251024200302.png]]
Apertura pasiva, el servidor tiene una aplicacion que pide que se quede en escucha de secciones TCP en un puerto determinado.
1. Llega un syn y se envia syn + ack
2. se responde con un ack y se establece la conexion 
3. Luego espero a que me llegue un fin, envio un ack
4. Envio un fin y luego recivo ack
5. La conexion quedo finalizada


#### Control de flujo
Pueden existir cliente y servidor con capacidades de recepcion diferentes. Busco que el dispositivo mas poderoso no sobrepase las capacidades del mas limitado. Existen distintos mecanismos
###### Stop and wait
Un extremo envia un mensaje y hasta no recibir la confirmacion no manda mas informacion. Entonces para controlar el flujo retengo la confirmacion para procesar el resto del mensaje. Lo malo de esto es que mientras espero a que llegue la confirmacion *el medio queda en deshuso y no aprovecho su capacidad completamente*
##### Sliding window
Se establece una cantidad de mensajes que se puedan intercambiar entre los 2 lados antes de recibir la confirmacion del primero. A esto se le llama tamaño de ventana. Esto implica que un extremo puede enviar `n` mensajes sin recivir ack y debe esperar a la confirmacion del primero para enviar el mensaje `n + 1`. Una vez llega, lo envio y asi sucesivamente.
Existe un window size optimo que depende del tiempo que tarda en llegar el mensaje cosa de llenar el medio lo mas posible.
##### Sliding windows en tcp - Sistema de otorgamiento de creditos
Indica en octetos el window size, no en secuencias. Hace referencia al tamaño del buffer. Comienza el el tamaño indicado en Acknowledge. Ademas hace un uso dinamico del tamaño de ventana donde en cada seccion se altera el campo window para que se controle el flujo extendiendo o achicando el credito segun pueda.
Como el ack y el window son elementos separados puedo en una seccion confirmar y en otra corregir el credito segun quiera.
La respuesta suele ser generalmente:
- `ack = i`
- `w = j`
Esto indica que se recibio hasta el octeto i-1 de la transmision y ademas que se espera recibir los octetos desde `i` hasta `i + j - 1`

La idea es jugar con el w y con el n para subir y bajarlos segun sea conveniente. Entonces se lleva registro de la ventana de ambos lados:
![[Pasted image 20251024204054.png]]
**Piggy backing**. Sobre los datos que envio mando un ack y window para confirmar y manejar ventana con mensajes anteriores. Aumenta la eficiencia. Con esto el receptor debe esperar a tener datos para envar para recibir (luego de un timeout, confirma de todas formas) y hay entidades que no lo soportan. Cuando esto es asi, la entidad no soportante manda el bit push encendido, indicando que quiere la confirmacion del mensaje ni bien es recibido. Por ejemplo, Telnet.

### Control de errores
TCP se basa en la transmision positiva y retransmite si no hay respuesta. Para detectar errores se mira el checksum. Ahora puede pasar que el segmento se pierda o llega dañado. Si el checksum da mal, se descarta el mensaje directamente. Como el transmisor envia el mensaje pero no recibe el ack lo retransmite. Entonces se practica correccion de errores hacia atras con ARQ. 
1. Luego de enviar el mensaje, corre un timer a la espera de la confirmaicon
2. Si la confirmacion no llega en un tiempo RTO retransmito el segmento y vuelvo al paso 1.
##### RTO
Depende de cada conexion y de cada RTT de la conexion.
En entornos de LAN el RoundTripTime(RTT) es menor a 1ms entonces pongo ese valor como RTO. Fuera de una LAN suele ser ms grande como de hasta 300 ms.
Yo quiero entonces que `RTO = f(RTT)` porque si el RTO es muy grande y se pierde la seccion voy a esperar mucho hasta retransmitir. Si es muy corto, no da tiempo a que llegue el ack

### Control de trafico o congestion
Si tengo abierto un puerto escuchando TCP puede saturarse con muchas conexiones distintas y tengo que manejar el buffer. Entonces se empieza a manifestar la congestion. Lo que hago es censar el estado de la red y reaccionar ante congestiones para reducirlas. Entonces se define la ventana de congestion `cnwd` que indica cuantos mensajes se le pueden mandar. Entonces me manejo con la ventana de congestion permitida que es:
`awnd = min[cnwd, credit]`. Es basicamente el valor de ventana con el que me debo manejar. 
- CNWD es el valor de ventana de la red
- credit es el que me dio el receptor
Uso el mas pequeño para no saturar
Se manejaron distintos mecanismos:
- Slow start: cnwd empieza en 1. Cuando pierdo un segmento vuelve a 1 pero duplico el valor por cada nueva confirmacion que reciba.
- Fast retransmit: Cuando la fuente recibe un ack duplicado puede ser que el segmento llega demorado y va a llegar o que el segmento se perdio. En vez de esperar a que caduque el RTO, si recibo 3 ACK sobre el mismo segmento, puedo suponer que la informacion fluye pero el segmento se perdio y debo retransmitir.
- Fast recovery: Cuando recibe un tercer ack duplicado, setea el cnwd en cnwd/2.
## Opciones 
Van al final de la cabecera de la trama y agregan informacion importante.
### Maximum segment size option
MMS option. Lo que hace es determinar el tamaño maximo en el MTU de IP o capa de interfaz para asignarselo a mi segmento TCP y asi evitar la fragmentacion ( LO MAS COMUN ES QUE NO SE FRAGMENTEN LOS SEGMENTOS TCP SINO QUE SE ENVIEN EN UNA SOLA TRAMA IP). Para calcular este tamaño maximo a usar hago
`mtu de interfaz - 40 bytes`. Estos 40 bytes salen de 20 bytes de cabecera de IP y otros 20 de cabecera TCP. 
![[Pasted image 20251024193852.png]]
 La idea es que cada extremo informa sus capacidades. Entonces si los 2 respetan el tamaño menor, se puede manejar con una comunicacion sin fragmentacion.
 Esta opcion se suele mandar en el SYN.
### Window scale factor
La idea es hacer un control de flujo con sliding windows. La idea es que mientras mas tarde en llegar un mensaje de un fin a otro, mas tamaño de ventana voy a poner, cosa de llenar el medio con mensajes y acks.  Si tengo mucho ancho de banda o mi bw * delay es muy grande tengo mucho espacio para mandar secciones. Entonces puede pasar que 64kb sea poco para mi ventana y necesite mas. Entonces se manda esta opcion para multiplicar el valor de ventana y solucionar este problema.
Para obtener el factor de multiplicacion hago 2^f con `f` siendo el factor de escala
## Puertos
Son donde levantan las aplicaciones. A partir del 1024 son de usuario y se usan para cualquier cosa
![[Pasted image 20251024212348.png]]
La idea es que estos son los puertos donde se escuchan al TCP.
# UDP
Es no confiable pero es agil
## Caracteristicas
- Es no orientado a la conexion
- No es confiable, no tiene confirmacion, no informa descartes, no reordena
- No controla el flujo
Agrega respecto a IP:
- Puerto origen y destino
- Checksum
#### Sirve para
- Procesos simples de peticion respuesta
- Multicast/broadcast
- Streaming de audio y video.
- DNS
- NTP
- SNMP
#### Comunicacion
El destino recibe el datagrama, verifica el puerto destino con los puertos activos. Si no coincide, envia un ICMP destino inalcanzable puerto no levantado. Si el puerto destino coincide y tiene espacio en el buffer lo manda a la cola. Si no hay espacio lo destruye
### Cabecera
![[Pasted image 20251024212738.png]]

#### Pseudo cabecera
Tiene tambien parte de red.
![[Pasted image 20251024213624.png]]
Pero esta en capa 3. Es decir, no se duplica la info, solo se recalcula el checksum sumando ambas cabeceras.
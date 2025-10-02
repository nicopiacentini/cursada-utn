### Cableado estructurado
Es un tipo de LAN donde hay cableado vertical con rj45 y cableado vertical.
## Ethernet
Patente perteneciente a DIX. Luego se adhiere al estándar del Comité IEEE 802.3. 
Opera en un modelo de comunicación "peer-to-peer" porque el control esta distribuido -> todos los miembros de la red LAN son iguales y tienen el mismo nivel de acceso. 

==Utiliza el método de acceso CSMA/CD, que significa "Carrier-Sense Multiple Access / Collision Detection"==. Es un mecanismo de control de acceso al medio y cada estacio ==busca su oportunidad de acceso al medio.==
Cada miembro de la LAN usa multiplexacion por division de tiempo. Generalmente, funciona en modo "half-duplex" (uno habla a la vez y se van alternando).

Se maneja con una conexion punto-multipunto -> una estacion de trabajo puede comunicarse con varias. Cada estacion transmite en banda base y modula en su propia frecuencia. 

![[Pasted image 20250909135526.png]]

#### Capa enlace
Aca se encuentran las capas MAC y LLC. 
- **LLC** -> Logical link control. Permite la conexion multiprotocolo entre dispositivo conectado por cable con dispositivo conectado inalambrico por ejemplo. Basicamente conecta con la capa red y protocolos mac
	 | DSAP (1) | SSAP (1) | Control (1) | Datos... |
		DSAP (Destination Service Access Point) → Identifica el protocolo de capa superior destino.
		SSAP (Source Service Access Point) → Identifica el origen.
		Control → Define el modo de operación (normalmente 0x03 = "Unnumbered Information" para datos).
- **MAC** -> Medium access control. Es la que controla el acceso al medio y puede ser por CSMA/CD, wireless o token ring. Dice quien entra al medio cuando transmite y como. Hace una deteccion de errores.
	- Direccion MAC -> forma de identificar dispositivos
#### Topologia
###### Modo Intercalacion (ahora)
Coaxil mas fino. Sufre de mas atenuacion que con cable grueso. Permite armados mas cortos 
###### Modo Derivacion (antes)
Coaxil grueso. Los equipos de trabajo se conectan/cuelgan de el. Permite armados mas extensos pero sin poder doblar los cables.

Ahora con el avance del utp:
Aparece el UTP con topologia estrella que funciona como bus gracias a un hub.

### Trama 802.3 o Ethernet 2
Al ser ====punto-multipunto====, es decir, el mensaje puede estar dirigido a una sola estacion de trabajo(**unicast**) o a toda estacion de trabajo(**broadcast**). Las tramas se envian a todas las estaciones de trabajo y cada una tiene una lista de **direcciones interesantes**. Dentro de ellas esta el broadcast y su propia direccion entre otras. La idea esta en que recibe todas y procesa aquellas tramas que tienen direccion destino entre esta lista. Si la estacion encuentra el utp libre, envia la siguiente trama (contenedor de bits)
Una trama 802.3 tiene varios campos:
![[Pasted image 20250922165944.png]]

- **Preámbulo:** 7 bytes, con el patrón binario `10101010`. Hace que todas las estaciones se sincronicen. Todo el mundo debe escuchar en manchester `10101010`
    
- **SFD (Start of Frame Delimiter):** 1 byte, con el patrón `10101011`. Indica el fin del preambulo y el comienzo de los datos/trama
    
- **DA (Dirección de destino):** 6 bytes. A quien va dirigido el mensaje. MAC address
    
- **SA (Dirección de origen):** 6 bytes. A quien debe llegarle el mensaje. MAC address
    
- **Longitud/Tipo de trama:** 2 bytes. La longitud de la trama puede ser de 0 a 1500 bytes. Para la 802.3 es la longitud de los datos (entonces como maximo mide 1500) . Para el Ethernet 2 indica el tipo de trama o Ethertype. Ethernet asigna **codigos al tipo de protocolo de red que envie el mensaje** para que el receptor conozca el protocolo. Para darme cuenta de que se trata, como el limite de datos es 1500 bytes, si es mayor a esto se trata de 802.3. Si es menor o igual es 802.11
	- Ejemplo de etherType:
		- 0800 -> `IPv4`
		- 0806 -> `ARP`
		- 86dd -> `IPv6`
    
- **Datos:** 0 a 1500 bytes.
    
- **Pad (Relleno):** 0 a 46 bytes. Sirve para llegar a los minimos 64 bytes para llegar al minimo no colisionable. En ethernet 2 No tengo forma de saber diferenciar entre padding y Datos. Luego una capa superior sabra como separarlo.
    
- **FCS (Frame Check Sequence):** 4 bytes, utilizando CCITT-32 CRC. Sirve para detectar errores en la trama.
    

La longitud mínima de una trama es de 64 bytes, y la máxima es de 1518 bytes (sin incluir el preámbulo ni el SFD). Las direcciones de 48 bits se componen de un OUI (Organizationally Unique Identifier) de 3 bytes y un DUI (Device Unique Identifier) de 3 bytes. Existen direcciones especiales como la de

_broadcast (a todos)_ (`0xffff.ffff.ffff`) y _multicast (a muchos)_ 01:00:5E:00:00:00  hasta  01:00:5E:7F:FF:FF). 
La idea de multicast es que las ET se pongan como direccion interesante a una de las multicast para pertenecer al grupo

#### Diferencia Ethernet 2 vs 802.3 + LLC
**Ethernet II y IEEE 802.3** son variantes de la capa de enlace (subcapa MAC). La diferencia principal está en el campo que sigue a las direcciones MAC: en **Ethernet II** es un **campo Tipo**, que identifica directamente el protocolo de capa 3 (por ejemplo, IPv4 o ARP), mientras que en **IEEE 802.3** es un **campo Longitud**, por lo que se necesita la subcapa **LLC (802.2)** para indicar el protocolo. Esto hace que 802.3 tenga un pequeño overhead adicional y, en algunos casos, use la extensión **SNAP** para volver a soportar identificadores similares al campo Tipo de Ethernet II. En la práctica, **Ethernet II es el formato dominante en Internet** por su simplicidad y eficiencia, mientras que 802.3 quedó relegado a entornos locales o académicos. Ethernet 2 no conoce padding pero 802.3 si.

#### MAC adress
Una laptop tiene 2 interfaces, wireless y fisica. La placa de red y la placa wireless tienen sus propias direcciones MAC de 6 bytes. Es unica y no hay ninguna igual. Los primeros 3 bytes son el OUI(identificador del fabricante) y los ultimos 3 bytes son DUI (Device Unique Identifier). Entonces cada direccion MAC es unica en cada LAN y en el mundo. Tambien se conoce con Physical adress. 
Los bytes del OUI Se transmiten alreves y lo importante de esto hace que si el ultimo es 1 es una direccion grupal y si es un 0 es una direccion individual. 
El bit 7 indica si el MAC adress es original o manipulado

### CSMA/CD
Como el medio es compartido, se escucha esperando a que este listo para transmitir. Despues de todo es un half-duplex con multiplexacion por division de tiempo. Cuando esta libre, y si me piden capas superiores, se transmite la trama y se propaga por la red donde todos lo reciven y escucho lo que transmito para **evitar colisiones**. Como es muy confiable no existe la retransmision.  La longitud maxima es de 2500m. Esta longitud maxima es adrede porque quizas 2 estaciones de trabajo ven que esta libre en momentos parecidos y existe una colision. Para detectar colisiones, las estaciones de trabajo en el momento que empiezan a transmitir, escuchan el medio, si ven que hay diferencia entre el medio y lo que transmito -> hubo colision.

**Características de la transmisión**
La velocidad es cercana a la velocidad de la luz. La distancia esta determinado por el largo del bus y su determinada atenuacion. Por esto es que hay un largo maximo de cable extendible hasta 4 veces con repetidores. Los repetidores introducen un retardo por tener que repetir/regenerar la señal.
Con una velocidad de transmisión de 10 Mbps, una trama mínima de 64 bytes (512 bits para llenar el medio por completo) tiene un "slot" de 51.2 microsegundos. Cuando hago esto, cuando transmito el ultimo bit el primero llego a los 2500 metros. Entoneces este es el minimo para detectar las colisiones. La longitud máxima de la red puede ser de 2500 metros, que es el resultado de la multiplicación de 5 tramos por 500 metros.
Cuando transmito el byte 65, el primer bit llego a la otra punta. Si hasta ese momento NADIE colisiono conmigo, entonces nadie va a colisionar porque todos ya escucharon que transmiti.
- Ventana de colision -> son los primeros 64 bytes colisionables. Si llega el primero a la otra punta, no puede haber colision.
Recuperacion de la colision 
##### Algoritmo exponencial binario
Antes de transmitir escucho un tiempo para ver que no haya nadie. Si el canal esta libre transmito. Si al escuchar hubo colision entra en *jamming* (se sigue transmitiendo para que todas las estaciones detecten la colision) y las estaciones empiezan a contar las colisiones `n`. Luego Existe una variable aleatoria `N = 2^n - 1` que es el tiempo maximo de espera. Toda estacion de trabajo que queria transmitir elige un tiempo t entre 0 y `N` Luego de este tiempo (individual de cada ET) vuelven a intentar transmitir. Todos deben enterarse de la colision. El limite de veces de ejecucion del algoritmo es de 16 veces.

**Dominio de colisión**
Un dominio de colisión es un segmento de red donde las colisiones de datos son posibles. Con un concentrador (HUB), todas las estaciones conectadas forman parte de un único dominio de colisión. Basicamente transforma una topologia estrella en un bus. Un conmutador (switch) de múltiples puertos permite crear dominios de colisión separados. Son 10Mbps para usar entre todos

**Dominio Broadcast**
Si envio en broadcast, todos los que estan en ese dominio reciben el mensaje y deben procesar. Es uno por LAN o VLAN

**Tipos de Ethernet cableado**

- **10Base5:** Utiliza cable coaxial grueso (RG-218) para una transmisión a 10 Mbps en banda base. La longitud máxima del segmento es de 500 metros.
    
- **10Base2:** Emplea cable coaxial fino (RG-58) para una transmisión a 10 Mbps en banda base, con una longitud máxima de segmento de 200 metros (o 185 metros).
    
- **10BaseT:** Usa cable UTP (Unshielded Twisted Pair) para una transmisión a 10 Mbps en banda base, con una longitud máxima de segmento de 100 metros.
    
- **100BaseT:** Utiliza cable UTP para una transmisión a 100 Mbps en banda base, con una longitud máxima de segmento de 100 metros.
    

#### Ethernet vs Ethernet 2
El ethernet 2 lo usan todas las computadoras con todos los SO por ser mas reliable. El ethernet es mas legacy.

**LLC**
Aca existe en DSAP Y el SSAP para indicar que protocolo de red se utiliza.


**Interfaz Full-Duplex**
Una interfaz "full-duplex" utiliza caminos de transmisión y recepción independientes que operan simultáneamente. Por ejemplo, con un utp, cruzo los cables. En una conexión punto a punto con un enlace "full-duplex", no hay contención, por lo que el método CSMA/CD se elimina porque no hay chance de colision. Entonces los 10Mbps a compartir se convierten en 10Mbps de subida y 10Mbps de bajada. ***SOLO APARECE EN CONEXIONES PUNTO A PUNTO***, por ejemplo pc-pc o pc-switch.

#### Bridging o Switching
###### Falta de eficiencia
Ante muchas ET compartiendo el medio, la eficiencia de transmision baja porque TODAS compiten con todas. Entonces puedo partir en 2 poniendo mitad de cada lado y queda lo siguiente:

Corta en 2 **dominios de colision** partiendo al medio la conexion. Actua de manera transparente, todo lo que escucha de un lado lo pasa al otro. Cuando aprende que MAC estan de un lado y que MAC estan del otro, agrega valor no filtrando tramas de trafico local de un lado del puente y solo pasando aquellas que deben ir de un lado del puente al otro como un unicast de un lado a otro o un broadcast. Entonces, ***se mantiene el dominio de broadcast***
- Dominio de broadcast -> a quien le llega la trama que envio.
###### Dominios de colision
El problema con esto es que ahora existen 2 dominios de colision. Ademas, de un lado del puente puede no haber uso del canal pero del otro lado si. Entonces al mandar el mensaje pasa por el bridge y quizas coliciona del otro lado.

##### ET con switch
Introduce la idea de que se puedan comunicar varias ET con CSMA/CD en un dominio de colision y full-duplex en otro dominio de colision con UNA SOLA ET.
Es basicamente un bridge que se comunica con cada estacion de trabajo con full-duplex, con su propio dominio de colision separado. Puede conectarse con otros switches y una logica de conmutacion para saber a quien mandar mensajes. Se maneja con un buffer de entrada de mensajes que se copian en un buffer de salida para distribuir los datos. Si le llega una MAC desconocida, lo manda a todos los puerto.

#### Conclusion
Si conecta 2 buses -> es un bridge con CSMA/CD
Si conecta directamente con ETs -> es un switch con full duplex
**CAM (content addresable memory) size** -> cantidad maxima de macs guardables en el switch.
Ademas, el switch debe saber las MAC por puerto, porque en un puerto quizas se conecto un hub.
El switch debe acoplarse a las velocidades de transmision de cada puerto.
El Switch es de capa 2 por manejar MACs
El hub es de capa 1 porque solo repite señales electricas.

##### Modos de operacion del switch
El proceso de _switching_ puede operar en diferentes modos:

- **Cut-Through:** El _switch_ comienza a reenviar la trama tan pronto como recibe la dirección de destino (los primeros 6 bytes). El problema es que puede sufrir de colisiones despues de los 6 bytes porque quizas dio mal el crc o porque se trabaja con CSMA/CD . Es mas rapido.
    
- **Fragment-Free:** El _switch_ espera los primeros 64 bytes antes de reenviar la trama. Como se cierra la ventana de colicion no hay posibles colisiones.
    
- **Store-and-Forward:** El _switch_ recibe la trama completa antes de reenviarla. Luego revisa el CRC antes de pasar la trama. Es mas lento.
    

### Spanning tree protocol
Opera sobre las redes LAN para resolver un problema. Si se cae el  bridge(unico punto de fallo) se cae la conexion. Ahora si agrego otro bridge soluciono este problema. Pero surge otro problema. 
##### Problema de 2 bridges
Cuando uno de los bridges cruza de un lado al otro una trama, el otro bridge lo recibe y piensa que el emisor esta del otro lado, cosa que rome con su buffer de direcciones de cada lado.

Otro problema es que si sale un *broadcast* de un lado ambos bridges lo reciben y tratan de retransmitir por el otro lado y viceversa. Esto lleva a un **bridging loop** ya que la transimision se repite por los bridges indefinidamente y deja inoperable a la red. Esto mismo puede pasar al hacer una conexion (uplink -> conexion entre switches, tiene su rj45 especial) entre 3 switches, formando un triangulo.

#### El protocolo 802.1d (STP)
El spanning tree protocol resuelve los bridging loop. Lo que hace es descubrir loops y desactivar los bridges redundantes. Busca romper el bucle con un arbol. Entonces lo que hace es elegir un switch raiz y elegir ramas individuales activas y desactivar otras para llegar a todos lados. 
###### Paso a paso
1. Cada 2 segundos cada bridge envia un BPDU por todas sus interfaces a todos lados.
	1. BPDU -> anuncia la existencia de ese bridge/switch en la red. Contiene el BridgeID del bridge que lo manda. Contiene al BridgeID (quien es el switch dueño de esa PDU) y al rootID (quien considera ese switch como su root)
	2. BridgeID -> del bridge que lo esta enviando. Compuesto por su direccion MAC (6 bytes) y su prioridad (2 bytes).
2. Los bridges escuchan BPDUs de los demas. Si escuchan el mismo BPDU de 2 o mas interfaces distintas existe un loop y algun bridge debe desactivar alguna interfaz
3. Todo switch se cree root hasta que llega un switch con bridgeID mas bajo. Cuando esto pasa, debe analizar la cantidad de BPDUs que llegaron de la raiz. 
	1. Si llego mas de un BPDU de esa raiz, el switch debe elegir una sola interfaz por donde llego dicha BPDU para designarla como *interfaz **root***. Las demas interfaces por donde tambien entraba la misma BPDU quedan desactivadas.
	2. Si llego un solo BPDU no hace nada. La unica interfaz queda como *root*
4. En el momento que la raiz deja de funcionar por la razon que fuera, los demas bridges dejan de recibir su BPDU y se reelije el root.


#### Estados de los puertos
Cuando cambia la topologia los bridges deben recalcular el root y escuchar bpdus. Es importante para cuando, por ejemplo, se mete un switch nuevo a la topologia.
- Blocking -> bloqueo el puerto para evitar bucles
- Listening -> Escuchar tramas para armar/reconfigurar el spanning treee
- Learning ->  Entender las tramas para saber si el que envia la trama es bridge o final
- Forwarding -> enviar tramas

## Vlan
Son creadas dentro del mismo switch. Es como un simil a maquina virtual para computadoras pero con un switch, es decir, crear switch aparte dentro de un switch para que terminen habiendo 2. Lo que hace es separar x puertos de un switch para armar una red aparte. Entonces, **entre esos x puertos armo un nuevo dominio de broadcast**. 
 
Para conectar ambas VLAN, (switch con switch virtual) necesito un router(capa 3) porque estoy saliendo de mi red hacia otra, basicamente lo que hacen los protocolos de capa 3.

Cada vez que conecto un switch nuevo existe una vlan por defecto con todos los puertos a su disposicion. 
##### Tipos de VLAN
- Por puerto -> asigno determinados puertos a una VLAN
- Por MAC address -> asigno determinadas direcciones MAC de los dispositivos que quiero que pertenezcan a la VLAN

Si asigno todos los puertos a diferentes VLAN y ocupo todos los puertos necesito comprarme otro switch para crecer. Pero si en este nuevo switch necesito conectar puertos con otros del switch anterior para pertenecer a la misma VLAN  tengo un problema. 
- Una solucion es usar un puerto de cada switch para conectar las 2 partes de la VLAN. Esto tiene un serio problema de escalabilidad porque por cada vlan pierdo 2 puertos.
- Otra solucion es usar el protocolo 802.1Q -> funcionalidad que debe soportar el switch para hacer **VLAN tagging**.
##### VLAN tagging 802.1Q
Defino 1 puerto de cada switch para hacer **trunk** y dejan de pertenecer a su VLAN. Cuando los conecto, a traves de esos puertos aparecen etiquietas (TAG) para extender las VLAN de un switch al otro.  Para realizar esto *se modifica la trama ethernet enviada en dicha VLAN cuando pasa por el trunk para que ambos puertos sepan a que VLAN pertenece*. Luego el puerto de llegada quita esta etiquieta. La nueva trama Ethernet ahora tiene un TAG que contiene:
![[Pasted image 20250822201415.png]]
Esta etiqueta modifica el EtherType y un VLAN-ID para identificar a los VLAN. Esto implica el recalculo del FCS.
*El VLAN tagging tambien puede ser utilizado entre switch-Dispositivo de ser necesario.* Por ejemplo, para que un dispositivo como pc pueda conectarse con varias VLAN.

##### 802.1P Prioridad
Los 3 bits de prioridad sirven para clasificar el trafico. Indican si una trama tiene mas prioridad que otra y por consiguiente debe ser transportada de forma distinta que otra.

##### PoE
Es la capacidad de un switch/dispositivo de alimentarse electricamente por un utp. Por ejemplo, sirve para una camara o un telefono IP para la red LAN.

###### STP
Adaptadores de un medio a otro segun la distancia entre switches.
##### VLAN por MAC address
Necesito conseguir la mac address de los dispositivos que pertenecerian a esta VLAN y solo se pueden mandar mensajes entre esas direcciones MAC. Esto logra la independencia de las VLAN de los puertos. Este no puede sufrir de sniffing. Es mas trabajoso pero mas seguro.



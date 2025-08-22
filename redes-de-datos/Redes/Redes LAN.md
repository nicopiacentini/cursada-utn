### Cableado estructurado
Es un tipo de LAN donde hay cableado vertical con rj45 y cableado vertical.
## Ethernet
Patente perteneciente a DIX. Luego se adhiere al estándar del Comité IEEE 802.3. Opera en un modelo de comunicación "peer-to-peer" porque el control esta distribuido -> todos los miembros de la red LAN son iguales y tienen el mismo nivel de acceso. 
Utiliza el método de acceso CSMA/CD, que significa "Carrier-Sense Multiple Access / Collision Detection". Es un mecanismo de control de acceso al medio y cada estacio busca su oportunidad de acceso al medio. Cada miembro de la LAN usa multiplexacion por division de tiempo. Generalmente, funciona en modo "half-duplex" (uno habla a la vez y se van alternando).
Se maneja con una conexion punto-multipunto -> una estacion de trabajo puede comunicarse con varias. Cada estacion transmite en banda base y modula en su propia frecuencia. En redes LAN se utiliza la *codificacion manchester* que cumple con:
- mantener el sincronismo
- Elimina la componente continua
- Detecta si hay alguien transmitiendo
Hoy en dia utiliza fibra optica monomodo.

En capa enlace existen varios protocolos que operan sobre el mismo medio fisico:
- 802.11
- 802.2
- 802.5
#### Capa enlace
Aca se encuentran las capas MAC y LLC. 
- LLC -> Logical link control. Permite la conexion multiprotocolo entre dispositivo conectado por cable con dispositivo conectado inalambrico
- MAC -> Medium access control
#### Topologia
###### Modo Intercalacion
Coaxil mas fino. Sufre de mas atenuacion que con cable grueso. Permite armados mas cortos
###### Modo Derivacion
Coaxil grueso. Los equipos de trabajo se conectan/cuelgan de el. Permite armados mas extensos pero sin poder doblar los cables.

Ahora con el avance del utp:
Aparece el UTP con topologia estrella que funciona como bus.

### Trama Ethernet 802.3
Al ser punto-multipunto, el mensaje puede estar dirigido a una sola estacion de trabajo(unicast) o a toda estacion de trabajo(broadcast). Las tramas se envian a todas las estaciones de trabajo y cada una tiene una lista de direcciones interesantes. Dentro de ellas esta el broadcast y su propia direccion entre otras. La idea esta en que solo recibe y usa aquellas tramas que tienen direccion destino entre esta lista. Si la estacion encuentra el utp libre, envia la siguiente trama (contenedor de bits)
Una trama 802.3 tiene varios campos:

- **Preámbulo:** 7 bytes, con el patrón binario `10101010`. Hace que todas las estaciones se sincronicen. Todo el mundo debe escuchar en manchester `10101010`
    
- **SFD (Start of Frame Delimiter):** 1 byte, con el patrón `10101011`. Indica el fin del preambulo y el comienzo de los datos/trama
    
- **DA (Dirección de destino):** 6 bytes. A quien va dirigido el mensaje. MAC adress
    
- **SA (Dirección de origen):** 6 bytes. A quien debe llegarle el mensaje. MAC adress
    
- **Longitud/Tipo de trama:** 2 bytes. La longitud de la trama puede ser de 0 a 1500 bytes. Para la 802.11 es la longitud de los datos. Para el 802.3 indica el tipo de trama. Ethernet asigna codigos al tipo de protocolo de red que envie el mensaje para que el receptor conozca el protocolo. Para darme cuenta de que se trata, como el limite de datos es 1500 bytes, si es mayor a esto se trata de 802.3. Si es menor o igual es 802.11
    
- **Datos:** 0 a 1500 bytes.
    
- **Pad (Relleno):** 0 a 46 bytes. Sirve para llegar a los minimos 64 bytes para llegar al standard. En ethernet 2 o 802.3 No tengo forma de saber diferenciar entre padding y Datos. Luego una capa superior sabra como separarlo.
    
- **FCS (Frame Check Sequence):** 4 bytes, utilizando CCITT-32 CRC. Sirve para detectar errores en la trama.
    

La longitud mínima de una trama es de 64 bytes, y la máxima es de 1518 bytes (sin incluir el preámbulo ni el SFD). Las direcciones de 48 bits se componen de un OUI (Organizationally Unique Identifier) de 3 bytes y un DUI (Device Unique Identifier) de 3 bytes. Existen direcciones especiales como la de

_broadcast_ (`0xffff.ffff.ffff`) y _multicast_ (`0x0000.5e00.0000` a `0x0000.5eff.ffff`). 

#### MAC adress
Una laptop tiene 2 interfaces, wireless y fisica. La placa de red y la placa wireless tienen sus propias direcciones MAC de 6 bytes. Es unica y no hay ninguna igual. Los primeros 3 bytes son el OUI(identificador del fabricante) y los ultimos 3 bytes son DUI (Device Unique Identifier). Entonces cada direccion MAC es unica en cada LAN y en el mundo. Tambien se conoce con Physical adress. 
Los bytes del OUI Se transmiten alreves y lo importante de esto hace que si el ultimo es 1 es una direccion grupal y si es un 0 es una direccion individual. El bit 7 indica si el MAC adress es original o manipulado

### CSMA/CD
Como el medio es compartido, se escucha esperando a que este listo para transmitir. Despues de todo es un half-duplex con multiplexacion por division de tiempo. Cuando esta libre, y si me piden capas superiores, se transmite la trama y se propaga por la red donde todos lo reciven. Como es muy confiable no existe la retransmision.  La longitud maxima es de 2500m. Esta longitud maxima es adrede porque quizas 2 estaciones de trabajo ven que esta libre en momentos parecidos y existe una colision. Para detectar colisiones, las estaciones de trabajo en el momento que empiezan a transmitir, escuchan el medio, si ven que hay diferencia entre el medio y lo que transmito -> hubo colision.

**Características de la transmisión**
La velocidad es cercana a la velocidad de la luz. La distancia esta determinado por el largo del bus y su determinada atenuacion. Por esto es que hay un largo maximo de cable extendible hasta 4 veces con repetidores. Los repetidores introducen un retardo por tener que repetir/regenerar la señal.
Con una velocidad de transmisión de 10 Mbps, una trama mínima de 64 bytes (512 bits para llenar el medio por completo) tiene un "slot" de 51.2 microsegundos. Cuando hago esto, cuando transmito el ultimo bit el primero llego a los 2500 metros. Entoneces este es el minimo para detectar las colisiones. La longitud máxima de la red puede ser de 2500 metros, que es el resultado de la multiplicación de 5 tramos por 500 metros.
Cuando transmito el byte 65, el primer bit llego a la otra punta. Si hasta ese momento NADIE colisiono conmigo, entonces nadie va a colisionar.
#### Algoritmo exponencial binario
Antes de transmitir escucho un tiempo para ver que no haya nadie. Si el canal esta libre transmito. Si al escuchar hubo colision hubo *jamming* y se empiezan a contar las colisiones `n`. Luego Existe una variable aleatoria `N = 2^n - 1` que es el tiempo maximo de espera. Todos elijen un tiempo t entre o y `N` Luego de este tiempo (individual de cada ET) vuelven a intentar transmitir. Todos deben enterarse de la colision. El limite de veces de ejecucion del algoritmo es de 16 veces.

**Dominio de colisión**
Un dominio de colisión es un segmento de red donde las colisiones de datos son posibles. Con un concentrador (HUB), todas las estaciones conectadas forman parte de un único dominio de colisión. Basicamente transforma una topologia estrella en un bus. Un conmutador (switch) de múltiples puertos permite crear dominios de colisión separados. Son 10Mbps para usar entre todos

**Dominio Broadcast**
Si envio en broadcast, todos los que estan en ese dominio reciben el mensaje y deben procesar.

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
Una interfaz "full-duplex" utiliza caminos de transmisión y recepción independientes que operan simultáneamente. Por ejemplo, con un utp, cruzo los cables. En una conexión punto a punto con un enlace "full-duplex", no hay contención, por lo que el método CSMA/CD se elimina porque no hay chance de colision. Entonces los 10Mbps a compartir se convierten en 10Mbps de subida y 10Mbps de bajada.

#### Bridging o Switching
Corta 2 dominios de colision partiendo al medio la conexion. Actua de manera transparente, todo lo que escucha de un lado lo pasa al otro. Cuando aprende que MAC estan de un lado y que MAC estan del otro, agrega valor no pasando tramas de trafico local de un lado del puente y solo pasando aquellas que deben ir de un lado del puente al otro como un unicast de un lado a otro o un broadcast. El problema con esto es que ahora existen 2 dominios de colision. Ademas, de un lado del puente puede no haber uso del canal pero del otro lado si. Entonces al mandar el mensaje pasa por el bridge y quizas coliciona del otro lado.
Introduce la idea de que se puedan comunicar varias ET con CSMA/CD en un dominio de colision y full-duplex en otro dominio de colision con UNA SOLA ET.
Es basicamente un bridge que se comunica con todas las estaciones de trabajo con full-duplex, con su propio dominio de colision separado o con CSMA/CD con otro dominio de colision separado. Puede conectarse con otros switches y una logica de conmutacion para saber a quien mandar mensajes. Se maneja con un buffer de entrada de mensajes que se copian en un buffer de salida para distribuir los datos. Si le llega una MAC desconocida, lo manda a todos los puerto.
**CAM (content addresable memory) size** -> cantidad maxima de macs guardables en el switch.
Ademas, el switch debe saber las MAC por puerto, porque en un puerto quizas se conecto un hub.
El switch debe acoplarse a las velocidades de transmision de cada puerto.
El proceso de _switching_ puede operar en diferentes modos:

- **Cut-Through:** El _switch_ comienza a reenviar la trama tan pronto como recibe la dirección de destino (los primeros 6 bytes). El problema es que puede sufrir de colisiones despues de los 6 bytes porque quizas dio mal el crc o porque se trabaja con CSMA/CD . Es mas rapido.
    
- **Fragment-Free:** El _switch_ espera los primeros 64 bytes antes de reenviar la trama. Como se cierra la ventana de colicion no hay posibles colisiones.
    
- **Store-and-Forward:** El _switch_ recibe la trama completa antes de reenviarla. Luego revisa el CRC antes de pasar la trama. Es mas lento.
    

**Bridging Loops y Spanning Tree Protocol (STP)**

Los bucles de

_bridging_ se producen cuando los _bridges_ en una red no tienen conocimiento de la existencia de otros _bridges_. El protocolo 802.1d Spanning Tree (STP) fue creado para solucionar este problema.

- **Función de STP:** Descubre los bucles de red y desactiva los enlaces redundantes. Si un enlace se desconecta, el STA (Spanning Tree Algorithm) se dispara de nuevo para reactivar el enlace que fue desactivado por el STP.
    
- **Proceso de elección:** Todos los _bridges_ (o _switches_) en la red participan en la elección de un _root_. Se envían BPDU (Bridge Protocol Data Units) cada 2 segundos. Cada
    
    _switch_ tiene un Bridge ID de 8 bytes, compuesto por la prioridad del _bridge_ y su dirección MAC. La prioridad más baja designa al
    
    _root_.
    
- **Estados de los puertos:** Los puertos de un _switch_ pueden pasar por los estados de BLOCKING, LISTENING, LEARNING, y FORWARDING. Si el estado de un puerto cambia, se envían notificaciones de cambio de topología (TCN) y se reinicia el cálculo del árbol.
    

**Virtual LANs (VLANs)**

Las VLANs son redes virtuales creadas dentro de un mismo

_switch_ que cuenta con esta funcionalidad. Las VLANs dividen los dominios de

_broadcast_ y aíslan las redes. Para interconectarlas, se necesita un dispositivo de capa 3. El estándar 802.1Q utiliza un

_tag_ de 4 bytes que se inserta en la trama Ethernet original. El

_tag_ 802.1Q contiene el valor Ethertype `0x8100`, un campo de prioridad (PRI) de 3 bits y un VLAN-ID de 12 bits, que permite hasta 4096 VLANs.
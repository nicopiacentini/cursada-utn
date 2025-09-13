Routers -> habla con dispositivos fuera de mi LAN. Es un *dispositivo de capa 3*. Realiza el:
- Direccionamiento -> identifica con quien quiero hablar fuera de la red
- Encaminamiento -> dice como llego con quien quiero hablar en capa 3
![[Pasted image 20250905192842.png]]
En **interfaz de red** hay CUALQUIER COSA no especificado:
- Wireless
- 802.3
- etc
PDU  en capa red -> datagrama ip o PAQUETE IP
#### Filosofia de internet
- Servicio de aplicacion
- Que corre sobre servicio de transporte confiable
- Que corre sobre envio de paquetes *connectionless*
# Protocolos
## Orientado a la conexion
Pasos:
1. Establecimiento de conexion
2. Intercambio de informacion
3. liberacion de la conexion
Por ejemplo -> llamada telefonica

# No orientada a la conexion
Se realiza el intercambio directamente, no hay ni establecimiento ni finalizacion de conexion previa y/o posterior.
Por ejemplo -> 802.3, ip.

## IP
- No confiable ->  La confiabilidad la da la *capa de transporte* con correccion de errores *end to end*. Del otro lado del transporte, se deben repedir/reordenar los paquetes
	- Perdidos -> ip no esta diseñado para resolver este problema. Lo resuelve la capa de Transporte
	- Duplicados  -> tambien lo resuelve transporte 
	- Desordenados -> hay que reordenar, lo detecta y hace transporte
	- Demorados
- Connectionless -> los paquetes se tratan independientemente. No existe estado de los paquetes en los router. Si en una trama ethernet llegan 10 paquetes IP, se procesan todos y cada uno por separado por el router.
- Best-Effort

#### Procedimiento
El paquete ip es envuelto en la trama ethernet y rebota por los switch hasta llegar al router. Este desarma la trama y toma una desicion de conmutacion para ver por que interfaz manda el paquete. Luego el proximo router lee el paquete, toma una desicion de encaminamiento y envia el paquete. Asi hasta el servidor.
Cada trama IP tiene la direccion capa 3 destino y origen. Hasta llegar al router se manejan con capa  2 y direcciones mac. De router en adelante se maneja con direccionamiento IP.

### Datagrama IP o Paquete
Todo en tcp/ip se maneja en palabras de 4 bytes. Cada fila es una palabra distinta.
El minimo son 5 filas entonces 20 bytes el minimo.
![[Pasted image 20250905194659.png]]
Elementos:
- Vers -> version ipv4 o ipv6
- Hlen -> longitud de cabezera, que son las 5 primeras filas de la trama + las opciones. Es variable porque depende de las opciones. El minimo son 5.
- Type of service
- Longitud total -> del datagrama en su total, datos y cabecera. El maximo es 2^16
- Identificacion -> es el valor que le envia el host para identificar univocamente al datagrama en esa conexion origen/destino.
- TTL -> time to leave. Es el tiempo de vida en cantidad de pasadas por router. Por cada pasada se le resta 1. Sirve para evitar que el paquete loopee infinitamente entre routers.
- Protocolo -> indica el protocolo de capa superior (transporte) que invoco el servicio. Sirve para multiplexar protocolos en un flujo, es decir, poder manejar el mismo mensaje segun el protocolo con que llega. Por ejemplo
	- ICMP -> 1
	- TCP -> 6
	- UDP -> 17
- CheckSum del encabezado -> solo checkea errores en cabecera, no en datos. Si hay error se descarta el datagrama.
- Direccion IP fuente
- Direccion IP destino
- Opciones si se necesita y su *relleno* para que en el *Hlen* sea un valor completo.
- ToS
#### ToS(definicion original)
Type of service, solo se usan 4 bits. Clasifica/califica el trafico para que la red (los router) lo traten de la mejor manera posible. Solo se puede elegir uno de estos:
- Minimizar delay
- Maximizar throughput -> velocidad de transmision de datos
- Mazimizar confiabilidad -> que lleguen los paquetes
- Minimizar costo -> que pase por la conmutacion menos costosa.
Ahora estan en desuso porque al pasar de router en router, se dejan de respetar el ToS por la gran cantidad de paquetes que pasan por ahi. Entonces enrutan por preferencia, segun quien ponga que plata

#### MTU
Maximum transfer unit. Cada tecnologia de conmutacion de paquetes (interfaz de capa 2/1) fija un límite máximo para la cantidad de datos que pueden transmitirse en una única trama. Cada protocolo tiene un tamanio limite de trama por diversas cuestiones. Por ejemplo, 802.3 tiene un maximo de 1500 bytes.
##### Problema
En capas inferiores, los tamaños de paquetes son creados sin tener en cuenta el tamaño de la red exterior a ella. Entonces puede pasar que el MTU de la red exterior sea inferior a aquel de red interior. 
##### Fragmentacion y reensamblado
Entonces IP realiza fragmentacion y reensamblado de los paquetes ip para que entren en su red exterior/sea compatible con los protocolos de enlace y su tamaño. El router hace este trabajo. Del otro lado IP rearma los paquetitos en uno solo EN DESTINO.
![[Pasted image 20250905201904.png]]

###### Fragmentacion
Trato de meter la mayor cantidad de datos posibles por trama de capa 2. Se que el header ocupa 20 bytes y meto 600 de datos para completar la trama de capa 2. El valor de *desplazamiento de fragmentado* en el datagrama IP indica que parte de los datos lleva cada fragmento. Pero como no es tan grande como para cubrir el largo maximo, se maneja de a multiplos de 8. Es decir, que el numero que aparezca en el desplazamiento debe multiplicarse por 8 y asi se obtiene donde esta. En el ejemplo, el fragmento 2 llevaria un offset de 75 ya que multiplicado por 8 da los 600 bytes de offset.

Los nuevos paquetes replican de la cabezera original aquello que no cambia, en especial el **identificador, direccion origen y direccion destino**(para identificar al datagrama en su totalidad). Entonces se puede reensamblar con facilidad.
Una vez creados los n datagramas IP, se envian por la red hasta el router destino.

- Flags:
	- Mas fragmentos -> si no es el ultimo fragmento de un paquete total
	- No fragmentar -> impide que se fragmente el paquete. Si llega a un router donde no entra, se descarta y se notifica por ICMP
Por como esta hecho se puede fragmentar un fragmento si se requiere por un menor MTU.
##### Desventajas de fragmentacion
- Duplica la probabilidad de perder datagrama
- Carga mayor de procesamiento en los routers

### Direccionamiento IP(1:09)
HOST -> dispositivo con direccion ip
Es unica en internet. tiene 32 bits de longitud. Son 4 bytes separados por "." con notacion decimal. Cada LAN tiene una y los dispositivos dentro de ella la usan.

Dentro de una red:
- Cada dispositivo tiene identificador de host (unico en la red)
- Todos comparten el identificador de la red
Entonces la direccion de ip de cada dispositivo queda
identificador de red.identificadorred.identificadorred.dispositivo

###### Mascara de subred
Me indica que parte de la direccion de un dispositivo es direccion de red y que parte es dispositivo por ejemplo:
- IP: `192.168.1.10`
    
- Máscara: `255.255.255.0` (o `/24`)
    
- Red: `192.168.1.0`
    
- Hosts válidos: `192.168.1.1 – 192.168.1.254`
Se combina con la direccion ip para identificar dispositivos en una LAN para ip. Sirve para identificar a la red. Entonces sirve para mandar broadcasts. 

#### Clasificacion de direcciones IP
Es clasificar las direcciones segun que tan grande es la red a la que se le asigna
- A -> direcciones de red para redes enormes. 
	- subnetmask -> 255.0.0.0 -> 2^24 hosts por red
	- Son pocas redes
![[Pasted image 20250905205958.png]]
Ahora Muchas direcciones se piden para uso privado, es decir no se usarian en internet. Por eso no se le asignan a nadie y quedan de uso privado como por ejemplo:
- 192.168.0.0
- 10.0.0.0
- 172.16.0.0 a 172.32.0.0
Son bloques libres de usar pero NO SON UNICAS Y SE REPITEN EN MUCHAS REDES. La subnet mask en cada una varia pero sirve para usar en privado.
Por eso es que en lans tengo IP privada 192.168.0.x con subnet mask 255.255.255.0, indicando que soy el host *x* dentro de mi LAN.
- La mascara entonces indica que en mi lan, TODAS LAS DIRECCIONES SON DE LA FORMA 192.168.0.x.
###### Eliminacion de capas
Se deja de utilizar el esquema de clases y ahora existe el esquema classless, con notacion CIDR. La cantidad de 1s en la mascara de subred sale de los limites de 8, 16, etc. Ahora mascara de longitud arbitraria
- 255.248.0.0 -> 11111111.11111000.00000000.00000000
##### Prefijo y longitud de prefijo
ante un prefijo
255.248.0.0 puedo poner longitud como /13
o 255.255.255.0 puedo poner /24


#### Entonces, conexion a internet??
EL router tiene una direccion IP publica, mediante la cual me conecto y comunico con el internet.
#### LinkAggregationControlProtocol
Toma 2 puertos de un switch como si fuesen uno solo. El spanning tree no los deshabilita y entonces aumenta la velocidad de transmision. Realiza el balanceo de carga *indicando que puerto se usa para que transmision/recepcion*.
- Src-mac indica que en el switch se distribuyen los puertos por macs origen
- dst-mac indica que en el switch se distribuyen los puertos por macs destino
arriba src y abajo destination
Mucho destino y poco origen -> dst-mac
Mucho origen y poco destino -> src-mac



Son la parte inalambrica de las LAN
# 802.11
Es el estandar de LAN para wireless
## Access point
Permiten acceder al sistema de distribucion sin cables. Pertenecen al modo Con estructura
![[Pasted image 20250829190849.png]]
BSS es el basic service set y ESS el extendido. 
Provee servicios de integracion -> la comunicacion entre terminales de trabajo es desde y hacia access points. Entonces toda comunicacion pasa por ahi.
##### Ad Hoc
Conecta 2 computadoras con wireless, una hace de access point

#### Comunicacion
Provee servicios de integracion -> la comunicacion entre terminales de trabajo es desde y hacia access points. Entonces toda comunicacion pasa por ahi. Los Access point se publican y los dispositivos se conectan

### Modelo
![[Pasted image 20250829191027.png]]
- 802.2 es parte del LLC
- 802.11 Es el acceso al medio mediante wireless
- FH -> Frequency hopping
- IR -> infraRojo
- DS -> Direct sequence spread spectrum

### Transmision
- Una banda tiene varios Canales
Se utiliza el aire (division de tiempo) para transmitir una señal. Se debe setear una frecuencia de transmision y al ser limitado el espacio RadioElectrico. Las bandas son limitadas y hay que pedir permiso al enacom. 
![[Pasted image 20250829191329.png]]
#### Bandas no licenciadas
Son bandas de uso libre y se interfieren entre si. Es la que suelen usarse en las casas para no tener que pedir permiso al enacom.

###### 2.4GHz
En argentina hay 13 canales en esta banda. El 1, 6 y 11 no se solapan, entonces si necesito cubrir un espacio con muchos dispositivos pongo varios access point operando en esos canales. Entonces puedo tener hasta 3 canales sin solapamiento. Esta tambien se usa en bluetooth.

##### 5GHz
A mayor frecuencia, se atenua mas que la 2.4GHz. Pero tiene muchos mas canales
![[Pasted image 20250829191751.png]]
Estos canales no se solapan. Es mas rapido que 2.4GHz.

### Problema del nodo oculto
Las estaciones no se escuchan entre si pero si escuchan al access point. Como no se escuchan entre si **no saben cuando esta transmitiendo la otra**. Por ende transmiten y terminan interfiriendose entre si.

### CSMA/CA
Es la adaptacion de MAC a Wireless del CSMA/CD que permite evitar colisiones.
Es aleatorio y no hay garantia de que realmente la transmision sea justa/todos puedan usar el medio

#### DCF con RTS/CTS (802.11b -> 11Mbps)
Logica que ejecuta cada estacion de trabajo al intentar conectarse.
![[Pasted image 20250829193044.png]]
 - DIFS -> espacio entre tramas distribuido. Es el tiempo de espera de una trama para evitar colisiones
 - RTS -> ready to send. Recibido por el access point enviado por la estacion del trabajo
 - DATOS -> de la estacion al access point
 - ACK -> confirmacion de recepcion de la trama desde el destino
Variable NAV -> network allocation vector -> es un vector de una estacion de trabajo que cuando la estacion escucha el RTS toma ese valor y pone un timer de tanto tiempo para esperar a transmitir
Si no escucha el RTS pero si el CTS actualizan su timer y NAV para esperar menos tiempo. El que falta hasta que el emisor termine de transmitir.
OJO -> destino puede ser access point o ET y lo mismo con source

#### DCF con RTS/CTS
![[Pasted image 20250829194020.png]]
- Ahora si no hay nadie transmitiendo durante un tiempo empiezo a transmitir yo
- SI el medio esta ocupado sin NAV = 0, espero un tiempo random hasta volver a intentar.
- Sigue estando vigente el intercambio RTS/CTS pero no siempre se usa. Solo a partir de un umbral de que tan larga es la trama.
#### PCF -> periodo libre de contencion
Surge con la idea de servicios isocronos -> transmision de videos o audios.
Una estacion para conectarse tiene que informar
![[Pasted image 20250829194450.png]]
- Surge con un aumento en el ancho de banda
- Ahora el access point **toma el control y organiza el acceso al medio**. Ya no hay mas aleatoriedad. -> antes el primero que llegaba transmite, ahora el access point me indica que transmita
- El access point toma el control de la celda de tiempo e indica quien transmite en ella.
- Se intercala (como se ve en la imagen de abajo) entre control puntual (pcf) y control distribuido (dcf). Esto es para que el que no sabe pcf pueda transmitir igual y viceversa.
- BEACON -> son transmitidas 10 veces por segundo por el AP. Cumple funciones administrativas. Una de ellas es señalizar el intervalo libre de contencion (pcf).
- D1 -> trama a transmitir
- POLL -> el ap pregunta a estacion si tiene para transmitir.
- D1 + POLL -> es el AP transmitiendo una trama y pregunta a otro si tiene para transmitir
- U1 + ACK -> respuesta de la ET de recepcion mas trama.
- CF - End -> Fin de PCF, empieza DCF
- No se produce nunca un silencio de tamanio DIFS (para el DCF). Lo minimo es un SIFS.

### Trama 802.11
Es un protocolo de capa 2 e incluye funciones/servicios de capa 2
![[Pasted image 20250829195901.png]]
- Duration -> tiempo necesario para transmitir
#### Frame Control
Las tramas pueden ser:
- Management(administrativas, DATOS NO) -> Peticion confirmacion asociacion (un dispositivo se vincula a la red), autenticacion del dispositivo, beacon.
- Control -> RTS, CTS, ACK
- Datos
Los campos:
- ToDS -> indica si va hacia el sistema de distribucion(1) o si viene del sistema de distribucion (0)
![[Pasted image 20250829200539.png]]

BSSID -> direccion MAC del access point
SA -> source adress
DA -> Destination address para ET
RA -> reciever address, para AP 
TA -> transmiter address para el ap
- RT -> es una retransmision
- MF -> hay mas fragmentos
- PowerMGT -> Hay terminales inalambricos con energia limitada. Entonces hace Dozing (apagar periodicamente la antena para ahorar energia). Este bit le informa al AP que se apaga la ET y debe guardar las tramas. Al despertar la estacion envia un PSPoll indicando que le envie todas las tramas guardadas. 
- More data -> El access point le pide a la estacion que no se duerma porque tiene mas tramas para entregarle.
- WEP -> Privacidad equivaliente en cableado. Fue la primer encripcion en wireless.
### Diferencias con ETHERNET
- Fragmentacion y reensamblado -> Como el BER es mucho mas alto por ser wireless conviene partir la trama en pedazos de tamaño determinado y pierdo eficiencia. En cada fragmento tengo un header de MAC HDR, luego el body y por ultimo un CRC. En ethernet la trama se envia por completo.
	- La cantidad de pedazos en los que se parte depende del estado de la capa fisica.

### Wireless LAN
Para incorporar un terminal wireless a un AP se hace esto:
- Sincronizacion: por medio de los beacon frames que envia los AP, los escuchan los terminales.
	- Los beacon se mandan en cualquier canal y por eso la ET escucha un poco en cada uno
- Autenticacion: intercambia info clave entre AP y terminal
- Asociacion: El AP conoce al terminal y viceversa, sus capacidades, MAC, etc.
Protocolos LAN
Del N en adelante se implementa MIMO (hasta 4 antenas por terminal y access point). Entonces las velocidades de transmision llegan a un tope y no son precisas.

## Trafico
Ethernet en Wireless -> Algunas capturas de paquetes muestran el trafico como ethernet cuando no lo es. Esto es porque el sistema operativo asi lo muestra por la interpretacion que le da.

-  TIM
Traffic information matrix. Informa a las ET asociadas si tiene guardadas tramas para el AP. Estos TIM se envian dentro de los beacon
- SSID
Se encuentra dentro del TIM es el nombre del AP

- Velocidades soportadas -> se dan en condiciones optimas(estan en el beacon/version del 802.11). Son escalonadas! Al depender de la modulacion, transmito a la velocidad maxima posible y si el enlace se debilita, cambio la modulacion por una mas robusta pero mas lenta. Ergo las velocidades de transmision discretas.
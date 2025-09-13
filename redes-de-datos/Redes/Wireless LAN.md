Son la parte inalambrica de las LAN
# 802.11
Es el estandar de LAN para wireless
## Access point
Permiten acceder al sistema de distribucion sin cables. Pertenecen al modo Con estructura
![[Pasted image 20250829190849.png]]
BSS es el basic service set con un solo AP y ESS el extendido, con mas de un AP. 
Provee servicios de integracion -> la comunicacion entre terminales de trabajo es desde y hacia access points. Entonces toda comunicacion pasa por ahi.
##### Ad Hoc
Conecta 2 computadoras con wireless, una hace de access point

#### Comunicacion
Provee servicios de integracion -> la comunicacion entre terminales de trabajo es desde y hacia access points. Entonces toda comunicacion pasa por ahi. Los Access point se publican y los dispositivos se conectan

### Modelo
![[Pasted image 20250829191027.png]]
- 802.2 es parte del LLC NECESARIA como 802.3
	- LLC es una capa de integracion con la capa 3. Sirve para que la capa de red se comunique con la capa de enlace mas facilmente. Ethernet no la necesita porque ya tiene un campo con *ethertype* que indica el protocolo de capa 3 utilizado. En cambio 802.3 y 802.11 si lo necesitan porque no tienen dicho campo.
- 802.11 Es el acceso al medio mediante wireless
- FH -> Frequency hopping
- IR -> infraRojo
- DS -> Direct sequence spread spectrum

### Transmision
- Una banda tiene varios Canales
Se utiliza el aire (division de tiempo) para transmitir una señal. Se debe setear una frecuencia de transmision y al ser limitado el espacio Radioelectrico. Las bandas son limitadas y hay que pedir permiso al enacom. 
![[Pasted image 20250829191329.png]]
#### Bandas no licenciadas
Son bandas de uso libre y se interfieren entre si. Es la que suelen usarse en las casas para no tener que pedir permiso al enacom.

###### 2.4GHz
En argentina hay 13 canales en esta banda. El 1, 6 y 11 no se solapan, entonces si necesito cubrir un espacio con muchos dispositivos pongo varios access point operando en esos canales. Entonces puedo tener hasta 3 canales sin solapamiento. Esta tambien se usa en bluetooth. Los canales suelen tener un ancho de 20Mhz. La cantidad de canales depende del pais.

##### 5GHz
A mayor frecuencia, se atenua mas que la 2.4GHz. Pero tiene muchos mas canales
![[Pasted image 20250829191751.png]]
Estos canales no se solapan. Es mas rapido que 2.4GHz. Pero tienen mas atenuacion
- Existen canales de 20MHz que no se solapan y pueden agruparse en canales mas grandes de 40MHz, 80MHz o hasta 160MHz

### Problema del nodo oculto
Las estaciones no se escuchan entre si pero si escuchan al access point. Como en ocaciones no se escuchan entre si **no saben cuando esta transmitiendo la otra**. Por ende transmiten y terminan interfiriendose entre si. Esto ocurre cuando hay algo entre ambas ET. 

### CSMA/CA
Es la adaptacion de MAC a Wireless del CSMA/CD que permite evitar colisiones.
Es **de acceso aleatorio** y no hay garantia de que realmente la transmision sea justa/todos puedan usar el medio

#### DCF(funcion de control distribuido) con RTS/CTS (802.11b -> 11Mbps)
Logica que ejecuta cada estacion de trabajo al intentar conectarse. A pesar de haber un AP
![[Pasted image 20250829193044.png]]
 - DIFS -> espacio entre tramas distribuido. Es el tiempo de espera de una trama para evitar colisiones
 - RTS -> ready to send. Recibido por el access point enviado por la estacion del trabajo
 - DATOS -> de la estacion al access point
 - ACK -> confirmacion de recepcion de la trama desde el destino
Variable NAV -> network allocation vector -> es un vector de una estacion de trabajo que pone un timer de tanto tiempo para esperar a transmitir al recibir un CTS o un RTS

###### Observacion canales
El CSMA/CA se hace por canal y ambos RTS y CTS se envian por un solo canal. Entonces la ET que este en otro canal NO lo escucha y no participa de ese juego.

##### Procedimiento
Cuando una ET quiere transmitir espera un DIFS(tiempo minimo para que no haya nadie mandando), luego envia el *RTS*. Algunas ET lo escuchan y ponen su NAV en RTS para esperar el tiempo que se indico. Otras ET no lo escucharon. Sin embargo, como el AP si recibió el RTS, le devuelve a la ET que mando el RTS un *CTS* para que empieze a transmitir. Como TODAS las ET escuchan al CTS, saben que deben poner su NAV en CTS para esperar el tiempo indicado. Finalizada la transmision, se envia un ACK indicando que la trama llego bien. Esto NO esta en 802.3.
#### DCF sin RTS/CTS
![[Pasted image 20250829194020.png]]
##### Procedimiento
Espero a que el NAV este en 0 y luego veo si el medio esta libre. Si lo esta empiezo a transmitir, sino vuelvo a poner tiempo en el NAV. Al finalizar la transmision, me debe llegar el *ACK* del receptor/AP. Si no llega, hubo colision y debo volver a llenar el NAV.
- Sigue estando vigente el intercambio RTS/CTS pero no siempre se usa. Solo a partir de un umbral de que tan larga es la trama.
##### Velocidad de transmicion en DCF con y sin RTS/CTS
Al tener que esperar un tiempo antes de transmitir por un RTS/CTS o por medio ocupado, la velocidad de transmision real se ve afectada mas alla de lo que indique la version del protocolo.

### PCF -> periodo libre de contencion
Este no es de acceso aleatorio, es mas justo con como se transmiten las trama.
Surge con la idea de servicios isocronos -> transmision de videos o audios.
Una estacion para conectarse tiene que informar
![[Pasted image 20250829194450.png]]Surge con un aumento en el ancho de banda. Ademas, el access point **toma el control y organiza el acceso al medio**. Ya no hay mas aleatoriedad. -> antes el primero que llegaba transmite, ahora el access point me indica que transmite cuando.
##### Procedimiento
El access point toma el control de la celda y establece un intervalo de repeticion donde se inicia con beacon + PCF(control centralizado) y luego se pasa a DCF(control distribuido) y se repite eternamente. Ademas, el AP sabe quien esta en la red porque cada AP que pertenece a la misma **debio haberse asociado** para poder participar.
Primeramente el AP indica el comienzo de PCF enviando el BEACON a todas las ET que esten en su red y lo esten escuchando. A partir de ahi todas las ET llenan su NAV porque no pueden transmitir ya que el control lo tiene el AP. Entonces el AP empieza y envia datos _D1_ a quien se lo deba mandar y le hace un *poll*, es decir, le pregunta si tiene algo para mandar. En caso de que si lo tenga, el AP cede el espacio para que la ET elegida transmita su informacion al AP con su ACK de que llegaron los datos iniciales D1. Luego el AP repite el procedimiento anterior con otra ET, enviando los datos, preguntando si tiene algo que enviar y en el mismo frame de tiempo le da ACK a la primer estacion indicando que recibio lo que envio. 
En caso de que la ET a la que le deben llegar los datos no tiene nada para enviar y responde que no al *poll*, no envia tampoco el ACK.
Para finalizar el AP envia a todas las estaciones un *CF-End* indicando el comienzo del DCF para que aquellas estaciones que no entiendan PCF puedan transmitir.
Durante el PCF, el espacio temporal entre trama y trama es MENOR a un DIFS y se lo conoce como SIFS o PIFS. Esto es para que evitar que los que estan en DCF se metan en el medio a transmitir pensando que no hay nadie
- SIFS -> espacio entre trama de AP y de ET
- PIFS -> espacio entre tramas del AP
- BEACON -> son transmitidas 10 veces por segundo por el AP. Cumple funciones administrativas. Una de ellas es señalizar el intervalo libre de contencion (pcf).

### Trama 802.11
Es un protocolo de capa 2 e incluye funciones/servicios de capa 2
![[Pasted image 20250829195901.png]]
- Duration -> tiempo necesario para transmitir
- Frame body -> datos
- Address 1
#### Frame Control
Las tramas pueden ser:
- Management(administrativas, DATOS NO) -> Peticion/confirmacion asociacion (un dispositivo se vincula a la red), autenticacion del dispositivo, beacon. Son transmitidas por el AP
- Control -> RTS, CTS, ACK
- Datos
##### Los campos son:
- Retry -> es una retransmision ya que el intento anterior no llego el ACK
- More Frag -> hay mas fragmentos que vienen con dicha trama
- PowerMGT -> Hay terminales inalambricos con energia limitada. Entonces hace Dozing (apagar periodicamente la antena para ahorar energia). Este bit le informa al AP que se apaga la ET y debe guardar las tramas. Al despertar la estacion envia un PSPoll indicando que le envie todas las tramas guardadas. 
- More data -> El access point le pide a la estacion que no se duerma porque tiene mas tramas para entregarle.
- WEP -> Privacidad equivaliente en cableado. Fue la primer encripcion en wireless.
- ToDS -> indica si va hacia el sistema de distribucion(lan cableada o switch o router)(1) 
- FromDS ->Indica si la trama viene del sistema de distribucion
Estos ultimos 2 le dan significado a las 4 direcciones MAC

![[Pasted image 20250829200539.png]]
Los Casos son los siguientes
1. 0|0 -> indica que la comunicacion no pasa por el sistema de distribucion y es una comunicacion *a traves del AP* entre ET que lo conocen.
2. 0|1 -> una ET que esta en el sistema de distribucion envia algo a una ET que esta conectada con el AP
3. 1|0 -> una ET que esta en conexion con el AP envia algo a otra que esta en el sistema de distribucion.
4. 1|1 -> Sirve para que una ET conectada con un AP1 se pueda comunicar con otra ET conectada a un AP2 con ambos AP conectados en el mismo sistema de distribucion.

BSSID -> MAC del AP
SA -> MAC origen de la ET
DA -> MAC destino de la ET
RA -> reciever address, direccion MAC del AP que recive datos del primer AP para el caso 4
TA -> transmiter address, direccion MAC del AP que envia datos al segundo AP para el caso 4
### Diferencias con ETHERNET
#### Fragmentacion y reensamblado 
Como el BER es mucho mas alto por ser wireless conviene partir la trama en pedazos de tamaño mas pequeño sacrificando eficiencia. Esto sin embargo, depende de que tan ocupada este la capa fisica. En cada fragmento tengo un header de MAC HDR, luego el body y por ultimo un CRC. En ethernet la trama se envia por completo.
- La cantidad de pedazos en los que se parte depende del estado de la capa fisica.

### Wireless LAN
Para incorporar un terminal wireless a un AP se hace esto:
- Sincronizacion: por medio de los beacon frames que envia los AP, los escuchan los terminales.
	- Los beacon se mandan en cualquier canal y por eso la ET escucha un poco en cada uno
- Autenticacion: intercambia info clave entre AP y terminal
- Asociacion: El AP conoce al terminal y viceversa, sus capacidades, MAC, etc.
#### Protocolos LAN Wireless, comparacion
De la version N en adelante se implementa MIMO (hasta 4 antenas por terminal y access point). Entonces las velocidades de transmision llegan a un tope y no son precisas.

## Trafico
Ethernet en Wireless -> Algunas capturas de paquetes muestran el trafico wireless como ethernet cuando no lo es. Esto es porque el sistema operativo asi lo muestra por la interpretacion que le da el driver.

##### Beacon parte administrativa
El beacon contiene estos campos como informacion
-  TIM
Traffic information matrix. Informa a las ET asociadas si tiene guardadas tramas para el AP. Estos TIM se envian dentro de los beacon
- SSID
Se encuentra dentro del TIM es el nombre del AP
- Velocidades soportadas -> se dan en condiciones optimas(estan en el beacon/version del 802.11). Son escalonadas! Al depender de la modulacion, transmito a la velocidad maxima posible y si el enlace se debilita, cambio la modulacion por una mas robusta pero mas lenta. Ergo las velocidades de transmision discretas.





# Notas TL2

LACP protocolo para agrupar cables y tratarlos como uno solo
Para hacerlo hay que meterlos en un channel-group
para un switch balanceo source si tiene muchos origenes y dst si tiene muchos destinos

REDES wlan -> routers

WRT300 (AP) -> puede ir en modo bridge o en modo router
- Bridge -> trabaja en capa 2 -> conecta dispositivos de la misma RED o LAN. Se usan los puertos en amarillo
	Es como un switch pero inalambrico
- router -> trabaja en capa 3 -> conecta entre si 2 redes LAN. Usa el puerto azul

Direccion de gateway -> puerta de salida hacia otra red. Es la direccion IP del router para salir.
Es la que hay que setearle a un dispositivo que quiera salir de la red para indicarle por donde salir. Es la que tiene el router dentro de esa lan.

tracert -> protocolo de capa 3 para ver saltos para llegar hasta otra red. MUESTRA ROUTERS DE CAPA 3 QUE MUEVEN MI PAQUETE.

IP del router -> sirve de fabrica para primer coneccion

SSID broadcast -> sirve para que exponga beacons a todos lados y todos conozcan el ssid
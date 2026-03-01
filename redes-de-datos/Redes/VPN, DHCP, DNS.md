# VPN
Lo que hace es crear un tunel donde los router que pasan por el medio conmutan el mensaje con normalidad pero gracias al protocolo IPSec aparenta que no pasa por ahi. Es como que los esconde. No confundir, los mensajes pasan por la red publica utilizandola como si fuese una red privada.
## IPSec
Son protocolos para darle seguridad al envio de mensajes. Surge como solucion a la seguridad requerida en IPv6. Tiene modos y protocolos de operacion
### Protocolos
Los protocolos de IPSec son:
#### AH protocol
Authentication header protocol. Me asegura autenticacion (que los datos que me llegan de alguien de internet realmente vengan de ese alguien) e integridad (que los datos no se vean modificados).
#### ESP protocol
Es un protocolo que agrega confidencialidad en la comunicacion mediante encriptacion.
### Modos de operacion
Los modos de operacion son:
#### Modo transporte
Tengo una red publica y 2 usuarios conectados. El IPSec permite encriptar los datos desde la capa de transporte en adelante. Esto permite asegurar una comunicacion TCP entre 2 dispositivos exclusivamente. Solo se encripta el transporte, las direcciones IP se siguen viendo. Solo sirve para UNA CONEXION TCP
#### Modo Tunel
Tengo una red publica, router y red LAN. Cada LAN tiene su propia direccion privada. La idea es que cuando un dispositivo le envia una pdu completa a su router para salir de la red y poder comunicarse con el otro fin, el router lo encripta y lo envuelve en otra cabecera IP. Entonces se estas encriptando todo el trafico entre las redes que quiero comunicar

### Formas de operacion de IPSec
#### Fase 1: IKE
Internet key exchange. Un gateway **contacta** al otro **informando** **quien es**, cual es el gateway **remoto con direccion ip** y cuales **parametros de encripcion se van a utilizar**. Entonces debo indicar
- Autenticacion: como se van a autenticar los gateway. Como indican quienes son. Se indica la contraseña a utilizar. Esta puede ser:
	- Pre-share: la sabemos y acordamos ambos desde antes
	- Con certificados
- Hash: Que metodo uso para chequear la integridad de los mensajes.
- Encripcion: Como voy a esconder los datos.
Luego Debo indicar la direccion del gateway con la que me voy a estar comunicando
Corre en UDP puerto 500.
Entonces se establecio una security asociation.
#### Fase 2: IPSec policy
Dominio de encripcion. Defino que va en el el tunel, que envio y que me llega. Lo que se hace es crear un **transform-set** con la misma informacion de encripcion y hash usada en la fase anterior. Luego se crea un **crypto-map** donde se define que transform-set se utiliza, que peer o router esta del otro lado y la access-list que debe ir por ese lado.

El tunel se establece cuando aparece trafico interesante. Es decir, hasta que no aparezca un trafico entre ambas redes no se arma el tunel. Luego este tunel tiene un tiempo de vida que tira el tunel despues de un determinado tiempo.

## Access-list
Es un descriptor de trafico de manera que creo entradas ACE que indican que trafico puede pasar o no puede pasar por ahi. Para hacerlo aclara que ip puede entrar por ahi y que ip sale por ahi.

# DHCP
Asignar direcciones IP manualmente no es muy conveniente debido a que pueden existir colisiones y es complicado llevar registro de quien tiene que IP. Ademas se complica si el host se mueve porque debe cambiar de IP segun donde se encuentre. Entonces DHCP:
- Centraliza y administra la asignacion de direcciones
- Mantiene un registro de la IP asignada a cada cliente
Asigna las direcciones IP de forma dinamica (cada dispositivo puede tener una IP distinta segun en que red este) Cada host requiere:
- IP unica
- Mascara de subred
- Default gateway
- Servidor DNS
#### Ventajas de la asignacion dinamica
- Elimina la necesidad de llevar cuenta de registro de asignaciones de IPs de forma manual (lo hace el servidor DHCP)
- Es facil modificar el espacio de direcciones de una red (se hace desde el servidor)
- Puedo tener mas hosts que direcciones IP (si cada host no esta levantado constantemente puede compartir su IP con otros hosts segun quien este conectado)
- Elimina existencia de errores de configuracion
- Permite distribuir parametros de configuracion mas facil
	- Subnet mask
	- Router option
	- DNS
	- Static route option
## Forma de trabajo
![[Pasted image 20251106194952.png]]
### Paso a paso
Una PC corre el cliente y el servidor corre el servidor. Asi, el cliente puede pedir que se le asigne una direccion IP para la red.
#### DHCPDiscover
Envia un mensaje a la red solicitando una direccion IP. Empieza con un TCP/IP limitado con ip origen 0.0.0.0 y destino 255.255.255.255. Este mensaje es un broadcast y contiene:
- Direccion fisica del cliente
- Nombre del host cliente
Se realiza cuando:
- Se enciende por primera vez el DHCP client
- El DHCP server rechaza el pedido de una direccion especifica
- El cliente con IP Asignada la libera para obtener otra
#### DHCPOffer 
Todos los DHCP Servers que reciben el request responden con una oferta con la siguiente información:

- Dirección de hardware del cliente (necesario porque asi el cliente puede discernir si le corresponde ese mensaje o no porque todos los clientes que mandaron el discover siguen con direccion 0.0.0.0)
- Dirección IP destino 0.0.0.0  
- Una dirección IP ofrecida  
- La máscara de subred  
- Duración de la asignación (Lease) -> El servidor presta la IP durante una duracion de tiempo. Es una configuracion del servidor. Esto es asi porque cuando el dispositivo cliente quiere dejar de usar la IP no hace falta que lo informe y el servidor sigue pensando que esa direccion esta en uso y no puede ser reasignada. 
- Una identificación del servidor (dirección IP)  

El DHCP Server reserva la dirección IP ofrecida. El cliente DHCP selecciona la dirección IP de la primer oferta recibida.
#### DHCP request
El cliente informa con un broadcast que acepto una determinada IP. Indica la direccion IP del servidor del cual acepto la oferta. Los demas servidores recuperan la direccion ofrecida para poder volver a ofrecerla.
#### DHCPACK
El DHCP Server cuya oferta fue aceptada envía una confirmación positiva al cliente (**DHCPACK**).
Este mensaje contiene la dirección IP asignada y otros valores de configuración.
Cuando el cliente recibe la confirmación, TCP/IP está completamente inicializado y puede comunicarse en la red.
#### DHCPNACK
Puede suceder que el cliente reciba una confirmación negativa (**NACK**). Esto ocurre cuando:
- La direccion IP asignada queda invalida porque se fue de la red la persona
- Se ejecuta un intento de renovacion de IP
### Intento de renovacion
Se intenta luego de pasado el 50% del tiempo de la lease asignada. Se manda un DHCP request confirmando al servidor que continua con la direccion IP asignada. Puede pasar que
- El servidor mande un DHCP ACK y me extienda el lease
- Que el servidor no responde. El cliente sigue trabajando y cuando pasa la mitad del tiempo restante vuelve a DHCP request. Si sigue sin haber respuesta cuando transcurre el 87.5% gdel tiempo se vuelve a inetntar y si no hay respuesta el cliente reinica el procedimiento buscando un nuevo DHCP server.
#### Consideraciones de diseño
- Si tengo 2 servidores DHCP tienen un pool de direcciones para asignar distintos
- El pool de direcciones que reparte el DHCP Server excluye un rango IP reservado para asignación estática  
  (routers, impresoras, default gateway, etc.)
- Es necesario configurar los routers para permitir el paso de DHCP Requests (broadcast)
- DDNS
# DNS
Originalmente existia en cada maquina un archivo conocido como `Hosts` que linkeaba una direccion IP con un **dominio**. Este archivo estaba hosteado por *stanford*. 
## Sistema de nombres de dominio
Es un sistema compuesto por:
- Resolver -> pide direccion ip asociada a nombre
- Name server -> entrega direccion ip asociada a nombre
El archivo de hosts sigue vigente y *tiene prioridad sobre el name server*.
El name server puede ser de un ISP o de google.
### Espacio de nombres
Tiene distintos niveles:
1. root, que es un punto `.`
2. Top level domain. Puede ser `.org` `.ar` `.com`
3. Second level domain. Son hosts o sub-dominios
4. Host name
Esto sigue hasta el nivel requerido. El dominio se lee de derecha a izquierda para indicar los niveles. Puede que el top level se use mas de una vez. El nivel mas bajo de todos es el nombre de host, al cual le corresponde la direccion ip. Esto esta hecho asi ya que cada Name server tiene acceso a distintos nombres y niveles. Si no tiene un nombre, busca el mejor match segun los niveles mas altos y redirecciona al usuario a otro servidor que si lo tenga.
`FQD` => es el host con todos sus dominios hasta el root

#### Zonas de autoridad
Los root server tienen referencia los servidores que implementan top level domains para asi referenciarse y poder dirigir el trafico. Un servidor no tiene todos los dominios existentes, conoce algunos y conoce quien podría conocer un determinado dominio.
##### Archivo de zona
Tiene entradas llamadas *resource record* que linkean un nombre con una IP donde esta hosteado. Este servicio suele ser hosteado por un ISP u otros.
#### Resource record
Existen 2 tipos
- Tipo A -> asocian un nombre de dominio con una direccion IP
- Tipo MX -> tienen nombres asociados con una direccion de mail.
- CNAME -> un alias, para que un nombre se resuelva con otro
##### Servidores
- **Primary Name Server**  -> contiene el archivo de zona
  - Los archivos de información de la zona se almacenan localmente.
- **Secondary Name Server**  -> replica informacion de otro servidor
  - Obtiene la información de zona del Master Name Server.
- **Master Name Server**  
  - Fuente de información para un Secondary Server.  
  - Pueden ser Primary o Secondary Servers.
- **Caching Only**  -> no hostean nada, pueden ser los del ISP. 
  - No almacena información de zona.
### Resolucion de nombre
![[Pasted image 20251106221041.png]]

- **Consulta Recursiva**  
  El servidor de nombres consultado está obligado a responder con los datos o con un error.

- **Consulta Iterativa**  
  El servidor consultado responde con su mejor respuesta.  
  Puede ser el nombre resuelto o una referencia a otro servidor de nombres que pueda ser capaz de responder la consulta.

- **Consulta Inversa**  
  El Resolver solicita el nombre de host asociado a una IP dada.

##### Cuestiones
La respuesta de estos servidores tiene un TTL para no repreguntar las cosas y cachear.
DNS corre en el puerto 53 con tcp o udp
Para registrar un dominio es en `nic.ar


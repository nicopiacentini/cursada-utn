#### Contexto
La IANA entrega en 2011 el ultimo bloque de direcciones en IPv4. Ante la escacez se empieza a trabajar en una evolucion que son de 128 bits, cosa que nos da 2^128 . Direcciones
___
#### Obtencion de direcciones
La IANA asigna bloques de:
- /12 a los RIRs (son los que dan direcciones en los continentes)
- /32 para LIRs (ISP)
	- /128 a un dispositivo
	- /64 a una sola red
	- /48 a usuarios finales -> da posibilidad de realizar subredes al usuario
Ahora cada dispositivo *puede tener una direccion IP variable*.
## Cabecera
Se eliminan campos que no son estrictamente necesarios porque las direcciones son muy grandes
![[Pasted image 20251031192226.png]]
- Version -> Nos dice la version del protocolo (ipv4 o ipv6)
- Traffic class -> evolucion del type of service. Son 8 bits, 6 para prioridad y 2 bits para ECN (Permite que cuando un router alcanza un umbral de transmision, marca los segmentos con el bit de congestion avisando al receptor que esta experimentando congestion. De esta forma, el receptor achica su ventana y el emisor original se entera y reduce la velocidad de transmision tambien)
- Flow label -> Para hacer mas eficiente la comunicacion, se trata de interpretar es si un datagrama ip conforma un flujo con otras datagramas. Entonces si yo tengo un flujo de paquetes de origen y destino, no necesito por cada uno pensar a donde enviarlo o reconmutar, sino que puedo mandar todos los paquetes por elmismo lado. Entonces la etiqueta de flujo permite correlacionar multiples paquetes.
- Longitud de datos -> son 16 bits, es decir 65325 bytes como maximo
- Hop limit -> Es el TTL con un nombre mas acorde.
- Next header -> Implementa el concepto de cabecera extensible. Indica siempre que protocolo esta encapsulando. Tambien puede encapsular cabeceras de TCP u opciones de IP, que tienen un orden. Cada cabecera tiene el next header diciendo que esta encapsulando. Entonces puedo anidar cabeceras con nextheaders hasta llegar al protocolo de transporte.
	- Opcion Routing -> indica por que routers quiere pasar el datagrama desde su origen
	- Opcion fragment -> tiene los datos de fragmentacion (last fragment, etc)
	- ![[Pasted image 20251106223136.png]]
	Las cabeceras tienen un orden que deben respetarce
### Formato de las direcciones
| Prefijo global de routeo (48 bits) | subnet ID (16 bits) | inteface ID (64 bits identifica host) |

##### Sintaxis Hexadecimal
Separo de a 16 bits y los separo con `:`.
##### Con supresion de ceros
Es lo mismo de hexa pero se eliminan los 0 a la izquierda de cada bloque de 16 bits
##### Compresion de ceros
Reemplaza una secuencia de ceros por un `::`. Ahi van tantos ceros como sea necesario para completar la direccion.
#### Direcciones interesantes
- Loopback `::1` Es la direccion IP asociada al localhost
- Default route `::/0` Es para tablas de routeo
#### Prefijos
Se suele usar con tantos numeros en hexa como indique el prefijo y se completa con ceros. Los prefijos menores a 64 son rutas sumarizadas (una serie de direcciones de red resumidas por un prefijo) y las direcciones de red son /64 por defecto.
### Tipos de direcciones
##### Sumarizacion
Representa muchas direcciones de red o redes con un unico prefijo que comparten. Estas redes tienen una direccion /64. La idea de sumarizar es para aumentar el tamaño de mi red si soy dueño de todas las redes que envuelvo, cosa de hacer mi direccion de red mas grande y mi red mas grande acortando el prefijo. Como las direcciones son regionalizadas y las direcciones pertenecen a bloques adyacentes, se puede agrupar, por ejemplo, todo el trafico de latinoamerica con una direccion de red.
#### Direccion global unicast
Es el equivalente a la direccion IPv4 registrada. Es una IPv6 publica. Diseñada para ser sumarizada, es decir, poder representar muchas redes como una direccion de red sola. Por ejemplo si tengo `192.168.0.0/24` y tengo `192.168.1.0/24` y me queda `192.168.0.0/23`. 
Como IPv6 es regionalizado Puedo hacer esto mismo con los bloques regionales de cada continente. 
Ademas, cada dispositivo tiene una propia no repetible segun donde se encuentre
#### Local-use Unicast address
Son direcciones especiales para dialogar con otro host especifico.
- Link local: La utilizo para conectarme con alguien que esta dentro de mi red.
	- ![[Pasted image 20251031195816.png]]
	Tiene un prefijo de FE80::/64 para este tipo de direcciones. A cada direccion tambien se le asigna un numero de interfaz y cuando quiero apuntar a determinada interfaz, debo setear este valor segun a quien quiero enviar un mensaje
Cada interfaz que activa IPv6, tiene automaticamente una direccion de Link-local autoconfigurada.
Con el router pasa lo mismo, al estar directamente conectado con el, me manejo con su direccion link-local para enviarle trafico
Cada direccion tiene un identificador al mismo tiempo para dirigir el trafico dentro de la LAN. Despues de todo, todos tienen la misma direccion de red. No puedo salir de mi red con esta IP. 
#### Unique local address
Permite direccionamiento privado distinto a las direcciones globales
![[Pasted image 20251031200747.png]]
Son direcciones que no asigna ni la IANA ni el ISP, son como las direcciones privadas 192.168.0.0. Sirve para conectar dispositivos de forma privada sin tener que pedir mas direcciones. Cada global ID es publico respetando una regla de generacion (aleatorio) y por ende unico. Si faltasen direcciones publicas, puedo usar la ULA como reemplazo. Ahora no fueron diseñadas para ser sumarizadas, porque no hay forma de asegurar que el bloque contiguo este en la misma region
#### Multicast
![[Pasted image 20251031201313.png]]
- FF02 : : 1 -> La multicast all-nodes es como el broadcast pero solo para IPv6. Entonces solo aquellos nodos que entiendan IPv6 pueden o son parte de este broadcast. El multicast all-nodes de IPv6 no se traduce entonces a broadcast IPv4 ya que solo los nodos IPv6 lo encuentran interesante.
#### Identificador a la interfaz
Como se completan los ultimos 64 bits de la direccion IPv6. Cada dispositivo se autoconfigura. La probabilidad de colision es muy pequeña. Existen tecnicas para elegirlo:
- EUI-64: como cada dispositivo tiene un MAC address unico, el identificador de interfaz se crea a partir de tal.
	- ![[Pasted image 20251031202213.png]]
- Aleatorio: genera una secuencia Aleatoria
- Temporario: El so lo asigna temporalmente y aleatoriamente (sirve para no usar una la MAC)
- DHCPv6: Es un dhcp en IPv6
- Manual
Router advertisment -> El router informa el prefijo de la red a los dispositivos pertenecientes a la LAN para que se autoconfiguren todos los dispositivos siguiendo el prefijo.
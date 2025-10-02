Las redes tienen un rango de direcciones

## Subnetting
Partir un bloque de direcciones en 2 redes. Antes tenia, por ejemplo 200.10.10.x/24 como *identificador de red* para una red. Quiero que sirva para 2 redes distintas. Lo que puedo hacer es partir el ultimo byte de mi bloque en 2 segun el bit de mayor orden y me quedan 2 bloques:
- 200.10.10.0/25 -> .1 - .126 y .127 es broadcast de la subred
- 200.10.10.128/25 -> .129 - .254 y el broadcast .255
Esencialmente estoy **partiendo una red en 2**. Ahora la mascara de subred es `255.255.255.128`
equivalente a `11111111.11111111.11111111.10000000`
##### Entrega de tramas
Si estoy en la misma subred (comparando prefijo y mascara) es *entrega directa*. La trama ni pasa por el router. Si NO estoy en la misma subred
##### Interfaz de un router
Es la direccion IP de UNA interfaz del router para identificarla en la red. Para los demas dispositivos de la red, la conocen como el ***gateaway***. Por ejemplo, si conecto 2 vlans del mismo switch, el router va a tener una interfaz con gateaway para una lan y otra interfaz con otro gateaway para la otra lan.

##### Direcciones no disponibles
11111111 -> es el broadcast
00000000 -> es el identificador de la red

### VLSM
Mascara de subred de longitud variable. Permite hacer subredes direccionando segun la cantidad de ips necesarias. Lo que se hace es subnetear segun la cantidad de hosts requeridos por red. Entonces cada red tendra un prefijo mas largo mientras menos hosts requiera. Por ejemplo si requiero y la direccion de red es 200.10.10.0:
- 50 host -> 200.10.10.192/26 con direcciones posibles 200.10.10.193/26 - 200.10.10.254/26 con broadcast en 200.10.10.255
- 10 host -> 200.10.10.32/28 con 200.10.10.33 - 200.10.10.62/28 
- 3 host -> /29
Ahora tengo un uso mas eficiente de las direcciones.

IMPORTANTE -> cuando tengo que mandar un paquete a algun lado, si esta en mi red local por IP se lo mando por ARP, sino se lo mando al gateway
# ARP
A alto nivel se trabaja solo con IP. Desde mi host me conecto con otra IP sin importar donde este o del encaminamiento. Ahora el problema esta en que mi datagrama IP se encapsula por una trama MAC y por consiguiente, necesita trabajar con direcciones MAC. Entonces ARP *mappea direcciones ip **logicas** a direcciones MAC **fisicas***. 
Para esto El host debe conocer la direccion IP a la que se quiere conectar de alguna forma u otra. Luego, a partir de la mascara de subred, la capa ip en el host determina si esta conectado en la misma red o debe ir al gateaway en el router para ir a otra red. En el caso en que esten en la misma red, NO HACE FALTA EL ROUTER, se puede manejar todo con direcciones MAC.

##### Funcionamiento (1:51:00)
Envia un request/broadcast en su propia red preguntando a todos los hosts quien tiene la direccion IP buscada. El host correspondiente responde que es su IP y cual es su MAC mediante un *unicast*. Entonces el host original guarda en su *cache ARP* la direccion MAC asociada a esa direccion IP. Esto dura un tiempo breve porque las direcciones IP son dinamicas.
Al ser un vecino de red es una *entrega directa*, es decir entrego el datagrama ip al destino final dentro de mi red lan.
Si esta fuera de mi red, SE LO ENTREGO AL ROUTER. Para identificarlo busco la *default gateway*. Es la IP local del router para que lo pueda identificar y mandarle trafico para que vaya a internet.

###### Caso Broadcast
Se traduce a un broadcast de red ethernet. Ahora cuando mande un broadcast IPv4 mando un broadcast ethernet. Estas NO requieren ARP. Existe una entrada estatica en la tabla que dice que `11111111` es broadcast.
###### Caso Multicast
Tambien tiene una direccion mac para aquellos que quieran participar y no requiere ARP. El mappeo es asi:
![[Pasted image 20250912211739.png]]
Existe un prefijo IP y un prefijo MAC para *multicast*
### Datagrama
![[Pasted image 20250912211800.png]]
- Operacion -> arp request o reply (es decir pregunto quien es una ip y me responden)
#### ARP gratuitous
Es aquel en el cual un host pregunta por su propia IP que MAC tiene. Es el mecanismo que usan los hosts para detectar si hay una IP en uso. Entonces si alguien responde con alguna MAC, esta ocuapda.
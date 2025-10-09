### Modo usuario
- `?` -> muestra todos los comandos disponibles
- `telnet  ` -> abre una conexion telnet
- `ping 192.168.1.0` -> hace un ping ICMP
- `comando + ?` -> muestra todas las opciones posibles
### Modo privilegiado (enable)
Aca podes hacer comandos basicos como `ping` u otros y ver la configuracion actual
- `show running-config` -> muestra la configuracion actual 
- `show startup-config` -> muestra configuracion del switch
- `copy running-config startup-config` -> guarda la configuracion en flash, cuando se reinicie el dispositivo usa esa configuracion
La startup-config es la que se manda al iniciar el dispositivo y se copia en la running. Cuando cambio la running debo pegarla en la startup si no quiero perderla.
### Modo configuracion (configure terminal)
Aca se configura como tal el dispositivo
- `hostname nombreDelDispositivo` -> cambia el nombre
- `enable secret nombreDeLaContrasena` -> pone una contraseña
- `do Comando` -> ejecuta comandos de modo privilegiado en modo configuracion
#### Configuracion de interfaces
`show interfaces` -> para ver el estado de las interfaces 
`no shutdown` para prender la interfaz
Para configurar una interfaz (osea un puerto que tenga su propia IP y tal) hago:
`int nombreDeLaInterface` o 
`int range f0/1 - 10`
Luego para configurar puedo cambiarle el modo para acceso o trunk:
	`switchport mode access|trunk`
##### Configuracion de Seguridad En interfaces
`switchport port-security`
`switchport port-security maximum 1`
`switchport port-security mac-address ....`
`switchport port-security violation shutdown`

Para ver la port-security configuration
`show port-security interface f0/1`
#### Configurar LACP
La idea es agrupar interfaces de un switch en un grupo (etherChannel) para aprovechar y aumentar el ancho de banda
Se configura entre 2 switches y lo que hay que hacer es primero crear un groupo sobre las interfaces que participan. RECORDAR QUE SI PARTICIPAN VARIAS LAN HAY QUE TRUNKEAR LAS INTERFACES.

`int range f0/1 - 2`
Esto se aplica a TODOS los channel-group del switch
`port-channel load-balance {dst-mac | src-mac}` -> 

`channel-group numeroCanal mode active` -> meto las interfaces en el mismo etherChannel
`channel-protocol LACP`


#### Configuracion de VLANs
Para mostrarlas hago `show vlan brief`. Para trabajarlas, debo **crearlas** *en cada switch donde pasen.*
Para **crear** una VLAN en un switch hago :
`vlan numeroDeVLAN`
`name nombreDeVLAN`
###### Asignar puertos a VLANs
Me meto al puerto:
`int f0/1`
	`switchport mode access`
	`switchport access vlan numeroDeVLAN`
#### IP de una vlan
Es la direccion ip (de un switch) de toda la vlan accedible por cualquier puerto de dicha vlan
`int vlan a`
	`ip address 192.168.1.0 255.255.255.0`
Es necesaria para manejarse con telnet/ping
### Trunking
Primero Crear vlans en cada lugar donde vayan a pasar dichas vlans, este o no un host que la necesite conectado. Luego hago trunk A TODOS LOS PUERTOS DONDE PASEN LAS VLAN
`int f0/24`
`switchport mode trunk`
### Configurar ssh
Previo a esto, el switch/router y la computadora que lo vaya a usar debe tener una ip.
`ip domain-name nombreDeDominio.com`
`crypto key generate rsa` -> elegir 1024, 512 o 2048
`ip ssh version 2`
`line vty 0` -> configuro la linea 0 de vty
	`transport input ssh` -> hago que solo acepte ssh
	`login local` -> dice que use los usuarios creados localmente en el switch
`username redes privilege 15 password cisco`



### Configurar Telnet
Previo a esto, todas las computadoras y switches deben pertenecer a la misma red ip y el switch debe tener una ip
`line vty 0 1` -> Estoy configurando las sesiones 0 y 1 en simultaneo
`login` -> obligo que el switch pida contrasena en vty
`password contrasena`
`exec-timeout 10`
``

#### Line Vty
Son lineas de conexion remotas en simultaneo para ejecutar comandos en el router/switch. Son un maximo de 16
##### Transport input
Es el protocolo que puede llegar a aceptar las lineas vty. Puede ser all (por defecto), SSH, Telnet o none. 
Para sacarlo hago
`line vty 0 15` -> para todas las vty
	`no transport input`

### STP
#### Switch1 — Root primario
```bash
enable
configure terminal
	spanning-tree vlan 1,10,20 root primary

```

Este switch será el root bridge de las VLANs 1, 10 y 20.
#### Switch2 — 3 
No se les hace nada, quedan asi
#### Verificacion
```bash
show spanning-tree vlan 1
show spanning-tree vlan 10
show spanning-tree vlan 20
```

#### CONFIGURACIÓN DE LACP ENTRE DOS SWITCHES CON VLANs

#### Escenario
- Dos switches: **SW1** y **SW2**  
- Conectados mediante **dos cables físicos**  
- Interfaces usadas:  
  - SW1: GigabitEthernet0/1 y GigabitEthernet0/2  
  - SW2: GigabitEthernet0/1 y GigabitEthernet0/2  
- Se agrupan en un **EtherChannel (Port-channel 1)** usando **LACP** (modo activo).

---

#### CONFIGURACIÓN EN SW1
configure terminal
port-channel load-balance src-mac
interface range gigabitEthernet0/1 - 2
 switchport mode trunk --> Solo si me manejo con vlans
 channel-protocol LACP
 channel-group 1 mode active
 exit


---

#### CONFIGURACIÓN EN SW2
configure terminal
port-channel load-balance src-mac
interface range gigabitEthernet0/1 - 2
 switchport mode trunk --> Solo si me manejo con vlans
 channel-protocol LACP
 channel-group 1 mode active
 exit


---

#### VERIFICACIÓN
show etherchannel summary  
show interfaces port-channel 1  
show spanning-tree  

---

- SRC-MAC -> hace que todo paquete que tenga la misma mac origen valla por el mismo link
- DST-MAC -> hace que todo paquete que tenga la misma mac destino valla por el mismo link
En definitiva, todo depende de en que sentido vaya el trafico. Siempre conviene priorizar aquello de lo que haya mas. Por ejemplo, si hay pocos hosts de un lado pero transmiten mucho mas hacia el otro que viceversa conviene SRC-MAC para que vayan por canales distintos los paquetes y no sea aleatorio


## Configuracion de routers
Segun los puertos del router que se usen es modo bridge o modo router. El puerto internet es para modo router y el puerto ethernet es para modo bridge

### Modo bridge
Trabaja en capa 2 como access point. Se comporta de manera similar a un switch.
Para configurarlo, hay que conectar una computadora por cable (y configurarle la ip para estar en la misma red que el router) y meterse a la ip que indica el fabricante y manejarse con la gui. 
#### Paso a paso
Es importante que luego de cada paso, se scrolee hacia abajo y se **guarden las configuraciones**. **LOS PRIMEROS 4 PASOS SON CONFIGURACION DE ASIGNACION DE IPS. PUEDE NO SER DHCP Y SER ESTATICO**
1. Conectar el router por interfaz ethernet a un switch o otro router
2. En **setup** _internet connection type_: DHCP -> no se va a utilizar y por ende dhcp no le da ninguna IP. Solo importa la de abajo
3. En **setup** _Router IP_: Direccion del router que me diga el enunciado. Suele ser la mas alta. Es la direccion que va a tener en la LAN. Como se va a colgar de la LAN necesita una direccion IP dentro de dicha LAN ya que solo extiende una Red
4. En **setup** DHCP server: Enabled
5. Jugar con *Start ip address* y con *maximum number of users* segun se indique
6. Ahora voy a **wireless** y la subpestaña **basic wireless settings**
7. Modificar de ser necesario el **SSID**
8. Modificar de ser necesario el **Canal**
9. Poner de ser necesario el **SSID** **Broadcast** para que la red se muestre
10. Ahora en **wireless** voy a **wireless** **security**
11. Pongo WPA2 Personal
12. Introduzco la contraseña que me pidan
Una vez configurado el router tengo que conectarme desde los dispositivos como tal. Antes debo configurarles una direccion IP con DHCP(no puede salir de la red local) o estatica. Estos dispositivos DEBEN TENER placa de red wireless. 

Recordar que el router ahora funciona como switch y para salir de la red DEBO CONECTARLO CON UN ROUTER en modo ROUTE con alguna interfaz de ethernet.
El switch debe tener un mode access LAN

### Modo Router
Trabaja en capa 3 comunicando diferentes redes. Conecto con interfaz **internet**
Primero conecto al puerto de internet el router a un switch u otro router. Ahora el paso a paso
1. Voy a **setup**
2. Pongo tipo de conexion: *IP* *Estatica* -> quiero colgarme de una red y que luego se cuelguen de mi
3. Pongo la direccion de IP de INTERNET perteneciente a la red WAN que arma con el otro router para salir a internet
4. Pongo la mascara de subred
5. Pongo como default gateway el que se me indique, es decir, la del otro router que me saca a internet
	- La idea aca esta en que la relacion o conexion entre redes se da porque el router en modo route se conecta como si fuese cualquier dispositivo a la red de la que quiere formar parte y luego se le conectan dispositivos de otra red para que se puedan hablar.
6. Configuro la direccion IP de la red del router de la que van a estar colgados otros dispositivos
	- Ahora tengo una direccion IP de internet (para que el router se hable con el router) y una IP de network (para que se le cuelguen otros dispositivos)
7. Agrego la mascara de subred
8. Habilito(de ser necesario) el servidor DHCP como se indico arriba en [[#### Paso a paso]]
9. Me voy a Wireless  y Basic Wireless settings y modifico lo que debo
10. Mismo en Wireless security
#### Configuracion de gateway
Es la direccion de una interfaz del router en modo router mediante la cual puede salir de la red 
### Configuracion de pc/telefono
Tiene que tener una direccion ip y gateway. Esta se la da un router en modo router con DHCP o se configura a mano con static. 

## Ruteo y redes
Para un enlace entre 2 routers WAN el que tenga la IP mas alta tiene el ETCD o clock. 
Los router a veces tienen un gateway predeterminado

### Cables seriales
Se conectan entre los router. El router con la ip mas grande va a tener la interfaz DCE. El que la tenga envia cada cierto tiempo la señal de sincronizacion.
A La interfaz con DCE hay que configurarle el tiempo de sincronismo.
### Configurar un router
- nombre -> `hostname nombre`
- contraseña -> `enable secret contraseña`
- Ver tabla de routeo -> `show ip route`
#### Interfaces en un router
Las de f0/0 son para la LAN y las de S0/0/0 son para WAN. Para ver la configuracion hago 
`show interface interfazQueQuieroVer`
##### LAN -> FASTETHERNET
`int f0/0 para acceder a la interfaz
 `ip address 192.168.1.2 255.255.255.0` -> le asigna esa direccion ip a esa interfaz
 `no shutdown` -> prende la interfaz
##### WAN -> SERIAL
1. `int s0/1/0` -> accedo a a la configuracion de la interfaz
	1. `ip address direccionIP SM` -> le pongo la direccion IP. Si tiene el relojito (interfaz DCE) PONGO LA MAS ALTA.
	2. `encapsulation ppp` -> configuro el PPP
	3. `clock rate 2000000` -> Solo si es la interfaz DCE le pongo esto.
	4. `no shutdown`
###### Encapsulation PPP configuracion
Es basicamente configurar 2 o mas routers para que hablen el mismo idioma y no con el protocolo de cisco que se llama `HDLC`.
##### Protocolo de enrutamiento
Previo a todo, las interfaces deben tener direccion IP
Nos permiten saltar de una red a la otra, por ejemplo, de la lan de mi casa a la wan que me conecte con otro lado. Para ver tabla de enrutamiento hago `show ip route` .Puede ser **estatico** con el comando 
`ip route [RED_DESTINO] [MASCARA_SUBRED] [IP_SALTO] [distancia_administrativa]` o
`ip route [RED_DESTINO] [MASCARA_SUBRED] [INTERFAZ_SALIDA]`
Tambien puede ser de forma dinamica con un protocolo determinado donde los routers que pertenecen a la misma wan se informan que redes conocen.
###### Configuracion de RIP
En modo configuracion:
1. `router rip` -> accedo a configuracion de rip
	1. `version 2`
	2. `passive-interface f0/0` -> marco como pasivas las conexiones con computadoras ya que no les interesa el rip.
	3. `network redClassfull` -> esto es importante. Cuando aclaramos con network estamos indicando que redes son relevantes para nosotros, es decir, que redes va a guardar y distribuir el protocolo. La idea es que es una red classfull sobre la red classless con la que estemos trabajando cosa de que el subneteo solo se encargue de llenar la tabla. Es sencillo, me fijo que redes classful conoce el router y las cargo. Repito por todas las redes classfull que conoce
	4. `no auto-summary`  (opcional si tengo una lan a la que me quiero conectar que sea classless)
	5. `redistribute static` (opcional si tengo una ruta estatica)
	6. exit
2. Repetir en demas routers
 Para controlar puedo hacer `debug ip rip`
 
###### Configuracion protocolo EIGRP
Es un protocolo de routeo mas. En modo de configuracion y por cada router que pertenezca a la red:
1. `router eigrp 1` -> el numero es el numero de sistema autonomo e identifica a una serie de routers para que pertenezcan a la misma area y se manejen con eigrp
2. `network direccionDeRedLANQueConoce` -> avisa que direccion conoce y le interesa. Siempre por classfull. No poner la red que conoce por cable (WAN), es redundante
##### ACL Standard
Es una lista de control para permitir que pasen unas ips y que no pasen otras. Se configura desde el router como 
##### Configuración de ACL estándar en Cisco 
1. **Crear la ACL estándar** 
    ```access-list 1 permit 192.168.1.0 0.0.0.127 ``` 
	Permite tráfico proveniente del rango 192.168.1.0 a 192.168.1.127 
2. **Aplicar la ACL a una interfaz** 
	``` interface fastEthernet0/0 ip access-group 1 { in | out } ``` 
	Asocia la ACL 1 a la interfaz FastEthernet0/0 para filtrar tráfico entrante si uso **in** y trafico saliente si uso **out**. 
3. **Verificar configuración** 
	``` show access-lists show running-config ``` 
	Muestra las listas de acceso configuradas y en qué interfaz están aplicadas.

### Configurar Switch con VLANs  conectado con router
Como no se puede trunkear de una hay que elegir otra estrategia. La idea esta en que *cada vlan tenga su propia direccion IP dentro de la misma interfaz del router*. Es decir una interfaz del router con 2 IP, una por cada vlan cosa de que sean gateway para cada VLAN. Entonces desde el lado del **router** hago
1. `int f0/0.numeroDeVLAN` -> configuro la **subinterfaz** f0/0.10, es decir la subinterfaz para la vlan 10 del switch.
	1. `encapsulation dot1Q numeroDeVlan`
	2. `ip address ipDentroDeVLAN10 sm`
	3. `no shutdown`
	4. `exit`
2. Repetir con demas vlans en el router
3. Poner en modo trunk la interfaz del switch que se conecta con el router
Ahora en el router deberian aparecer como interfaces las 2 **subinterfaces** de las VLAN sobre la interfaz que conecta al router con el switch.
En el switch hago:
`switchport mode trunk`
#### Configurar tunel IPSec
Esta configuracion se realiza sobre los otros 2 router que no son el que queremos saltear. Lo que se busca es configurar el protocolo de encriptacion isakmp. Entonces en el primer router hago en modo **configuracion**:
1. `crypto isakmp policy 10`
	1. `encr aes` -> algoritmo de encriptacion
	2. `authentication pre-share`
	3. `group 5`
	4. `lifetime 900`
2. `crypto isakmp key cisco address direccionDelOtroRouterAlQueQuieroTunelear`
3. `crypto ipsec transform-set 50 ah-sha-hmac esp-3des`
4. `crypto map nombreDeMapa 10 ipsec-isakmp` -> creo un cryptoMap
	1. `set peer direccionDelOtroRouterAlQueQuieroTunelear`
	2. `set security-isolation lifetime seconds 1800`
	3. `set transform-set 50`
	4. `match address 101`
5. `access-list 101 permit ipOrigen smWildcardOrigen ipDestino smWildcardDestino` -> configuracion de la access-list extendida (por eso un numero mayor a 101). Esta access list indica quien va por el tunel y quien no.
6. `int s0/0/1`
	1. `crypto map nombreDeMapa` -> activo el mapa que acabo de crear sobre la interfaz del tunel
Luego queda replicar este paso a paso del otro router con los mismos valores pero modificando la ip.


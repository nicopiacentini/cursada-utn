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
Para mostrarlas hago `show vlan brief`. Para trabajarlas, debo **crearlas** *en cada switch.*
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
`username redes privilige 15 password cisco`



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
1. En **setup** _internet connection type_: DHCP -> no se va a utilizar y por ende dhcp no le da ninguna IP. Solo importa la de abajo
2. En **setup** _Router IP_: Direccion del router que me diga el enunciado. Suele ser la mas alta. Es la direccion que va a tener en la LAN.
3. En **setup** DHCP server: Enabled
4. Jugar con *Start ip address* y con *maximum number of users* segun se indique
5. Ahora voy a **wireless** y la subpestaña **basic wireless settings**
6. Modificar de ser necesario el **SSID**
7. Modificar de ser necesario el **Canal**
8. Poner de ser necesario el **SSID** **Broadcast** para que la red se muestre
9. Ahora en **wireless** voy a **wireless** **security**
10. Pongo WPA2 Personal
11. Introduzco la contraseña que me pidan
Una vez configurado el router tengo que conectarme desde los dispositivos como tal. Antes debo configurarles una direccion IP con DHCP(no puede salir de la red local) o estatica. Estos dispositivos DEBEN TENER placa de red wireless. 

Recordar que el router ahora funciona como switch y para salir de la red DEBO CONECTARLO CON UN ROUTER en modo ROUTE con alguna interfaz de ethernet.

### Modo Router
Trabaja en capa 3 comunicando diferentes redes.
Primero conecto al puerto de internet el router a un switch u otro router. Ahora el paso a paso
1. Voy a **setup**
2. Pongo tipo de conexion: *IP* *Estatica* -> quiero colgarme de una red y que luego se cuelguen de mi
3. Pongo la direccion de IP de INTERNET perteneciente a la red de la que quiere pertenecer. Esto configura la ip de la interfaz rj45 INTERNET del router
4. Pongo la mascara de subred
5. Pongo como default gateway el que se me indique
	- La idea aca esta en que la relacion o conexion entre redes se da porque el router en modo route se conecta como si fuese cualquier dispositivo a la red de la que quiere formar parte y luego se le conectan dispositivos de otra red para que se puedan hablar.
6. Configuro la direccion IP de la red del router de la que van a estar colgados otros dispositivos
	- Ahora tengo una direccion IP de internet (para que el router se hable con sus dispositivos de su red) y una IP de network (para que se le cuelguen otros dispositivos)
7. Agrego la mascara de subred
8. Habilito(de ser necesario) el servidor DHCP como se indico arriba en [[#### Paso a paso]]
9. Me voy a Wireless  y Basic Wireless settings y modifico lo que debo
10. Mismo en Wireless security
#### Configuracion de gateway
Es la direccion de una interfaz del router en modo router mediante la cual puede salir de la red 
### Configuracion de pc/telefono
Tiene que tener una direccion ip y gateway. Esta se la da un router en modo router con DHCP o se configura a mano con static. 

#### 
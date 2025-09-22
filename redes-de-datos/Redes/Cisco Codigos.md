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
Para configurar una interfaz (osea un puerto que tenga su propia IP y tal) hago:
`int nombreDeLaInterface` o 
`int range f0/1 - 10`
Luego para configurar puedo cambiarle el modo para acceso o trunk:
`switchport mode access|trunk`
Puedo ponerle seguridad con 
`switchport port-security`
`switchport port-security maximum 1`
`switchport port-security mac-address ....`
`switchport port-security violation shutdown`
#### Configurar LACP
La idea es agrupar interfaces de un switch en un grupo (etherChannel) para aprovechar y aumentar el ancho de banda
Se configura entre 2 switches y lo que hay que hacer es primero crear un groupo sobre las interfaces que participan. RECORDAR QUE SI PARTICIPAN VARIAS LAN HAY QUE TRUNKEAR LAS INTERFACES.

`int range f0/1 - 2`
Esto se aplica a TODOS los channel-group del switch
`port-channel load-balance {dst-mac | src-mac}` -> 

`channel-group numeroCanal mode active` -> meto las interfaces en el mismo etherChannel
`channel-protocol LACP`


#### Configuracion de VLANs
Para mostrarlas hago `show vlan`. Para trabajarlas, debo **crearlas** *en cada switch.*
Para **crear** una VLAN en un switch hago :
`vlan numeroDeVLAN`
`name nombreDeVLAN`
###### Asignar puertos a VLANs
Me meto al puerto:
`int f0/1`
`switchport access vlan numeroDeVLAN`
#### Trunking
Primero Crear vlans en cada lugar donde vayan a pasar dichas vlans, este o no un host que la necesite conectado. Luego hago trunk A TODOS LOS PUERTOS DONDE PASEN LAS VLAN.
`int f0/24`
`switchport mode trunk`
#### Line Vty
Son lineas de conexion remotas en simultaneo para ejecutar comandos en el router/switch. Son un maximo de 16
##### Transport input
Es el protocolo que puede llegar a aceptar las lineas vty. Puede ser all (por defecto), SSH, Telnet o none. 
Son comandos pendejos para ejecutar comandos desde un dispositivo sobre otro.
# SSH en Cisco y Redes

##  Qué es
- **SSH** (Secure Shell) es un protocolo de la **capa de aplicación (OSI)**.  
- Permite administración remota de dispositivos de red como Telnet, pero con **cifrado**.  
- Usa **TCP (capa de transporte)**, **puerto 22** por defecto.  
-  Tiras comandos en una maquina y se ejecutan en otra
##  Protocolos de capas inferiores
- **Transporte**: TCP.  
- **Red**: IP.  
- **Enlace**: Ethernet (u otro según el medio).  
## ⚙️ Comandos básicos en Cisco IOS

Configurar el router/switch como **servidor SSH**:

```bash

Router(config)# hostname R1

Router(config)# ip domain-name midominio.com

Router(config)# crypto key generate rsa   # genera claves RSA

Router(config)# username admin secret cisco123

Router(config)# line vty 0 4

Router(config-line)# login local

Router(config-line)# transport input ssh

```

Conectarse como **cliente SSH**:

```bash

Router> ssh -l admin 192.168.1.1

```
##  Autenticación y seguridad
- Cifrado con RSA (u otros algoritmos).  
- Usuario y contraseña van cifrados → comunicación segura.  
##  Uso típico
1. Administración remota segura de routers, switches y servidores.  
2. Transferencia segura de archivos (SCP/SFTP).  
##  Ventajas sobre Telnet
- **Cifrado completo** de datos.  
- **Autenticación fuerte** con usuarios locales o externos.  
- Estándar actual en redes empresariales y en Internet.
# Telnet en Cisco y Redes

  

##  Qué es

- **Telnet** (Telecommunication Network) es un protocolo de la **capa de aplicación (OSI)**.  

- Permite la **administración remota de dispositivos de red** (routers, switches, servidores).  

- Usa **TCP (capa de transporte)**, **puerto 23** por defecto.  

## 📊 Protocolos de capas inferiores

- **Transporte**: TCP (confiable, orientado a conexión).  

- **Red**: IP.  

- **Enlace**: Ethernet (u otro protocolo según el medio).  

## ⚙️ Comandos básicos en Cisco IOS

En el **cliente** (desde otro router, switch o PC):

```bash

Router> telnet 192.168.1.1

```

En el **servidor Telnet** (el dispositivo que va a aceptar conexiones):

```bash
#// esto es accediendo a la configuracion de lineas virtual teletype para acceder al servidor. Cada linea es una posible conexion. Entonces puede haber un maximo de 5 conexiones en simultaneo.
Router(config)# line vty 0 4
#// aca pongo contrasena
Router(config-line)# password cisco
#// aca exijo que se logueen antes de entrar
Router(config-line)# login
#// aca digo que esas lineas se manejen con telnet especificamente
Router(config-line)# transport input telnet

```

## 🔑 Autenticación

- Usuario/contraseña enviados en **texto plano**.  

- No hay cifrado de datos → inseguro en redes reales.  

## 🛠️ Uso típico

1. Conectar a un router/switch en la misma red o a través de Internet.  

2. Administrar remotamente el dispositivo como si estuvieras en la consola.  

## ⚠️ Limitaciones

- **Sin cifrado**: credenciales y datos pueden ser interceptados.  

- Obsoleto en redes modernas, reemplazado por SSH.
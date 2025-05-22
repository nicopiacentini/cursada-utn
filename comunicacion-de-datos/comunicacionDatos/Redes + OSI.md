
**Modelo OSI** → ambos equipos terminales tienen implementadas todas las capas del modelo. Los nodos conmutadores, conmutan sobre algunas capas, no todas. Cada capa se comunica con la superior a traves de una interfaz. Mientras que dialogue con capas pares, puedo comunicarme con redes heterogeneas. Cada capa le agrega un header a los datos para que su capa par lo entienda y sepa que hacer. Los datos con header de cada capa se convierten en PDU que para la capa siguente son datos, es decir, SDU.

## Modelo TCP/IP y funciones de cada capa:

#### Capa de Enlace (Link Layer)
Es la capa más baja del modelo TCP/IP. Se encarga de la comunicación directa entre dispositivos en una red física local (por ejemplo, una LAN).

##### Componentes:
- MAC (Media Access Control): Identifica físicamente a cada dispositivo con una dirección MAC única de 48 bits. Controla quién accede al medio de transmisión y cuándo.
- LLC (Logical Link Control): Proporciona servicios como detección de errores y control de flujo. Permite que múltiples protocolos de red (como IP) compartan el mismo enlace físico.

##### Función principal:
Encapsula y transmite datos a través del medio físico (cable, Wi-Fi, etc.) y determina cómo se accede a ese medio.

#### Capa de Internet (o Red)
Su objetivo es entregar paquetes desde el origen hasta el destino, sin importar si están en redes distintas. Equivale a la Capa de Red del modelo OSI.

##### Protocolos:
- IP (Internet Protocol): Encapsula los datos en paquetes IP que contienen las direcciones IP de origen y destino. Es un protocolo no confiable y sin conexión.
- ARP (Address Resolution Protocol): Traduce una dirección IP de destino a su dirección MAC correspondiente (funciona dentro de una LAN).
- RARP (Reverse ARP): Hace lo opuesto: permite a un dispositivo sin IP (pero con MAC conocida) obtener su IP. Ya casi no se usa.
- ICMP (Internet Control Message Protocol): Usado para mensajes de error y diagnóstico. El clásico ejemplo es el ping.

##### Función principal: 
Enrutamiento y direccionamiento de los datos entre distintas redes.

#### Capa de Transporte
Se encarga de proveer comunicación entre procesos (no solo entre computadoras). Aporta control de errores y gestión de la conexión.

##### Protocolos:

- TCP (Transmission Control Protocol): Protocolo orientado a conexión, confiable y ordenado.

- UDP (User Datagram Protocol): Protocolo sin conexión y más rápido, pero sin garantía de entrega ni orden.

##### Función principal:
Asegurar que los datos se entreguen correctamente (TCP) o rápidamente (UDP), según el caso.

#### Capa de Aplicación
Es la más cercana al usuario. Proporciona las herramientas para que las aplicaciones se comuniquen a través de la red.

##### Protocolos comunes:

- Telnet: acceso remoto por consola.

- DNS: traduce nombres de dominio en direcciones IP.

- HTTP/HTTPS: acceso a páginas web.

- SMTP, POP3, IMAP: envío y recepción de correos electrónicos.

- FTP: transferencia de archivos.
##### Función principal:
Proveer servicios y protocolos de red directamente a las aplicaciones del usuario.

## Modelo OSI
##### Nombre del PDU en cada capa del OSI

•      Red → paquete

•      Enlace de datos → trama

•      fisica → bits

El enlace de datos en osi, se divide en 2 para LAN → logical link control y mac

##### Donde esta cada equipo

•      capa fisica → repetidores y hubs

•      enlace → switches y bridges (mac address)

•      red → routers o enrutadores (ip)

•      aplicacion, presentacion, sesion y transporte → computadora

## Capas del modelo osi

##### fisica → conexion fisica con el medio transmisor (con el cable)
definicion de caracteristicas mecanicas (como son los cables que uso), electricas(voltage que uso) y funcionales  y de procedimientos

##### Capa de enlace → establece mantiene y libera las conexiones con red (N3)

- controla errores y flujo de datos

- delimita secuencia de bits

- resuelve problemas de dano, perdidas y duplicidad

- protocolo HDLC

- Transparencia

protocolo ethernet (802.3) tiene MTU (maximum transfer unit = 1500 bytes) luego tiene 5 campos para poder cumplir su mision de direccionar un mensaje. Tiene direccion de destino y de origen. Los primeros bytes limitan la secuencia de bits (los 2 primeros campos)

##### Capa de red → servicios orientados a la conexion o sin conexion a la capa de transporte o N4

- Encaminamiento → que pase por los routers segun su direccion ip para que llegue al destino

- tratamiento de congestion y facturacion → esto es de la red y depende de la cantidad de gente que haya en la red para evitar que colapse, comunicandose con el transmisor y con el receptor

- Reenvios por sistemas intermedios

- Interconexion por redes heterogeneas → el router adapta los tamanos y formatos de los bloques de datos para que pase por todas las redes.

##### Capa de transporte → conexion de extremo a extremo, implementada en los terminales. Hay distintos flujos de datos que pueden tener distintas calidad de servicio (QoS → quality of service)

- Oculta detalles de las capas superiores

- Multiplexion → en mi computadora tengo una sola IP pero simultaneamente hago muchas cosas (videoconferencia, descarga de archivos, etc).

##### Capa de sesion → Gestiona el control de dialogo, sincronizacion, administracion, establecimiento y liberacion de conexion

##### Capa de presentacion → codificacion de datos (), manejo de abstracciones, conversiones, compresion y criptografia

- Permite comunicar equipos con distintas representaciones, adecua sintaxis

##### Capa de aplicacion

- define  virtual para el dialogo entre terminales incompatibles

- proporciona interfaz de usuario

- establece autorizaciones y autentifica datos

- determina disponibilidad actual

### Funciones ejecutadas por redes

Estas son la conmutacion (enrutacion de bloques de datos) y transmision (de bloques de datos a traves de la interfaz donde puede llegar a destino) de datos

Conmutadores → seleccionar el camino mas optimo para la transmision de bloques de datos

##### De circuitos
No hay bloques de datos, hay una secuencia continua de bits (como la red telefonica). Como la comunicacion es por un tubo y preestablecida, si se cae un enlace o nodo, se cae la comunicacion

- establecimiento de comunicacion

- transferencia de informacion

- desconexion de comunicacion

##### De paquetes con datagrama

Transmite bloques de datos de forma digitalizada

Cada router tiene una tabla de enrutamiento para saber para donde tiene que ir el bloque de datos segun la red a la que se dirige. Si hay congestion, es capaz de no seguir siempre el misom camino segun lo que decida el nodo → los bloques llegan desordenados

- Hay procesos de almacenamiento y retransmision de mensajes

- no me bloquea la cantidad de bloques que puedo mandar

##### De paquetes con circuitos virtuales

- funciona con senales digitales

- los mensajes (secuencia de bits) se dividen en paquetes en el transmisor de mensajes. Se les agrega info a los paquetes para que los conmutadores definan la ruta establecida. Van por tubo y tienen orden de llegada

- son mas rapidas porque el nodo ya sabe a donde tiene que mandar las cosas → se lo indica el paquete, por eso el circuito es virtual, es decir, no existe. Si se cae un nodo, se cae toda la comunicacion
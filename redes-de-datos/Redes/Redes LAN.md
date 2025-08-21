## Ethernet

Ethernet es un tipo de red de área local que se adhiere al estándar del Comité IEEE 802.3. Opera en un modelo de comunicación "peer-to-peer" y utiliza el método de acceso CSMA/CD, que significa "Carrier-Sense Multiple Access / Collision Detection". Generalmente, funciona en modo "half-duplex".

**Evolución histórica de Ethernet**

La evolución de Ethernet comenzó en 1970 con la Aloha Radio Network en Hawái. En 1979, Digital, Intel y Xerox (DIX) crearon DIX Ethernet II. El estándar IEEE 802.3 fue establecido en 1985, con una velocidad de 10 Mbps. Posteriormente, se desarrollaron versiones más rápidas: Fast Ethernet en 1995 (100 Mbps), Gigabit Ethernet en 1998, y 10 Gb Ethernet en 2002.

**Trama Ethernet 802.3**

Una trama 802.3 tiene varios campos:

- **Preámbulo:** 7 bytes, con el patrón binario `10101010`.
    
- **SFD (Start of Frame Delimiter):** 1 byte, con el patrón `10101011`.
    
- **DA (Dirección de destino):** 6 bytes.
    
- **SA (Dirección de origen):** 6 bytes.
    
- **Longitud/Tipo de trama:** 2 bytes. La longitud de la trama puede ser de 0 a 1500 bytes.
    
- **Datos:** 0 a 1500 bytes.
    
- **Pad (Relleno):** 0 a 46 bytes.
    
- **FCS (Frame Check Sequence):** 4 bytes, utilizando CCITT-32 CRC.
    

La longitud mínima de una trama es de 64 bytes, y la máxima es de 1518 bytes (sin incluir el preámbulo ni el SFD). Las direcciones de 48 bits se componen de un OUI (Organizationally Unique Identifier) de 3 bytes y un DUI (Device Unique Identifier) de 3 bytes. Existen direcciones especiales como la de

_broadcast_ (`0xffff.ffff.ffff`) y _multicast_ (`0x0000.5e00.0000` a `0x0000.5eff.ffff`).

**Características de la transmisión**

Con una velocidad de transmisión de 10 Mbps, una trama mínima de 64 bytes (512 bits) tiene un "slot" de 51.2 microsegundos. La longitud máxima de la red puede ser de 2500 metros, que es el resultado de la multiplicación de 5 por 500 metros.

**Dominio de colisión**

Un dominio de colisión es un segmento de red donde las colisiones de datos son posibles. Con un concentrador (HUB), todas las estaciones conectadas forman parte de un único dominio de colisión. Un conmutador (switch) de múltiples puertos permite crear dominios de colisión separados.

**Tipos de Ethernet cableado**

- **10Base5:** Utiliza cable coaxial grueso (RG-218) para una transmisión a 10 Mbps en banda base. La longitud máxima del segmento es de 500 metros.
    
- **10Base2:** Emplea cable coaxial fino (RG-58) para una transmisión a 10 Mbps en banda base, con una longitud máxima de segmento de 200 metros (o 185 metros).
    
- **10BaseT:** Usa cable UTP (Unshielded Twisted Pair) para una transmisión a 10 Mbps en banda base, con una longitud máxima de segmento de 100 metros.
    
- **100BaseT:** Utiliza cable UTP para una transmisión a 100 Mbps en banda base, con una longitud máxima de segmento de 100 metros.
    

**Interfaz Full-Duplex**

Una interfaz "full-duplex" utiliza caminos de transmisión y recepción independientes que operan simultáneamente. En una conexión punto a punto con un enlace "full-duplex", no hay contención, por lo que el método CSMA/CD se elimina.

**Bridging**

Los

_bridges_ operan en la capa 2 de la red y usan las direcciones MAC para enrutar las tramas. Aprenden automáticamente la ubicación de los hosts y procesan las tramas a través de dos funciones: "Filtering" y "Forwarding".

- **Transparent Bridge:** Aprende automáticamente la ubicación de los _hosts_.
    
- **Translating Bridge:** Además de las funciones de un _transparent bridge_, realiza la conversión de protocolos y velocidad. Un ejemplo es la conversión de tramas entre una red Token Ring y una Ethernet.
    

**Switching**

El proceso de _switching_ puede operar en diferentes modos:

- **Cut-Through:** El _switch_ comienza a reenviar la trama tan pronto como recibe la dirección de destino (los primeros 6 bytes).
    
- **Fragment-Free:** El _switch_ espera los primeros 64 bytes antes de reenviar la trama.
    
- **Store-and-Forward:** El _switch_ recibe la trama completa antes de reenviarla.
    

**Bridging Loops y Spanning Tree Protocol (STP)**

Los bucles de

_bridging_ se producen cuando los _bridges_ en una red no tienen conocimiento de la existencia de otros _bridges_. El protocolo 802.1d Spanning Tree (STP) fue creado para solucionar este problema.

- **Función de STP:** Descubre los bucles de red y desactiva los enlaces redundantes. Si un enlace se desconecta, el STA (Spanning Tree Algorithm) se dispara de nuevo para reactivar el enlace que fue desactivado por el STP.
    
- **Proceso de elección:** Todos los _bridges_ (o _switches_) en la red participan en la elección de un _root_. Se envían BPDU (Bridge Protocol Data Units) cada 2 segundos. Cada
    
    _switch_ tiene un Bridge ID de 8 bytes, compuesto por la prioridad del _bridge_ y su dirección MAC. La prioridad más baja designa al
    
    _root_.
    
- **Estados de los puertos:** Los puertos de un _switch_ pueden pasar por los estados de BLOCKING, LISTENING, LEARNING, y FORWARDING. Si el estado de un puerto cambia, se envían notificaciones de cambio de topología (TCN) y se reinicia el cálculo del árbol.
    

**Virtual LANs (VLANs)**

Las VLANs son redes virtuales creadas dentro de un mismo

_switch_ que cuenta con esta funcionalidad. Las VLANs dividen los dominios de

_broadcast_ y aíslan las redes. Para interconectarlas, se necesita un dispositivo de capa 3. El estándar 802.1Q utiliza un

_tag_ de 4 bytes que se inserta en la trama Ethernet original. El

_tag_ 802.1Q contiene el valor Ethertype `0x8100`, un campo de prioridad (PRI) de 3 bits y un VLAN-ID de 12 bits, que permite hasta 4096 VLANs.
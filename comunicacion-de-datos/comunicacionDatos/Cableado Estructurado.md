## Introducción al cableado de red

El cableado de red es un sistema de infraestructura de telecomunicaciones dentro de edificios que permite conectar dispositivos de red. Su característica principal es la capacidad de soportar distintos servicios sin requerir modificaciones físicas. Las normas TIA/EIA-568, desarrolladas por las asociaciones estadounidenses EIA (Electronics Industries Association) y TIA (Telecommunications Industries Association), definen estándares que regulan este tipo de instalaciones.

## Tipos de cables y medios de transmisión

### Par trenzado

El par trenzado puede ser sin blindaje (UTP) o blindado (STP, FTP, ScTP). La estructura de hilos trenzados reduce la interferencia electromagnética entre pares. Las corrientes en cada hilo fluyen en direcciones opuestas y sus campos se cancelan mutuamente, disminuyendo el ruido.

UTP es más económico y fácil de instalar. STP ofrece mayor inmunidad al ruido pero es más costoso.

### Fibra óptica

La fibra óptica transmite datos mediante pulsos de luz. Puede estar fabricada en vidrio o materiales plásticos, y la fuente de luz puede ser un LED o un láser.

Se distingue entre fibras multimodo (usadas en distancias cortas) y monomodo (para distancias largas y altas tasas de transferencia). La fibra monomodo tiene un núcleo más delgado, lo que limita la propagación a un solo modo de luz.

## Componentes del cableado estructurado

El cableado estructurado incluye:

**Puestos de trabajo,** con bocas RJ-45 y tomas eléctricas con tierra independiente.

**Cableado horizontal**, que conecta los puestos al armario de telecomunicaciones (IDF). Se recomienda usar UTP categoría 5e con una distancia máxima de 90 metros. Luego me sobran 10 metros para conectar patch cords en frame de comunicaciones y para conectar la boca de rj45 con el puesto de trabajo.

**IDF** (Intermediate Distribution Frame), punto intermedio entre los usuarios y el sistema central.

**Cableado vertical o backbone**, que conecta los IDF al MDF, utilizando fibra óptica o cables multipar.

**MDF** (Main Distribution Frame), donde se ubican routers, switches, servidores y UPS. Es el núcleo de la red. La idea es que la central telefonica me tira un multiapar a mi mdf. Al mismo tiempo, el proveedor de servicio de red me tira otro cable a otro dispositivo de mi mdf. Luego tengo un switch con entradas rj45. A este switch, le entran utps que se conectan con telefonos o pcs. Si quiero que el utp haga de telefono, uso un patch cord para conectarlos. De lo contrario, uso un patch cord para conectar con el dispositivo de red.

**Documentación técnica**, con planos de disposición, ubicación de ductos y sistemas de rotulación. Es clave para administración y mantenimiento.

## Estándares TIA/EIA 568A y 568B

Estos estándares definen:

Tipos de cables, conectores y arquitecturas.

Longitudes máximas (por ejemplo, 100 m para UTP).

Terminaciones, métodos de instalación y prueba.

Requisitos de desempeño eléctrico.

El objetivo es garantizar compatibilidad presente y futura entre dispositivos y redes.

## Armado de cables: conectores RJ45 y jacks

### Terminación en conector RJ45

Quitar la funda del cable.

Ordenar los hilos según norma 568A o 568B.
Los canales 1 y 2 son de emision, mientras que el 3 y 6 son de recepcion

Insertar en el conector.

Crimpar con herramienta.

Verificar la conexión.


### Terminación en jack RJ45 (roseta o boca)

Quitar aproximadamente 2 cm de la vaina.

Destrenzar solo lo necesario (máx. 13 mm).

Insertar los hilos en las clavijas con herramienta de impacto.

Controlar la conexión.

## Tipos de cableado y conexión

Existen dos tipos principales de cables de conexión:

Directo (straight-through), utilizado entre dispositivos de distinto tipo (switch a PC, router a switch).

Cruzado (crossover), para conexión entre dispositivos del mismo tipo (switch a switch, PC a PC).

Estos tipos de conexión permiten establecer correctamente la comunicación de datos según la función del equipo.

## Certificación de enlaces

La certificación evalúa si el cableado cumple con las normas TIA/EIA y se basa en pruebas de campo.
- Capacidad marginal -> pongo un limite de un parametro y mido la menor diferencia. Mientras mas lejos del limite, mejor.
- Mapa de cableado -> verifica que en el cableado horizontal no hayan pares invertidos, cruzados, divididos, hilos divididos o cortocircuito
- FEXT
- NEXT
- ACR -> NEXT - atenuacion. Si da 0, tengo mala relacion señal ruido. 10 es buena relacion Señal ruido.
- Resistencia -> resistencia del bucle de corriente en corriente continua.
- Longitud -> se mide la longitud de cada par probado.
- Retardo
- Heater -> diferencia de retardo
- Impedancia caracteristica
- Atenuacion -> depende de la distancia y de la frecuencia
- 
Los estándares como el TSB-67 establecen procedimientos, criterios de aceptación y configuraciones válidas de prueba.

Se utilizan dos modelos:

Canal (Channel): incluye todo el recorrido, desde el panel hasta el dispositivo, incluyendo patch cords.

Enlace Básico (Basic Link): mide solo el cableado estructurado, excluyendo los cordones de conexión.

El canal tiene una longitud máxima de 100 m, mientras que el enlace básico no debe superar los 94 m.

## Parámetros técnicos de prueba

### Capacidad marginal

Es la menor diferencia entre un valor medido y su límite normativo. Se aplica a parámetros como NEXT, ACR y PSNEXT. Cuanto mayor es la capacidad marginal, mejor es el rendimiento del cable.

### Mapa de cableado

Verifica la continuidad y configuración de los pares:

Correcto

Pares invertidos

Pares cruzados

Pares divididos

Corto

Abierto

### Resistencia

Mide la resistencia del bucle de corriente continua en cada par. Si supera el límite, se considera falla.

### Longitud y NVP

La longitud del cable se calcula a partir del tiempo de propagación y la velocidad nominal de propagación (NVP), que depende del tipo de cable.

### Retardo de propagación y skew

El retardo es el tiempo en nanosegundos que tarda una señal en recorrer el cable. El skew es la diferencia entre los retardos de los pares.

### Impedancia característica

La impedancia representa la oposición a la corriente alterna. Cambios bruscos en la impedancia generan reflexiones que pueden distorsionar la señal. Se mide para detectar anomalías.

### Atenuación

Es la pérdida de energía de la señal a lo largo del cable, causada por resistencia e imperfecciones en el aislante. Se mide en decibeles. A mayor atenuación, menor rendimiento.

### NEXT y PSNEXT

El NEXT mide la diafonía en el extremo cercano; PSNEXT es la suma de todas las interferencias sobre un par.

### ACR

Es la diferencia entre NEXT y atenuación. Un ACR alto implica buena relación señal/ruido y mayor ancho de banda utilizable.

### Pérdida de retorno (RL)

Representa la diferencia entre la señal enviada y la reflejada por variaciones en la impedancia. Una RL alta indica mejor coincidencia de impedancias.

### Herramientas de diagnóstico (TDR y TDX)

TDR (Reflectometría en el dominio del tiempo) localiza fallas por reflexión (cortos, abiertos).

TDX identifica la ubicación de interferencias entre pares.

Ambas herramientas permiten ver los resultados en forma de lista o gráfico, y ayudan a encontrar la causa de fallas.


Comunicación de datos

****TODOS LAS CLASES VIRTUALES****

Primer parcial → 12/05

Segundo Parcial → 9/06

## Las Telecomunicaciones


- Antes→ la empresa brindaba servicio de telecomunicacion o de transmision de datos o de video

- Ahora→ transmision digital, cualquier empresa puede ofrecer todo, video, telefonia o internet

###### El problema de la última milla es la dificultad de entregar un paquete al destinatario en la etapa final

la caja router es → router, switch y access point

Teleinformatica: vinculo entre telecomunicaciones e informática

	• Permite el procesamiento distribuido

	• Permite el procesamiento digital de las señales

	• Aparecen nuevos servicios como telefonía IP, TV/IP

	• Aparece la convergencia de servicios:

		– todas las señales se trasmiten por la misma red

		– un solo proveedor de servicios (3play, 4play, etc.)

	• Permite la globalización

	• Pasó de los monopolios a la desregulación

## Infocomunicaciones

	·        Las comunicaciones como medio de transporte de información

	·        La informática como forma de comunicaciones

## Comunicación de datos 
Permitir el intercambio de información entre usuarios de mi sistema. Requisitos o conceptos básicos (problemas de la comunicación y como debe ser):

- **Confiable:** funciona todo el tiempo, las 24 horas. Tolerancia al fallo, en cuanto se puede demorar la restauracion del servicio

- **Sin errores:** Que los equipos y los enlaces sean de buena calidad. Protocolos de errores para priorizar velocidad o correccion de errores.

- **En tiempo real:** el tiempo en que interactuo con la aplicación, debe ser instantaneo para la toma de decisiones del usuario.

- **Flexible**

- **Segura:** confidencialidad, encriptacion de mensajes

- **Autenticacion:** de quien manda el mensaje

- **No repudio: que no se rechaze el mensaje**

## Circuito teleinformático básico:


- Equipo terminal de datos (ETD): equipo que envia o recibe información en un sistema de telecomunicaciones

- Equipo de comunicación de datos (ECD): transforma datos para que puedan ser transmitidos a través de las líneas de comunicación. Intermediario entre ETD y líneas de comunicación

- Circuito de datos (CD): Medios físicos que transportan la información entre los extremos de comunicación

- Enlace de datos (ED): proceso lógico que establece la comunicación entre dos terminales de datos.


![[Pasted image 20250519181235.png]]



### Redes de comunicaciones

Es el conjunto de recursos de comunicaciones y de informática que forman un sistema, para el transporte de información.

·        Redes integradas

·        Redes multimediales

·        Redes convergentes

## Arquitectura de las comunicaciones

Conectividad: posibilidad de interconectar equipos de diferentes marcas y proveedores, integrándolos en redes armónicas con normas comunes (integrarlos en un mismo sistema)

##### Las redes de telecomunicaciones necesitan:

	– establecer una comunicación (ver si ambos terminales estan despiertos)

	– controlar el flujo de datos entre las estaciones

	– cuando el dialogo finalizo, liberarla.

La arquitectura de la red es:

	– un modelo de interconexión

	– un conjunto de reglas para comunicar los terminales.

### Arquitecturas Propietarias

- SNA (Systems Network Architecture): Desarrollada por IBM para la interconexión de redes de computadoras con una fuerte centralización:

		un procesador central importante (mainframe)

		computadores medianos

		estaciones bobas (terminales de entrada/salida de texto).

- DNA (Distributed Network Architecture): Desarrollada por Digital, basada en siete capas similares a la arquitectura OSI.

### Arquitecturas Abiertas

- OSI (Open Systems Interconnection): Modelo de referencia diseñado en Europa por la Organización Internacional para las Normalizaciones (ISO) y por la Unión Internacional de Telecomunicaciones (UIT-T).

- DARPA (Defense Advanced Research Project Agency): Desarrollado por Estados Unidos. Incluye los protocolos conocidos como TCP/IP. TCP/IP agrupa los datos en bloques de datos o paquetes.


### Modelo OSI
Modelo OSI o ISO: Compouesto por siete capas, cada una con un protocolo. El modelo distribuye entre las capas las funciones que se necesitan cumplir para lograr una comunicación segura y existente

### La Red internet

Red internacional formada por un conjunto de varias redes independientes que:

- Son operadas de forma autónoma

- Están interconectadas por medio de protocolos y procedimientos normalizados como estándares de internet

- Permiten comunicaciones entre dos equipos terminales de cualquier red si se identifican con una dirección numérica única (la dirección IP)


### Nombres

Para manejar las direcciones IP de manera más simple y práctica, se usan nombres para individualizar los host (el terminal que recibe o envia informacion). Los nombres se traducen en direcciones numéricas en el momento de utilizarse la red, mediante un **servidor de resoluciones de dominio.** TRADUZCO EL NOMBRE DE DOMINIO (GOOGLE.COM) A SU DIRECCION IP


Niveles de requerimiento de una especificación técnica:

- Requerido o Required

- Recomendado o Recommended

- Electivo o elective

- De uso  limitado o Limited use

- No recomendado o Not recommended


UNIDAD 2, CARACTERISTICAS DE LAS SENALES DE COMUNICACION

Las senales pueden ser:

- Electrica

- optica

- electromagnetica


###### Senal analogica→ son representadas por funciones que pueden tomar valores infinitos entre valores acotados. Para transmitir a digital uso CODEC

###### Senal digital → son representadas por funciones que toman valores discretos. Para transmitir a analogico uso un MODEM

### Envio de informacion por señales

Telecomunicaciones: conjunto de tecnologías que permiten la trasmisión a distancia de señales de información. 
Medio o canal de comunicaciones: permite que las señales generadas en el transductor de la fuente lleguen al transductor del sumidero.
Componentes de un sistema de comunicaciones:

-  Una fuente y un sumidero o colector.

- Un medio o canal de comunicaciones.

- Un transductor en la fuente y otro en el sumidero.

#### Cualquier tipo de senal analogica o digital sufren de:

- Atenuacion: se degrada y atenua la potencia de la senal emitida

- Distorcion: deformacion de la senal por el medio de transporte. Depende de la impedancia. Se produce una reflexion cuando no considero bien las impedancias

- Ruido: puede ser interno o externo y afecta a la senal. No se puede evitar

- Retardo o delay: Cuanto tarda la senal.

- La variacion del retardo la maneja el heater y no puede ser administrada como el delay

#### Solucion a la atenuación y al ruido

Cuando una senal **analogica** se **degrada** la puedo repetir con un _amplificador._ El problema es que si tengo ruido o degradacion o ruido, estos se amplian.

En el caso de una senal **digital**  puedo usar un _regenerador de pulso._  Este se consume y anula la distorcion o el ruido o la degradacion.


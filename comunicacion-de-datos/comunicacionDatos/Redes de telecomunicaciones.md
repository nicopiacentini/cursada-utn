Velocidad de modulacion Vm = 1/tao, es decir, 1/ancho de pulso mas pequeño = baudio
El medio de transmisión se opone a la transmisión de datos. Busco aumentar la velocidad de transmisión sin aumentar la velocidad de modulación o velocidad física.
Los baudios coinciden con los bits por segundo cuando la señal tiene solo 2 estados, es decir 1 y 0. En estos casos, la **velocidad de modulación** coincide con la **velocidad de transmisión**

## Transmision multinivel

Velocidad de transmisión (Vtx) = Vm * log2(n) = bits por segundo, donde n es la cantidad de niveles de señal, es decir posibles valores de tensión. A MAYOR CANTIDAD DE VALORES POSIBLES DE NIVELES DE TENSION, MAYOR VELOCIDAD DE TRANSMISION. El problema radica en que a mayor cantidad de niveles, puedo tener mas error porque hay mas valores posibles. La cantidad de bits por baudio me indican la velocidad, bibaudio (2 bits por baudio), tribauido (3 bits por baudio o pulso).

Velocidad de transferencia de datos (Vtd) = bits de datos transferidos / tiempo empleado. Los bits son SOLO DE DATOS no hay corrección de errores o similar. Esta es siempre mas pequeña que la de transmisión

Velocidad real de transmisión de datos  =  numero de bits de datos transmitidos y aceptados como validos / tiempo empleado

Eficiencia o rendimiento de un sistema de transmisión de datos (Vrtd) = longitud de archivo conocido / tiempo empleado

Tasa de error BER (bit error rate) = cantidad de bits con errores/ cantidad de bits transmitidos. Cantidad de bits erróneos sobre cantidad de bits transmitidos.

## Tipos de transmisión (para 2 equipos)

- Simplex -> una estación siempre actúa como fuente y otra siempre como colector. Siempre va en el mismo sentido (por ejemplo, las emisoras de radio). Hay un solo canal
- Semiduplex o halfduplex -> Hay un solo canal pero es ida y vuelta, el que es fuente puede luego ser colector y viceversa.
- Duplex o full dúplex -> tengo 2 canales, donde uno va en un sentido y el otro en otro. Estos requieren  3 condiciones:

		Medios físicos capaces de transmitir en ambos sentidos
		Protocolos de transmisión

Sincronismo de bit -> como detecto que me están mandando un bit. El receptor tiene una frecuencia de muestreo y el ancho de pulso debe ser muestreado de 8 a 9 veces para aproximar el tao.

### Modos de transmisión

- Transmision en paralelo -> en un solo ciclo de reloj, transmito los _n_ bits que componen cada byte. Las usan las computadoras de forma interna. Transmite muchos bps en distancias cortas

- Transmision en modo serie -> la placa red o el puerto usb traducen paralelo a serie. Los bits van uno atrás del otro. Puede ser asincrónica o sincrónica

	Sincrónico -> sincroniza un bloque de bits, es decir, agarra muchos bits y les suma info de todos aumentando la velocidad de transmisión. Si hay error, pierdo mas que en asincrónico porque pierdo el bloque.



	Asincronico -> sincroniza carácter a carácter. Entonces a cada carácter se le suman bits de información que realentece todo.

### Redes de telecomunicaciones

Elementos de una Red:

- Nodo -> punto de red al que concurren dos o mas vínculos de comunicaciones y tienen facilidad para la conmutación
- Vínculos-> medios físicos que unen 2 nodos de una red
- Terminal -> equipo electrónico que ingresa o extrae señales de la red

Si la red no tuviese nodo, los vínculos serían entre terminales directamente y de acá surgen topologías de red y estas dependen de la topografía del lugar, el costo de los vínculos, la flexibilidad para incorporar nuevos usuarios, la escalabilidad y la performance que se busca.

Topologías de la red la forma que toma la red:

- Estrella -> un nodo central concentra y distribuye todo el trafico al que están conectados los terminales
- Topologia malla -> no hay nodo central, todos los nodos conectados entre si  
- Topologia malla incompleta -> es una malla pero no están todos los vínculos posibles
- Anillo con control distribuido -> cada terminal esta conectada a otras 2. las señales pasan de un nodo de la red al siguiente mediante repetidores. La conexión es secuencial hasta que llegue la información a quien lo necesite.
- Anillo con control centralizado -> arquitectura maestro esclavo. La estación de control establece quien tiene el token y quien es el que manda info
- Topologia de bus de datos -> todos los dfatos se conectan a un canal (es por competencia, es decir, si el canal esta libre transmite el terminal. Si esto pasa simultáneamente entre 2 terminales se chocan los datos en una colisión)

### Modelo OSI 

Protocolo-> PDU (unidad de datos de protocolo) esta compuesta por los datos que vienen de la capa de arriba y vienen encapsulados (SDU  unidad de datos de servicio). Le agrego los datos de la capa que me corresponde en forma de header o PCI (información de control de protocolo). Esto se repite hasta la capa física. Cuando sube, se sacan las cabeceras

Interfaces -> son puntos de acceso al servicio y son unidos por conexiones lógicas. Si uso varias al mismo tiempo, estoy usando multiplexion.

Servicios:

- Orientado a conexión:

		-Con orden de llegada
		-Como tubo
		-Transferencia libre de errores
		-Circuito virtual

- Orientado a la no conexión:

		-Sin orden de llegada
		-Encaminamiento independiente
		-Enfoque mejor intento
		-datagrama
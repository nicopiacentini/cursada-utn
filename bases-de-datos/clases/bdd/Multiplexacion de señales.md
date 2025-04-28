Hay medios de comunicacion que tienen mucho ancho de banda y busco con la multiplexacion mandar mas de una transmision sin que se mezclen.

Tecnica para transmitir simultaneamente varias comunicacion por un unico canal sin que se interfieran con el objetivo de aprovechar mejor el ancho de banda

### Mejoras de la capacidad de un canal

- Transmisiones multinivel: limitado por la relación señal ruido.
- Aumentar la velocidad de modulación
- Enviar varias comunicaciones simultáneas usando multiplexación
- Utilizar al máximo el ancho de banda disponible en el medio con el hardware necesario.

banda ancha > 2Mb
banda angosta < 2Mb

A nivel usuario, el uso de multiplexores no se nota -> no hay reduccion de calidad ni afecta la QOC
	El medio de transmision tiene una capacidad que es ancho de banda. La suma de los subcanales de entrada debe ser **menor** al ancho de banda
Los multiplexores son ECD y trabajan de a pares. Pueden llevar señales analogicas como digitales, pero hay que adaptar. Laburan en la capa de enlace

## Tecnicas de multiplexado

#### Division de Frecuencias (FDM)

Divide el ancho de banda del canal principal en distintos rangos de frecuencia y le da cada una a cada uno de los subcanales. Cada subcanal tiene su propia portadora.
Existe una banda de señal entre anchos de banda para que no hayan interferencias de frecuencia.
Los multiplexores incluyen a los modem necesarios para hacer esto.
Hay ordenes basicos y superiores de multiplexores en jerarquias analogicas.

##### Formación de un grupo primario
Hay doce canales de 4 kHz y cada uno es modulado en
amplitud con una portadora diferente.
Se forma un grupo primario de 60 a 108 kHz.

##### Formación de grupos superiores de las jerarquías analógicas
Los grupos básicos se van modulando para obtener grupos
superiores que transportan hasta 2.700 canales telefónicos.

![[Pasted image 20250428104427.png]]
Esto tambien lo usan los sistemas GSM.

###### Division de frecuencias ortogonal

La técnica OFDM envía un conjunto de subcanales con ondas portadoras ortogonales de diferentes frecuencias separadas poranchos de banda pequeños.
Al ser ortogonales no se interfieren a pesar de la cercanía.
Cada una se puede modular por QAM o PSK.
Aplicaciones:
- Redes inalámbricas IEEE 802.11a, g y n (Wi-Fi).
- Redes de telefonía celular de cuarta generación (4G).
- Acceso de banda ancha móvil: IEEE 802.16e (WiMax).
- Sistemas para transmisión digital de señales de vídeo (TVDT).

#### Division de Tiempo (TDM)

Divide el tiempo en time slots, es decir espacios fijos. Siempre respeta un orden. Si el medio es analogico, tengo que usar un modem para digitalizar. Aca importa el sincronismo, porque la idea es darle un tiempo especifico a cada transmisor para que no se mezclen las comunicaciones.
Lo que mando son tramas que cada subcanal llena de informacion.

##### Entramado de bits
Cada período de tiempo o slot se ajusta para que transporte un solo bit de cada terminal (dígito por dígito).

##### Entramado de caracteres
Se usa para señales compuestas por un grupo de caracteres que deben mantener su integridad.

##### Formacion de grupos basicos
En la norma europea las señales de voz se codifican en PCM en 64 kbit/s (canal E0). Se forman grupos de 30 canales de voz y dos canales adicionales para sincronismo y señalización.
32 x 64 = 2.048 kbit/s, aproximadamente 2 Mbits/s (canal E1).

En la norma americana las señales de voz se codificaban en PCM en 56 kbit/s pero luego pasaron a 64 kbit/s(canal T0). Se forman grupos de 24 canales de voz con un sincronismo resultando 1.544 kbit/s, aproximadamente 1,5 Mbits/s (canal T1).

##### Formacion de ordenes superiores
La primera generación de TDM son los Sistemas Plesiócronos (casi sincrónicos) porque tienen una tolerancia amplia con las tramas (pueden variar +/-50 partes por millon). El conjunto de los distintos niveles forma la Jerarquía Digital Plesiócrona (UIT - T en Recomendación G.701).

##### Jerarquia digital preisocrona

- Pleisocrono significa casi digital. Cada jerarquia tiene su propio tiempo y tengo que desmultiplexar todo para obtener la info del canal n
- El primer nivel es el grupo basico
- cada vez que agrupo tengo que agregar mas info porque los relojes de un nivel son distintos a los demas
- Poco flexible -> para acceder a una señal tengo que demultiplexar todo
-  Duracion de la trama varia segun nivel
- Los tipos de jerarquia son americana y europea

##### Jerarquia digital sincronica (sdh)

- Mas flexible y sensilla
- Los relojes son iguales para todas las jerarquias
- Es compatibles con demas jerarquias.
- Mas control, gestion y mantenimiento
- Equipos add drop y cross connect para agregar y sacar cosas de las tramas
- Puedo incorporar PDH con contenedores visuales
- Gran capacidad de transmision
Trama SDH
![[Pasted image 20250428111546.png]]


#### Division de Tiempo Estadistico (STDM)
Que pasa cuando un canal no ocupa su trama como deberia? Esta soluciona ese problema y es mas eficiente.
- Asignacion estadistica de tiempo segun la base estadistica de cada terminal
- Aprovecha todos los tiempos
- Asignacion por demanda de Ranuras
- Le asigno tiempos distintos a cada terminal

##### Redes opticas
Nodos interconectados por enlace de fibra optica. Nos da funciones de transporte, multiplexacion, enrutamiento y gestion. Esta en la capa de transporte optica que esta en la capa fisica del modelo OSI. Ventajas 
- Grandes anchos de banda.
- Compatibles con los servicios de voz, datos y vídeo.
- Avances tecnológicos continuos, en especial en DWDM.
- Cables construidos con muchas fibras .
- Son inmunes a las interferencias electromagnéticas.
- Poseen tasas de errores reducidas.
- Atenuación muy baja, permite grandes distancias sin amplificadores.
- Mayor seguridad que los enlaces de cable de cobre o los inalámbricos.
#### Division de Longitud de Onda (WDM)

Transmite varias longitudes de onda (o colores en simultaneo). La velocidad de transmision va de 2,4 a 40Gbps. Puedo aumentar la velocidad sin aumentar la cantidad de canales.

La frecuencia disminuye cuando aumentan los rayos x por rayos gamma.

**DWDM** -> amplifica las longitudes de onda
**CWDM** -> 

**Amplificadores ópticos**
La propagación a través del sistema sufre atenuaciones debido a las fibras, los acopladores, multiplexores, transponder, etc. Para restaurar el nivel de calidad se utilizan regeneradores que convierten señales ópticas a eléctricas y nuevamente en ópticas.
Actualmente se usan amplificadores ópticos que no requieren la conversión óptica- eléctrica–óptica y permite transmitir señales ópticas a distancias mucho mayores.
Hay de tres tipos:
- de fibra dopada -> Usan fibras dopadas con tierras raras, en particular erbio ionizado en forma trivalente (erbio Er3+). Utilizan el fenómeno de emisión estimulada, que se concentra en la misma dirección y sentido del haz de luz que actúa como estimulador.
- Raman -> Utilizan el efecto Raman que es una interacción no lineal entre la señal óptica y una señal generada por una bomba de gran potencia implementada con diodos láser. Las fibras monomodo usadas con amplificadores Raman no requieren ser dopadas con tierras raras.
- semiconductores -> Son diodos láser sin espejos finales con fibras unidas en cada extremo. Poseen una capa antireflectante y una guía de onda cortada en ángulo para evitar que se comporte como un láser. Comparados con los EDFA, tienen menos ganancia, altas perdidas por acoplamiento, mayor factor de ruido, fuerte dependencia de la polarización y un comportamiento alineal.
**Anillos opticos**
Las redes con anillos ópticos permiten que ante un corte en unaparte del anillo, el tráfico automáticamente se redirecciona para que las dos partes en las que el anillo quedó dividido
permanezcan con servicio. Los tiempos para esta conmutación son menores a los 50 milisegundos.

Los equipos cross-connect permiten:
- la conmutación de las tramas, o parte de ellas
- transportar tramas desde un anillo hacia otro anillo adyacente
Tipos de redes opticas de transporte:
- Redes de Acceso.
- Redes Metropolitanas.
- Redes Regionales (LH) Alta Capacidad o de Larga Distancia.
- Redes Continentales o Submarinas (ULH) de muy Alta Capacidad o de Ultralarga Distancia.
#### Division de Codigo (CDM)

Se usa mas en telefonia y en redes wifi
En vez de mandar una señal fuerte y angosta mando una con menor potencia pero gran ancho de banda.

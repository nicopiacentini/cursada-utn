## Unidades de medicion y calculo de enlaces

La señal se atenúa, distorsiona y tiene ruido y debe mantenerse en valores etables para ser interpretada. Esto se puede regenerar con repetidores regeneradores para digital y amplificador para analógica.

El **amplificador** mide en veces, es decir G = Ps/Pe y Perd = Ps/Pe para las perdidas

Amplificadores en cascada, la potencia de salida de uno es la de entrada de otro. Para obtener la potencia total, multiplico todas las ganancias. Con un atenuador hago lo mismo

La ganancia y la perdida es en decibeles

	G(db) = 10log(Ps/Pe)

	Perd(db) = -10log(Pe/Ps)

Nivel de potencia -> mide la potencia respecto de un miliwatt

	Dbm = 10log(Ps[mW]/1mW)

Nivel de potencia -> mide la potencia respecto 0,775volt

	Dbu = 20log(Vs[mV]/0,775)

Otro nivel de potencia o tencion -> dBmV referencia de un milivolt

	dBmV = 20 log(Vs/1mV)

### Calculo de enlases
Potencia de transmisor – atenuaciones + ganancias > Sensibilidad del receptor

Esto se tiene que dar para que funcione el enlace

dBm -+ dBm = dB

Atenuacion del cable -> [dB/m]

Frecuencia de trabajo de cable -> tabla. Si no esta el punto que busco, interpolación lineal. Tomo dos puntos y lo trato como una recta. Luego con esos 2 puntos, creo una recta y aproximo con la misma

#### Efecto pelicular 
Si aumento mucho la frecuencia, por el centro de mi conudctor deja de circular corriente, entonces tengo menos sección -> se disminuye la resistencia del conductor y el calculo cambia -> P (atenuación)= a/f^(1/2), donde f es la frecuencia y a es cte dependiente de sección y material

Perdida en el espacio libre = 20 log(distancia[km])

## Transmision en banda base

Para señales digitales que se envían por cables de cobre. Son generadas por una fuente de información y no sufren ningún tratamiento de modulación o amplificación a su salida. Extiende el alcance de las señales digitales. Sirve para adaptar y disminuir la corriente continua de señal, señal autosincronizante, detectar presencia de señal en línea, acomodar espectro de señal. No se puede lograr todo en simultaneo


Aspectos a considerar

- Importancia de frecuencias bajas
- Envio de señal sincronismo
- Umbral de decisión
- Dependencia entre símbolos
- Potencia transmitida
- Ancho de pulsos y ancho de banda
- Componente continua
- Ancho de banda
- probabilidad de error

### Clasificación de señales

#### Según polaridad

o   Unipolar +0 o -0 nunca toma 0

o   Polar +- toma dos valores.

o   Bipolar + 0 -, toma 3 valores, tencion positiva y negativa para 1 y 0 para el 0

#### Segun ancho de pulso

o   Señal que no retorna a 0 ancho de pulso  = Instante significativo (Is)

o   Señal retorna a 0 pulso < Is. Es mas fácil darse cuenta que me mandan  1 1. Mejora el sincronismo pero me baja el ancho de banda de la señal


##### Codificacion manchester

- Bit 1 es una transición positiva en mitad del intervalo significativo

- Bit 0 es transición negativa en mitad del intervalo significativo

##### Codigo manchester diferencial o bifase, la información esta en el cambio de estado

- para enviar un cero: se efectúa una transición al inicio y en la mitad del intervalo significativo

- para enviar un uno: solo hay transición en la mitad del intervalo significativo.

##### Codigo Miller

- Para el uno hay una transición en la mitad del intervalo significativo.

- Para el cero hay una transición al final del intervalo si el bit siguiente es cero (en caso contrario no habrá transición).

##### Codigo high density binary 3

- El HDB-3 se basa en el denominado código AMI.

- Es un código bipolar sin retorno a cero con tres niveles [+], [–] y [0] para representar la información binaria.

- El cero se representa siempre con polaridad cero, y el uno, con polaridad alternada [+] y [–].

No posee componente de continua, ni bajas frecuencias. Cuando aparece una larga secuencia de ceros se pierde La posibilidad de recuperar la señal de reloj. Cuando hay cuatro ceros se reemplaza la secuencia por otra (000V ó R00V) que depende de la historia. Para elegir la frecuencia, se cuenta la ultima cantidad de 1 entre la ultima violación y la actual, si es par uso la segunda y si es impar uso la primera

##### Código 4B-3T

Para 140 Mbps sobre cable coaxial, se emplean otros códigos como el 4B-3T (4 binario a 3 ternario). Es un código ternario, dado que reduce 4 bits a 3 bits, mediante el empleo de tres niveles. Se reduce el ancho de banda necesario en un 25%.
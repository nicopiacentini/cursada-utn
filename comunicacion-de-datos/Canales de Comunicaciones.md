Se estudian de 2 aspectos
#### Canal fisico
Investigo las caracteristicas electricas (circuitos, impedancia, etc)

#### Canal de informacion
Se estudian las especificaciones  tecnicas y logicas de transmision de informacion. Tecnicas de codificacion, redundancia, etc. Esta vinculado a la teoria de informacion. Administra el canal fisico. Usa como criterio de eficiencia la velocidad de transmision y la calidad de la misma.

##### Los canales pueden ser Reales (con ruido) o ideales (sin ruido)

Los canales reales sufren de distorcion y atenuacion por distancia recorrida y por efectos reactivos

**Relacion señal ruido** -> 10log(potenciaSeñal/potenciaRuido)
**Factor de Ruido** -> señalRuidoDeEntrada/SeñalRuidoDeSalida

##### Acondicionamiento de canales analogicos
Los canales analogicos presentan fenomenos fisicos que alteran sus caracteristicas:
- Señales de retorno (eco) -> Se resuelve con cancelador de eco. Es el reflejo de la señal del transmisor en el receptor, que vuelve al transmisor
- atenuacion y distorcion -> resuelvo con ecualizador
Producen comportamiento no lineal en la curva de respuesta en frecuencia. Tengo que introducir equipos especiales (como ecualizador) al canal

#### Ecualizador
Proceso de compensación de un canal de comunicaciones por los efectos que produce la distorsión. La distorsión puede ser en amplitud (atenuación) o en fase
(retardo de grupo).
Los ecualizadores son circuitos que agregan distorsión en las
bandas donde esa es menor, de forma que sea igual en toda
la banda y se pueda compensar.

#### Teorema de nyquist (IDEAL)
Fn > 2fmax 
En corto, Fn es frecuencia de nyquist o sea de muestreo. El teorema me dice que si muestreo con una frecuencia mayor al doble de la frecuencia maxima de la señal, puedo recrear la señal. Tambien existe Fn = 2AB, donde AB es el ancho de banda de mi señal.
##### Capacidad de un canal con multinivel
C = 2 * anchoDeBanda * log2(cantidadDeNiveles)

anchoDeBanda es del canal

**n**max  = (1 + S/N)^(1/2)

Entonces para un canal real la capacidad es 

C = 2 * anchoDeBanda * log2((1 + S/N)^(1/2)

En vez de S/N, puedo usar BER si el canal es digital

El capacidad del canal se torna en una asintota a meida que voy aumentando estos parametros. Esto se da porque al aumentar el ab, aumenta el ruido
C = S/α * log2

e = 1,44 * S/α

#### Fenomenos que afectan a los canales de comunicaciones

- Atenuacion -> Disminuye la intencidad de la señal util. Es la relacion entre la potencia de salida y la de entrada
	- Atenuacion [Db] = 10log(p2/p1)
-  Ruido -> distorcion no deseada en mi señal
	- termico -> N  = kTB
	- diafonia -> Acoplamiento inductivo entre señales que transportan señales. Si lo trenzo disminuyo su poder
		- Next -> mide el crosswalk en el extremo donde se inyecta
		- Fext
	- Impulsivo -> Dificil de detectar su origen, se produce en intervalos irregulares con corta duracion pero mucha amplitud
	- Intermodulacion -> Cuando multiplexeo en frecuencia, los cambios en temperatura pueden modificar la frecuencia y sobrepasar la barra de proteccion.
	- Ruido de linea
- Distorcion
	- Por atenuacion
	- por retardo de grupo -> armonicas de una señal afectan armonicas de otra señal
	- Por efectos meteorologicos
##### Tasa de errores para digitales BER
Limitantes fisicos -> ancho de banda y ruido.

### Deteccion y Correccion de errores
Cuando hago control de errores detecto y corrijo errores. Necesito mandar datos adicionales y darle tiempo a esto. Dependiendo del servicio que de me importa o no hacer esto.

Redundancia -> bits sin informacion
Eficiencia = 1 - Redundancia -> tantos bits de info sobre el total

Si aumento velocidad de transmision, me puede generar mas error y aumenta el BER


#### Errores en la transmision de datos




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


## Errores en la transmision de datos
Son alteraciones o mutilaciones en los mensajes recibidos. Estos pueden ser
- De operador a operador -> puedo pedir repeticion
- De maquina a maquina -> esto ya es en un programa. Para solucionar puedo
	- ignorar
	- Detectar e informar
	- Detectar y pedir reenvio
	- Detectar y corregir en el destino


### Tipos de errores

#### Segun distribucion en el tiempo

- Errores aislados ->afecta a un bit
- Errores en rafagas -> afecta a varios bits no necesariamentes juntos
- Errores  agrupados -> afecta a varios bits agrupados

### Tratamiento de errores 
Se envian datos en el medio que agregan redundancia que logra mayor proteccion contra errores pero disminuye la eficiencia del mensaje. En sincronica, a bloque mas pequeño, menos eficiencia pero me molesta menos el error. La redundancia de mi codigo de caracter se suma a la redundancia de bits que use segun mi metodo de deteccion de errores


### Deteccion de errores

#### Por control de paridad
Le sumo un bit de paridad a mi mensaje y la suma de todos los bits tiene que ser par o impar segun se consensa con el receptor del mensaje. Este bit de control **no transporta informacion**. Hay 3 metodos:

##### Control de paridad vertical
A cada caracter le agrego el bit de paridad vertical y establezco paridad con receptor. Lo malo es que no puedo detectar 2 errores en simultaneo. 

##### Control de paridad bidimencional o longitudinal
Es el de mayor redundancia dentro de los de paridad. Implementa un grupo de N caracteres donde cada uno tiene un bit de paridad vertical. A ese mismo grupo le agrego un bit por caracter y estos bits son los de paridad horizontal. Entonces por N caracteres tengo un bloque de bits de paridad horizontal. Si se produce un error me dice especificamente que bit es porque estan mal para ese caracter el bit vertical y el bit horizontal. Es una paridad doble, para cada caracter y para cada grupo de primer, segundo, tercer, etc de caracteres

##### Control de paridad ciclica
Hay 2 bits de paridad por caracter. Uno para los bits primero tercero y quinto y otro para los bits segundo, cuarto y sexto


#### Por agregado de informacion redundante o por polinomios
El nodo transmisor aplica un algoritmo a los datos y se genera informacion redundante compuesta por k bits. El receptor recibe este resumen y los datos. El receptor aplica el mismo algoritmo y obtiene otro resumen. Si ambos resumenes son iguales, **la informacion es correcta**.
Hay 2 metodos checksum y redundancia ciclica

##### CheckSum
Se usa en el protocolo Tcp/Ip
Primero agrupo todos los bytes adyacentes en el transmisor agrupados de a 16 bits o 2 bytes. Luego los sumo con complemento a 1. El valor obtenido se pone en el campo de bits de verificacion. El receptor recibe los datos y el campo de bits de verificacion. Luego, hace este mismo calculo y si coinciden los datos, se dice que la transmision NO tuvo errores.

##### Redundancia ciclica
Es un metodo polinomial que usa una funcion matematica. El mensaje que mando son bits y lo voy a transformar en un polinomio generador que ya estan normalizados. Estos intentan que el resto de dividirlo por varios numeros sea distinto para evitar colisiones. Tambien necesito un polinomio auxiliar para multiplicar el polinomio original y dividir por el mensaje. Cuando envio el mensaje, tambien envio el resto. En el receptor, uso los mismos polinomios pero agarro el mensaje por completo. Luego al dividir por los polinomios, si me da resto 0, el mensaje se envio correctamente. 
###### Procedimiento
- tomo un polinomio de grado n, mensaje a transmitir
- defino un polinomio auxiliar de grado r (generador) estandarizado
- multiplico polinomio auxiliar 

### Correccion de errores
Detecto el error y lo corrijo. Puedo corregir hacia atras o hacia adelante

#### Correccion hacia atras
Pido el reenvio del mensaje mediante el metodo ARQ. Existen mensajes de aceptacion (ACK -> me llego bien el mensaje) o rechazo (NAK -> me llego mal el mensaje). Hay 2 variantes. La diferencia recae sobre donde mando la confirmacion de recepcion, si sobre 1 o *n* mensajes

##### Stop and wait
Mando un bloque de datos y espera a que el receptor envie una confirmacion positiva o negativa de recepcion de mensaje. Es poco eficiente

##### Sliding Windows
El receptor tiene un buffer de un maximo de mensajes. El receptor informa sobre correcta o incorrecta recepcion de n mensajes. Si sale mal, se reenvian los n mensajes

**PiggyBack**
Si la transmision es full duplex, tanto B como A reciben y envian datos. Si A envia a B, B en vez de mandar el ACK de una, lo manda junto con los datos que transmite.
#### Correccion hacia adelante
El receptor no sabe transmitir. Lleno el mensaje de redundancia para poder corregir. Esta redundancia es enviar el mensaje 2 veces. Si ambos llegan con error no puedo recibir el mensaje.

###### Codigos autocorrectores
Codigos con suficiente redundancia para poder detectar y corregir errores en la transmision. Esta redundancia va desde un par de bits hasta retransmitir el mensaje por completo

###### Distancia de hamming
Es el numero de bits que difieren 2 secuencias binarias de misma longitud. La minima es la menor distancia en un codigo determinalo. Determina la cantidad de errores que puedo detectar y corregir. Para un determinado codigo, mientras mas combinaciones tengo, mas distancia de hamming pero mas redundancia

ErroresDetectados = DistHammingMin - 1
ErroresCorregidos = (DistHammingMin - 1) / 2

#### Codigo de Hamming
Detecta y corrige errores metiendo bits de paridad entre los de informacion y cada bit de paridad gestiona n bits de informacion. 
Para los bits de paridad, el 0 implica que NO hubo error.

#### Codigo Hagelberger
Usa 6 bits de paridad

#### Codigo de Bose-Chauduri

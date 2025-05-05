### Compresión con pérdida

Se caracterizan por comprimir archivos multimedia (imagenes, audios y videos), por la forma que tienen de guardarse en memoria este tipo de archivos.

#### Video en modo texto

**Memoria de video** -> Habia una porcion de memoria destinada a esto. Lo que veo en el video esta en una memoria determinada y lo que veo en la pantalla es un vector.
- Inicialmente cuando empieza la computacion, la pantalla era de 25 x 80 
- Cada caracter ocupaba uno de esos espacios
- En total necesito 25 x 80 x 8 bits = 1,6Kb
- Ademas necesito agregarle atributos a los caracteres, como *i* o **b**. Entonces necesito 2 bytes por caracter -> los high order bits para los atributos y los low order bits para el caracter
- Ahi llego a los 3,2Kb
Esta memoria de video en maquina de escritorio esta en vram y en una laptop esta en ram.

Ratio de refresh -> n veces por segundo, sendo n el ratio de refresh, se toma la memoria de video y se muestra por pantalla.

#### Video a color 

Ahora uso un byte para definir un color -> 256 colores posibles. 
Ahora necesito 3 bytes para representar un caracter
8 bits para color, 8 bits para atributos, 8 bits para el caracter como tal

#### Aparicion de la computacion grafica

La computadora deja de ser 25x80, ahora aparecen los **pixeles**, un punto que es unidad minima de representacion. Este pixel va a tener un atributo que es encendido y apagado. 
La cantidad de pixeles en mi pantalla es la **resolucion**. Y cada pixel me ocupa un byte ahora en vram.
Entonces si tenemos una resolucion de 800 x 600 x 8 bits(encendido/apagado, color, atributo)

**Definicion** -> con que calidad voy a ver a los pixeles. Dependiendo la cantidad de bytes que use por pixel, se ve mejor o peor
	true colours de 32 bits -> 4 bytes por pixel
	true colours de 64 bits -> 8 bytes por pixel

### Video
**Calidad de video** -> Los videos se graban en una calidad. Depende activamente de la **definicion** y la **resolucion**

Digital video -> una hora pesa como  100gigas

#### Compresion de video (con perdida)
Transformo el audio y video cambiando la resolucion para efectivamente reducir su tamaño.
- Cambio de definicion de colores -> paso de tener 100 tonalidades de un color a 50 y no puedo volver para atras porque no se como era.
- Cambio de resolucion de colores -> unifico los pixeles para que 2 pixeles representen 1 por ejemplo y efectivamente bajo la calidad del video

Conversores o compresores multimedia -> cambian el formato de el archivo multimedia para que ocupa menos

## Integridad y Encriptacion

**INTEGRIDAD** -> Me garantiza que un archivo se mantenga igual ante un proceso de transformacion. El proceso de integridad me chequea esto

**ENCRIPTACION** -> Proceso que modifica el contenido del archivo para que mantenga el contenido establecido, pero que el mismo no pueda ser visible en un formato tradicional del mismo.


##### Problema
Cuando se produce una modificación en un archivo a través de un proceso modificatorio se requiere conocer la integridad del nuevo archivo generado. Necesito saber que el archivo generado es igual a lo que tenia.

##### Control de integridad
- Necesidad: Cuando se produce una modificación sobre un archivo, por ejemplo cuando se transmite mediante una red o se copia o se le realiza un proceso de compresiòn y descompresiòn aparece la necesidad de verificar si el nuevo archivo obtenido es igual al original.

- Procedimiento: si bien es cierto que la ùnica forma de verificar que un archivo es igual a otro se requeriría una lectura de ambos archivos con una comparación de uno a uno, existen medios tecnologicos para poder validar la veracidad del archivo sin necesidad de contar con el archivo original.

Lo que busco es que *el tamaño del archivo se mantenga*, que e*l dominio de contenido sea el mismo* y la *posicion de los caracteres sea igual*.

#### Metodo checksum

Para representar esto puedo usar un POLINOMIO
- El tamaño -> grado del polinomio
- La posicion -> donde este la x
- El contenido -> los coeficientes del polinomio

Por ejemplo, si tengo un archivo que tenga "hola" creo el polinoimo hx^0 + ox^1 +lx^2 +ax^3
 Me quedo con sus raices. Transformo al archivo y construyo el polinoimo y tambien obtengo las raices. Si la suma de raices es igual, los archivos son iguales. La raiz no puede ser ni 0 ni 1.

El problema estaria en que me puede dar que son iguales cuando no lo son.

En realidad, el checksum se hace a partir de bits y crece mucho el valor del polinomio.
lo que queda es algo asi:
	si tengo que representar h como 00110011 me queda: 
		0x^0 + 0x^1 + 1x^2 + 1x^3 + 0x^4 + 0x^5 + 1x^6 + 1x^7

Tomo una raiz que este en el intervalo (0;1)

#### Metodo CRC
Control de redundancia ciclica. Utiliza el crc pero busca el *divide and conquer*. Parte el archivo en pedazos para hacer los polinomios y que me facilite la busqueda de la raiz y no me quede un megapolinomio.
Controla una redundancia por ciclos, siendo una redundancia porque me guardo la suma en la compresion mas alla de que el archivo no lo use. Es ciclico porque cada n bits me hago el polinomio y hago este chequeo.

## Encriptacion
Busco ocultar la informacion contenida en un archivo para que no pueda ser legible. No modifico ni el tamaño ni espacio ocupado por mi archivo. Hay muchas formas de hacer esto. Existen metodos con retorno (puedo volver al archivo inicial) o sin retorno (no puedo volver al archivo original).  En realidad, yo tengo un programa que se abre con clave y esta esta encriptada. Para acceder al programa, este la encripta y compara con la que tiene.

### Procesos de encriptacion
- Desplazamiento -> desplazo los caracteres de mi archivo segun una funcion
	Cambia de lugar los bits de mi archivo, por que es mas facil que cambiar caracteres de lugar.
- Reemplazo -> reemplazo algunos caracteres de mi archivo segun un patron donde el reemplazo es fijo o variable.
	- Reemplazo fijo -> reemplaza el algoritmo sin intervencion del usuario. Toma lo que tiene que encriptar (como un string), y reemplaza determinados caracteres siguiendo un patron
	- Reemplazo variable -> el usuario nos da una clave para encriptar y se copia al contenido del archivo o valor a encriptar.
- Mixto -> uso un poco de **desplazamiento** y de **reemplazo**

##### Header
Esta al comienzo del archivo y me describe lo que viene atras. Los archivos de texto no tienen header. Cuando encripto un zip, encripto su header.
Apertura de archivos -> si mi archivo tiene un formato conocido por el operativo como .xsxl, no me pregunta que programa quiero usar.
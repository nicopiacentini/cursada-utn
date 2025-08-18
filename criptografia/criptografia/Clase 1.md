#### Mischellaneous
1 parcial multiple choice + tp de investigacion

# Elementos de criptografía, criptología clásica y stenografia
###### Consepcion inocente de la comunicacion
Lo que la gente cree -> no necesariamente digital o con computadoras. Tiene el problema de que cualquier mensaje puede ser interceptado. Existe un *canal de comunicacion* para que se pueda enviar el mensaje. El canal es exclusivo. ESTO EN REALIDAD NO ES ASI

#### Proceso de comunicacion

- Emisor
- Canal
- Mensaje
- Receptor

El **Emisor** le manda un **Mensaje** al **Receptor** mediante un **Canal**. Los mensajes se mueven a traves del canal. El canal es inseguro por definicion -> es interceptable y otro puede verlo. El mensaje es fisico, es decir, existe y se puede modificar.

Entonces la criptografia busca dar seguridad al *canal* para que no se *modifique* o *acceda* al **mensaje**.

El canal puede sufrir de ruido
#### Infraestructura de red
El equipo del emisor envia un mensaje a una *red de datos* (basicamente una red de repetidores conectados por cable donde el mensaje rebota entre estos) que luego envia el mensaje al equipo del receptor. Existen rutas de routers para rebotar los mensajes hasta cualquier lado.

- El mensaje del emisor se parte en *paquetes* que son enviados por la red de datos. 
- Los *sistemas autonomos* pueden enviar o recibir mensajes

### Seguridad de la informacion
Compuesta por estas tres cosas (segun ISO):
##### Confidencialidad
Que nadie que no deba acceda a la informacion. Depende de legalidades y acceso a la informacion. **La informacion solo puede sser leida por entidades autorizadas**. Ojo pueden pincharme la informacion pero no van a poder abrirlo/ leerlo

##### Integridad
Que si guardo algo de una forma se mantenga de esa forma. Que se mantenga integro. **La informacion solo puede ser modificada por las personas autorizadas**. Es poder detectar que se cambio algo.

##### Disponibilidad
Que las cosas que yo guarde o persista realmente se persistan y esten disponibles para ser usadas en un futuro. **La informacion debe estar disponible cuando sea requerida**. Es poder recuperar la informacion que tenia guardada incluso si se rompe un servidor.

### Criptografia
Ofrece/permite lo siguiente
- Confidencialidad
- Integridad
- Autenticacion -> Mecanismo que permite comprobar la identidad de una entidad. Es la certeza de que quien este del otro lado sea quien debe ser.
- No repudio -> si se usa autenticacion, se asume la imposibilidad de la suplantacion de la identidad

La disponibilidad en este caso esta dada por las redes de datos, computadoras, etc. La criptografia **no da** disponibilidad.


### Proteccion de la informacion
A la informacion le aplicamos criptografia para protegerla. En teoria, la criptografia hace imposible romper la informacion cuando se usa correctamente.
Entonces la informacion puede estar en:

##### Reposo
La informacion no se mueve, esta persistida. Celulares, computadoras, pendrives, bases de datos, etc. Para proteger la informacion puedo hacer
- Cifrado de archivos
- Carpetas seguras
- cifrar particiones en disco
- cifrar disco completo

##### Transito
La informacion se esta moviendo. Camaras de vigilancia, comunicacion por telefono, etc.
Para proteger a la informacion puedo:
- Cifrar capas de red
- Utilizar protocolos de comunicaciones
- Cifrado de aplicacion

##### Proceso
La informacion se esta creando.

Criptografia homomofrica -> cifrar informacion y poder manipularla sin descifrarla.


### Criptografia vs Criptoanalisis

##### Criptoanalisis
Busca vulnerabilidades y desarrolla ataques a la criptografia

##### Criptografia
Estudia el diseño y propiedades de algoritmos criptograficos y mecanismos de confidencialidad e integridad.

## Modelo matemático de un criptosistema

Un criptosistema puede definirse como el conjunto:

**(M, K, C, Ee, Dd)**

- **M**: conjunto de mensajes en claro (plaintext).
    
- **K**: conjunto de claves.
    
- **C**: conjunto de textos cifrados.
    
- **Ee**: función de cifrado.
    
- **Dd**: función de descifrado.
    

Existen dos grandes categorías:

- **Sistemas simétricos**: la misma clave se utiliza para cifrar y descifrar.
    
- **Sistemas asimétricos**: se emplea un par de claves (pública y privada).
    

---

## Criptografía clásica

La criptografía clásica es principalmente **simétrica**. La clave debe permanecer en secreto y ser compartida entre emisor y receptor. Si se roba, copia o pierde, la seguridad se compromete.

El modelo se compara con una cerradura: la misma llave abre y cierra, y cada cerradura requiere su propia llave.

### Técnicas clásicas

1. **Transposición**: reorganizar las letras del mensaje según un patrón predefinido (ejemplo: Escítala espartana, siglo V a.C.).
    
2. **Sustitución**: reemplazar cada carácter por otro siguiendo una regla (ejemplo: el Cifrado César, usado en la Guerra de las Galias).
    
3. **Cifrado de Vigenère**: combinación de sustituciones polialfabéticas que se consideró durante siglos “indescifrable”.
    

Con el tiempo, se desarrollaron métodos de **criptoanálisis** como el análisis de frecuencias, que permiten romper muchos de estos sistemas.

---

## Códigos y cifras

Es importante diferenciar:

- **Cifrado**: sustituye letras o símbolos de acuerdo a un algoritmo.
    
- **Código**: sustituye palabras o conceptos completos por otros equivalentes (ejemplo: el **Código Navajo** durante la Segunda Guerra Mundial).
    

---

## Hitos históricos

- **Disco de Alberti (1467)**: pionero en la construcción de mecanismos de cifrado.
    
- **San Martín**: durante su formación en España, adquirió conocimientos de criptografía y esteganografía, llegando a emplear “tintas invisibles” en sus comunicaciones.
    
- **Cifrado Francmasón (PigPen)**: empleado en el siglo XVIII, aún visible en inscripciones.
    
- **Máquina Enigma (1918–1945)**: usada por las fuerzas alemanas en la Segunda Guerra Mundial. Fue quebrada en Bletchley Park por criptógrafos y matemáticos, entre ellos Alan Turing.
    
- **Cifrados sin resolver**: entre los más famosos se encuentran el **Manuscrito Voynich** y los mensajes del **Asesino del Zodiaco**.
    

---

## Esteganografía

La esteganografía busca **ocultar la existencia misma del mensaje**.

### Ejemplos históricos

- **Heródoto (siglo V a.C.)**: un mensaje fue tatuado en la cabeza afeitada de un mensajero, oculto hasta que el cabello volvió a crecer.
    
- **Tablillas enceradas**: los griegos escribían mensajes ocultos bajo una capa de cera.
    
- **Tintas invisibles**: jugo de limón o naranja, y en tiempos modernos, tintas ultravioletas.
    
- **Micropuntos (Segunda Guerra Mundial)**: textos reducidos al tamaño de un punto imperceptible pegados en cartas.
    

### Esteganografía moderna

Hoy, la técnica se aplica en entornos digitales. Es posible esconder archivos completos (como capítulos de un libro) dentro de imágenes, audios o videos. Esto se utiliza tanto para fines legítimos como para actividades ilícitas.
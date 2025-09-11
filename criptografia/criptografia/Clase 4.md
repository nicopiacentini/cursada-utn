## Era de las maquinas 

#### Cifrado de discos
Cada disco tiene su propio alfabeto y se gira para que en un renglon se ponga la palabra, luego la *key* esta en reordenar los discos para descifrar el mensaje.
#### Enigma americana
Modelo de rotores mecanicos
### Principios de Kerckhoffs
Son una serie de principios para cifrar con maquinas
1. La seguridad no debe estar en la maquina, el secreto debe estar en la seguridad de la clave. Entonces, *la seguridad esta en la clave*
2. La clave debe ser aleatoria o lo mas aleatoria posible. Una clave no aleatoria es muy **vulnerable a la fuerza bruta**. A eso se lo conoce como ataque de diccionario. 
3. La clave debe ser tan larga como se pudiera
#### Maquina enigma
Rotor de la maquina enigma -> usa electricidad para permuvulnerable a la fuerza brutatar las letras.
Cifrado reciproco -> el cifrado de caracteres es por pares, es decir, si el cifrado de *u* es *c* entonces el cifrado de *c* es *u*.
Fue descifrada originalmente por polacos.
###### Funcionamiento
Al apretar una tecla, la corriente viaja por cobre hasta llegar al primer rotor. El primer rotor matchea una letra a otra y segun la orientacion del rotor que le sigue, matchea a otro caracter distinto. Sigue asi hasta llegar al ultimo rotor y luego vuelve al inicio. Entonces *la clave esta en la posicion de los rotores*. Al final hay un reflector que garnatiza la reciprocidad del cifrado. Al final existen 26^3 \* 25^3. Parte de la clave estaba dada tambien por permutaciones entre caracteres mediante cables.

### Esteganografia
Es esconder mensajes ocultos dentro de otros mensajes. Usa escritura con tintas invisibles o rejillas.
##### Clasica
- Rejas
- tinta invisible
- micropuntos
##### Moderna

#### El esquema de esteganografia
![[Pasted image 20250910201358.png]]
Dentro de un mensaje de caracteres se oculta otro mensaje distinto. NO REQUIERE CIFRADO.
- Tapadera -> envase, mensaje que si se ve de afuera que contiene al mensaje secreto
- Mensaje -> el mensaje oculto
- Clave -> la clave para esconder el mensaje
- Estego-funcion -> mete el mensaje en la tapadera creando el *estego-objeto*
- Inversa-estego-funcion -> hace la inversa y obtiene el mensaje a partir de la clave.
# Teoria matematica de informacion y comunicacion
La crea Shannon. Da el sustento teorico de la automatizacion de la informacion.
### Teoria matematica de la informacion
La base esta sobre la idea de probabilidades. Ademas, se indica que *los hechos mas improbables aportan mas informacion*. La cantidad de informacion que aporta un evento *e* que tiene una determinada probabilidad es:
I(e) = -logb(prob(e))
- b = 10 -> Hurtley
- b = e -> Nat
- b = 2 -> bit
Si prob(e) = 0 es un evento imposible
Si prob(e) = 1 el evento es cierto
Ninguno de estos 2 aporta informacion y no interesan.
1 Bit es la menor cantidad de informacion que se puede tener. Esto es asi porque la menor cantidad de eventos posibles (en equiprobabilidad) son 2. Como ambos tienen 0,5 probabilidad de pasar, ambos aportan lo mismo, es decir, 1 bit.
 - Si la fuente de informacion es completamente aleatoria, entonces puedo usar bit
 - Si la fuente de informacion es equiprobable, se usa shannon.
#### Entropia
Grado de entropia de la informacion. Nos dice el nivel de alatoreidad de la informacion de la fuente. Nos dice la cantidad de signos o caracteres promedio que pueden usarse para codificar la informacion optimamente. La idea principal esta en que mientras mas probable sea el evento, menor sea su codigo y de esta forma se mande la misma informacion en la menor cantidad de bits posibles.
Se puede entender tambien como la cantidad de "bits" como informacion que manda por mensaje.
![[Pasted image 20250924195055.png]]
Es una suma ponderada de la informacion total que viene de la fuente
Se mide en las mismas unidades que la informacion.
#### Redundancia en el codigo
Agrego redundancia para evitar errores en el codigo. Se les llama codigos detectores de errores. Por ejemplo:
- paridad
- checksum
Sistema de secreto perfecto -> la alatoriedad es maxima entonces es irrompible.
## Criptografia Simetrica
Utilizo la misma key para encriptar y desencriptar.
### Cifrado en flujo/cadena/streamcipher
Se trabaja bit a bit y se cifra bit a bit. En cambio blockciphers cifran de a grupos de bloques.
#### Cifrado de Vernam
La llave es una secuencia cifrante, que es una secuencia de pulsos binarios. Por ejemplo, la clave puede ser `10101`. Luego la clave se repite hasta llegar al largo del mensaje a cifrar. Despues se realiza un Xor entre el mensaje y la clave repetida.
![[Pasted image 20250924204223.png]]
Luego para descifrarlo, del otro lado se toma la misma clave repetida hasta el largo del mensaje y al mensaje y se hace el Xor de vuelta llegando al mensaje original.
Tienen entropia maxima
###### Registros de desplazamiento con realimentacion lineal LFSR
Trabaja con n registros de memoria que van rotando como circulo el valor que llevan. Cuando roto, el ultimo bit es *el que uso para cifrar*, los otros n - 1 se suman (Xor) para llenar el espacio que dejo. En realidad no se suman todos sino que solo algunos segun indique el codigo.Se puede manejar con una recurrencia homogenea lineal de orden 3:
an = an2 + an3
Tambien se puede representar como un polinomio caracteristico:
p(x) = x^2 + x^3
Periodo = 2^L
L = longitud del periodo.
Ahora al ser recurrencia lineal, con gauss-jordan se puede resolver rapido.
#### LFSR sin linealidad -> A5/1
Basicamente usar varias claves LSFR para que sean de input de h, funcion no lineal. Entonces es imposible de descifrar con linealidad. Esto se conoce como *combinador no lineal*. Lo que tambien saca la linealidad es un *bit central* que en cada clave decide si se rota o no.
#### Filtrado no lineal
De un registro que si es lineal, extraigo algunos bits para que no sea lineal. Luego eso lo meto dentro de otra funcion no lineal.
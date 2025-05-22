### Formas de medir errores
BER : bitsErroneos/bitsTotales

## Politicas de Tratamientos de errores (luego de detectar el error)

#### Eliminar el paquete
Esto se suele hacer en etherntet, es de bajo nivel, busca velocidad sobre calidad.

#### Eliminar el paquete y avisar
Detecta el error, elimina el paquete y avisa que lo elimino. Lo usa el IP

#### Eliminar el paquete y pedir retransmision
Lo suelen usar el TCP y el X25

## Politicas de deteccion de errores

#### Paridad

#### BCC
Esta politica agrega un bit de paridad a nivel horizontal (por cada caracter) y a nivel vertical (por todo el mensaje). Ejemplo con paridad par

 A: 0 0 1 1 *0*
 B: 1 0 1 1 *1*
 C: 0 1 1 0 *0*
 D: 0 0 1 0 *1*
 *1* *1* 0 0 *0* 

Entonces envio: 0 0 1 1 *0* 1 0 1 1 *1*  0 1 1 0 *0* 0 0 1 0 *1* *1* *1* 0 0 *0* 

#### CheckSum
Mi objetivo es sumar todos los caracteres por separado. En este caso A + B + C + D = 0111

 A: 0 0 1 1
 B: 1 0 1 1 
 C: 0 1 1 0 
 D: 0 0 1 0

Si llego a tener overflow, lo mando al principio, es decir, al bit 0 y dejo lo demas como estaba.
Una vez que tengo todo sumado, lo complemento a uno y transmito los caracteres con la suma. El receptor recibe los caracteres y la suma. Luego realiza esta misma suma la suma a la suma complementada. si el resultado es 1 1 1 1, esta bien

#### CRC
Tengo que transmistir el mensaje M(x) = 10110101101. Ambos emisor y receptor se ponen de acuerdo en usar el mispo polinomio generador. En este caso G(x) = x^4 + x + 1. Ahora lo paso a binario siendo 10011. Al mensaje original le concateno tantos 0 como el grado del polinomoi generador : 101101011010000
Ahora agarro el mensaje nuevo y el generador y aplico XOR
101101011010000
10011
0010110
.....10011
.....0010111
..........10011
..........0010001
////////.10011
...............00010000
.......................10011
.......................000110  -> ESTE ES MI RESTO

Ahora el transmisior envia el mensaje y el resto, que resto? **0110** porque tiene la misma cantidad de bits que el grado del polinomio generador. La misma cantidad de bits que le concatene al principio al mensaje.
Luego en el receptor, se recibe el mensaje concatenado con el resto y se divide por el polinomio generador. Si da todo 0, no hay errores.

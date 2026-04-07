### Vaciamiento de sistema
Consiste en no cortar la simulacion si se cumplio el tiempo final hasta que no quede nadie en el sistema. Seguir iterando produciendo salidas hasta que Ns = 0. Para que no se produzcan mas entradas TPLL = HV.
Lo debo hacer siempre que pueda. En caso de que sistema no contemple, el metodo de calculo para determinar la permanencia en el sistema NO funciona.
### Metodos de calculo
$$SPS = \sum{\Delta_it ~*~  Ns_i}$$
Donde $\Delta t_i$ Es el intervalo entre eventos i e i + 1. Este metodo si funciona cuando no hay vaciamiento ya que se acerca mucho mas al resultado real que el otro sistema incluso cuando no se puede registrar el ultimo tiempo de salida.
A nivel diagrama de flujo tengo que usar un acumulador de la forma:
$$SPS = SPS + (TPLL - T) * NS$$
$$SPS = (TPS - T) * NS$$
Todo esto antes de actualizar el vector de estado y el tiempo
### Arrepentimiento contemplado en el sistema
El arrepentimiento del cliente que se va con odio al sistema. El porcentaje de arrepentimiento suele depender de la cantidad de persona. Por ejemplo con *n* personas se retira $x$ cantidad de personas.
Siempre va antes de hacer Ns = Ns + 1, es decir, antes de actualizar el vector de estado.
##### Calculo de arrepentimiento
Se suele establecer una cota de no arrepentimiento, otra cota mas grande con un numero random para ver si una persona se arrepiente y una cota de arrepentimiento directo. Se observa si dicho $R$ es menor a la condicion de arrepentimiento.
$$PARR = (ARR/NT) * 100$$
- $NT$ -> Total de personas que ingresaron en el sistema
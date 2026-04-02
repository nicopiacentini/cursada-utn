### Vaciamiento de sistema
Consiste en no cortar la simulacion si se cumplio el tiempo final hasta que no quede nadie en el sistema. Seguir iterando produciendo salidas hasta que Ns = 0. Para que no se produzcan mas entradas TPLL = HV.
Lo debo hacer siempre que pueda. En caso de que sistema no contemple, el metodo de calculo para determinar la permanencia en el sistema NO funciona.
### Metodos de calculo
$$SPS = \sum{\Delta_it ~*~  Ns_i}$$
Donde $\Delta t_i$ Es el intervalo entre eventos i e i + 1
### Arrepentimiento contemplado en el sistema
El arrepentimiento del cliente que se va con odio al sistema. El porcentaje de arrepentimiento suele depender de la cantidad de persona. Por ejemplo con *n* personas se retira $x$ cantidad de personas.
Siempre va antes de hacer Ns = Ns + 1, es decir, antes de actualizar el vector de estado.

Divido el tiempo en intervalos de la misma longitud. 
1. Avanzo el tiempo hasta el proximo delta t
2. Me ocupo de todo lo que ocurrio desde el ultimo avance hasta ahora
3. Repetir
##### Caracteristicas
1. Contrario a eAe donde me ocupo de un solo evento en cada avanze del tiempo, en este caso me puedo ocupar desde 0 hasta N eventos en cada avanze del tiempo
2. En eAe siempre miro hacia adelante. En esta metodologia miro hacia **atras**, donde ocurrieron los evento
##### Definicion de eventos
La tabla de eventos futuros se mantiene pero en vez de TEI ahora tengo la **clasificacion de eventos**
#### Clasificacion de eventos

| **Eventos propios** (ocurren en todos los $\Delta T$) | Eventos comprometidos en $\Delta T$ anteriores | **Eventos que se comprometen para $\Delta T$ futuros |
| ----------------------------------------------------- | ---------------------------------------------- | ---------------------------------------------------- |
|                                                       |                                                |                                                      |
1. **Evento propio**: Ocurren porque si, sin que nada suceda para que asi ssea. Pueden NO ocurrir en todos los $\Delta T$
2. **Eventos comprometidos en $\Delta T$ anterior**: Ocurren porque en el pasado se hizo algo para que asi fuese. Los indica la **TEF**
3. **Eventos que se comprometen para $\Delta T$ futuros**: Son los encargados de
	1. Lograr que en el futuro ocurra un evento. Son disparadores de eventos
	2. Son los unicos que se pueden escribir en la **TEF**
	3. Al ser los unicos que pueden estar en la TEF, son los unicos que disparan *eventos comprometidos en $\Delta T$ anterior*.
	4. Puede que uno de estos comprometa varios EC$\Delta T$A
###### TEF
Donde se escribe el momento en que va a ocurrir un Evento comprometido. Son variables. 
### Eleccion del $\Delta T$
El primer candidato para elegirlo es la unidad de tiempo en que vienen dado los DATOS. Puede ser que tenga 2 unidades de tiempo en datos. Entonces elijo la MAYOR. Para ver los eventos de la que tiene intervalo menor, hago un FOR para generar datos con la f.d.p. Luego los sumo. NUNCA divido las FDP.
En cambio si me dan valores fijos tipo, valor de un hotel por dia (donde es fijo, si me quedo menos no pago menos), debo pensar distinto. En este caso NO puedo dividir el tiempo. Lo sumo de una
###### Necesidad para aplicacion
Necesito un dato DADO EN DENSIDADES.
## Ejemplo Stock
A medida que pasa el tiempo, el pedido/stock que tengo baja por las ventas. Entonces antes de llegar a stock 0, en el stockMinimo/PuntoReposicion, decido llamar al proveedor que me trae la mercaderia. Esta llega mas tarde de cuando me quedo sin stock y tengo **ventas perdidas**
>[!IMPORTANT] Caso stock invierte metodologia
>Primero atiendo los metodos comprometidos antes que los propios para tener stock para atender.
#### Costos
1. Almacenamiento. Cobra $\alpha$$ por cada unidad de stock almacenada por cada unidad de tiempo almacenada
2. Costo de emision de pedido. No es gratis llamar al proveedor a cada rato, independientemente de la cantidad de unidades que traiga. En este caso cobra $\alpha_2$$
3. Costo de ventas perdidas. Generalmetne es un costo ilusorio/inventado. A veces es real si es por contrato
El objetivo es minimizar al maximo estos 3.
###### Tradeoffs en costos
Disminuir el CVP aumentando el TP -> Aumenta el CAL
Disminuir el CAL disminuyendo el TP -> Aumenta el CVP
Y si sumo el Punto de reposicion, disminuye la demora del proveedor y aumenta CEP

#### Metodologia
 $\Delta T$ CTE $\Delta T$ = 1 dia 
#### Datos
- Demora del proveedor
- Cantidad de ventas/ventas diarias
#### Variables de control
- TP: Tamaño de pedido
- SR: Punto de reposicion
#### Resultado
- Costo total (diario mensual o anual)
	- CAL
	- CVP
	- CEP
#### Estado
- Stock(ST)

| Evento propio | ECA                | ECF                |
| ------------- | ------------------ | ------------------ |
| Venta         | Llegada del pedido | Emision del pedido |
|               |                    |                    |
##### TEF
- Fecha de llegada del pedido (FLL)
#### El grafico COMPLETAR
1. Fijo las condiciones iniciales
2. Avanzo el tiempo en $\Delta T$ un dia. T = T+1
3. Considerar eventos propios del ultimo $\Delta T$. 
	1. En el caso de este ejercicio y solo por este, si se diese que llegan al mismo tiempo, me encargo primero del ECA llegada del pedido porque se supone que estoy bajo de stock. Por esto me tengo que fijar si T\==TLL -> hago ST = ST + TP
	2. Ahora si me ocupo del evento propio. Genero la funcion de ventas diarias VD. 
4. Considerar los eventos comprometidos en $\Delta T$ anteriores
5. Actualizar el vector estado -> BUEN MOMENTO PARA PENSAR EN RESULTADOS
	1. Si VD<=ST. Vendi y me sobro 
		1. ST = ST - VD 
		2. CAL = CAL + ST * $\alpha_1$$
	2. En caso en que no se cumpla la condicion y tengo ventas perdidas
		1. CVP = CVP + (VD - ST) * $\alpha_3$
6. Registrar evento que se comprometen par $\Delta T$ futuros. En este caso es llamar y hacer un pedido *si estoy por debajo del punto de reposicion* y *si no pedi aun*.
	1. ST <= SR y T>FLL
		1. Genero demora de proveedor DE
		2. FLL = T + DE
		3. CEP = CEP + $\alpha_2$$
7. Fin de simulacion
	1. Si T < TF -> vuelvo a condiciones iniciales
	2. Caso contrario hago:
		1. CT = CAL + CVP + CUP
		2. Pongo resultados TP, SR: CT, CAL, CEP, CVP
#### Condiciones iniciales
- FLL = 1 para cumplir con la condicion y que se me sume el stock en caso de que empieze con ST = 0
- FLL = -1 para que sea menor que T necesariamente llegue el proveedor, dado que ST = TP
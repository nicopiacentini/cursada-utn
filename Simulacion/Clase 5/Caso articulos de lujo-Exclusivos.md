Muchas veces la gente espera por el resto de la mercaderia en vez de ir a otro negocio donde lo pueden vender (como puede ser el caso de un chocolate).
### Costos de ventas acumuladas (CVA)
Son mercaderias que AUN NO TENGO pero ya tengo reservadas por falta de stock y se que voy a comprar. Es un $\alpha_4$$ por cada venta acumulada por cada dia de atraso a la venta

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
	- CVA -> costo de ventas acumuladas
	- CEP
#### Estado
- Stock(ST) -> contempla el reservado para vender a personas en la proxima entrega. Se lo resta a 


| Evento propio | ECA                | ECF                |
| ------------- | ------------------ | ------------------ |
| Venta         | Llegada del pedido | Emision del pedido |
|               |                    |                    |
##### TEF
- Fecha de llegada del pedido (FLL)
### Modelo/grafico
1. Fijo las condiciones iniciales
2. Avanzo el tiempo en $\Delta T$ un dia. T = T+1
3. Considerar eventos propios del ultimo $\Delta T$. 
	1. En el caso de este ejercicio y solo por este, si se diese que llegan al mismo tiempo, me encargo primero del ECA llegada del pedido porque se supone que estoy bajo de stock. Por esto me tengo que fijar si T\==TLL -> hago ST = ST + TP - VAC. VAC seria las ventas acumuladas del ciclo anterior.
	2. ST me puede dar negativo y eso implica que TP esta mal elegido, entonces no puede ser TP\<VAC
	3. VAC = 0. Revisar
	4. Ahora si me ocupo del evento propio. Genero la funcion de ventas diarias VD. 
4. Considerar los eventos comprometidos en $\Delta T$ anteriores
5. Actualizar el vector estado -> BUEN MOMENTO PARA PENSAR EN RESULTADOS
	1. Si VD<=ST. Vendi y me sobro 
		1. ST = ST - VD 
		2. CAL = CAL + ST * $\alpha_1$$
	2. En caso en que no se cumpla la condicion y tengo ventas perdidas
		1. CVA = CVA + (VD - ST) * (FLL-T)$\alpha_4$
		2. VAC = VAC + VD - ST
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
#### Estimacion del SR y del TP
 El SR Tiene que estar en valores especificos
el minimo debe ser el minimo DE * el minimo de VD
El maximo debe ser el maximo VD * el maximo DE

El TP debe ser mayor al VAC en promedio.
##### Para clase que viene
1. TERMINAR evento a evento y repasar reglas de TEI
2. Hacer ejercicios 13, 14 y 15 de guia
3. Leer ejercicios 16 y 17 y comparar con anteriores
4. 
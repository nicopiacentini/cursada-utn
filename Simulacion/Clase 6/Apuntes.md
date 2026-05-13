# Ejercicio 16
#### Diferencia con 14
- Los datos vienen dados en encadenador de eventos, no en densidades.
#### Aplico los pasos
1. Los datos son IA y por ende no puedo afirmar que tipo de metodologia usar
2. El costo de ventas atrasadas y el costo de almacenamiento son por unidad y por **dia**. El intervalo entre arribos me da en **minutos**. Como segun el paso 2 no puedo iterar por menos de un dia, resuelvo con $\Delta T$Cte de un dia.
### Analisis previo
#### Datos 
- Intervalo entre arribos
- Cantidad de ventas por cliente
- DE demora de proveedor
#### Control
- TP
- SR
#### Resultados
- Costo total
#### Estado
- ST: Stock
#### Clasificacion de eventos
- Propios
	- Ventas
- Eventos comprometidos anteriores
	- Llegada del pedido
- Eventos que se comprometen
	- Emision del pedido
#### TEF
- FLL
#### Diagrama: Es igual al 14
### Rutina de ventas diarias
Cuento con el intervalo entre arribos IA y la cantidad vendida CV. Como el IA es encadenador de eventos, esta es una rutina **Evento a eventos**

1. . 
2. Busco el menor de la TEF. En este caso, el unico evento es la llegada del cliente TPLL. 
3. Avanzo el tiempo hasta lo ocurrencia del evento
	1. T1 = TPLL
4. Determinar el tipo de evento. Es una llegada
5. Determino instante de evento futuro no condicionado. Es una llegada porque tengo como dato el IA. 
	1. IA
	2. TPLL = T1 + IA
6. Variables de estado
	1. Calculo CANT
	2. VD = VD + CANT
7. EFNOc. No tengo
8. Pregunto si T1<8 * 60, y termino o sigo
# Ejercicio 17
Es un simil parecido al 13 
#### Diferencias
- Tengo IA y CANT vs VD
#### Pasos
1. Datos vienen dados en intervalos
2. La unidad de tiempo limitante es el minuto por CAL y no puedo iterar por menos de un minuto. Los datos IA estan dados en minutos y por ende no me resuelve. 
3. Objetivos del caso. Pide costo total, nada relativo a un evento
4. Resuelvo por eficiencia
		$\Delta T$ Cte de un minuto hace que en 30 minutos o 30 vueltas atienda 4 o 5 eventos. Sin embargo, Evento a evento, con 4 eventos lo saco y con 4 vueltas
#### Analisis previo
#### Datos
- IA
- CANT
- DE
#### Control
- TP
- SR

#### Restultados
 - Costo total
#### Estado
- Stock

##### TEI
Un evento independiente nunca puede generar un evento futuro no independiente. Los eventos no son independientes
Emision de pedido no es un evento independiente de la llegada de pedido sino que son EL MISMO

| Evento          | Efnoc   | EFC                       | Condicion                   |
| --------------- | ------- | ------------------------- | --------------------------- |
| Venta           | Venta   | EM/LLEG. Pedido           | ST < SR y FLL < T           |
| EM/LLEG. Pedido | ------- | ------------------------- | --------------------------- |
|                 |         |                           |                             |
TEF:
- TPV: Tiempo proxima venta
- FLL: Fecha proxima llegada. 
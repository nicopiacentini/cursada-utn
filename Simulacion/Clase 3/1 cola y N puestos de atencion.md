

### a) Metodología

- **Evento a Evento:** Se utiliza porque hay al menos un dato que encadena dos eventos en el tiempo.
    

### b) Clasificación de Variables

- **DATOS:**
    
    - `IA`: Intervalo entre Arribos (lapso de tiempo entre dos llegadas seguidas). Ambas son f.d.p.
        
    - `TA`: Tiempo de Atención del puesto de atención. Tambien puede ser un vector de fdp
        
- **VARIABLES DE CONTROL:**
    
    - `N`: Cantidad de Puestos de Atención.
        
- **VARIABLES DE RESULTADO:**
    
    - `PPS`: Promedio de tiempo de Permanencia de los clientes en el Sistema. (general)
        
    - `PTO(i)`: Porcentaje de Tiempo Ocioso del puesto de atención "i" (depende de cada puesto).
        
- **VARIABLES DE ESTADO:**
    
    - `NS`: Cantidad de Personas en el sistema. (Hay una cola única, no es un vector sino una variable).
        

### c) Tabla de Eventos Independientes

| **EVENTO**    | **E. F. NO C.** | **E. F. C.** | **Cond.**  |
| ------------- | --------------- | ------------ | ---------- |
| **LLEGADA**   | LLEGADA         | SALIDA[i]    | $NS \le N$ |
| **SALIDA[i]** | -----           | SALIDA[i]    | $NS \ge N$ |

### d) Tabla de Eventos Futuros

- **TPLL:** Tiempo en que ocurre la Próxima Llegada de un cliente.
    
- **TPS\[i\]:** Instante de Tiempo en que ocurre la Próxima Salida por el puesto de atención "i".
    

> [!NOTE] Lógica de Eventos
> 
> - Una **LLEGADA** genera como EFNOC otra LLEGADA (por el dato IA) y un EFC una SALIDA[i] siempre y cuando haya puestos libres ($NS \le N$).
>     
> - Una **SALIDA[i]** genera como EFC otra SALIDA[i] siempre y cuando haya gente esperando en la cola ($NS > N$).

### e) Fijacion de condiciones iniciales del modelo
Es una rutina de CI
### f) Determinar el instante t del proximo evento
Es una rutina que elige de la tabla de eventos futuros y se fija el proximo evento a ocurrir segun el menor de los tiempos de salida.
Comparo el menor TPS con TPL. 
### g) Avanzo hasta el proximo evento
Se me divide entre llegada y salida. Hago subrutina de (SPS = SPS + (TPLL - T)NS) y luego actualizo el tiempo. Ahora para haccer el sps general tengo que hacer un for:
```c
for(int i = 1; i <= n ; i++){
sps = sps * (TPLL - T) * NS
}
```
Para el caso de la salida, al ser de un puesto especifico, el for lo hago con `j` ya que el puesto i es con el que estoy trabajando y del que le tengo que hacer la salida
```c
for(int j = 1; j<=n ;j++){
sps = sps * (TPS[i] - T) * NS[j]
}
```
### h)Determinar el tipo de evento 
ya lo hice en el paso anterior al ir por una rama.
### i) Determinar instante de efnoc de este evento
Basicamente, actualizar el TEI y sus variables con las fdp. Para el caso de la salida no tengo nada
### j) Actualizar el vector de estado
NS = NS + 1
**BUEN MOMENTO PARA PENSAR EN LOS RESULTADOS**: PARA LLEGADA SUMO UNA LLEGADA CLL = CLL + 1 EN LLEGADA
Para el caso de salida resto NS[i] - 1. No tengo nada de resultado

### k) Determino instante de efc

Para el caso de salida pregunto si NS >= N, genero TA y actualizo TPS[i] = T + TA. Para elegir el puesto elijo el primero con TPS[i] = HV

Todo esto lo hago mientras que T < TF. Si es asi vuelov al comienzo. De no ser asi, hago vaciamiento. Luego calculo e imprimo los PTS[i] y los PPS / CLL y digo para N: PPS
Con esto hago una tabla e informo resultados para cada N.

Para salida Comparo NS con N. Si Ns es mas chico actualizo TPS[i] = 0 y ITO[i] = T
#### Vaciamiento
Dentro de un for sumo todos los NS[i] y me fijo si es 0. En caso que si calculo resultados. En caso que no hago TPLL = HV y vuelvo al comienzo.


#### Calculo de tiempos osciosos
Es un for sobre i y hago
PTO[i] = Sto[i] * 100/T

#### Menor en NS[i]
Men = HV
En un for hago que si NS[j] < Men 
i = j
Pongo menorIgual en caso de querer el ultimo.### e) Fijacion de condiciones iniciales del modelo
Es una rutina de CI
### f) Determinar el instante t del proximo evento
Es una rutina que elige de la tabla de eventos futuros y se fija el proximo evento a ocurrir segun el menor de los tiempos de salida.
Comparo el menor TPS con TPL. 
### g) Avanzo hasta el proximo evento
Se me divide entre llegada y salida. Hago subrutina de (SPS) y luego actualizo el tiempo. Ahora para haccer el sps general tengo que hacer un for:
```c
for(int i = 1; i <= n ; i++){
sps = sps * (TPLL - T) * NS[i]
}
```
Para el caso de la salida, al ser de un puesto especifico, el for lo hago con `j` ya que el puesto i es con el que estoy trabajando y del que le tengo que hacer la salida
```c
for(int j = 1; j<=n ;j++){
sps = sps * (TPS[i] - T) * NS[j]
}
```
### h)Determinar el tipo de evento 
ya lo hice en el paso anterior al ir por una rama.
### i) Determinar instante de efnoc de este evento
Basicamente, actualizar el TEI y sus variables con las fdp. Para el caso de la salida no tengo nada
### j) Actualizar el vector de estado
Sumo NS[i] ++ para la cola con menos gente, osea: men NS[i] y luego NS[i] ++. Normalmente si hay empate, pregunto o a lo sumo, elijo la ultima o la primera.
**BUEN MOMENTO PARA PENSAR EN LOS RESULTADOS**: PARA LLEGADA SUMO UNA LLEGADA
Para el caso de salida resto NS[i] - 1. No tengo nada de resultado
### k) Determino instante de efc
Actualizo TEI segun fdp solo si se cumple la condicion. En este caso tengo qeu evaluarlo segun la cola `i` que generé antes. Ademas si es el ultimo actualizo tiempo oscioso con STO[i] = ++ T - ITO[i]. 
Para el caso de salida pregunto si NS[i] > 0, genero TA y actualizo TPS[i] = T + TA
Para el caso en que no se cumpla la condicion, es decir no hay nadie en la cola, pongo ITO[i] = T y TPS[i] = HV

Todo esto lo hago mientras que T < TF. Si es asi vuelov al comienzo. De no ser asi, hago vaciamiento. Luego calculo e imprimo los PTS[i] y los PPS / CLL y digo para N: PPS
Con esto hago una tabla e informo resultados para cada N.
#### Vaciamiento
Dentro de un for sumo todos los NS[i] y me fijo si es 0. En caso que si calculo resultados. En caso que no hago TPLL = HV y vuelvo al comienzo.


#### Calculo de tiempos osciosos
Es un for sobre i y hago
PTO[i] = Sto[i] * 100/T

#### Menor en NS[i]
Men = HV
En un for hago que si NS[j] < Men 
i = j
Pongo menorIgual en caso de querer el ultimo.


### a) Metodología

- **Evento a Evento:** Se utiliza porque hay al menos un dato que encadena dos eventos en el tiempo.
    

### b) Clasificación de Variables

- **DATOS:**
    
    - `IA`: Intervalo entre Arribos (lapso de tiempo entre dos llegadas seguidas). Ambas son f.d.p.
        
    - `TA`: Tiempo de Atención del puesto de atención.
        
- **VARIABLES DE CONTROL:**
    
    - `N`: Cantidad de Puestos de Atención.
        
- **VARIABLES DE RESULTADO:**
    
    - `PPS`: Promedio de tiempo de Permanencia de los clientes en el Sistema.
        
    - `PTO(i)`: Porcentaje de Tiempo Ocioso del puesto de atención "i" (depende de cada puesto).
        
- **VARIABLES DE ESTADO:**
    
    - `NS`: Cantidad de Personas en el sistema. (Hay una cola única, no es un vector sino una variable).
        

### c) Tabla de Eventos Independientes

|**EVENTO**|**E. F. NO C.**|**E. F. C.**|**Cond.**|
|---|---|---|---|
|**LLEGADA**|LLEGADA|SALIDA[i]|$NS \le N$|
|**SALIDA[i]**|-----|SALIDA[i]|$NS \ge N$|

### d) Tabla de Eventos Futuros

- **TPLL:** Tiempo en que ocurre la Próxima Llegada de un cliente.
    
- **TPS[i]:** Instante de Tiempo en que ocurre la Próxima Salida por el puesto de atención "i".
    

> [!NOTE] Lógica de Eventos
> 
> - Una **LLEGADA** genera como EFNOC otra LLEGADA (por el dato IA) y un EFC una SALIDA[i] siempre y cuando haya puestos libres ($NS \le N$).
>     
> - Una **SALIDA[i]** genera como EFC otra SALIDA[i] siempre y cuando haya gente esperando en la cola ($NS > N$).
>
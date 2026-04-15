### a) Metodologia evento a evento
### b) Clasificación de Variables

- **VARIABLES DE RESULTADO:**
    
    - `PPS`: Promedio de tiempo de Permanencia de los clientes en el Sistema (general).
        
    - `PTO(i)`: Porcentaje de Tiempo Ocioso del puesto de atención "i" (**Vector**).
        
- **VARIABLES DE ESTADO:**
    
    - `NS[i]`: Cantidad de Personas en el Sistema del puesto de atención "i" actualmente (**Vector**).
        

### c) Tabla de Eventos Independientes

| **EVENTO**     | **E. F. NO C.** | **E. F. C.** | **Cond.**   |
| -------------- | --------------- | ------------ | ----------- |
| **LLEGADA[i]** | LLEGADA[i]      | SALIDA[i]    | $NS[i] = 1$ |
| **SALIDA[i]**  | -----           | SALIDA[i]    | $NS[i] > 0$ |
### d) Tabla de Eventos Futuros

- **TPLL\[i\]:** Tiempo en que ocurre la Próxima Llegada de un cliente.
    
- **TPS\[i\]:** Instante de Tiempo en que ocurre la Próxima Salida por el puesto de atención "i".
    

> [!NOTE] Lógica de Eventos
> 
> - Una **LLEGADA[i]** genera como EFNOC otra LLEGADA[i] (por el dato IA) y un EFC una SALIDA[i] siempre y cuando haya puestos libres ($NS \le N$).
>     
> - Una **SALIDA[i]** genera como EFC otra SALIDA[i] siempre y cuando haya gente esperando en la cola ($NS > N$).


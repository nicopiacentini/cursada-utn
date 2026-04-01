## Metodología de avance del tiempo
### Evento a evento

Para poder aplicar esta metodología es necesario al menos un **dato** que encadene **eventos** en el tiempo, siendo un dato una **función de densidad de probabilidad**.

### Pasos (informales)
1. Miro a ver cuándo ocurre el próximo evento en el tiempo.  
2. Me traslado a ese instante.  
3. Me ocupo de ese evento.  
4. Una vez que terminé, repito el primer paso hasta que no haya eventos.

### Características
- Siempre mira hacia el futuro, nunca hacia el pasado.  
- En cada avance del tiempo nos ocupamos únicamente de 1 y sólo 1 evento a la vez.

### Clasificación de eventos

#### [TEF] Tabla de eventos futuros
- Es un conjunto de variables (no es una "tabla" pero se comporta como tal).
- Está formada por variables que contienen el instante en que va a ocurrir un evento.

#### [TEI] Tabla de eventos independientes

| EVENTO | EFNOC | EFC | Cond. |
| ------ | ----- | --- | ----- |
|        |       |     |       |

### Reglas

1. La TEI tiene:
   - 3 columnas: "Evento", "Evento Futuro NO Condicionado" y "Evento Futuro Condicionado".
   - Tantas filas como **eventos independientes** haya: cada evento tiene su propia fila, aun si no hace nada.  
   - La columna "Condición" no forma parte de la TEI, se anexa.

2. En la TEI sólo se pueden escribir **eventos independientes** o nada ("-").

3. En la columna **EFNOC** sólo se puede escribir el mismo evento que en "EVENTO".
   - Si en "EVENTO" está el evento "A", en "EFNOC" puede haber "A" o "-".

- La única forma de unir eventos independientes es mediante una **condición**.  
- Un evento puede generar un **evento futuro condicionado**.

### Reglas de la columna "Condición"

1. Se pueden escribir valores fijos o constantes (como **variables de control**).
2. Las variables que aparecen (exceptuando las de control) deben ser **de estado**.
   - Eventualmente pueden aparecer variables relacionadas con el tiempo.
   - Si aparece "x", entonces debe ser de estado sí o sí (salvo que sea de control o relacionada con el tiempo).
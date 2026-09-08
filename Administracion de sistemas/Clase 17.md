- Ajustar horas diarias para que los empleados no trabajen mas de 8 horas por dia
	- Investigar la opcion *calendar* en el projectlibre
- Usar IA de cátedra para terminar de corregir trabajo
- Enfoque predictivo en cascada o por fases
- Kickoff debe ser un hito en projectlibre
- El hito debe ser algo mas comercial o que se le informe al stakeholder, no es tan tecnico.
- Hacer coincidir hitos de projectlibre con hitos de roadmap
- Agregar matriz de evaluaciones a la gestionesfuerzo
- Agregar periodicidad de control de proyecto como reunion(?)
___
# Clase 20 · Ejecución y Método del Valor Ganado (EVM)

---

## 1. Ciclo de vida de un proyecto según el PMI

1. **Estructuración o Iniciación** — Se define el proyecto a alto nivel, se identifican necesidades, objetivos y viabilidad.
2. **Planificación** — Se detallan los objetivos, alcance, recursos, tiempos, costos y riesgos. Se elabora el plan del proyecto.
3. **Ejecución** — Se lleva a cabo el plan del proyecto para producir los entregables definidos.
4. **Control y Seguimiento** — Se monitorea el desempeño del proyecto, se comparan resultados con el plan y se toman acciones correctivas cuando es necesario.
5. **Cierre** — Se finaliza formalmente el proyecto, se entregan los entregables y se documentan las lecciones aprendidas.

> Un ciclo continuo de mejora y aprendizaje.

Las fases de **Ejecución** y **Control y Seguimiento** están interrelacionadas (se ejecutan de forma iterativa).

> Se pasa de Planificación a Ejecución **una vez que**:
> 
> - Es elaborada y presentada la documentación general al Sponsor, y
> - Es aprobado el Proyecto.

---

## 2. Fase de Ejecución del proyecto

- **Es la etapa donde:** la planificación se convierte en **acción** y los **resultados** comienzan a tomar forma.
- **Durante esta fase:** el equipo del proyecto trabaja en estrecha colaboración para completar **las tareas** y entregar **los entregables** del proyecto. 
- **Y es donde:** las responsabilidades del PM cobran principal importancia para garantizar el **éxito** del proyecto.

**Pilares de la fase:**

- **Acción** → Transformamos planes en resultados.
- **Colaboración** → Trabajo conjunto del equipo.
- **Éxito** → Entregamos valor y cumplimos objetivos.
> Esta estrechamente relacionado con la etapa de control
---

## 3. Actividades del PM en la fase de Ejecución

> Principalmente, llevar adelante las tareas que se comprometió a realizar en el **Acta**.

1. Realizar la **reunión de Kickoff** o Lanzamiento del Proyecto. Va despues de la reunión de inicio porque muestra toda la gestión del proyecto.
2. **Acompañar y motivar al equipo** para que cumplan con los entregables comprometidos.
3. Ejecutar periódicamente la fase de **Control y Seguimiento**.
4. Mantener una **comunicación fluida** con los Interesados (Stakeholders). Para esto necesitas KPIs que permitan comunicar el avance.
5. Efectuar el **análisis de impactos**, junto a su equipo, cada vez que haya cambios solicitados.
6. Realizar **ajustes en el cronograma** cuando sean necesarios.
7. Garantizar el **cumplimiento del tiempo** de cada entregable.
8. Velar porque **se respete el presupuesto**.

---
>[!important] Linea base
>Es la planificacion base de mi proyecto. El final de esta es el presupuesto a la finalización del proyecto. Me sirve para medir frente a alguna referencia porque la linea base es la referencia. 
## 4. Método del Valor Ganado (EVM)
> Traducis alcance de proyecto en tiempo y costo

> Herramienta de Control y Seguimiento **más utilizada** en un enfoque predictivo.

Se lo conoce como **El Método del Valor Ganado (EVM)** y es un método que integra **Alcance, Tiempo y Costo** para medir el rendimiento y el avance del proyecto en forma objetiva.

### 4.1. Variables principales

1. **PV — Valor Planeado (Planned Value)** Representa el reflejo numérico del trabajo presupuestado a realizar. Se considera una línea base establecida contra la cual se mide el progreso real del proyecto. **Es el valor de mi linea base para un tiempo especifico**. Se calcula en esfuerzo.

    
2. **AC — Costo Actual (Actual Cost)** Indicación del nivel de recursos que se han gastado para lograr el trabajo real realizado hasta la fecha (o en un período determinado). 
Es el costo que realmente hice hasta un determinado momento. Difiere con Valor ganado en que el costo se mide segun planificado en EV pero en AC se mide con realidad. Esto sale de la planilla de costos reales.
    
3. **EV — Valor Ganado (Earned Value)** Es una "foto" del progreso del trabajo en un momento dado. Refleja la cantidad de trabajo que realmente se ha realizado hasta la fecha, expresada como el valor planificado para ese trabajo. **Es el valor o esfuerzo aplicado hasta el momento especifico**. 
	Es el valor del trabajo realizado segun mi costo planificado. Es decir, **el esfuerzo planificado para lo que llevo hecho hasta ahora** 
	Es DISTINTO a lo avanzado. Es cuanto costo y cuantas horas llevo en el proyecto
4. **SV** -- Variacion en el cronograma por atrazo. Se mide en esfuerzo y equivale a $EV - VP$ 

>[!idea]
>El PV es donde deberia estar para ese costo en este tiempo y el EV es el valor del trabajo realizado hasta un momento. 



> [!example]
> Tengo 3 actividades que planifico duran 3 horas cada una y las logro hacer todas en 6 horas. Me queda:
> - AC = 6hs
> - EV = 9hs


### 4.2. Variables secundarias

1. **BAC — Presupuesto del proyecto (Budget At Completion)** Costo total previsto inicialmente para el proyecto.
    
2. **ETC — Estimación para finalizar (Estimate To Complete)** _¿Cuánto costará el trabajo restante?_ Estimación del costo del trabajo (segun lo planificado) que aún resta para completar el proyecto.
    
3. **EAC — Estimado a la conclusión (Estimate At Completion)** = AC + ETC _¿Cuál es el costo probable del proyecto?_ Re-estimación del costo del proyecto durante su ejecución, teniendo en cuenta la tendencia de desempeño actual del equipo. Se espera que sea más certera que el BAC.
    
4. **VAC — Variación a la conclusión (Variance At Completion)** _¿Estaremos por debajo o por encima del presupuesto?_ Diferencia entre el BAC y el EAC. Es el desvío en el costo total del proyecto (conocido como **overrun** o **underrun**).
    

---

## 5. Fórmulas de indicadores

| Indicador                        | Fórmula                   | Descripción                                                                                                                                                                               |
| -------------------------------- | ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **CV**                           | `CV = EV − AC`            | Variación de costos                                                                                                                                                                       |
| **SV**                           | `SV = EV − PV`            | Variación de cronograma                                                                                                                                                                   |
| **SPI**                          | `SPI = EV ÷ PV`           | Índice de desempeño de cronograma. >1 estoy adelantado y <1 estoy atrazado. =1 estoy planificado                                                                                          |
| **CPI**                          | `CPI = EV ÷ AC`           | Índice de desempeño de costos. =1 significa que cada $ invertido es igual al planificado >1 Cada $ invertido mide mas de lo planificado. <1 Cada $ invertido mide menos de lo planificado |
| **VAC**                          | `VAC = BAC − EAC`         | Variación a la conclusión                                                                                                                                                                 |
| **TCPI**                         | `(BAC − EV) ÷ (BAC − AC)` | Desempeño de costos requerido para finalizar dentro del BAC                                                                                                                               |
| **TCPI** (con nuevo presupuesto) | `(BAC − EV) ÷ (EAC − AC)` | Desempeño de costos requerido si hay un nuevo presupuesto                                                                                                                                 |


> - CPI/SPI **> 1** → desempeño favorable (ahorro / adelanto).
> - CPI/SPI **< 1** → desempeño desfavorable (sobrecosto / atraso).

### 5.1. Escenarios de cálculo del EAC

El valor de **EAC (AC + ETC)** depende del ETC, y éste de cómo se considere que será el desempeño en lo que resta del proyecto. Osea depende de como se este llevando a cabo el proyecto y cuanto me falta. Se plantean **cuatro escenarios básicos**:

1. **Desempeño típico** — La performance de costos observada hasta el momento se mantendrá hasta la finalización del proyecto: `EAC = BAC ÷ CPI`
    
    _Ejemplo:_ EV = 640, AC = 720, CPI = 0,89, BAC = 4000 → **EAC ≈ 4500**
    
2. **Desempeño atípico** — La performance observada hasta el momento fue excepcional y no se mantendrá; la eficiencia de costos corresponderá a lo planificado: `EAC = AC + (BAC − EV)`
    
    _Ejemplo:_ EAC = 720 + (4000 − 640) = **4080**
    
3. **Cambio a desempeño diferente** — La performance observada no se mantendrá; de aquí en adelante habrá una diferente: `EAC = AC + [(BAC − EV) ÷ CPI_nuevo]`
    
    - Si el nuevo CPI debe permitir concluir el proyecto dentro del BAC: `CPI_nuevo = (BAC − EV) ÷ (BAC − AC)`
    - Si el nuevo CPI estará afectado por la performance de cronograma observada: `CPI_nuevo = CPI × SPI`
    
    _Ejemplo:_ EAC = 720 + [(4000 − 640) / 0,89] = **4495,28**
    
4. **Nueva estimación detallada** — Los desvíos en la performance son atribuibles a una mala estimación, o las condiciones del proyecto cambiaron significativamente y los supuestos originales ya no son válidos. Se debe realizar una nueva estimación detallada para lo que resta del proyecto: `EAC = AC + Nueva Estimación`
    

---

## 6. ¿De dónde se obtiene la información inicial?

La **Línea Base de Medición del Rendimiento** surge de integrar:

1. **Alcance** (EDT / WBS)
2. **+ Cronograma** (Red / Gantt)
3. **+ Costo** (estimado del costo / presupuesto)

**=** Curva Costo vs. Tiempo (forma de "S") → Línea Base de Medición del Rendimiento (PMB).

---

## 7. Comportamiento de las variables según Tiempo y Costo

Sobre el gráfico de Gestión del Valor Ganado, en la **fecha de estado** se ubican las curvas de **AC**, **PV** y **EV**, y se proyectan hacia el final del proyecto **BAC** y **EAC**.

> - `ETC = EAC − AC`
> - `CV = EV − AC`
> - `SV = EV − PV`
> - `VAC = BAC − EAC`
> - `SPI = EV / PV`
> - `CPI = EV / AC`
> - `TCPI = (BAC − EV) / (BAC − AC)`
> - `CPI_AC = BAC / EAC`
> - `SPI_ACt = Duración de PMB / EACt`

---

## 8. Ejemplo práctico con cronograma (Figura 1-4)

Plan de trabajo con 6 tareas a lo largo de 12 meses, presupuesto total **$150**.

|Task|Budget|
|---|---|
|1|12|
|2|48|
|3|28|
|4|18|
|5|28|
|6|16|
|**Σ**|**150**|

Valores acumulados (CUM) mes a mes: 6, 20, 32, 48, 67, 88, 110, 118, 128, 134, 142, 150.

### 8.1. Representación del Valor Planeado (PV)

La curva PV sigue exactamente los valores acumulados de presupuesto planificado mes a mes (6 → 150).

### 8.2. Representación del Valor Ganado (EV)

En el ejemplo, al mes 4 el EV acumulado es **36** (mientras que el PV acumulado a esa fecha era 48) → el proyecto está **atrasado**.

### 8.3. Aplicación de las tres variables al mismo tiempo (Figura 2-6, al 30 de abril)

|Variable|Acumulado a abril|
|---|---|
|PV|48|
|EV|32|
|AC|40|

> Con estos datos se puede calcular CV, SV, CPI y SPI para diagnosticar el estado del proyecto en ese corte.

---

## 9. Tablero de control integrado (ejemplo real de proyectos)

Formato de seguimiento por proyecto, con columnas: **Responsable, Docentes, Situación Actual, Próximo Hito, Objetivo** y semáforo de estado.

Ejemplo de ficha individual de proyecto (caso _Manopedia_):

- **Avance esperado vs. real** (ej: esperado 70%, real 63%).
- **Plan de trabajo** por fases (Análisis, Diseño, Desarrollo, Pruebas, Implementación, Cierre).
- **Puntos de atención** (riesgos, impacto, probabilidad).
- **Avances**: finalizado / en proceso / pendiente por iniciar.
- **Objetivo del proyecto** y **objetivos del producto**.
- **Decisiones importantes** (si las hubiera).

---

## 10. Ejercicio integrador

### Enunciado

Proyecto de desarrollo de un **sistema de control de flotas**.

**Datos:**

- Duración planificada: **12 meses**
- Presupuesto total (**BAC**): **$120.000**
- Costo presupuestado por quincena: **$5.000**
- Situación actual: **semana 18**
- Costo real gastado (**AC**): **$55.000**
- Valor presupuestado del trabajo realizado (**EV**): **$60.000**
- PV = 45000

> **Nota de interpretación:** el dato "costo presupuestado es de $60.000" se interpreta como **EV = $60.000**, es decir, el valor presupuestado del trabajo efectivamente realizado. Esta interpretación permite resolver las tres preguntas.

**Se pide:**

1. ¿Cuál es el estado actual del proyecto?
2. Si el proyecto continúa con dicha performance, ¿cuántos días llevará?
3. Si el proyecto continúa con dicha performance, ¿cuál será el costo final?

### A. Estado actual del proyecto

| Indicador        | Resultado | Interpretación           |
| ---------------- | --------- | ------------------------ |
| **CPI** = EV/PV  | 1,09      | Buen desempeño de costos |
| **SPI** = EV/AC  | 1,33      | Proyecto adelantado      |
| **CV** = EV − AC | +$5.000   | Ahorro                   |
| **SV** = EV − PV | +$15.000  | Adelanto                 |

> Por cada $1 gastado, se obtiene aproximadamente **$1,09** de trabajo presupuestado. **Conclusión:** el proyecto tiene desempeño favorable en costos (gasta menos de lo que corresponde al trabajo realizado) y está **adelantado** respecto del cronograma (SPI > 1).

### B. Duración estimada del proyecto

```
Duración estimada = Duración planificada / SPI
Duración estimada = 12 / 1,33
Duración estimada ≈ 9 meses (≈ 270 días)
```

> Si mantiene el SPI actual de 1,33, el proyecto finalizaría aproximadamente en **270 días (9 meses)**.

### C. Costo final estimado del proyecto

```
EAC = BAC / CPI
EAC = 120.000 / 1,09
EAC ≈ 110.000
```

> El costo final estimado del proyecto será aproximadamente **$110.000**.

---

## 11. Material adicional — nomenclatura clásica del EVM (PMBOK antiguo)

|Sigla actual|Sigla clásica|Significado|
|---|---|---|
|PV|**BCWS**|Budgeted Cost of Work Scheduled|
|EV|**BCWP**|Budgeted Cost of Work Performed|
|AC|**ACWP**|Actual Cost of Work Performed|
|ETC|**FCST**|Forecast of Remaining Work|
|BAC|**BAC**|Budget At Completion|
|EAC|**EAC**|Estimate At Completion|
|—|**FTG**|Estimate To Go|

> Estos términos aparecen en gráficos clásicos de la Gestión del Valor Ganado (GVG), mostrando la relación entre Varianza de Programa (tiempo) y Varianza de Costos a la fecha y proyectadas a la finalización.

---

## 12. Cálculo práctico en ProjectLibre

### 12.1. Calcular el costo del proyecto

- El **costo** de una tarea se calcula en base a las **horas de trabajo asignadas** por el **valor (tasa) de cada recurso**.
- Se define en la pestaña **Recurso → Tasa Estándar** (ej: Alumno $10/hora, Docente $10/hora).

### 12.2. Calcular el BAC (Costo Presupuestado a Finalización)

- El **BAC** se actualiza al **guardar la Línea Base** del proyecto (`Tarea → Guardar Línea de Base`).
- Se puede guardar para el **Proyecto Completo** o para una **Tarea Seleccionada**.

### 12.3. Calcular el EV (BCWP)

> **EV = BCWP** (Budgeted Cost of Work Performed). Mide el valor presupuestado del trabajo que efectivamente se realizó.

Se obtiene comparando el **Porcentaje completado** y el **Trabajo real** de cada tarea contra su costo presupuestado (BAC de la tarea).

### 12.4. Preguntas guía para el seguimiento ("¿Cómo está tu proyecto?")

1. ¿Cuál es el **valor planeado** para el día de hoy? → **PV** (Valor Planeado)
2. ¿Cuál es el **grado de avance real** de tu proyecto? → **EV** (Trabajo realizado)
3. ¿Y cuál es el **costo real** para el día de hoy? → **AC** (Costo Real)

**Variación del cronograma:**

```
SV = EV − PV
SV = BCWP − BCWS
```

**Variación del presupuesto:**

```
CV = EV − AC
CV = BCWP − ACWP
```

> **Nota práctica en ProjectLibre:** las tareas a la fecha de corte (ej. 17/08/2026) _deberían_ estar completadas para que `PV = BCWS`. La diferencia entre lo que debería estar hecho y lo que efectivamente está hecho (EV) es la que genera el SV.

---

## 13. Resumen de fórmulas clave

> - `CV = EV − AC` → Variación de Costo
> - `SV = EV − PV` → Variación de Cronograma
> - `CPI = EV / AC` → Índice de Desempeño de Costos
> - `SPI = EV / PV` → Índice de Desempeño de Cronograma
> - `EAC = BAC / CPI` → Estimado a la Conclusión (desempeño típico)
> - `EAC = AC + (BAC − EV)` → Estimado a la Conclusión (desempeño atípico)
> - `EAC = AC + [(BAC − EV) / CPI_nuevo]` → Estimado a la Conclusión (cambio de desempeño)
> - `EAC = AC + Nueva Estimación` → Estimado a la Conclusión (nueva estimación detallada)
> - `VAC = BAC − EAC` → Variación a la Conclusión
> - `TCPI = (BAC − EV) / (BAC − AC)` → Índice de Desempeño de Costo por Completar
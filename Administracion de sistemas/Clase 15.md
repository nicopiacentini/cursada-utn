- Para medir calidad de proyecto -> **Tengo que definir nivel de calidad en porcentaje y nivel de errores en testing**
	- Tengo que definir criterio de aceptacion y pasar a produccion -> Si no hay ningun error critico puedo pasar a producción. 
	- Tengo que definir tambien KPIs para criterios de aceptacion.
	- AGREGAR ENTREGABLE QUE INDIQUE NIVEL DE CALIDAD Y CRITERIOS DE CALIDAD ACEPTADOS.
- Ciclo de gestion de cambio tengo
- que definir pasos para proponer cambios, por ejemplo
	- Tambien aclarar Que no todos pueden solicitar un cambio, solo algunas
	- Estos pasos los tiene que manejar y gestionar el PM
	1.  Solicitud de cambio recibida por PM...
	2.  Analisis de solicitud de cambio liderada por PM... 
	3. Aprobacion/rechazo de la solicitud por parte del PM...
- Necesito una planificacion para tener un seguimiento
- Agregar conformacion de comites
- Quizas conviene dividir el testing segun modulo para poder hacerlo concurrente(?)
- Establecer criterios de estimacion
- Tareas por modulo pueden incluir:
	- desarrollo
	- testing
- Agregar pruebas de integracion
- Implementacion cambiar por despliegue
- ver elaborar aprobar y firmar entregables como actividades. Luego lo pongo el documento una sola vez en la edt
- Agregar un entregable *principal* por cada fase
Para project libre
- Hitos tienen tareas dentro de la fase y duracion 0
- Poner entregables que agrupen a otros
	- Cada uno de estos tiene sus propias tareas
___
# Tiempo
Tengo que ver si mi proyecto avanza segun lo planificado. Para hacer seguimiento de esto debo hacer:
- Reuniones
- Informes 
- Auditorias
Tengo que ver cada cuanto y como hago esto

> Seguimiento y control se fija si voy segun lo planificado

> La WBS implica que cada entregable tiene un esfuerzo o recurso material y esto se traduce a horas o dinero cuanto me lleva.

> Alcance -> Esfuerzo -> Tiempo

Esto me da una baseline o **Linea base**
#### Linea base
Como voy avanzando y como logro mi objetivo segun lo planificado. 

#### Que pasa si no puedo seguir con la linea base - el desvío
Que pasa si llevo 16 horas de esfuerzo acumulado y necesitaria tener 20hs para este momento? Esto es un **desvio**. Este tiene que corregirse pero esto puede implicar cambiar la calidad o en su defecto cambiar el alcance. Despues de todo estan relacionados. Aca aparece el cambio de alcance. Esto se debe a que tengo que preguntarme:
- Cambio la calidad?
- Cambio el alcance?
El tiempo es fijo y debo cambiar algo de eso. En cambio si el tiempo no es fijo puedo armar **otra linea base** que implica una **nueva planificación**. Sobre la cual controlo, trabajo y analizo cambios de calidad y cambios de alcance.
> Replanificar -> Nueva linea base


---

# Clase 15 — Gestión del Tiempo

> Administración de Sistemas de Información — UTN FRBA

## Agenda

1. Repaso de Gestión de la Calidad en el proyecto y Gestión de Cambios al Alcance.
2. Gestión del Tiempo del proyecto.
3. Pasos para el armado del Cronograma del proyecto.
4. Ejercicio Práctico para el armado del Gantt (cronograma).
5. Plan a alto nivel del proyecto.
6. Actividades para la próxima clase.

---

## 1. Repaso

### Gestión de la Calidad

Resulta importante destacar que lo que nosotros solemos denominar como **"control de calidad"**, el PMI lo denomina **aseguramiento de la calidad (QA)**, ya que el proceso de control siempre corresponde a una acción inherente al PM, verificando que todo esté dentro del plan y no existan desvíos.

Como instrumento de identificación de la política de calidad a aplicar en el proyecto estará el tipo de **metodología**: por ejemplo CMMI, PMI, etc.

**Flujo del proceso:**

```
Identificación de la Política de Calidad
        ↓
Planificación de las acciones de calidad
        ↓                    ↘
Control y Seguimiento  ←  Aseguramiento de la Calidad
        ↓
      Cierre
```

> Una **gestión de calidad efectiva** asegura entregables adecuados a los requisitos, mejora la **satisfacción de los interesados** y contribuye al **éxito del proyecto**.

### Gestión de Cambios al Alcance

Resulta importante mencionar que la variable **Cambios al Alcance** es la que permite definir y modelar la manera en que se gestionarán los cambios solicitados por el usuario, principalmente en los proyectos que contemplen desarrollo de software y en los ámbitos de empresas u organizaciones complejas.

Como instrumento para identificar y gestionar los cambios al alcance se utiliza la **Bitácora de Cambios**.

**Flujo del proceso:**

```
Identificación de la política de Cambios al alcance
        ↓
Planificación de las acciones
        ↓
Gestión de Cambios al Alcance ← Contempla actividades de análisis
        ↓                        e identificación de impactos de
      Cierre                     aceptar o rechazar un cambio
        ↑
Durante el cierre se evalúan los cambios rechazados y con ellos
se plantea la estrategia para encarar el proyecto de mejoras
y evolución de la solución
```

> Una **gestión efectiva** de cambios al alcance asegura que el proyecto se mantenga **alineado** con los objetivos, minimice riesgos y entregue **valor** al negocio.

### Ciclo de Vida de un Proyecto (según el PMI)

1. **Estructuración o Iniciación**: Se define el proyecto a alto nivel, se identifican necesidades, objetivos y viabilidad.
2. **Planificación**: Se detallan los objetivos, alcance, recursos, tiempos, costos y riesgos. Se elabora el plan del proyecto.
3. **Ejecución**: Se lleva a cabo el plan del proyecto para producir los entregables definidos.
4. **Control y Seguimiento**: Se monitorea el desempeño del proyecto, se comparan resultados con el plan y se toman acciones correctivas cuando es necesario.
5. **Cierre**: Se finaliza formalmente el proyecto, se entregan los entregables y se documentan las lecciones aprendidas.

> Un ciclo continuo de mejora y aprendizaje.

_(Nota: Estructuración/Planificación se solapan parcialmente, y Ejecución se relaciona en bucle con Control y Seguimiento, que desemboca en Cierre.)_

### Áreas de Conocimiento a contemplar en un proyecto

Triángulo central: **Alcance** (arriba), **Tiempo** (izquierda), **Costo** (derecha) — interrelacionados.

Otras áreas (eje vertical):

- Calidad
- Riesgos
- Capital Intelectual
- Comunicaciones
- Recursos Materiales
- Cambios al Alcance
- Interesados
- Adquisiciones

> Un ciclo continuo de mejora y **aprendizaje**.

---

## 2. Gestión del Tiempo

Resulta importante mencionar que la variable **Tiempo** es la que permite estimar la **duración total del proyecto**, identificar las actividades de cada entregable que tiene el proyecto y el armado del cronograma **"Línea Base"** que se utilizará para comparar lo planeado respecto a lo que sucede en la realidad.

**Flujo del proceso:**

```
Definición de las actividades de cada entregable
        ↓
Determinación de la duración de cada actividad
        ↓
Armado del Cronograma → Control del Cronograma - Linea base
```

- **Armado del Cronograma**: Se genera el cronograma denominado **"Línea Base"** que es el que se utiliza para contrastar la realidad vs lo planeado.
	- Tengo que controlar esfuerzo, costo y recursos.
	- Esto implica tambien limitar el control de alcance a nivel paquetes y actividades para que no exploten los costos
- **Control del Cronograma**: Las tareas de control y seguimiento del cronograma permitirán identificar los desvíos y ajustes que sean necesarios hacer. Como instrumento de seguimiento se suele utilizar **EVM** (Earned Value Management).

### ¿En qué consiste la Gestión del Tiempo?

En la elaboración del denominado:

- **Diagrama de Red**: que permitirá relacionar las tareas del proyecto y descubrir el **camino crítico**.
    
- **Cronograma del Proyecto**: que permitirá llevar las tareas del proyecto a la vida real asociándole **fechas, recursos y dependencias** de cada tarea.
    

### ¿Qué se va a lograr?

1. Obtener la **duración total** del Proyecto.
2. Detectar la toma de **decisiones estratégicas** en la Fase de Estructuración.
3. Identificar el conjunto de **acciones** que se podrían **ejecutar en paralelo** (conocido como técnica de **Fast-Tracking**).
4. Identificar las acciones del **Camino Crítico** que necesitarán mayor cantidad de recursos (conocido como técnica de **Crashing**).

### Tipos de Estimaciones
Esto se hace para cada actividad individualmente

1. **Bottom-Up**
2. **Análoga o Top-Down**
3. **Paramétrica (precio × cantidad)**: Cuando se conoce la cantidad. (Ej: puntos de función). Esto es experiencia previa o expertos.
4. **Pert (con tres estimaciones)**: Optimista, Pesimista, Más Probable.
5. **Simulación de Montecarlo**: Para determinar convergencia de caminos.

#### Ventajas y Desventajas de cada tipo de estimación

| Tipo de Estimación | Ventajas                                                                                                                                     | Desventajas                                         |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| **Bottom-Up**      | Es el más exacto. Tardo lo que tarde la suma de esfuerzo de actividades                                                                      | Requiere mayor esfuerzo                             |
| **Top-Down**       | Es el más rápido. Una unica estimación antes de comenzar el proyecto.                                                                        | Puede resultar inexacta sin la experiencia adecuada |
| **Paramétrica**    | Se anticipa el costo por línea de código, pantallas o puntos de función. Comparar con otro proyecto parecido                                 | Requiere conocimiento previo por proyecto parecido  |
| **PERT**           | Se puede obtener fácilmente la desviación estándar: `E = (O + 4M + P)/6`. Sirve para cuando no tenes idea de cuanto puede llevar el proyecto | Requiere profesionalismo y honestidad               |

### ¿Cómo hacer una estimación de esfuerzo exitosa?

1. Documentando todos los **supuestos** de la estimación → Utilizando **rangos**. No las estimo pero las tengo en cuenta
2. Estableciendo un **nivel de confianza** de la estimación.
3. Consultando al **responsable** de ejecutar la tarea.
4. Reconociendo que la estimación **no es una Negociación**.
5. Utilizando los conceptos de **"Esfuerzo"**(horas por tarea) y **"Tiempo transcurrido"**().
6. Utilizando el concepto de **"TimeBoxing"** → Restricciones de tiempo.

### Recordar siempre

Que una **estimación** es buena en la medida que:

1. Sea **auditable** (verificable).
2. Sea **sincera** (sin poner colchones porque sí).
3. Sea **confiable** (dependiente de supuestos que se encuentran documentados).

### Existen tres niveles de exactitud en las estimaciones

|Nivel|Desvío (-)|Desvío (+)|Fase asociada|
|---|---|---|---|
|**De Orden de Magnitud**|-25%|+75%|Estructuración|
|**De Presupuesto**|-10%|+25%|Planificación|
|**Definitiva**|-5%|+10%|Planificación|

---

## 3. Pasos para el armado del Cronograma

### ¿De qué manera construir el cronograma?

1. Definiendo **fechas claves externas** (lanzamiento del producto, feriados, etc.).
2. Definiendo y documentando las **variables básicas** del calendario de trabajo:
    - Cuántos días por semana se trabaja en el proyecto.
    - Horario — Tiempos dedicados al almuerzo.
    - Vacaciones, Eventos de la Organización, etc.
3. **Validando** la disponibilidad de recursos.
4. **Asignando** los recursos a las actividades.
5. **Nivelando** los recursos.

### Pasos para el armado de un Gantt eficiente

|Nivel|Descripción|Contenido|
|---|---|---|
|**A**|Nivel previo|Tareas + Entregables + Roles|
|**B**|Nivel de armado|Título + División de Etapas o Fases + Hitos|
|**C**|Nivel de Verificación|Etapas + Entregables|

#### A. Nivel Previo

|Paso|Acción|Detalle|
|---|---|---|
|-3|Identificar Tareas|Para cada entregable|
|-2|Identificar Roles|Para cada tarea|
|-1|Definir Duración|Para cada tarea|

**Ejemplo desarrollado — Identificar Tareas (para cada entregable):**

- Redactar el Acta del Proyecto
- Elaborar Matriz de Roles y Responsabilidades
- Actualizar Matriz de Roles y Responsabilidades
- Elaborar Matriz de Habilidades y Competencias
- Elaborar material del kickoff del proyecto
- Modificar la Matriz de Roles y Responsabilidades
- Elaborar instructivos, políticas y procedimientos del proyecto
- Adaptar cronograma del proyecto

**Entregables (E) asociados:**

- (E) Acta del proyecto consensuada
- (E) Matriz de Roles y Responsabilidades actualizada
- (E) Matriz de Habilidades y Competencias elaborada
- (E) Material del kickoff elaborado
- (E) Instructivos, políticas y procedimientos elaborados
- (E) Cronograma adaptado

**Identificar Roles (para cada tarea):**

- Redactar el Acta del Proyecto — **(PM)**
- Elaborar Matriz de Roles y Responsabilidades — **(PM)**
- Actualizar Matriz de Roles y Responsabilidades — **(PM)**
- Elaborar Matriz de Habilidades y Competencias — **(PM)**
- Elaborar material del kickoff del proyecto — **(PM)**
- Modificar la Matriz de Roles y Responsabilidades — **(PM)**
- Elaborar instructivos, políticas y procedimientos del proyecto — **(PM)**
- Adaptar cronograma del proyecto — **(PM)**

**Definir Duración (para cada tarea):**

|Tarea|Rol|Duración|
|---|---|---|
|Redactar el Acta del Proyecto|PM|24 hs|
|Elaborar Matriz de Roles y Responsabilidades|PM|4 hs|
|Actualizar Matriz de Roles y Responsabilidades|PM|2 hs|
|Elaborar Matriz de Habilidades y Competencias|PM|16 hs|
|Elaborar material del kickoff del proyecto|PM|40 hs|
|Modificar la Matriz de Roles y Responsabilidades|PM|2 hs|
|Elaborar instructivos, políticas y procedimientos del proyecto|PM|24 hs|
|Adaptar cronograma del proyecto|PM|8 hs|

#### B. Nivel de Armado

|Paso|Acción|Contenido|
|---|---|---|
|0|Comienzo|Título del Proyecto|
|1|1er Nivel de la WBS|Etapas o Fases del Proyecto|
|2|Escribir las actividades|Actividades del Proyecto|
|3|Identificar Hitos|Entregables del Proyecto|
|4|Establecer precedencias|Etapas + Tareas + Duración + Predecesoras + Recursos + Hitos|
|5|Establecer jerarquía|Etapas + Tareas + Hitos|
|6|Resultado final|Etapas + Tareas + Hitos|

**Ejemplo completo (capturas de MS Project) — Proyecto: "Implementación de un Sistema de Gestión Educativa"**

Paso 0 — Comienzo:

```
1 día? — mar 15/06/21 → mar 15/06/21
Implementación de un Sistema de Gestión Educativa
```

Paso 1 — 1er Nivel de la WBS (Etapas o Fases):

```
1  Implementación de un Sistema de Gestión Educativa    1 día?
2  Fase 0 (Inicial)                                     1 día?
3  Redactar el Acta del Proyecto                        1 día?
4  Elaborar Matriz de Roles y Responsabilidades         1 día?
5  Actualizar Matriz de Roles y Responsabilidades       1 día?
6  Elaborar Matriz de Habilidades y Competencias        1 día?
7  Elaborar material del kickoff del proyecto           1 día?
8  Elaborar instructivos, políticas y procedimientos    1 día?
9  Adaptar cronograma del proyecto                      1 día?
```

Paso 2 — Escribir las actividades (agrega hitos abajo):

```
10 (E) Acta del proyecto consensuada                    0 días
11 (E) Matriz de Roles y Responsabilidades actualizada  0 días
12 (E) Matriz de Habilidades y Competencias elaborada   0 días
13 (E) Material del kickoff elaborado                   0 días
14 (E) Instructivos, políticas y procedimientos elaborados  0 días
15 (E) Cronograma adaptado                              0 días
```

Paso 3 — Identificar Hitos: se marcan como hitos (0 días) los entregables (10 a 15).

Paso 4 — Establecer precedencias (Etapas + Tareas + Duración + Predecesoras + Recursos + Hitos):

|#|Nombre de tarea|Duración|Comienzo|Fin|Predecesoras|Recurso|
|---|---|---|---|---|---|---|
|1|Implementación de un Sistema de Gestión Educativa|1 día?|mar 15/06/21|mar 15/06/21|||
|2|Fase 0 (Inicial)|1 día?|mar 15/06/21|mar 15/06/21|||
|3|Redactar el Acta del Proyecto|24 horas|mar 15/06/21|jue 17/06/21|||
|4|Elaborar Matriz de Roles y Responsabilidades|4 días|vie 18/06/21|mié 23/06/21|3|Andrea Alegretti (PM)|
|5|Actualizar Matriz de Roles y Responsabilidades|2 horas|jue 24/06/21|jue 24/06/21|4|Andrea Alegretti (PM)|
|6|Elaborar Matriz de Habilidades y Competencias|16 horas|jue 24/06/21|lun 28/06/21|5|Andrea Alegretti (PM)|
|7|Elaborar material del kickoff del proyecto|40 horas|lun 28/06/21|lun 05/07/21|6|Andrea Alegretti (PM)|
|8|Elaborar instructivos, políticas y procedimientos del proyecto|24 horas|lun 05/07/21|jue 08/07/21|7|Andrea Alegretti (PM)|
|9|Adaptar cronograma del proyecto|8 horas|jue 08/07/21|vie 09/07/21|8|Andrea Alegretti (PM)|
|10|(E) Acta del proyecto consensuada|0 días|jue 17/06/21|jue 17/06/21|3||
|11|(E) Matriz de Roles y Responsabilidades actualizada|0 días|jue 24/06/21|jue 24/06/21|5||
|12|(E) Matriz de Habilidades y Competencias elaborada|0 días|lun 28/06/21|lun 28/06/21|6||
|13|(E) Material del kickoff elaborado|0 días|lun 05/07/21|lun 05/07/21|7||
|14|(E) Instructivos, políticas y procedimientos elaborados|0 días|jue 08/07/21|jue 08/07/21|8||
|15|(E) Cronograma adaptado|0 días|vie 09/07/21|vie 09/07/21|9||

Paso 5 — Establecer jerarquía: se aplica sangría (indentación) a las tareas 3-9 y a los hitos 10-15 bajo "Fase 0 (Inicial)" (Alt+Mayús+Derecha en MS Project), convirtiendo a la Fase en tarea resumen con duración total de **18,25 días** (mar 15/06/21 → vie 09/07/21).

Paso 6 — Resultado final (estructura jerárquica completa):

```
1  Implementación de un Sistema de Gestión Educativa   18,25 días  mar 15/06/21 → vie 09/07/21
2    Fase 0 (Inicial)                                  18,25 días  mar 15/06/21 → vie 09/07/21
3      Redactar el Acta del Proyecto                   24 horas    mar 15/06/21 → jue 17/06/21
4      Elaborar Matriz de Roles y Responsabilidades    4 días      vie 18/06/21 → mié 23/06/21
5      Actualizar Matriz de Roles y Responsabilidades  2 horas     jue 24/06/21 → jue 24/06/21
6      Elaborar Matriz de Habilidades y Competencias   16 horas    jue 24/06/21 → lun 28/06/21
7      Elaborar material del kickoff del proyecto      40 horas    lun 28/06/21 → lun 05/07/21
8      Elaborar instructivos, políticas y procedimientos  24 horas lun 05/07/21 → jue 08/07/21
9      Adaptar cronograma del proyecto                 8 horas     jue 08/07/21 → vie 09/07/21
10     (E) Acta del proyecto consensuada                0 días     jue 17/06/21
11     (E) Matriz de Roles y Responsabilidades actualizada 0 días  jue 24/06/21
12     (E) Matriz de Habilidades y Competencias elaborada  0 días  lun 28/06/21
13     (E) Material del kickoff elaborado               0 días    lun 05/07/21
14     (E) Instructivos, políticas y procedimientos elaborados 0 días jue 08/07/21
15     (E) Cronograma adaptado                          0 días    vie 09/07/21
```

#### C. Nivel de Verificación

|Paso|Acción|Contenido|
|---|---|---|
|1|Cerrar Etapa o Fase|1 etapa|
|2|Cerrar a nivel Proyecto|Colapsar todas las etapas|
|3|Verificar la línea de tiempo|Diagrama de Gantt|

**Paso 1 — Cerrar Etapa o Fase:** Se colapsa la "Fase 0 (Inicial)" mostrando sólo el resumen y los hitos (10-15).

**Paso 2 — Cerrar a nivel Proyecto (colapsar todas las etapas):** Ejemplo con dos fases:

```
1  Implementación de un Sistema de Gestión Educativa   21,25 días  mar 15/06/21 → mié 14/07/21
2  + Fase 0 (Inicial)                                  18,25 días  mar 15/06/21 → vie 09/07/21
   (E) Acta del proyecto consensuada ... (E) Cronograma adaptado
16 + Fase 1 (Análisis)                                 3 días      vie 09/07/21 → mié 14/07/21
18   (E) Documento de Casos de Uso del Negocio Realizado  0 días   mié 14/07/21
```

**Paso 3 — Verificar la línea de tiempo (Diagrama de Gantt):** Se visualiza el diagrama de barras con las tareas de "Andrea Alegretti (PM)" encadenadas desde 15/06/21 hasta 14/07/21, con los hitos marcados en las fechas: 17/06, 24/06, 28/06, 05/07, 08/07, 09/07, 14/07.

---

## 4. Ejercicio Práctico (Actividad Grupal)

**Actividad Grupal: Armado de Gantt**

Ejemplo de referencia — Gantt Chart de campaña de marketing (4 semanas):

|Tasks|Week 1|Week 2|Week 3|Week 4|
|---|---|---|---|---|
|Market research|▮▮▮||||
|Digital advertising||▮▮|||
|Marketing briefs||▮|||
|Copywriting|||▮▮||
|Paid Social||▮▮|||
|Design Rollout||▮▮▮|||
|Print assets|||▮▮||
|Social campaign||||▮▮|
|Sale period|||▮▮||
|Extended hours||||▮▮|
|Post-campaign analysis||||▮|

---

## 5. Plan a Alto Nivel (Roadmap)

El plan a alto nivel del proyecto se representa habitualmente como un **roadmap** con hitos jalonados en el tiempo (íconos de pin de ubicación sobre un camino).

### Ejemplo 1 — Roadmap por etapas (Marzo a Agosto 2022)

|Etapas|Marzo-22|Abril-22|Mayo-22|Junio-22|Julio-22|Agosto-22|
|---|---|---|---|---|---|---|
|**Gestión**|Gestión ◇ Acta de proyecto||||||
|**Análisis**||Análisis ◇ EDT|||||
|**Diseño**||Diseño|◇ Diseño funcional y técnico||||
|**Desarrollo**|||Desarrollo (barra continua hasta Julio)||||
|Sprint 1|||Sprint 1 ◇ Módulo de aprobación||||
|Sprint 2||||Sprint 2 ◇ Workflow SAP|||
|Sprint 3|||||Sprint 3 ◇ Aplicación Fiori||
|Sprint 4|||||Sprint 4 ◇ Integración||
|**Cierre**||||||Cierre ◇ Informe de cierre|

Hitos (fechas): 01/03, 18/03, 04/04, 29/04, 30/05, 27/06, 25/07, 19/08, 25/08.

### Ejemplo 2 — Roadmap tipo timeline con entregables (Gestión, Diseño, Desarrollo, Implementación, Cierre)

- **Gestión** (02/11/2021 - 01/12/2021):
    
    - Acta de proyecto aprobada
    - Matriz de roles y responsabilidades aprobada
    - Matriz de interesados aprobada
    - Matriz de comunicaciones aprobada
    - Diagrama de estructura de descomposición de trabajo aprobada
    - Matriz de gestión de riesgos aprobada
    - Matriz de habilidades y competencias aprobada
    - Mapeo de procesos aprobado
    - Plantilla de costos controlada
    - Gantt realizado
- **Diseño** (01/12/2021 - 31/12/2021):
    
    - Flujos de procesos de gestión y pedidos de comida controlados
    - Informe de relevamiento de procesos de gestión y pedidos de comida realizados
- **Desarrollo** (31/12/2021 - 25/04/2022):
    
    - Especificaciones Técnicas aprobadas
    - Diagrama Entidad-Relación realizado
    - Plan de pruebas aprobado
    - Casos de prueba controlados
    - Módulo de usuarios desarrollado
    - Módulo de locales desarrollado
    - Módulo de pedidos desarrollado
- **Implementación** (25/04/2022 - 17/05/2022):
    
    - Plan de despliegue en producción controlado
    - Puesta en producción del sistema realizado
- **Cierre de proyecto** (17/05/2022 - 19/05/2022):
    
    - Documento de lecciones aprendidas y Cierre de proyecto completo

### Ejemplo 3 — Roadmap por Releases (Gestión, Diseño/Desarrollo/Pruebas, Cierre)

- **GESTIÓN** (21/03/24 - 10/07/24):
    
    - Documentación general del proyecto
    - Doc. de arquitectura inicializado
    - Product backlog y Story Mapping elaborados
    - Casos y plan de pruebas elaborados
    - Tablero de control N° 1 elaborado
- **DISEÑO, DESARROLLO Y PRUEBAS** (11/07/24 - 30/10/24):
    
    - Release 1: Administración de contenidos
    - Release 2: Perfil de usuario con testeo de aprendizaje
    - Release 3: Gestión de satisfacción con contenidos
    - Release 4: Plataforma finalizada
- **CIERRE** (31/10/24 - 27/11/24):
    
    - Presentación final elaborada
    - Informes de avance elaborados
    - Doc. de lecciones aprendidas y cierre elaborado

**Detalle por Release:**

|Release 1 (11/07/24 - 07/08/24)|Release 2 (08/08/24 - 04/09/24)|Release 3 (05/09/24 - 02/10/24)|Release 4 (03/10/24 - 30/10/24)|
|---|---|---|---|
|Doc. de arquitectura elaborado|Doc. de arquitectura actualizado|Doc. de arquitectura actualizado|Módulo de administración de cursos: administración y carga de contenido|
|Modelo de IA inicial|Modelo de IA actualizado|Modelo de IA actualizado|Modelo IA finalizado|
|Módulo de administración de contenidos|Módulo de gestión de perfil de usuario + testeo tipo de aprendizaje|Módulo de análisis de satisfacción|Doc. de arquitectura finalizado|
|Sprints backlog elaborado|Sprints backlog elaborado|Plan y casos de pruebas actualizado|Sprints backlog finalizado|
|Resúmenes de sprints elaborados|Resumen de los sprints elaborados|Sprints backlog elaborado|Resúmenes de sprints elaborados|
|Story Mapping actualizado|Casos y plan de pruebas actualizados|Resúmenes de sprints elaborados|Paper CoNaIISI finalizado|
|Historias de usuario elaboradas|Presentación comercial elaborada|Tablero de control N° 3 elaborado|Casos y plan de pruebas ejecutados|
|Casos y plan de pruebas actualizados|Paper preliminar CoNaIISI elaborado||Manual de usuario elaborado|
|Tablero de control N° 2 elaborado|Poster A4 elaborado||Plataforma finalizada|
||||Tablero de control N° 4 elaborado|

### Ejemplo 4 — Roadmap tipo "carretera" con nodos numerados (0-9)

```
0 Estructuración y relevamiento   15/04/2024 - 03/06/2024
1 Análisis                        02/05/2024 - 17/06/2024
2 Diseño y modelado                10/06/2024 - 24/06/2024
3 Presentación Comercial           25/06/2024 - 22/08/2024
4 Desarrollo                       25/06/2024 - 24/09/2024
5 Pruebas                          09/09/2024 - 04/10/2024
6 Control                          03/06/2024 - 24/10/2024
7 Instalación y configuración      04/10/2024 - 22/10/2024
8 Capacitación                     22/10/2024 - 04/11/2024
9 Cierre del proyecto              04/11/2024 - 21/11/2024
```

### Ejemplo 5 — Roadmap de Recambio de SIGEU (2023-2024) — Plan estratégico por trimestres

```
Febrero 2023 → Marzo 2023 → Julio 2023 → Febrero 2024
```

|Trimestre|Hito|
|---|---|
|T1|Equipo de trabajo del Proyecto definido — Identificar los roles y referentes que trabajarán en el proyecto|
|T2|Comité de Dirección definido — Establecer la política y lineamientos de trabajo del equipo del proyecto|
|T3|Comité de Gestión de Cambios definidos — Identificar roles y referentes y establecer la política y estrategia de gestión del cambio funcional|
|T4|Usuarios Claves y Líder de Frente definidos — Identificar los usuarios claves y definir el líder que llevará adelante la ejecución del proyecto|
|T5|Relevamiento y Análisis de funcionalidades claves e integraciones realizado — Identificar y analizar las funcionalidades y las integraciones con los otros sistemas requeridos|
|T6|Documentación y Procesos actualizados — Documentar los procesos faltantes y actualizar los existentes|
|T7|Alcance del proyecto y Estrategia de implementación definida — Detectar el alcance del proyecto de Implementación y definir la estrategia asociada|
|T8|Plataforma seleccionada — Seleccionar y contratar plataforma|
|T9|Planificación del Proyecto elaborado — Armar el cronograma de proyecto y preparar el material del (Kick Off) técnico|
|T10|Procesos del negocio configurados — Realizar la configuración de las reglas del negocio sobre la plataforma y las interfaces con los otros sistemas|
|T11|Capacitación realizada — Llevar a cabo la capacitación de cada proceso|
|T12|Estrategia de mantenimiento y de evolución definida — Elaborar el plan de acción relacionado con el mantenimiento y nuevos releases del sistema|

Período: 01 (Febrero 2023) a 30/09/2024.

---

## Consignas

Continuando con el proyecto que se viene trabajando en **equipo** clase a clase:

1. Confeccionar el **cronograma** de Proyecto.
2. Confeccionar el **Plan a alto Nivel** del acta de Proyecto.

> 👥 Actividad grupal

---

## Actividades para la próxima clase

1. Revisar las correcciones del TP.
2. Comenzar a plantear el cronograma del Proyecto.
## Como hago un project libre
El entregable debe ser atomico y es un paquete de trabajo
cada paquete de trabajo se compone por una o mas actividades, por ejemplo tengo acta de proyecto elaborada, aprobada, firmada
1. Agarro la lista de entregables de la edt
2. Comienzo a relacionar dichos entregables de la edt. Por ejemplo, no puedo hacer el seguimiento de algo si no tengo su planificacion
3. Convertir paquetes de trabajo en actividades 
4. relaciono las actividades segun como las necesito
5. Ahi puedo empezar a estimar el esfuerzo
Generalmente estima la persona que tiene que realizar el esfuerzo. Entonces lo mejor es hacer una estimacion a mas bajo nivel, es decir, hacer un mapa de estimaciones. Es decir, lo mas cercano. 
> Se estima el tamaño de una tarea y el tiempo es una consecuencia. 

#### pasos
1. Cada entregable va dentro de un nombre
2. El primer nivel es el nombre de proyecto
3. El segundo nivel es la fase
4. El tercer nivel es el de entregable o paquete de trabajo
5. Esta compuesto por multiples actividades
6. Elaboro dependencias entre dichas actividades
NIVELES
- Fase
	- Entregable/paquete de trabajo. Porque la WBS es de paquetes de trabajo
		- Actividad o tarea
Luego cada actividad o tarea se relacionan entre si
Para hacer esto necesito **sangrar** o indicar sangria desde la pestaña sangría. Esto me tiene que quedar similar a la WBS
#### Predecesores
Indica precedencia entre actividades y se hace a este ultimo nivel para permitir concurrencia
#### Trabajo
Es una columna a insertar que nos dice estimacion en horas de trabajo

#### Relaciones entre actividades
Segun la relacion puedo trabajar quizas de forma concurrente o no:
- Fin-Comienzo FC -> La tarea B comienza cuando termina A
- Comienzo-Comienzo CC -> El inicio de la tarea A determina el inicio de la tarea B
- Fin-Fin FF -> La tarea B termina cuando termina A
- Comienzo-Fin CF -> El inicio de A indica la finalizacion de B. B no puede terminar hasta no empezar A
> Estas son relaciones de dependencia donde B depende de o esta condicionada por A

##### Tecnicas para tomar desiciones en la baseline
Estoy atrasado y tengo que terminar antes o tuve un problema:
- Intensificar o **crashing**: Sumo gente a una actividad o tarea. Asigno mas recursos para acelerar actividades. Aumenta el costo
- Fast tracking o ejecucion rapida: Observa ruta critica para determinar actividades a ejecutar en simultáneo. Aumenta el riesgo.
#### Recursos
En realidad son roles o responsables de cada entregable. Esto tiene que ser coherente con la matriz RACI. 
> Se agrega en la pestaña recurso de projectlibre
> Tengo que asignar el tiempo tambien de las personas que participan en una actividad para ambos roles

#### Fases y entregables
Deben estar identados para que la fase lo incluya. Luego cada entregable va con una (E) delante y van con duración 0. Los entregables entonces son hitos con duracion 0
- Proyecto
	- Fase
		- Actividades de cada fase. Cada actividad tendra dependencias con entregables, es decir, la tendra como dependencia
		
	- (E)Entregable -> duracion 0
> Basicamente el entregable tiene dependencia en sus actividades pero tienen duracion 0. Luego las actividades quedan guardadas dentro de la Fase
Kanban -> dominio simple
scrum -> dominio complicado
___
## 4. Estimaciones de Software

---

### ¿Qué es importante estimar? ¿Qué NO?

**NO** es importante estimar el **tiempo** que vamos a tardar en desarrollar el proyecto.  
**NO** es importante estimar la **duración** del proyecto, ni la cantidad de horas por persona.  
**NO** es importante estimar el **costo** del proyecto.

**SÍ** es importante estimar el **tamaño** de lo que vamos a construir:

- El **tamaño** siempre será la misma cantidad, independientemente de las personas que participen.
#### Proceso de estimar
1. Requerimientos
2. Tamaño del proyecto
3. estimar el Esfuerzo a dedicar
4. Duración o costo de trabajo
Los requerimientos y la estimacion del tamaño deberian ser similares para cualquier equipo. Sin embargo, la duracion y el esfuerzo dependen del equipo y los procesos del mismo y las herramientas y tecnicas que utilizen

---

### Razones por las que fallan las estimaciones

- Demasiado optimismo.
- Estimaciones informales del estilo "más o menos en X tiempo está", sin ningún argumento consistente.
- No se estima el tamaño.
- Alcance mal definido.
- No hay suficiente experiencia ni historia.
- Complejidad del problema a resolver.
- No hay seguimiento ni control una vez empezado el proyecto.
- No se administran los requerimientos adecuadamente.
Mi objetivo es evitar las fallas

###### Ciclos de vida de las estimaciones
A medida que avanza mi proyecto mi prediccion/estimacion puede ser mas o menos precisa segun el **nivel de incertidumbre.** El cono de incertidumbre define niveles estadísticos predecibles de la incertidumbre de las estimaciones en cada etapa del proyecto. Cuanto mas refinada la definición, mas exacta la estimación.

#### Cono de incertidumbre 
- Cuanto más refinada la definición, más exacta será la estimación.
- A medida que avanza el proyecto, la incertidumbre se reduce.
- Al inicio del proyecto:
    - **Mínimo**: 0,25X (4 veces por debajo)
    - **Máximo**: 4X (4 veces por exceso)

---

### Consejos para estimar

- **Objetivos, estimaciones y compromisos** son cosas distintas: el _objetivo_ lo fija el cliente, la _estimación_ la hace el equipo, el _compromiso_ es el acuerdo entre ambos.
- Asociar las estimaciones a un porcentaje de confiabilidad.
- Presentar estimaciones como **rangos de tiempo**, no como un único valor.
- Presentar los **supuestos y riesgos** considerados al hacer la estimación (sirve para aprender y ganar experiencia).
- Recolectar **datos históricos** (a mayor cantidad, más exactas son las estimaciones).
- Evitar la **Ley de Parkinson**: que una tarea ocupe el tiempo que deba ocupar, ni más ni menos.
- Considerar **todas** las actividades: análisis, diseño, testing, certificaciones, documentación, etc.
- Recolectar datos historicos para tener como referencia
- No asumir que por solo el paso del tiempo y de las fases de un proyecto se avanza con menor incertidumbre en las estimaciones

---

### Estimaciones creíbles

- Las personas hacen las estimaciones (las herramientas ayudan, pero las personas definen).
- Las estimaciones se basan en comparaciones y por ende necesito historia de proyectos pasados para comparar
- Los métodos deben ser de **"caja blanca"**: todos pueden saber qué hay dentro.

---

### ¿Qué se debe estimar? ¿En qué orden?

|#|Qué|Medida|Depende del equipo|
|---|---|---|---|
|1|**Requerimientos**|—|No|
|2|**Tamaño**|—|No|
|3|**Esfuerzo**|HH (horas hombre)|Sí|
|4|**Duración**|días / semanas / meses|Sí|

#### Recomendaciones
- Juntar historia de todos los proyectos, registrar lecciones aprendidas y la importancia de la comunicacion
- Desarrollar metodo de estimacion adecuado a la instalacion basado en los conocidos y crear el propio. Lo importante es la eficacia
- No descartar metodos porque si
- Usar metodos elaborados sin experiencia o info suficiente
- Ignorar supuestos/presuposiciones.

---

### Ciclo de Estimación
Ayuda a mejorar la forma de estimar. Cada vez que lo recorro/itero hago que mi estimacion/metodo sea mejor

```
ESTIMAR → MEDIR → REGISTRAR → COMPARAR → ANALIZAR → CALIBRAR → VOLVER A ESTIMAR → ...
```

| Paso                 | Descripción                                                              |
| -------------------- | ------------------------------------------------------------------------ |
| **Estimar**          | Se estiman requerimientos, tamaño, esfuerzo y duración.                  |
| **Medir**            | Se mide tamaño, esfuerzo y costo durante la evolución del proyecto.      |
| **Registrar**        | Se registran esas mediciones y las estimaciones iniciales.               |
| **Comparar**         | Estimaciones iniciales vs. reales.                                       |
| **Analizar**         | Se analizan desvíos y diferencias.                                       |
| **Calibrar**         | Si hubo desvío, se ajustan variables y parámetros del método.            |
| **Volver a Estimar** | Con el método calibrado, se re-estima el próximo (o el último) proyecto. |

> El ciclo se repite hasta que no haya diferencias entre las estimaciones iniciales y las reales.

---

### Métodos de Estimación

#### No Paramétricos (Rudimentarios / Caseros)
No dan tamaño, sino que dan fechas-horas-esfuerzo

##### Juicio Experto

Estimación realizada por una **única persona experta**, basada en experiencia personal y analogías. Simple, barato, útil en etapas tempranas. La calidad depende del experto. Es sencillo de implementar pero depende de un experto y de su humor

##### PERT o Clark

Similar al juicio experto pero con miradas (datos) optimistas y pesimistas:

```
Estimación = (E_optimista + 4 × E_media + E_pesimista) / 6
```
Permite estimar tamaño y esfuerzo.
##### Wideband Delphi

Similar al juicio experto pero **grupal**: cada experto estima individualmente y, mediante iteraciones, se llega a un consenso. Útil cuando no hay datos históricos.
Es facil de implementar y da sentido de propiedad a la estimación. Se puede usar en etapas tempranas del proyecto. Se recomienda usar en proyectos poco conocidos en donde no se cuenta con historia

##### Planning Poker

Similar a Wideband Delphi pero se estiman **tamaños relativos** usando una tarea "pivote" como referencia. Consensuado, rápido, ideal para desarrollo incremental.

**Dinámica:**
Hasta que se llegue a la cantidad de SP que marca la velocity del sprint
1. El SM modera; el PO resuelve dudas.
2. Se define la tarea "pivote" con su tamaño en story points.
3. Cada integrante asigna story points a cada user story relativo al pivote. Si no hay acuerdo, se repite (converge en 2-3 rondas).
4. Se visualizan todas las estimaciones para compararlas y ajustarlas.
###### Reglas
- Participantes: Todo el equipo
- Timebox: cantidad de tiempo que se va a estimar y cumplirlo
- Priorizar: Todas las user stories(requerimientos) deben estar priorizadas y leidos
- Escala: Suele usar la sucesion de fibonacci
- Tarea pivote: Defino una user story pivote y de doy un tamaño en story points. Puede ser una story actual o una anterior significativa. Luego arreglo las demas stories respecto a mejor o peor que esta
##### Reglas
- Velocity: para saber numero minimo de SP que necesito estimar paara completar un sprint
- Definicion de terminado: Dar definicion de una user story terminada
Epicas: Suma de historias
Historias: Suma de tareas que se necesitan para cumplir con dicho requerimiento

---

#### Paramétricos (Sofisticados)
Llevan uno o mas parametros. NO son mejores que los otros sino que tienen otro enfoque. Devuelven tamaño del proyecto.

##### Function Points (FP)

Miden el **tamaño funcional o requerimientos** del software. Independiente de la tecnología.

**Funciones identificadas:** archivos lógicos internos, archivos de interfaz externos, entradas externas, salidas externas, consultas externas.

**Cada función se clasifica:** high / average / low (con pesos asignados) → se obtienen los **UFP**.

**Se calculan 14 TCF** (technical complexity factor, 0–5 cada uno):

```
TCF = 0,65 + (Suma de Factores / 100)    →    TCF ∈ [0,65 ; 1,35]

FP = UFP × TCF
```

> FP (tamaño) → HH (esfuerzo) → días/semanas/meses (duración)

Se usa mucho en la industria. Lo que mide es:
- Archivos logicos de sistema
- Archivos de interfaces externas
- Entradas externas
- Salidas externas
- Entradas externas.

---

##### Use Case Points (UCP)

Miden la **complejidad de los casos de uso** y de los actores y factores tecnico.

```
UAW   = suma de actores × sus pesos
UUCW  = suma de casos de uso × sus pesos
UUCP  = UAW + UUCW

TCF   = 0,6 + (0,01 × Tfactor)
EF    = 1,4 − (0,03 × Efactor)

UCP   = UUCP × TCF × EF
```

> UCP → HH (esfuerzo)

---

##### Object Points (OP)

Miden la **complejidad de los objetos** (pantallas, reportes, módulos, clases, scripts SQL, stored procedures, etc.). Recomendado para proyectos ya conocidos.

**Objetos clasificados:** high / average / low → se suman los productos cantidad × peso → **OP**
Cada clasificacion tiene su peso y de ahi puedo obtener su peso total bruto.  
`OP = suma de objetos x complejidad de cada uno`
Tambien debo tener en cuenta que puedo reutilizar componentes y por ende tener en cuenta el
**Factor de reúso:**

```
NOP = OP × (100 − %reutilización) / 100
```

> OP (tamaño) → HH (esfuerzo) → días/semanas/meses (duración)

---

### Comparativa de Métodos

| Método          | Tipo           | Requiere historia | Momento de uso               | Participantes |
| --------------- | -------------- | ----------------- | ---------------------------- | ------------- |
| Juicio Experto  | No paramétrico | No                | Etapas tempranas             | 1 experto     |
| PERT / Clark    | No paramétrico | No                | Etapas tempranas             | 1 experto     |
| Wideband Delphi | No paramétrico | No                | Etapas tempranas             | Equipo        |
| Planning Poker  | No paramétrico | Recomendable      | Sprints / incremental        | Equipo        |
| Function Points | Paramétrico    | Sí                | Con requerimientos definidos | Analistas     |
| Use Case Points | Paramétrico    | Sí                | Con casos de uso definidos   | Analistas     |
| Object Points   | Paramétrico    | Sí                | Proyectos ya conocidos       | Analistas     |

---

### Recomendaciones Finales

**✅ Qué SÍ hacer:**

- Juntar historia de todos los proyectos y registrar lecciones aprendidas.
- Usar el método de estimación adecuado para el momento adecuado.
- Apoyarse en herramientas y aplicar el ciclo de estimación para mejorar continuamente.

**❌ Qué NO hacer:**

- Descartar algún método sin razón justificada.
- Ignorar los supuestos (siempre deben aclararse al principio).
- Usar métodos elaborados sin experiencia o información suficiente.
- 
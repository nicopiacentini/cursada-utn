- Si pasa el tamiz de IC vale la pena. Si no esta tan claro se discute
- Drive compartido/Google docs
- # 6. Software Testing

## Definiciones

El **software testing** es una actividad en la cual un sistema o componente es ejecutado bajo condiciones o contextos específicas. Los resultados de dicha ejecución son observados o registrados y, a partir de los mismos, se realiza una evaluación de algún aspecto del sistema o componente.

> El software testing es una investigación técnica empírica ejecutada para proveer a los stakeholders de información de la calidad del producto o servicio que se encuentra a prueba.

---

## Pruebas o Tests

- Las pruebas por sí mismas **encuentran fallas**, no defectos.
    - Por probar más (o menos) no se encontrarán más fallas: las fallas existen desde antes.
    - Las pruebas pueden **demostrar la presencia** de fallas, pero **no su ausencia**.
- Se parte de la base de que el software a probar **contiene defectos**.
- Si el objetivo fuera demostrar que el software no contiene errores, se estará inconscientemente orientado a ese fin.

> [!important] Testing El testing es ejecutar un componente software con el objetivo de **producir fallas**.
> 
> - Una prueba es **exitosa** si encuentra fallas.
> - Si al ejecutar una prueba no se encuentran fallas, la prueba no se hizo bien.
> - Todo software tiene fallas. No testear no elimina errores.

---

## Objetivo

El objetivo del testing es encontrar fallas en el producto de manera **eficiente** y **eficaz**:

|Criterio|Descripción|
|---|---|
|**Eficiente**|Lo más rápido y barato posible, sin malgastar tiempo ni dinero.|
|**Eficaz**|Encontrar la mayor cantidad de fallas, priorizando las más importantes y sin falsos positivos.|

> [!warning] El objetivo del testing es **encontrar fallas**, no demostrar que el software no las tiene.

---

## Importancia

- Los bugs pueden ser **costosos o peligrosos** → pérdidas económicas y/o humanas.
- Cuanto más temprano se encuentran los problemas → más barato corregirlos.
- El software es cada vez más **crítico y complejo**.
- El software está escrito por personas → puede tener defectos que llevarán a fallas.

### ¿Por qué se producen fallas?

- Requerimientos poco claros, incorrectos o cambiantes.
- Falta de experiencia en testers y/o desarrolladores.
- Diseño complejo, lógica complicada.
- Falta de tiempo.
- Falta de conocimiento del producto.
- Problemas del entorno o de sistemas.

---

## Software de Calidad

Un software de calidad es aquel que:

- Cumple con los **requisitos**.
- Al ser usado **no tenga fallas**.
- **Funciona** y hace lo que dice que hace.

El testing es una actividad que **asegura la calidad** de software mediante un patrón planificado y sistemático de casos de prueba.

---

## Aseguramiento vs Control de Calidad

> [!note] La calidad no puede inyectarse al final → depende de las tareas realizadas durante el proceso.

|                    | Quality Assurance (QA)                            | Quality Control (QC)                                     |
| ------------------ | ------------------------------------------------- | -------------------------------------------------------- |
| **Objetivo**       | Previene la aparición de defectos desde el inicio | Identifica y corrige defectos antes de llegar al cliente |
| **Tipo de prueba** | Estáticas (NO en runtime)                         | Dinámicas (en runtime)                                   |
La calidad no puede inyectarse al final y depende de las tareas realizadas en el proceso. Detectar errores de forma temprana ahorra esfuerzos, tiempo y recursos. 

---

## Verificación vs Validación

|              | Verificación                                         | Validación                                             |
| ------------ | ---------------------------------------------------- | ------------------------------------------------------ |
| **Pregunta** | ¿Se está construyendo el producto **correctamente**? | ¿Se está construyendo el producto **correcto**?        |
| **Pruebas**  | Unitarias, de integración, de regresión, de sistema  | Aceptación de usuario, UI/UX, de regresión, de sistema |
|              | Unitarios, integracion, **regresion** y **system**   | UAT, UX/UI, **regresion** y **system**                 |

---

## Proceso de Testing
Ejecuto un componentes con el objetivo de producir fallas. La prueba es exitosa si encuentra fallos.

### Diseño de la Prueba
Es el proceso de generacion de poruebas.

1. Los **requerimientos**.
2. La **condición de prueba** → descripción de la situación que quiere probarse.
    - _Ejemplo: que un usuario pueda hacer log in en el sistema._
3. Los **casos de prueba** → lote de datos de entrada necesarios para probar.
    - _Ejemplo: ingresar con el usuario PabloReitano y la contraseña Pablo123._
4. Los **resultados esperados**, propios de cada caso de prueba.

### Ejecución de la Prueba

- Hay componentes software asociados a los requerimientos.
- Hay un entorno donde la prueba va a suceder.
- Hay una ejecución del caso de prueba que da un resultado.
- Hay una obtencion de resultado que debe ser igual al esperado

|Comparación|Resultado|
|---|---|
|Resultado esperado **=** resultado obtenido|✅ Prueba **exitosa**|
|Resultado esperado **≠** resultado obtenido|❌ **Incidente**|

---

## Conceptos Relacionados

### Incidente

Toda ocurrencia de un evento durante la ejecución de una prueba que **requiere investigación-análisis**. Puede deberse a un defecto en el software, en los casos de prueba o en el ambiente. No todo incidente es una falla. Amerita un análisis. Es importante entender si es una fall o no.

### Falla

Resultado incorrecto de una ejecución → la **manifestación física** de un incidente. Se ve en **runtime** (prueba dinámica).

### Defecto

Paso, proceso o definición de dato incorrecto; o ausencia de cierta característica. Se ve **NO en runtime** (prueba estática). Una falla es generada por uno o mas defectos

### Equivocación

La **acción humana** que produce un resultado incorrecto. Un defecto es generado por una o mas equivocaciones

```
Equivocación  →(1..n)→  Defecto  →(0..n)→  Falla
```

> Una equivocación genera siempre al menos un defecto. Un defecto no siempre genera una falla. De hecho puede que la falla nunca se manifieste.

---

## Depuración (Debugging)

Depurar es **eliminar un defecto** que posee el software. No es una tarea de prueba, sino **consecuente** del testing.

> [!warning] La depuración puede ser fuente de introducción de **nuevos defectos**.

### Proceso de Depuración

1. **Detectar el defecto** → dada la falla (consecuencia), encontrar el defecto (causa), su razón y una solución.
2. **Depurarlo** → encontrado el defecto, eliminarlo. A veces tambien encontrar la razón, la solución y aplicarla.
3. **Volver a probar** → asegurarse de que se sacó el defecto y no se introdujeron otros (**regresión**).
4. **Aprender para el futuro** → lecciones aprendidas.

---

## Economía del Testing - ¿Que tiene sentido probar?

El testing es una tarea que:

- **No tiene fin** → nunca se puede demostrar que un programa es correcto.
- **Demanda mucho esfuerzo** y, por lo tanto, dinero.

Seguir probando es una **decisión económica** ya que:
- Se puede invertir mucho esfuerzo en probar
- a
- a
Es imposible en la practica estimar la intensidad de testing para alcanzar determinada densidad de defectos.

### ¿Cuándo se deja de hacer testing?

- Cuando el software pasa exitosamente el conjunto de pruebas diseñado.
- Cuando el software es _**good enough**_ → un nivel de fallas no críticas es aceptable.
- Cuando la cantidad de fallas detectadas es similar a la cantidad de fallas estimadas.

### Abaratamiento del Testing

Para abaratar las pruebas sin degradar su utilidad *diseño el sw para ser testeado*:

- Diseño **modular**.
- Buen uso de **puntos de control**.
- **Programación no egoísta** (uso de comentarios en código).

> Lo más barato para encontrar y eliminar defectos es **NO introducirlos**.

---

## Enfoques del Testing

### Caja Negra
Es netamente funcional producida por datos o entrada-salida. Define el modulo a probar y nos desentendemos del comportamiento y estructura interna del componente

> Se sabe **QUÉ** hace, pero no **CÓMO**.

- No interesa la estructura interna del componente.
- Se basa en entradas y salidas observables.
- Los casos de prueba están definidos por los **requerimientos del usuario**.
- Suele ser una prueba **funcional**.
#### Que se hace?
- Selecciona subconjuntos de datos de entrada posibles, esperando que cubran un conjunto extenso de otros casos de prueba posibles
- Podemos suponer que la prueba 
- a
- a

#### Criterios de Selección de Casos para evitar pruebas infinitas

##### Partición de Equivalencia

Se identifican clases de equivalencia, dividiendo cada condición de entrada en clases **válidas** e **inválidas**. Se prueba un elemento representativo de cada clase.

_Ejemplo: número de sucursal entre 000 y 999, válidos solo del 100 al 200:_

- Clases inválidas: `0–99` y `201–999`
- Clase válida: `100–200`
- Representantes elegidos: `40`, `150`, `800` → 3 pruebas.

##### Condición de Borde

Se consideran los **valores límite** y fuera de rango. La experiencia muestra que con estos casos se producen mejores resultados.

_Ejemplo: código postal entre 1000 y 8000 → es más probable que fallen `999`, `1001`, `7999`, `8001` que el `4000`._

Para conjuntos no numéricos ordenados: prestar especial atención al **primer** y **último** elemento.

##### Clases Inválidas

Probar ingresar valores con un **tipo de dato diferente** al esperado.

- _Ejemplo: alfanumérico cuando se pide numérico._
- A veces la **combinación** de datos de entrada es la que produce la clase válida o inválida.

##### Conjetura de Errores (Prueba de Sospechas)

Se enumeran posibles errores o situaciones propensas a tener errores (sospechas) y se crean casos de prueba basados en ellos. Es un proceso **intuitivo** basado en la experiencia.

Se suele hacer cuando un componente:

- Fue hecho a las apuradas.
- Fue modificado por varias personas en distintos momentos.
- Tiene estructuras anidadas o condiciones compuestas.
- Fue copiado de otro aplicativo.

---

### Caja Blanca
Ahora veo el codigo y como esta construido. Es mas profundo y requiere de habilidades técnicas.
> Se sabe **QUÉ** hace y **CÓMO**.

- Se conoce la estructura interna, el diseño y la implementación del software.
- Los casos de prueba están definidos por **cómo está definido el código**.
- Requiere que el tester conozca el lenguaje de programación.

#### Grados de Cobertura

| Cobertura         | Descripción                                                                                                                                           |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Sentencia**     | Se evalúa cada instrucción.                                                                                                                           |
| **Decisión**      | Se evalúa cada salida de cada `IF` y `WHILE` (cada rama).                                                                                             |
| **Condición**     | Se evalúa el valor de verdad de cada expresión lógica en cada `IF` y `WHILE`. Evalua cada combinacion posible del if y del while por ende son varias. |
| **Camino Básico** | Se representa el flujo de control mediante un diagrama de flujo y se calcula la **complejidad ciclomática**. Se puede representar con un grafo.       |


> **Complejidad ciclomática**: métrica que mide la complejidad lógica del software. Indica el esfuerzo necesario para probar un componente y determina la cantidad de casos de prueba a generar.

Tres formas de calcularla (todas deben dar el mismo número):

1. Cantidad de **caminos independientes**.
2. Cantidad de **regiones**/**secciones encerradas** del grafo o diagrama de flujo. Tambien cuenta a la hojra osea minimo es 1.
3. `A − N + 2` (A = aristas, N = nodos).

---

### Aclaraciones

> [!tip]
> 
> - Ninguna técnica es 100% perfecta y completa.
> - Lo más eficiente es **combinarlas** para complementar las ventajas de cada una.
> - No olvidar la **conjetura de errores** al testear.

|Caso|Enfoque recomendado|
|---|---|
|Carrito de compras|Caja Negra|
|Medio de pago (crítico)|Caja Blanca|

---

## Tipos de Pruebas

### Pruebas Unitarias

Evalúan un componente en forma **independiente**.

- Generalmente realizadas por el **desarrollador** que construyó el código.
- Se realizan una vez codificado, compilado y revisado el código.
- Los módulos altamente cohesivos son los más sencillos de probar.

### Pruebas de Integración

Evalúan que las partes que funcionan bien de manera **aislada** también lo hagan de manera **conjunta**.

|Tipo|Descripción|
|---|---|
|**No incrementales**|BIG-BANG|
|**Incrementales**|BOTTOM-UP, TOP-DOWN, "SANDWICH"|

- Conectar de a poco las partes más complejas.
- Minimizar la necesidad de usar programas auxiliares.

### Pruebas de Aceptación de Usuario (UAT)

Realizadas por los **usuarios** para verificar que el sistema se ajusta a sus requerimientos. Es una prueba de **caja negra**.

### Pruebas de Volumen

Evalúan si el sistema soporta los **límites máximos** (almacenamiento y procesamiento) definidos en los requerimientos.

### Pruebas de Stress

Someten al sistema **excediendo los límites máximos**. Sirven para saber cómo responde el sistema ante situaciones imprevistas.

- _Ejemplo: sistema pensado para 1000 transacciones/min → se prueba con 1050 o 1100._

### Pen Testing / Ethical Hacking

Práctica de probar un sistema para **encontrar vulnerabilidades de seguridad**, evitando que un hacker dañino las explote. Puede hacerse de forma automática o manual.

### Pruebas de Regresión

Evalúan si la **funcionalidad original no fue alterada** tras introducirse cambios en el código. Se prueba "lo viejo", lo que ya estaba.

### Pruebas Alfa y Beta

|Tipo|Realizada por|Lugar|
|---|---|---|
|**Alfa**|Usuario|Nuestras instalaciones|
|**Beta**|Usuario|Sus instalaciones|

- Es económica → el trabajo lo hace el usuario.
- Normalmente las versiones tienen muchos defectos.

---

## Clasificación de las Pruebas

|Criterio|Tipos|
|---|---|
|**Ejecución**|Estáticas (no runtime) / Dinámicas (runtime)|
|**Conocimiento**|Caja Blanca / Caja Negra / Caja Gris|
|**Automatización**|Automatizadas / Manuales / Semi-automatizadas|
|**Tipo**|Funcionales / No funcionales|
|**Alcance**|Unitarias / Integración / Sistemas / Aceptación de usuario|

### Por Habilidades (Software Testing Abilities)

- Funcionalidad
- Experiencia de usuario
- Rendimiento y carga
- Compatibilidad
- Seguridad
- Gestión de las pruebas

---

## Agile Testing · Test Driven Development (TDD)

En TDD se **desarrolla pensando en los tests**. El driver no es el código, sino el caso de prueba.

### Ventajas

- Aplicaciones más modulares, flexibles y escalables.
- Código más desacoplado y mantenible.
- Mejor cobertura de código.
- La regresión de bugs soporta cambios y está más automatizada.

### Desventajas

- El mantenimiento de los tests debe estar al día.
- Puede llevar a un falso nivel de confianza sobre la calidad del código.
- Algunas funcionalidades son difíciles de probar.

---

## Modelos de Ciclos de Vida de Testing

### Pirámide del Testing – Automatización

Los esfuerzos y costos para automatizar una prueba son **inversamente proporcionales** al tiempo dedicado para automatizarla.

- Algunas pruebas conviene automatizarlas, otras no.
- Las herramientas son **necesarias**, pero no **suficientes**.

### Modelo de Ciclo de Vida V

- No es necesario tener código para poder testear.
- Teniendo los requerimientos ya se puede hacer testing.
- En cada etapa de construcción se pueden ir escribiendo los casos de prueba.
- Es **QA**, no QC.

---

## Cuadrantes de Testing

|Cuadrante|Foco|Tipo|Ejecución|
|---|---|---|---|
|**Equipo + Negocio**|Funcionales, historias, prototipos, simulaciones|Pedidos por el negocio, generados por el equipo|Automatizadas y manuales|
|**Equipo + Tecnología**|Unitarias, de componentes, de integración|Técnicas y tecnológicas|Automatizadas|
|**Producto + Negocio**|Exploratory, escenario, usabilidad (UX/UI), alfa-beta|100% de usuario|Manuales|
|**Producto + Tecnología**|Performance, volumen, seguridad|Con herramientas|Semi-automatizadas|

> Los enfoques con los que se trabajan determinan la conveniencia de automatizar y del uso de herramientas.
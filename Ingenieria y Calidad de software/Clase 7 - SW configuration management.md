# Unidad 5: Software Configuration Management (SCM)

---

## Problemas en el Desarrollo de Software

- Problemas de ingeniería comunes a todos los equipos de trabajo.
	- En mi maquina no funciona
	- Actualizacion de API
	- Armar el entregable toma unos dias...
- Surgen al gestionar y hacer funcionar código en muchos lugares.
- **SCM → Gestionar cambios al Software.**
	- Abarca desde los requerimeintos
	- la interaccion entre los desarrolladores
	- Despliegue de codigo
- Basicamente gestionar los cambios de sw para que no explote todo

---

## Conceptos Clave

### Ítem de Configuración (IC)

- Cualquier elemento involucrado en el desarrollo del producto que está bajo control de SCM.
    - Ejemplos: código, servers, scripts, modelos, bases de datos.
    - Es **cualquier parte que sea software** 
- **No todo necesita estar bajo SCM.**
- Cada ítem tiene: nombre, versión, fecha de creación y autor.
##### IC de proceso
Son items generados por el proceso de desarrollo
- Plan de configuration management
- Propuestas de cambio
- Plan de desarrollo
Algunos de estos solo son gestionados durante una parte de la vida del producto sw.
Otros siguen siendo gestionados durante toda la vida del producto SW.
##### IC de producto
Items propios de producto sw
### Baseline
Es el estado de la configuracion en un conjunto de items en el ciclo de desarrollo, que puede tomarse como punto de referencia para la siguiente etapa de un ciclo. Se establece porque se verifica que esta configuracion de item o conjunto de items satisface algunos requerimientos funcionales o tecnicos.
Se forma una linea base cuando un conjunto de personas lo analiza y dice, avanzamos y evolucionamos el producto sobre estow

### Configuración

- Conjunto de todos los componentes fuentes compilados en un ejecutable consistente.
- Conjunto de todos los ítems de configuración → definen una **versión**.
- Incluye todos los componentes, documentos e información de estructura que definen una versión del producto a entregar.
### Trazabilidad
Es la capacidad de rastrear un item de configuracion a lo largo de todo un proceso
##### Trazabilidad horizontal
Es la capacidad de tracear todos los items de configuracion en cada etapa del proceso por un mismo requerimiento.
- Sirve para ver como avanzo un determinado requerimiento entre las distintas etapas y ver como avanzo o como exploto
##### Trazabilidad vertical
La capacidad de tracear todos los items de configuracion del mismo tipo, generados en la misma etapa
- Sirve para ver todos los requerimientos 
### Branching
Es ramificar codigo en distintas lineas de trabajo. Se usan para desarrollar nuevas funcionalidades usando un entorno de trabajo separado del resto
### Ambiente/enviroment
Es una coleccion de servidores, clusteres y servicios configurados que colaboran para proporcionar un entorno para alojar módulos de software
Cada entorno se construye con un propósito pudiendo tener caracteristicas funcionalmente similares pero no necesariamente ser iguales a nivel infra

---

## Gestión de la Configuración de Software (SCM)

> Disciplina orientada a administrar la evolución de productos, procesos y ambientes, definiendo mecanismos para admionistrar diferentes versiones de los mismos controlando los cambios efectuados y auditando y reportando la actividad de cmabios

**Propósito:** Establecer y mantener la integridad de los productos del proyecto a lo largo del ciclo de vida.

Para una configuración, involucra:

- Identificarla en un momento dado.
- Controlar cambios sistemáticamente.
- Mantener su integridad y origen.
Cada cambio en el sw es manejado-controlado por el SCM

#### Que es el sw
>[!DEFINITION]
>Es cualquier componente que haga que la solucion por la cual fue construida corra y funcione en el instante

Esto incluye:
- Especificaciones de usuario
- Scripts
- Bases de datos
- Modelos
- Servers
- Codigo
El sw esta compuesto por *items de configuracion*.
---

## Pasos de SCM (según SWEBOK)

### 0. Administración del Proceso de SCM _(etapa previa)_
Dicho proceso debe estar institucionalizado.
Define herramientas, reportes y procesos que seran utilizados en la organizacion o el proyecto para la gestion de la configuracion. Define como se integran los ICs.
- Comprender el contexto organizacional.
- Comprobar si existen procesos de SCM en la organización.
- Ver qué herramientas hay disponibles.
#### Plan de gestion de configuracion
- Define la lista de IC
- Define estandares de nombres, jerarquias de directorios, estandares de versionado
- Definir estrategias de branching y mergeo
- Define procesos de creacion de builds y releases
- Definier reglas de uso del CM y rol del administrador
- Define contenido de reportes de auditoria y los momentos en los que se ejecutan
Puede ser definido por proyecto o a nivel organizacion al y luego realizar una adaptacion al proyecto
##### Estrategias de branching
Es la estrategia de los equipos de desarrollo para escribir, mergear e implementar codigo cuando se usa un sistema de control de versiones. Es un conjunto de reglas de los desarrolladores para decir como interactuan con una base de codigo compartida.  La estrategia busca:
- Mejrorar productividad al garantizar una coordinacion adecuada entre desarrolladores
- Facilitar el desarrollo paralelo
- Ayudar a organizar una serie de lanzamientos planificados y estructurados
- Trazar un camino claro al realizar cambios en el software hasta produccion
- Mantener un codigo libre de errores donde los desarrolladores pueden corregir problemas rapidamente y hacer que los cambios vuelvan a produccion sin interrumpir el flujo de trabajo

---

### 1. Identificación de la Configuración

- Definir qué elementos (ICs) estarán controlados por SCM.
- Identificar ICs y sus relaciones.
- Definir guías para saber qué elementos son parte y cuáles no.
- Establecer momentos o condiciones para fijar una **línea base (baseline)** o hacer un **release**.
Generalmente se usan herramientas como jira,git, etc.

Es la actividad que define elementeos que estaran controlados por la gestion de configuracion ya que no todos los artefactos necesitan ser gestionados para garantizar la identidad del producto

Para esto, la actividad establece criterios para entender que elementos son parte o no de una configuracion. Tambien define momentos o condiciones para establecer una **baseline** o para **liberarla**
Se realizan distintas acciones como:
- Identificar codigo
- Identificar ambientes de produccion
- Identificar documentacion


---

### 2. Control de la Configuración

Asegurar que los ICs mantienen su integridad ante los cambios:

1. Identificación del propósito del cambio. Formalizar el cambio de pedido
2. Evaluación del impacto y aprobación del cambio.
3. Planificación de la incorporación del cambio.
4. Control de la implementación y verificación.

> ⚠️ La solicitud de cambio **debe ser formalmente registrada**.

El control de cambios de la configuración consiste en establecer un procedimiento
##### SW configuration control board
Es quien tiene la autoridad de aceptar o rechazar un cambio en la configuracion de sw. En proyectos pequeños puede residir el lider de proyecto, y a medida que se incrementa la complejidad puede ir incorporando nuevos integrantes.
Puede haber diversos jniveles de autorizacion de acuerdo con diferentes criterios.
##### Mediciones relacionadas con los cambios
- Successful changes. Cuenta la candiad de cambios aprobados y deplegados sin generar accidentes
- Cantidad de cambios por emergencias
- Cambios en el backlog
---

### 3. Status & Accounting de la Configuración

Registrar y reportar la información para administrar la configuración efectivamente:

- Listar los ICs aprobados.
- Mostrar el estado de los cambios aprobados.
- Reportar la trazabilidad de todos los cambios al baseline.
- Informar periódicamente con reportes a todos los grupos afectados.


---

### 4. Auditoría de la Configuración

Verificar el estado de la configuración para determinar si se cumplen los requerimientos especificados.

**Niveles de formalidad:**

- Revisiones informales basadas en checklists.
- Pruebas exhaustivas planificadas.

**Tipos de auditoría:**

|Tipo|Descripción|
|---|---|
|**Funcional**|Verificar el cumplimiento de los requerimientos.|
|**Física**|Verificar que la configuración del producto se corresponda con la estructura especificada.|
|**De Proceso**|Verificar que se haya cumplido el proceso de SCM en todo el proyecto.|

---

### 5. Administración de Distribución y Despliegue de Software

Asegurar la construcción exitosa del paquete de software y liberarlo en forma controlada a otros entornos (pruebas, producción, usuario final, etc.).

Se divide en:

- **Software Building**
- **Software Release Management**

---

## Planificar el Proceso de SCM

1. Listar los ICs y en qué momento ingresan al sistema de CM.
2. Definir estándares de nombres, jerarquías de directorios y versionamiento.
3. Definir políticas de **branching** y **merging**.
4. Definir procedimientos para crear **builds** y **releases**.
5. Definir reglas de uso de la herramienta de CM y el rol del administrador.
6. Definir el contenido de los reportes de auditoría y los momentos de ejecución.

---

## Definiciones Básicas

### Baseline (Línea de Base)

- Estado de configuración de un conjunto de ítems que puede tomarse como punto de referencia para la siguiente etapa.
- Se establece porque esa configuración satisface ciertos requerimientos.
- Para cada baseline, existe un conjunto de cambios respecto a la anterior.
- **Baseline ≠ Release.**

### Branch (Rama)

- Línea de desarrollo separada.
- Utiliza la baseline de un repositorio existente como punto de partida.
- Permite trabajar en múltiples versiones usando el mismo set de ICs.

### Trazabilidad entre ICs

- El **Configuration Control Board (CCB)** evalúa qué hay que modificar ante un cambio.

---

## Software Building

Los builds deben:

- ✅ Ser **automáticos**.
- ✅ Generar **reportes** de estado.

**Beneficios:**

- Reducen la cantidad de defectos.
- Mejoran la reproducción de problemas y trazabilidad.
- Mejoran la performance del equipo.

**Tipos de Builds:**

|Tipo|Descripción|
|---|---|
|**Local**|El developer lo hace localmente y corre pruebas unitarias.|
|**Integration**|Genera el entorno completo para pruebas de integración.|
|**Nightly**|Construcción diaria con reportes automáticos.|
|**Release**|Cuando se decide crear una nueva versión a liberar.|

---

## Software Deployment

Para determinar un modelo de deployment se debe evaluar:

- Qué usuarios recibirán los cambios.
- En qué forma se hará el despliegue.
- Riesgos del despliegue y cómo minimizarlos.
- Aprobación por el negocio y/o área de QA.
- Quiénes realizarán el deployment.

---

## Build & Deployment Pipelines

> Manifestación automatizada del proceso para llevar el software desde la aprobación del cambio de SCM hasta que llega a los usuarios.

- Incluye compilación, construcción, y progreso a través de etapas de testing y deployment.
- Requiere colaboración entre individuos y equipos.
- **Gated Commits:** buena práctica que valida el cambio _antes_ de hacer merge, manteniendo master en estado íntegro.

---

## CI/CD

### Integración Continua (CI)

Integrar código **al menos una vez por día** para minimizar problemas.

**Buenas prácticas:**

- Repositorio de código único.
- Automatizar el proceso de build.
- Hacer el build testeable automáticamente.
- Todo commit debe ser construido por una herramienta de integración (no por el dev).
- El build debe ser **rápido**.

### Despliegue Continuo (CD)

Conjunto de prácticas que aseguran que el software puede desplegarse en producción rápidamente y en cualquier momento.

- Cada cambio llega a un entorno de **staging** donde se corren pruebas exhaustivas.
- El pase a producción puede hacerse manualmente (alguien aprueba).

> ⚠️ **No confundir:**
> 
> - **Continuous Delivery** → el despliegue a producción lo hace una persona.
> - **Continuous Deployment** → el despliegue a producción es automático (siguiente paso al Delivery).

---

## DevOps

> Conjunto de prácticas destinadas a reducir el tiempo entre el cambio en un sistema y su pasaje a producción, garantizando calidad y minimizando el esfuerzo.

- Termina con la cultura de separación entre developers y operations.
- Combina desarrollo y operaciones, normalmente en un mismo equipo.

**Prácticas:**

1. Planificación del Cambio
2. Coding & Building
3. Testing
4. Release & Deployment
5. Operation & Monitoring

### CALMS (Filosofía de Trabajo)

|Letra|Concepto|Descripción|
|---|---|---|
|**C**|Cultura|Ser dueños del cambio para mejorar la colaboración y comunicación.|
|**A**|Automatización|Eliminar trabajo manual y repetitivo; reducir el error humano.|
|**L**|Lean|Remover la burocracia para tener ciclos más cortos y menos desperdicio.|
|**M**|Métricas|Medir todo, usar datos para refinar los ciclos.|
|**S**|Sharing|Compartir experiencias de éxito y falla para que otros aprendan.|
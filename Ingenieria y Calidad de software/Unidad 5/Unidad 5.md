# Unidad 5: Software Configuration Management (SCM)

## ¿Qué es SCM?

Disciplina orientada a administrar la evolución de productos, procesos y ambientes. Define mecanismos para gestionar diferentes versiones, controlar los cambios efectuados y auditar/reportar la actividad de cambios.

**Propósito:** Establecer y mantener la integridad de los productos del proyecto a lo largo del ciclo de vida.

> El software es cualquier componente que haga que la solución corra y funcione: código, scripts, bases de datos, modelos, servers, especificaciones de usuario.

### Problemas que resuelve

- "En mi máquina no funciona"
- Actualizaciones de API que rompen otras partes
- Armar el entregable toma días
- Gestionar código corriendo en muchos lugares

---

## Conceptos Clave

### Ítem de Configuración (IC)

Cualquier elemento involucrado en el desarrollo del producto que está bajo control de SCM. Tiene: **nombre, versión, fecha de creación y autor**.

> Puede que estos items se gestionan por requisitos legales

> No todo necesita estar bajo SCM.

|Tipo|Descripción|Ejemplos|
|---|---|---|
|**IC de Proceso**|Generados por el proceso de desarrollo|Plan de CM, propuestas de cambio, plan de desarrollo|
|**IC de Producto**|Propios del producto SW|Código, scripts, modelos, bases de datos|

Algunos ICs de proceso solo se gestionan durante parte de la vida del producto; otros durante toda su vida.

### Configuración

Conjunto de todos los ICs que definen una **versión** del producto. Incluye componentes, documentos e información de estructura.

### Baseline (Línea de Base)

Estado de la configuración en un conjunto de ítems en el ciclo de desarrollo, tomado como punto de referencia para la siguiente etapa. Se establece cuando un equipo verifica que esa configuración satisface ciertos requerimientos funcionales o técnicos.

- Para cada baseline existe un conjunto de cambios respecto a la anterior.
- **Baseline ≠ Release**

### Branch (Rama)

Línea de desarrollo separada que parte desde la baseline de un repositorio existente. Permite trabajar en múltiples versiones sobre el mismo set de ICs.

→ Ver [[Estrategias de Branching]]

### Trazabilidad

Capacidad de rastrear un IC a lo largo de todo el proceso.

|Tipo|Descripción|Para qué sirve|
|---|---|---|
|**Horizontal**|Trazar todos los ICs en cada etapa para un mismo requerimiento|Ver cómo avanzó un requerimiento entre etapas|
|**Vertical**|Trazar todos los ICs del mismo tipo generados en la misma etapa|Ver todos los requerimientos en una etapa|

### Ambiente (Environment)

Colección de servidores, clusters y servicios configurados que colaboran para alojar módulos de software. Cada entorno se construye con un propósito; pueden ser funcionalmente similares pero no necesariamente iguales a nivel de infraestructura.

---

## Pasos de SCM (según SWEBOK)

```
0. Administración del proceso SCM
1. Identificación de la Configuración
2. Control de la Configuración
3. Status & Accounting
4. Auditoría de la Configuración
5. Administración de Distribución y Despliegue
```

### 0. Administración del Proceso de SCM _(etapa previa)_

Define herramientas, reportes y procesos para la gestión de la configuración en la organización o proyecto. Define cómo se integran los ICs.

**Incluye:**

- Comprender el contexto organizacional
- Verificar si ya existen procesos de SCM
- Relevar herramientas disponibles

→ Ver [[Plan de gestion de configuración]]

---

### 1. Identificación de la Configuración

Define qué elementos (ICs) estarán controlados por SCM, sus relaciones y los criterios para determinar qué entra o no a la configuración.

**Se realizan acciones como:**

- Identificar código
- Identificar ambientes de producción
- Identificar documentación
- Establecer momentos/condiciones para fijar una **baseline** o hacer un **release**

---

### 2. Control de la Configuración

Asegura que los ICs mantienen su integridad ante los cambios.

**Proceso:**

1. Identificar y formalizar el propósito del cambio
2. Evaluar el impacto y aprobar/rechazar el cambio
3. Planificar la incorporación del cambio
4. Controlar la implementación y verificar

> ⚠️ La solicitud de cambio **debe ser formalmente registrada**.

**SW Configuration Control Board (CCB):** Tiene autoridad para aceptar o rechazar cambios en la configuración. En proyectos pequeños puede ser el líder de proyecto; en proyectos más complejos incorpora más integrantes. Puede haber distintos niveles de autorización.

**Métricas relacionadas con cambios:**

- _Successful changes:_ cantidad de cambios aprobados y desplegados sin incidentes
- Cantidad de cambios por emergencias
- Cambios en el backlog
**Versionado**:
Cada vez que se modifica un sw en produccion es por
- Bug en produccion
- Nuevo requerimiento
---

### 3. Status & Accounting de la Configuración

Registrar y reportar información para administrar la configuración efectivamente.

- Listar los ICs aprobados
- Mostrar el estado de los cambios aprobados
- Reportar la trazabilidad de todos los cambios al baseline
- Emitir reportes periódicos a todos los grupos afectados

---

### 4. Auditoría de la Configuración

Verifica el estado de la configuración para determinar si se cumplen los requerimientos especificados.

**Niveles de formalidad:**

- Revisiones informales basadas en checklists
- Pruebas exhaustivas planificadas

| Tipo           | Descripción                                                                                                                                                                        |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Funcional**  | Verificar el cumplimiento de los requerimientos. Se prueba con tests.                                                                                                              |
| **Física**     | Verificar que la configuración del producto corresponda con la estructura especificada. Que los componentes fisicos que son modificado sean consistentes con el cambio realizado.  |
| **De Proceso** | Verificar que se haya cumplido el proceso de SCM en todo el proyecto.                                                                                                              |

---

### 5. Administración de Distribución y Despliegue

Asegura la construcción exitosa del paquete de software y su liberación controlada a otros entornos (pruebas, producción, usuario final, etc.).

Se divide en:

- [[SW Building]]
- [[SW development & pipelines]]
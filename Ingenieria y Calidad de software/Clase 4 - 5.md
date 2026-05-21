### Gestionando en un contexto cambiante
### Proyecto
>[!DEFINITION]
>Emprendimiento temporal realizado por un grupo de personas utilizando recursos, con un objetivo comun especifico y usando un desarrollo gradual

Una implementacion de mismo producto no es el mismo proyecto. Cambia porque cambia el **contexto**.
###### Elementos
- Alcance: definicion de requisitos tecnicos y funcionales
- Ciclo de vida: Hasta que no muere no termina el proyecto. Incluye documentacion, entregas, diseno o mantenimiento
- Equipo
- Enfoques: metodologías agiles o tradicionales para gestionar riesgos y entregas
#### Gestion de proyectos
Es la disciplina que administra los proyectos.
##### Partes
- Inicio: Obtener el objetivo del proyecto, alcance y viabilidad
- Planificacion: Establacer tareas, tiempos recursos y reisgos
- Ejecucion: Se llevan a cabo tareas
- Monitoreo y control: Supervisar progreso y ajustes para cumplir objetivos 
- Cierre: Se finnaliza el proyecto
#### Dimensiones de un proyecto software
Identificamos cada una por caracteristicas que tiene:
- Driver: Impulsor del proyecto, es el objetivo a lograr y el por que del proyecto. Logra al objetivo y no es muy flexible
- Constraint - Restriccion: Esta impuesto por afuera y no bajo control directo. Es muy poco flexible
- Degree of freedom - grado de libertad: Libertad para fijar objetivos. Es mas flexible.
Esta clasificacion define como tomar decisiones en el proyecto. No todas las dimensiones pueden ser drivers ni constraints al mismo tiempo, siempre se negocian las prioridades. **El proyecto consiste en balancear trade-offs**. Lo que no es ni driver ni constraint es grado de libertad

#### Enfoques de dimenciones
##### Enfoque de 3 dimensiones
- Alcance
- Costo
- tiempo
- Quality
Alcance controla costo que controla tiempo que controla alcance. Ahora todas estas mueven la calidad. Tengo que hacer tradeoffs para llevar adelante el proyecto
##### Enfoque de 5 dimensiones
- Alcance
- Recursos
- Costos
- Tiempo
- Calidad
Ahora el alcance controla recursos que controlan costos que controlan tiempo que controlan calidad que controla el alcance. De vuelta debo hacer tradeoffs para balancear dimensiones/prioridades
#### Roles de un proyecto
Son roles del lado del cliente
###### Stakeholders
- Son todos involucrados en el proyecto
- Tienen poder de decision con capacidad de influir en la marcha del proyecto
- Quiere que el proyecto salga bien
###### Sponsors
- Es el dueño del proyecto
- Tiene autoridad para llevar adelante el proyecto
- Es el de mas autoridad. Puede ser el que pone la plata (incluso si le cae de arriba).
###### Usuario campeon
- Product owner
- Experto en dominio del problema del proyecto (know-how)
- Asegura su capacidad para la funcion y su disponibilidad (suelen ser demandados)
- Generalmente suele ser 1 solo y se busca eso. Si tengo mas, son mas personas que invitan a un conflicto de intereses
###### Usuarios directos
- Interactuan directamente con el sistema
###### Usuario indirecto
No usa el sistema directamente. Lo usa a travez de otra herramienta
- Usan el sistema pero no lo operan directamente.


## Cynefin
Modelo que compara caracteristicas de 5 dominios para elegir el enfoque de trabajo de un proyecto
##### Caracteristicas
Son los contextos donde puede caer cada proyecto
###### Ordenado
De alguna forma u otra **siempre** se lo que tengo que hacer
- Simple -> Siempre estan las mejores practicas. Tengo un manual de herramientas/procesos contra toda situación. Siempre conozco el outcome de cada situación
	- Veo que pasa -> elijo la categoria -> obtengo lo que tengo que hacer
- Complicado -> Tengo buenas practicas pero no tengo el outcome de cada situación. Debo explorar un poco. Suele requerir análisis de causas de mi situación
	- veo que pasa -> analizo -> respondo
###### Desordenado
- Complejo ->  Hay practicas emergentes, es decir, que surgen. La cosa se va iterando y mejorando sin saber que lo que estoy haciendo esta bien o es lo correcto. Requiere de prueba y error y por eso itero
	- Pruebo -> veo que pasa -> respondo
- Caotico -> Aparecen practicas novedosas. No existe ningun analisis. Se actua y luego analizan las consecuencias.
	- Actuo -> analizo -> respondo


# Otros enfoques de trabajo

→ SCRUM  
→ Kanban  
→ Lean

---

> [!quote] SCRUM  
> Marco de trabajo para la administración de proyectos que enfatiza el trabajo en equipo, el proceso iterativo incremental y la adaptación continua a partir de lo conocido.

Comienzo con lo visto o conocido. Itero e incremento hasta llegar a lo que quiero

---

# SCRUM – Framework

Scrum es un marco metodológico para construir productos de forma **incremental** mediante iteraciones llamadas _Sprints_.

Un **Sprint**:

- duración fija: 1 a 4 semanas
- entrega: incremento de producto funcional

Cada incremento:

- mejora la versión anterior
- cumple criterios de aceptación
- mantiene calidad requerida
- Tiene que ser potencialmente desplegable/entregable


#### Framework
El product owner elige y designa el product backlog(los todos). En el sprint planning elijo elementos del backlog para trabajar en el sprintBacklog.
Todos los dias existe una reunion llamada daily que dice:
- Que hice ayer
- Que hice hoy
- Que impedimento existe
Suele durar 15 minutos y sirve para sincronizar el equipo
Luego tengo mi posiblemente enviable producto. De ahi se va a la review del producto (sprint review). El pOwner dice que tan bien esta e indica mejoras. Luego en la retrospective es team con scrum master en la retrospective ven posibles mejoras

---

# Valores de Scrum
- Dividir el alcance -> Entregables pequeño priorizados por valor
- Dividir la organizacion -> en equipos
- Dividir el tiempo -> Seguimiento diario con iteraciones cortas
- Optimizacion regular -> para mejoras

## Producto

Entregables pequeños, priorizados por valor y estimables

## Equipo

Pequeño, auto-organizado, interdisciplinario, con participación del cliente

## Proceso

Seguimiento diario, iteraciones cortas, planificación inicial y evaluación final

## Mejora

Retrospectivas (proceso) + revisiones (producto)

## Cultura

Foco · Coraje · Apertura · Compromiso · Respeto

---

# SCRUM – Ceremonias

## Sprint Planning
Planifica elementos de product backlog y los mete en el sprint backlog. Estima la duracion o **velocity**. Esta se estima en base a experiencias anteriores.

Al finalizar:

- Sprint Backlog definido
- User stories asignadas
- Tareas generadas

Frecuencia: 1 vez por sprint  
Duración: 1–2 horas

---

## Daily Meeting
Ya estoy trabajando en codigo. Pone en sincronismo a los equipos

Al finalizar:

- Se buscan remover impedimentos

Frecuencia: diaria (inicio del día)  
Duración: 10–15 minutos

---

## Sprint Review
Se muestra la funcionalidades desarrolladas y se obtiene un feedback de lo realizado.

Al finalizar:

- Se validan/aprueban funcionalidades

Frecuencia: 1 vez por sprint  
Duración: ~60 minutos

---

## Retrospectiva

Al finalizar:

- Lecciones aprendidas
- Acciones de mejora

Frecuencia: 1 vez por sprint  
Duración: 60–120 minutos

## Refinamiento
Pasa entre dia 1 y dia 15. Es para discutir y cambiar elementos del backlog para la proxima planning
#### Roles
##### Scrum master
Es el dueño del proceso. Elimina impedimentos, cuida el proceso, se asegura que se aplique scrum correctamente
##### Product owner
Dueño de definicion de exito o terminado. Reprecenta al cliente o usuarios. Elige y diseña el backlog. Establece plan de entregas y administra el ROI priorizando requerimientos
##### Equipo
Pequeño. Hace el trabajo o codigo

---

>[!IMPORTANT]
>En vez de hacer paso a paso donde primero especificacion, luego diseño, luego build y luego integracion y test, hago esto para cada feature/backlog del sprint. Al tener un feedback constante es mejor para corregir errores y hacer mejoras. Me *adapto* a lo que me indique el PO.

# Kanban

> [!quote]  
> Marco ágil que visualiza el trabajo, limita el WIP y promueve la mejora continua mediante flujos transparentes.

Forma visual de ordenar el trabajo. Dice que se hace, que se esta haciendo, que se debe hacer, etc. Puedo entregar valor respecto a donde estoy parado

Las prácticas clave incluyen:

- límites de trabajo en progreso (WIP)
- estandarización del flujo
- métricas (lead time, cycle time)

Uso de tableros y tarjetas para:

- seguimiento
- detección de cuellos de botella
- optimización del flujo

---

# Principios Kanban

- Comenzar con el proceso actual. Entender donde estoy y como estoy.
- Mejoras incrementales (no cambios bruscos)
- Liderazgo distribuido. No lidera solo el manager sino que el equipo promueve cambios en funcion de observaciones.
- Enfoque en necesidades del cliente
- Gestionar trabajo, no personas
- Revisión continua de servicios

---

# Kanban – Características

Se utiliza cuando:

- hay demasiadas tareas simultáneas
- cambios constantes de foco/prioridades
- baja productividad percibida
- problemas de comunicación

## Conceptos base

**Visualizar flujo**  
**Limitar WIP**  
**Medir y optimizar**

---

# Kanban – Conceptos operativos
Es un tablero con las siguientes columnas:

## TO DO

- Visualización del trabajo
- Método basado en tarjetas
- Mejora continuaz
Cada tarea esta definida y no debe investigarse. Las tareas estan ordenadas por prioridad
## WIP (Work In Progress)

- Trabajo en curso. Es en lo que se esta trabajando actualmente
- Límite para evitar multitasking y volver al problema que intenta solucionar la metodología
- Activación según capacidad

## DONE
Usa metricas para anticiparse a problemas, accionar a tiempo y buscar mejoras continuas
**Métricas clave:**

- Lead Time → pedido a entrega
- Cycle Time → inicio a fin
- Touch Time → tiempo efectivo de trabajo

---

# Kanban – Límite de WIP

Consiste en definir cuántos ítems pueden trabajarse en paralelo por etapa.

Objetivos:

- detectar cuellos de botella
- evitar bloqueos
- reducir multitasking
- optimizar flujo y Lead Time

> [!important]  
> Limitar WIP diferencia un tablero visual de un sistema Kanban real

---
#### Importante
- Ver el workflow/tabla -> ver como estoy y que pasa
- Limitar el work in progress 
- Manejar el flujo -> ver como se mueven las tareas/cuadraditos entre columnas
- Hacer politicas explicitas -> como salgo de una columna y paso a la otra
- Establecer loops de feedback
- Mejorar colaborativamente


___
# ¿Cuándo usar Kanban?

- Proyectos inestables, con muchos cambios
- Cambios frecuentes de prioridad, requerimientos cambian constantemente de prioridad
- Gestión de incidencias

---

#### Kanban vs scrum

| Kanban                                                                                           | Scrum                                                                                                                    |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------ |
| No hay sprints de duración fija. En su lugar, los equipos toman tareas de un backlog priorizado. | El trabajo se realiza en sprints de 1 a 4 semanas. El objetivo es entregar un producto listo al final de cada sprint.    |
| Las entregas ocurren de forma continua o cuando hay un producto listo.                           | El producto se libera en una cadencia determinada por la duración del sprint; puede ser después de cada sprint o varios. |
| Los miembros del equipo pueden especializarse y tomar tareas según su área de experiencia.       | Hay un fuerte enfoque en la multifuncionalidad. No hay roles específicos; todos son desarrolladores.                     |
| Se enfatiza la mejora continua del proceso, pero no hay eventos estándar obligatorios.           | Existen eventos como Daily Standup, Refinamiento del Backlog, Sprint Planning, Sprint Review y Retrospectiva.            |
# LEAN

> [!quote]  
> Filosofía enfocada en eliminar desperdicios y eliminar falta de valor y maximizar valor mediante mejora continua.

Objetivos(elegir alguno de estos):

- mayor calidad
- menor tiempo de ciclo
- reducción de costos

---

# Gestión LEAN

Modelo que impulsa:

- mejora continua
- generación de valor al cliente
- desarrollo de personas

La cultura de personas guia el trabajo  través de:

- herramientas
- sistemas
- rutinas de trabajo
- principios y guias

---

## 4Ps del modelo LEAN  
  
### 1. Filosofía  
- Sistema de pensamiento a largo plazo  
- Enfoque en el **propósito**  
Hago lo que hago porque quiero que el dia de mañana pase tal cosa
### 2. Procesos  
- Flujo de valor hacia cada cliente  
- Añadir valor y eliminar desperdicios  
Creo flujos de procesos para evidenciar problemas. Utiliza procesos pull(para traer tareas) y push (para distribuir-entretar tareas). Recurrir a tecnologias confiables. Usar controles visuales
### 3. Personas  
- Desafío, compromiso y crecimiento  
- Respeto, selección y desarrollo de las personas  
Desarrollar a lideres que entiendan el trabajo, filosofia y enseñen la misma. Ademas, desarrollan personas y equipos excepcionales que sigan la filosofía de su organizacion. Poru ultimo respetar red de contratistas y proveedores ayudando a mejorar

### 4. Resolución de Problemas  
- Aprendizaje organizacional continuo  
- Dinámica de mejora continua  
Ve y observa por ti mismo para comprender profundamente la situación. Tomar decisiones por consenso, teniendo en cuenta todas las opciones e implementando agilmente. Por ultimo, propiciar el proceso de convertirse en una organización que aprende a través de reflexion y mejora contiuna
---  
  
##  Principios clave (base del sistema)  
  
- Desafío  
- Mejora continua  
- Aprendizaje en el área de trabajo  
- Trabajo en equipo y responsabilidad  
- Respeto y desarrollo de personas


# Sistema LEAN – Principios

## Filosofía y proceso

1. Pensamiento a largo plazo
2. Flujo continuo
3. Sistema pull
4. Nivelación de carga (Heijunka)
5. Calidad integrada (detener para resolver)
6. Estandarización
7. Control visual
8. Tecnología confiable

---

## Personas y mejora

9. Desarrollo de líderes
10. Equipos alineados a la filosofía
11. Respeto a proveedores
12. Genchi Genbutsu (ir a la fuente)
13. Nemawashi (consenso)
14. Kaizen + Hansei (mejora continua y reflexión)
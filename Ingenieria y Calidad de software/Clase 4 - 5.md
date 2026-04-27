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
> Marco de trabajo para la administración de proyectos que enfatiza el trabajo en equipo, el proceso iterativo y la adaptación continua a partir de lo conocido.

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

---

# Valores de Scrum

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

Al finalizar:

- Sprint Backlog definido
- User stories asignadas
- Tareas generadas

Frecuencia: 1 vez por sprint  
Duración: 1–2 horas

---

## Daily Meeting

Al finalizar:

- Se buscan remover impedimentos

Frecuencia: diaria (inicio del día)  
Duración: 10–15 minutos

---

## Sprint Review

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

---

# Kanban

> [!quote]  
> Marco ágil que visualiza el trabajo, limita el WIP y promueve la mejora continua mediante flujos transparentes.

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

- Comenzar con el proceso actual
- Mejoras incrementales (no cambios bruscos)
- Liderazgo distribuido
- Enfoque en necesidades del cliente
- Gestionar trabajo, no personas
- Revisión continua de servicios

---

# Kanban – Características

Se utiliza cuando:

- hay demasiadas tareas simultáneas
- cambios constantes de foco
- baja productividad percibida
- problemas de comunicación

## Conceptos base

**Visualizar flujo**  
**Limitar WIP**  
**Medir y optimizar**

---

# Kanban – Conceptos operativos

## TO DO

- Visualización del trabajo
- Método basado en tarjetas
- Mejora continua

## WIP (Work In Progress)

- Trabajo en curso
- Límite para evitar multitasking
- Activación según capacidad

## DONE

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

# ¿Cuándo usar Kanban?

- Proyectos inestables
- Cambios frecuentes de prioridad
- Gestión de incidencias

---

# LEAN

> [!quote]  
> Filosofía enfocada en eliminar desperdicios y maximizar valor mediante mejora continua.

Objetivos:

- mayor calidad
- menor tiempo de ciclo
- reducción de costos

---

# Gestión LEAN

Modelo que impulsa:

- mejora continua
- generación de valor al cliente
- desarrollo de personas

A través de:

- herramientas
- sistemas
- rutinas de trabajo

---

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
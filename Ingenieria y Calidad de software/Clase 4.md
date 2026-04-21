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


### Enfoques de trabajo
Enfoques para trabajar un proyecto de sw
#### SCRUM
#### Kanban
#### Lean



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

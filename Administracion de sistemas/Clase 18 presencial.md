# Como se adopta el enfoque agil
> Enfocar el proximo pitch a la gestion del proyecto indicando:
> Mi proyecto, su objetivo, su organizacion y planificacion, gestione estos riesgos, tome estas decisiones. Va mas alla del producto y se enfoca de una en el proyecto. 

#### BMC
Business model canvass. Se tiene que incluir en el enfoque ágil. Ayuda a hacer consistente al proyecto y negocio.
##### Product vision board
El product vision board sirve para pensar en la estrategia del producto relacionada con el negocio. Como se relaciona el objetivo de producto con los actores. Entonces en el ágil tengo que entregar la **WBS** *cambiada*. 
###### Nueva WBS
No entrego pedazos/faces de la solución. Voy entregando capas. 
##### Impact mapping
Tiene que estar relacionado con los actores de mi product vision board. Esto debe estar relacionado con la propuesta de valor y los *entregables de la wbs*.
##### User story mapping
Usa los entregables de la wbs. Estoy armando una lista priorizada de mas a menos de entregables de la wbs. Tengo que incluir tambien cuestiones de gestión, como puede ser infraestructura, complementos y cosas que no necesariamente son user.
> Necesito priorizar aquellas cosas que son mas complejas de mi solucion y sobre esa base indico que entra en cada release.

>Definir de antes las user stories para luego mappearlas con releases.

> Es importante que el user story mapping incluya en cada release aquellas cosas que quizas no son de producto, como entrevistas, infraestructura, deploy, etc.

###### MVP
Debe tener el minimo de toda la solución. Como voy a tener interacción del usuario debe tener todas las funcionalidades que requiera pero en una versión temprana y mala. **Tengo que tener algo puesto en producción**. 

### Backlog de mi producto
Esta compuesto por
##### Impact mapping
Donde decimos que entregable/parte del producto impacta a cada actor para cumplir un objetivo (cumplir el objetivo de producto y de ahi se avanza **CAMBIAR IMPACT MAPPING**)
##### User story mapping - Siempre desde la vista de usuario
Divido lo que dije en el impact mapping en prioridad y tiempo. De izquierda a derecha vemos lo que hace el usuario en mi producto (primero loggearse, luego browsear/gestionar turnos). 
Tengo actividades que refieren a lo que hace el usuario en mi producto y incluyen un conjunto de funcionalidades a ser aplicadas en varias releases. Entonces tengo
Actividad, que agrupan epicas, que agrupan funcionalidades dispersas en historias de usuario a ser implementadas en varias releases
# Definir user stories, checkpoints para ver que se cumplan las user stories (indicadores) y ceremonias de review y retro

## User stories
Son *descripciones breves de una funcionalidad desde la perspectiva de usuario final*. Busca capturar lo que el usuario necesita y desea para guiar el desarrollo del producto. Suele tener el formato:

>Como \[rol] quiero \[funcionalidad] para \[beneficio]

Estas deben ser:
- Breves y claras
- Centradas en usuario
- En lenguaje simple
- Enfocadas en un beneficio
- Sirve como base para conversación y refinamiento
##### Caracteristicas
Cumple con **I.N.V.E.S.T**
- Independiente: Se debe poder trabajar en separado de las demas
- Negociable
- Valiosa porque aporta valor al cliente
- Estimable en cantidad de esfuerzo a implementar
- Small (pequeña)
- Testeable: Tiene que tener criterios de aceptación claros
### Epicas
Son grandes cuerpos de trabajo que se pueden desglosar en muchas historias de usuario. Representan funcionalidades amplias que abarquen varios sprints. Estas son
- A gran escala
- Fragmentables
- Abarca varios sprints
No necesariamente son actividades del impact mapping. Se define con el cliente o su representante (el product owner).
### Priorizacion basada en valor
Ofrezco el maximo valor en un minimo tiempo. Como priorizo si todo es importante?
Quiero tener una mínima planificacion pensando en:
- Tiempo que tarda en hacerse un producto con tales funcionalidades
- Cuanto costará un producto si se quiere para una fecha concreta
Cuando se planifica?
- Constantemente en las ceremonias a lo largo del proyecto
- Se reacciona y se adapta al cambio en vez de seguir pel plan predefinido
#### Prioridades segun manifiesto ágil
- Individuos e interacciones **sobre** procesos y herramientas
- SW funcionando **sobre** documentación
- Colaboración con el cliente **sobre** negociación contractual
- Respuesta ante el cambio **sobre** seguir un plan
#### Valores para enforcar a la hora de priorizar
1. Colaboración con el cliente. Siempre entregar antes lo que le entrega el valor al cliente
2. Negociación contractual. 
3. Respuesta ante el cambio. Con las ceremonias nos adaptamos
4. Seguir el plan de trabajo o roadmap. 
#### Que se prioriza en un proyecto
El backlog del producto que tiene items ordenados (historias de usuario y epicas) que el producto debe tener para su implementación. 
##### Respecto a product backlog
Pongo requerimientos/historias con mas prioridad en releases iniciales y las de menso prioridad luego. Tengo que hacer **product baglog items (PBIs)** y estos son
- User stories -> funcionalidades
- Casos de uso -> defectos
- Narrativas sin formato -> trabajo técnico
### Priorizacion de historias de usuario - Metodos
#### MoSCoW
Clasificas historias segun importancia y valor de entrega:
- Must have: La tarea es impresindible para esta entrega y no cumple el objetivo la entrega si no esta
- Should have
- Can Have
- Wont have
#### Valor vs esfuerzo
Hago una grilla y clasifico cantidad de valor y cantidad de esfuerzo clasificando en:
- Hacer primero
- Considerar
- Planificar
- Postergar
#### Modelo Kano
Divide las stories en 
- Basicos
- Desempeño
- Atractivos

>Los enfoques son complementarios

#### Definition of ready
Criterios a definir para user story para antes de comenzar la historia. Cuando la historia esta lista para ser llevada a cabo
#### Definition of done
Criterios a definir para decir que una user story esta finalizada
## Tecnicas de sprint review
Es cuando se recibe feedback del producto post sprint. Ahi decidimos que conviene hacer
#### Demo
El feedback lo dan los stakeholders
#### Revisar el product backlog
Que se hizo 
#### Metricas de sprint
Que tanto avanzamos en el sprint
#### Feedback de stakeholders
#### Roadmap y proximos pasos
#### Tecnicas stop, start and continue
## Metricas de scrum
Permiten pronosticar, dar visibilidad y aprender. No se usan para comparar equipos. 
#### Velocity
Cantidad de trabajo terminado por un mismo equipo expresado en story points. Se calcula por sprint y se promedia con demas sprints. Se puede usar para pronosticar
#### Burndown chart
Como evoluciona el trabajo restante durante el sprint. Lo ideal vs lo real. Cuanta carga de trabajo queda a medida que se avanza en el sprint
## Retrospectivas
Es una pausa intencional para aprender del sprint y decidir como mejorar. Se hace:
1. Reflexionar sobre lo ocurrido
2. Identificar aprendizajes
3. Deside cambios concretos
Tiene que ser un espacio seguro para mirar como se tabaja, aprender.
##### Pasos de la retrospectiva
1. Preparacion. Abrir, dar foco y generar seguridad
		Se establece un objetivo
2. Reunir datos y metricas
		Veo que hice como equipo, impedimentos, reuniones, emociones del equipo y metricas
3. Generar ideas
		Pasar de "que ocurrio a "que significa y por que ocurrio". Busco por que paso lo que paso y que se puede cambiar para mejorar. Buscamos patrones, causas, comportamientos.
4. Decidir acciones y experimientos
		Se conocen como action items. Se suelen elegir un par que dependan del equipo
5. Cerrar y acordar seguimiento
		Se registran los accionables, agradece y se da seguimiento en el proximo sprint
 
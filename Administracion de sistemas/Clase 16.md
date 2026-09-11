- Asignar el rol de la persona en el cronograma
- Revisar carga horaria de cronograma
- Agregar hitos y cambiarlos para que apunten a un publico mas extenso
- Inicio de proyecto en mayo 
- quitar del projectlibre al sponsor, usuario clave, encargado y dejarselo unicamente a pm, analista funcional.
- Los entregables deberian tener como predecesoras a sus tareas
- Entregables dependen de tareas pero tareas no dependen de entregables
- hacer que kickoff sea un hito para poner en acta
- Lo que va en un entregable va dentro del entregable
- lo que es no repetitivo o rutinario o gestion de reuniones va en un hito
- LOS PRINCIPALES ENTREGABLES DEL PROYECTO DEBEN ESTAR EN EL PROYECT LIBRE Y SUS TAREAS DENTRO DE EL
- LOS DEMAS ENTREGABLES VAN COMO ACTIVIDAD DENTRO DE HITOS
- En el roadmap solo poner LOS HITOS MAS IMPORTANTES DEL PROYECTO
- paralelizar tareas en el roadmap
- no trabajar sabado y domingo
- Analizar camino critico en el project

- Despues de asignar costos debo **guardar linea base**
- En autoridad de PM tengo que poner la responsabilidad en torno a presupuesto, por ejemplo, si pongo holguras en costos base, no sumo costos de gestion luego en el presupuesto. Esto **tiene que estar en autoridad y responsabilidad del PM**
- Tambien agregar respecto a presupuesto cambio
- Revisar wbs y matriz de riesgos:
  Aquello que este considerado como mitigado debe quedar reflejado en la wbs
- Enfoque de implementacion de proyecto: Predictivo 
- En presupuesto de acta de proyecto poner el presupuesto + un rango
- Luego poner entregable de planilla de costos
- Autoridad y responsabiliad del pm
	- Es como el pm afronta cada punto
	- se escribe en tercera persona
	- 
___
# Costos
Tengo que 
- Estimar costo de entregable
- Determino costo de proyecto
- Tengo que agregar reservas para conformar presupuesto de proyecto
#### Estimacion de costos
Es como una piramide:
- La **base** esta dada por **costos de entregables**:
	- Acta de proyecto
	- Riesgos
	- Casos de uso de negocio
	- Entregable
		- Esfuerzo
		- tiempo
		- recurosos
- Por encima esta costos de gestion:
	- Costos de reuniones
	- tiempo de reuniones
	- asignaciones de minutas
	> A LAS HORAS ESTIMADAS DE DE ENTREGABLES SE LE SUMA 40% Y ESO ES COSTOS DE GESTION
- Reserva de contingencia:
	- Sirve para ASUMIR riesgos. Es decir, no transfiero, mitigo u otra cosa. No hago nada para evitarlo salvo agarrar plata para entregar cuando ocurra
	- Si gestiono el riesgo y meto plan de accion entonces es entregable y va en la base
	- Si no gestiono el riesgo lo agrego como contingencia
	- El monto esta relacionado con la matriz de riesgos y segun el impacto
- Reserva administrativa:
	- Los proyectos no terminan a tiempo, bajo costo estimado, etc. Sirve para manejar desvios en el proyecto
	- Equivale a el 40% de lo obtenido hasta el costo de reserva de contingencia
- Ganancia
	- Es el 35% de todo lo estimado en niveles anteriores
>[!note] Agregar precio por hora en los recursos
>Esto sirve para calcular la base de los costos. Tengo que poner en tasa Estandar. Tengo que poner el doble de su salario para incluir vacaciones, obra social, etc. Luego agregar columna costos


#### Diferencia con costo y presupuesto
En autoridad de PM tengo que poner la responsabilidad en torno a presupuesto, por ejemplo, si pongo holguras en costos base, no sumo costos de gestion luego en el presupuesto. Esto **tiene que estar en autoridad y responsabilidad del PM**

### Planilla de costos
Tenes recursos, horas de cada recurso y valor hora. Esto es el costo base. Esto debe ser coherente con el project.
Ademas tengo que considerar costos como servicios, compra de licencias, infraestructura, gastos generales.
Con esto tengo el **costo** **total** de mi proyecto. Esto es el peldaño 1
Luego completo
- Peldaño 2
- peldaño 3 consistente con riesgos asumidos en matriz de riesgos
	- Estimacion de costos por riesgos asumidos:
	  Me fijo cuanto tiempo no voy a poder trabajar y sumo cuantos dias me costo eso.

# Enfoque de implementacion de proyecto y producto
> Se trabaja con metodologia predictiva

El ciclo de vida de proyecto es independiente del producto y este puede ser:
- Predictivo
- adaptativo
En su core ambas implican
#### Adaptativo
Elaboracion progresiva de los requisitos basados en ciclos breves e iterativos de planificacion y ejecucion. Hay etapas que se reinician y hay otras que quedan. Por ejemplo, diseno, construccion o pruebas pueden rehacerse mientras que gestion y plenificacion no.
Existe retroalimentacion frecuente que lleva a una mayor calidad. El alcance se itera varias veces
#### Predictivo
Hasta no terminar una fase no comienzo con la otra. Desde el comienzo del proyecto conozco el alcance y se como queda

>[! important] Diferencia entre predictivo y agil
El predictivo fija el alcance mientras que el agil fija el tiempo y el costo

##### Iterativo
Puede ser adaptativo o en cascada, lo importante es que itero el pase completo, es decir, el adaptativo completo o la casacada completa.

### Diferencias
![[Pasted image 20260831211643.png]]

#### Implementacion de producto
- **Paralelo** Se instala el sistema nuevo y entra en funcionamiento sin interrumpir el uso del aterior. Ambos se usan simultaneamente hasta que el nuevo sistema funciona correctamente y se abandona el anterior. Se recomienda cuando el nuevo sistema es muy grande o impacta mucho en el negocio
- **BigBang**: Dejas de usar sistema viejo y de una entra en funcionamiento el otro sistema. Requiere de capacitacion generalmente. La operativa se transfiere de forma abrupta del anterior al nuevo a partir de la instalacion de este. Generalmente se intenta disponder 
- **Piloto**: Instalas el nuevo sistema en un area de la empresa. Una vez aprobado, se generaliza para los demas. El sistemas se pureba en un ambito restringido para validarlo luego. Se recomienda cuando existe un ambito de pruebas apropiado. Requiere establecer el tiempo de duracion.
- **Por etapas**: Instalas el nuevo sistema gradualmente. En cada etapa el proceso de instalacion se experimenta el sistema, se mejora la impementacion
Esto se define en implementacion de producto. 

___
## Definiciones
>[!IMPORTANT] ALGUNAS DEFINICIONES
>- La calidad es cumplir con los requerimientos. Es cumplir exactamente con lo especificado
>- Cumple con los requisitos de alguna persona. Agrega valor para una persona. 
>- Adecuacion al uso o *fit for use*. Satisface al cliente y no tiene errores
>- La totalidad de aspectos y caracteristicas de un producto o servicio que se sustentan en su cpacidad de cumplir las necesidades especificadas o implicitas

## Fundamentos de calidad
- La calidad debe ser tenida en cuenta al trabajar en proyectos software
- La calidad es una *ecuacion entre costo-beneficio* (trade-off)
- Exxiste un costo de calidad (debe ser previsto y medido) contra un costo de no calidad (fallas que afectan al cliente y al desarrollo)
- Los requerimientos de calidad se deben establecer con los requerimientos del proyecto. Mas alla de esto la clidad se discute en cada paso del proyecto: Arquitectura/construcción/pruebas/aceptación
### Costos de no calidad
Que pasa si ahorramos en calidad? Tambien son costos para amendar la falta de calidad

![[Pasted image 20260407205054.png]]

- **Costos de prevencion** -> Son costos para llegar a la calidad deseada en requerimientos
- **Costos de fallas internas** -> Son post construccion y corrigen software para mejorar calidad
- **Costos en fallas externas** -> No se detectaron fallas en pruebas y tengo que volver a atras para garantizar la calidad
##### Esto causa
- Baja motivacion en equipos de trabajo y duplicacion de esfuerzo
- Over-time constante y retrabajo constante
- Desgaste en el equipo de trabajo
- Imagen negativa en el cliente
#### A nivel numeros
Mientras mas aumento los costos de **prevencion** *mayor* es el nivel de calidad. Mientras En cambio mientras menos costos de prevencion tengo, me aumentan los costos por **fallo** y me terminan aumentando mas los costos generales.
>[!IMPORTANT]
>La clave esta en poner o gastar lo suficiente en prevencion para bajar costos por fallos pero al mismo tiempo no excederse con costos de prevencion pues puede ser demaciado. Se busca un equilibrio entre costos de prevencion y por fallas

1. **Los errores son mas costosos mientras mas tarde**
	- Corregir un error en produccion puede costar de 10 a 100 veces mas que corregirlo en desarrollo
	- Esto se relaciona con costos de fallos
2. **La prevencion es una practica ingenieril**: Invertir en calidad del inicio reduce fallos
	- Pruebas unitarias, de integracion, Analisis estatico de codigo, revisiones de codigo
3.  **Existe el nivel optimo de calidad**
	 - Escribir demasiadas pruebas o sobreingenieria realientiza el desarrollo innecesariamente.
	 - Escribir pocas rpuebas conduce sistemas inestables
#### Iceberg de no calidad
Existen sintomas visibles de calidad que son creados o generados por sintomas invisibles de calidad. Es decir, el sintoma visible es consecuencia del sintoma invisible de falta de calidad.
#### Piramide de calidad
Similar a la piramide de mazlow, hay aspectos de calidad que son mucho mas importantes que otros. Por ejemplo, cumplir requisitos por sobre interfaz linda. La piramide va asi:
					1. Disfrutable
					2. Adaptado a lo que usa el usuario
					3. Usable
					4. Disponible y confiable
					5. Cumple los requisitos
Los primeros 3 Causan satisfaccion mientras que el 5 y 4 **Al faltar causan insatisfaccion**.
### Visiones de calidad
La calidad puede ser percibida desde 5 perspectivas, con mayor o menor grado de
- **vision trascendental**: La calidad se puede reconocer pero no definir. Es subjetiva
- **vision de usuario**: La calidad es adecuacion al proposito. Se adecua a lo que necesita o no. *Por ejemplo, al comprar un auto para hacer de taxi, un corsa, no un ferrari*. Es el **fit for use**
- **vision de manufactura**: La calidad es conformidad con especificacion. *Si establezco correctamente los requerimientos y los sigo correctamente entonces mi producto es de buena calidad*. Es cumplir con los requerimientos. Suele comparar respecto a un requerimiento de la manufactura, por ejemplo, el peso de los archivos de un sistema que no supere tal cantidad. No existe cumplir un requisito mejor que otro, la comparación esta en cumpliro o **no**.
- **vision de producto**: La calidad esta vinculada a las caracteristicas inherentes del producto. 
- **vision basada en valor**: La calidad depende de la cantidad de dinero que el usuario este dispuesto a pagar por el producto
### Calidad del producto
Tenemos un modelo de calidad de producto y metricas que determinan si se cumple tal idea de calidad.
## Iso 25000
Esta compuesto por areas y subareas. Es un sistema que te acompaña a ver todo el software y determina metricas sobre cada area
### Adecuacion funcional
El software proporciona funciones que satisface las necesidades. *El software hace lo que dice y hace lo que sse le pide*. SubAtributos
- Completitud funcional: Grado/porcentaje de covertura de funciones/tareas del sistema
- Correccion funcional: Capacidad del sistema de producir resultados correctos/incorrectos ssegun un nivel de precisión requerido
- Pertinencia funcional: Es mas pertinente o especifico requerido a cada subfuncion/tarea del sistema. Es la especificidad al detalle en cada funcion que tenga el sistema y no tenga cosas al pedo.
- Cobertura funcional: Mide las funciones faltantes en el sistema vs las desarrolladas
**Diferencia entre pertinencia y completitud**: completitud habla de hacer las cosas/funciones generales que debe hacer. Ahora pertinencia tenga todas las funciones y subfunciones para mi sistema y no otras que no requiere.
### Eficiencia de desempño
Es el desempeño de mi sistema relativo a la cantida de recursos usados.
- Comportamiento temporal: Tiempo de respuesta esperado para un caso
- Utilizacion de recursos: A nivel hardware/servidores/procesadores. Mientras mas optimo sea el uso de recurosos es mas barato.
- Capacidad: Grado de limites maximos de un parametro (ej maximo de usuarios en simultaneo)
#### Metricas de eficiencia 
- Tiempo medio de respuesta: Es el promedio de espera de usuario despues de emitir una solicitud
- Cantidad media de rendimiento: Es el promedio de tareas concurrentes que puede soportar el sistema en un tiempo especifico
### Compatibilidad
Es la capacidad de 2 o mas sistemas o componentes para intercambiar informacion y/o llevar a cabo sus funciones cuando comparten el mismo entorno software o hw
- Coexistencia: Ambos viven independientemente, uno no se muere si el otro esta en el mismo entorno compartiendo recursos
- Interoperabilidad: Es la capacidad de ambos para Intercambiar informacion y usar la informacion intercambiada.
### Usabilidad
Es la capacidad de sistema para ser **entendido, aprendido, usado y resultar atractivo** para el usuario
- Capacidad de reconocer adecuacion: Que tan adecuado esta el uso del sistema para el usuario
- Capacidad de aprendizaje: Que tan facil aprende el usuario a usar la aplicacion
- Capacidad de ser usado: Capacidad del producto de ser operado y controlado con facilidad.
- Proteccion contra errores de usuario: El usuario comete errores y la app le avisa que paso y lo ayuda a corregir
- Estetica de interfaz de usuario:  Capacidad de interfaz de usuario de agradar y satisfacer la interaccion con usuario.
- Accesibilidad: Capacidad del producto de ser usado por usuario para personas con diferentes caracteristicas y discapacidades
### Fiabilidad
El software puede desempeñar bajo condiciones y peroiodos determinados
- Madurez: El sistema satisface necesidades de fiabilidad en condiciones normales
- Disponibilidad: El sistema o componente esta disponible cuando se use
- Tolerancia a fallas: El sistema funciona segun lo previsto incluso con fallos
- Capacidad de recuperacion: Ante una falla, como mi sistema se recupera sin perder datos.
#### Mediciones
- MTTR (mean time to recovery): Cuanto tiempo tardo en recuperarme de una falla.
- MTBF (mean time between failure): Tiempo promedio entre fallas.
### Seguridad
Proteccion de datos e informacion. Quien tenga ingreso/lectura/escritura pueda y quien no que no pueda
- Confidencialidad: Capacidad de proteccion contra acceso de datos e info no autorizados ya sea accidental o deliberadamente
- Integridad: Previene accesos o modificaciones no autorizadas a datos o programas de ordenador. 
- No repudio: Capacidad de demostrar acciones o eventos de lugar
- Responsabiliad: Rastrear de forma inequivoca acciones de entidad
- Autenticidad: Capacidad de demostrar identidad de un sujeto o recuroso. O sea demostrar que soy yo para poder acceder a ser algo
### Mantenibilidad
Que tan mantenible es el sw. Es decir, modificado efectiva y eficientemente por necesidades evolutivas, correctivas o perfectivas
- Modularidad: Que tan acoplado modularmente un componente a otro. Osea que el cambio en un componente tenga un minimo impacto en otro
- Reusabilidad: Cuando un sistema puede reusar una porcion de codigo
- Analizabilidad: Facilidad para evaluar el impacto de un cambio sobre el software, diagnosticar deficiencias o causas de fallos en el software.
- Capacidad de ser modificado: que tan facil es cambiar un codigo
- Capacidad de ser probado: Facilidad para establecer criterios de prueba para un sistema o componente con la que se pueden llevar a cabo las pruebas para determinar si se cumplen los criterios.
#### Metricas
- Lineas de codigo (LOC/ NCLOC): Es el numero de lineas de codigo de cada archivo
- Mean time to repair: Cuanto tiempo requiero para reparar un sistema y restaurarlo a su funcionalidad
### Portabilidad
El cacho de sw se puede mover entre entornos facilmente o efectivamente (entre sistemas operativos o entornos de testing/stageing)
- Adaptabilidad: CApacidad del producto para adaptarse efectivamente o eficientemente entres intornos
- Capacidad de ser instalado: Facilidad de instalar o desinsalar facilmente
- Capacidad de ser reemplazado
## Tradeoffs entre recursos
Hay manga corta / nunca se puede tener todo y debo priorizar atributos sobre otros. Entonces debo elegir que atributo es mas importante que otro.
# Calidad de proceso
Voy a ver como construyo el producto, no el producto en si.
>[!DEFINITION]
>Conjunto de actividades ge la gente usa para desarrollar y mantener software y sus productos asociados
#### Madurez
Como organizacion como cumplo sistematicamente los objetivos. Es el grado en que un proceso esta definido, documentado, administrado, controlado, medido y efectivo
#### Capacidad de proceso
Habilidad inherente de un proceso de SW para PRODUCIR RESULTADOS PLANIFICADOS. 
#### Que es un proceso de construccion
Existen Perosnas con habilidades, capacitacion y motivacion que usan procedimientos y metodos utilizando herramientas. Este proceso se repite por tarea/proyecto/sprint.
### Proceso maduro
- Soportado por gerencia -> existe un standard forma especifica de realizar esto (por ejemplo, levantar un tiket para reemplazar un teclado)
- Definido, documentado, conocido y practicado -> No es improvisado
- Existe infraestructura adecuado para soportar -> Existe plataforma donde hacer las cosas
- Adecuadamente medido 
- Adecuadamente controlado
- Presupuestos y plazos realistas
- Riesgo conocido y controlado 
- Proactivo -> Siempre lo que pasa esta previsto
- Es como respirar pero institucionalizado, no se piensa, se hace
## Modelos de calidad de proceso 
### CMMI
Es un modelo de desarrollo y evaluacion de sw y que sea siempre previsible. Si mi modelo es bueno mi sw tambien lo es.
- No es un proceso para desarrollar sw
- No es una metodologia -> Nos dice que hacer pero no como hacerlo ni quien debe hacerlo
- Cubre pracitas de planificacion ingenieria y gestion de desarrollo
Existen 2 representaciones de niveles de CMMI
>[!NOTE]
>Cada Area/parte tiene una serie de PA o project activities. Dichos PA tienen *corroboration rules* que indican si cumplo a un nivel para una practica. Cada PA tiene una serie de niveles que son alcanzados mediante SG o specific goals compuestos de multiples SP. De esta forma si se cumple con todos los SG de un mismo nivel para toda la PA se llega al nivel especifico de SCAMPII 
#### Por etapas - Niveles de madurez
Da certificacion
- Nivel 1: Inicial. Impredecible y reactivo. No existe un procedimiento, sale al voleo
- Nivel 2: Administrado a nivel proyecto: Los proyectos se planean, miden y controlan
- Nivel 3: Definido. Proactivo y no reactivo. Toda la organizacion tiene standards para proyectos 
- Nivel 4: administrado cuantitativamente. Medido y controlado. Ademas de tener standards para todos los proyectos mido cada uno para al final ver como mejorar. *Administro mis proyectos con metricas*.
- Nivel 5: Optimmizo. Estable y flexible. Con los datos que tengo de la capa/nivel anterior mejoro mis procesos.
#### Scampi
Es una evaluacion formal para ver en que nivel estoy como organizacion. Estas evaluaciones van de la A a la C segun la presicion que tienen. La A indica en que nivel CMMI estoy y es la unica
- Clase C. Dice en que nivel basico estoy y es el comienzo. Se hace para equipos bajos y con pocos datos. De aca se sale con un area de procesos.
Tanto C como B son mas internos, luego el A es mas riguroso y reuiqere de gente externa.
#### Por continuidad - Niveles de capacidad
No da certificacion pero me dice en que nivel estoy y por ende ver en que capa quedaria
### ITIL
Es una forma de gestionar las practicas de la **gestion de servicios de IT**. Define lineamientos y procedimientos para gestionar y entregar servicios de IT de forma efectiva, fin de satisfacer necesidade sde negocio y expectativas de clientes. La estrategia es:
- Servicio de operaciones
- Mejora continua de servicio 
- Estrategia de servicios
- Diseño de servicios
- Transmision de servicios
### SPICE - ISO 15504
Es un estadnar internacional para evaluar y merjorar procesos de desarrollo de sw en una organizacion. Se basa en:
- evaluacion de capacidad de procesos
- asignacion de niveles de capacidad
- Identificacion de fortalezas y areas de mejoria
Su objetivo es ayudar a organizaciones a optimizar sus procesos, aumentar calidad de sw y lograr resultados predecibles y controlados.
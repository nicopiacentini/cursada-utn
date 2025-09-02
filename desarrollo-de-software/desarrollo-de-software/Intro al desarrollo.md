El ingeniero en sistemas crea soluciones/sistemas que procesan informacion a partrir de tecnologia. Los sistemas requieren mucha automatizacion. Por eso usamos **software** como herramienta de trabajo.
## Desarrollo de Software y Diseño de sistemas
Diseño de sistemas -> proceso decisorio que recibe los requerimientos del analisis, se evalua alternativas para estructurar componentes del sistema, responsabilidades y relaciones, eligiendo al final la mas adecuada.
**Desarrollo de software** -> proceso en el cual se construye una aplicacion desde los requerimientos hasta la entrega, focalizandose en herramientas y decisiones tecnologicas que conllevan. Va en paralelo al diseño de sistemas que se enfoca mas en decisiones relativas al dominio y considera completo no solo a la parte de sw.
## Proceso del desarrollo de sw
Proceso que parte de requerimientos y termina en un aplicacion. Esta compuesta por varias etapas que no se realizan de forma secuencial necesariamente. El orden y palalelismo de las etapas las de el *desarrollo iterativo-incremental*.
### Desarrollo iterativo incremental
Se pueden adoptar distintos enfoques que lo siguen. Cumple con:
- Incremental: no se construye todo de una, sino que se parte en pasos o incrementos hasta llegar a u totalidad tras varios ciclos
- Es iterativo porque en la primera instancia no se alcanza la totalidad del proyecto, sino que se itera sobre el mismo mejorando versiones viejas.
### Requerimientos
Surgen del analisis del sistema, realizada por el analista. El que se encarga de cersiorar que dicen los requermientos, que prioridad tienen y que soluciones deben adoptarse se llamma *product owner*. Este provee los requerimientos en casos de uso y en historias de usuario. (*como \[rol\] quiero \[funcionalidad buscada\] para \[objetivo de negocio\]*).
Posterior a esto hay un debate que debe acercar los requerimientos vistos a mano con el sw. Una vez materializados, se lleva control de estos con "issue trackers".
### Etapas del desarrollo
Son terminos de duarcion determinada para hacer una iteracion sola.
#### Codificación
Etapa en la que se genera el código de programación a partir de los requerimientos definidos en la fase de análisis.  
El resultado son **componentes de software ejecutables** (al menos en el entorno de desarrollo).

- **Entradas**: requerimientos definidos por el equipo de Producto.  
- **Almacenamiento**: el código se guarda en **repositorios compartidos**, que permiten:
  - Desarrollo concurrente entre integrantes del equipo.  
  - Versionado y manejo de cambios.  
- **Herramienta estándar**: Git (sistema de control de versiones más usado en la industria).  
- **Decisiones clave**: durante esta etapa se toman la mayoría de las decisiones de **Diseño del Sistema**.  

---

#### Testing (Etapa de pruebas)
Proceso de validación del código generado contra los requerimientos.  
Busca **definir expectativas de comportamiento** del software y verificar su cumplimiento.

###### Tipos de pruebas
- **Testing unitario**: validaciones puntuales sobre funcionalidades y algoritmos específicos.  
- **Testing de integración**: pruebas que verifican la interacción entre algunos componentes, sin abarcar toda la aplicación.  
- **Testing funcional o end-to-end (E2E)**: validaciones del comportamiento de la aplicación completa en condiciones cercanas a las reales.  

###### Automatización vs manualidad
- **Automatizadas**:
  - Útiles cuando deben ejecutarse con frecuencia.  
  - Deben diseñarse de forma independiente y programarse como código.  
- **Manuales**:
  - Más adecuadas para escenarios complejos, exploratorios o con foco en la experiencia de usuario.  

###### Relación con codificación
- El testing puede darse **después de codificar** o **en paralelo**, especialmente en el caso de pruebas automatizadas.  

---

#### Aceptación
Una vez implementado y probado el software, se valida con el **usuario o un rol que lo represente** si el producto satisface las necesidades originales del negocio.

###### Diferencia con Testing
- **Testing**: valida que el software se comporte según lo esperado (criterios técnicos).  
- **Aceptación**: valida que ese comportamiento esperado realmente **resuelva las necesidades del usuario** (criterio de negocio).  

###### Formas comunes de aceptación
- **Demo**: presentación donde usuarios o roles de Producto prueban el software y dan feedback.  
- **Sign-off**: un rol de Producto revisa y da aprobación formal.  
- **Pruebas de aceptación de usuario (UATs)**: usuarios finales usan el sistema en escenarios reales y deciden si es aceptable.  

El resultado puede generar **nuevos requerimientos**, modificando o ampliando los existentes.  

---

#### Despliegue (Deploy)
Proceso por el cual el código se **compila en ejecutables** y se carga en un **entorno de ejecución** donde diversos actores pueden accederlo.

###### Concepto de ambiente
Un **ambiente** o **entorno de ejecución** es una instancia del software con configuraciones específicas.  
Se distinguen a través de:
- Nombre que les asignamos (ej. “testing”, “producción”).  
- **Variables de entorno** que determinan su configuración (ej. conexión a base de datos distinta).  

###### Tipos de ambientes más comunes
- **Local**: corre en la computadora del desarrollador. Es inestable, útil para debugging inicial.  
- **Desarrollo**: compartido por el equipo, permite integrar cambios frecuentes. También inestable.  
- **Testing / QA / Beta**: configurado con datos de prueba, se actualiza solo cuando una funcionalidad está lista. Relativamente estable.  
- **Pre-producción (Staging)**: réplica cercana del ambiente productivo, sin exponer datos reales sensibles. Muy estable.  
- **Producción**: el ambiente real accesible por usuarios finales. Contiene datos reales.  

###### Ciclo
El despliegue ocurre varias veces durante el desarrollo, pero el **más importante es a Producción**, donde el sistema llega a los usuarios.  

---

#### Entrega o Release
Etapa final donde el software se pone a disposición de los usuarios en el ambiente de producción.

###### Características
- Implica un **conjunto de componentes de software** empaquetados y etiquetados para identificación.  
- Se acompaña del despliegue en producción y de pruebas finales.  

###### Cadencias posibles
- Al final de cada iteración.  
- En fechas regulares (ej. semanal, mensual).  
- Al completar un conjunto de funcionalidades.  
- Incluso por cada requerimiento (caso de despliegues continuos).  

###### Validaciones finales
- **Smoke Test**: conjunto reducido de pruebas rápidas sobre flujos críticos del sistema.  
  - Si falla → se ejecuta un **rollback** (volver a la versión anterior estable).  
  - Si pasa → se habilita el código a los usuarios (**Go live**).  

###### Resultados esperados
- Código funcionando en producción.  
- Identificación clara de la versión desplegada.  
- Registro de cambios de último momento incorporados al repositorio para evitar inconsistencias.  

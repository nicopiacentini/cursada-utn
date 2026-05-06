# Arquitectura de Aplicaciones

## Aplicación

Definimos aplicación como una s**olución a problemas relacionados a las operaciones y procesos de negocio en una organización** (podría o no ser un sw). Da soporte a las tareas y procesos diarios. Ordena flujos de trabajos y mejora la trazabilidad. Genera valor a usuarios externos o internos. 
**Caracteristicas**:

- **Modulares**: la funcionalidad se encuentra dividida en módulos, los cuales pueden instalarse de acuerdo con los requerimientos del cliente.
- **Configurables**: pueden ser configurados mediante desarrollos en el código del software. Esto para adaptar a una persona/requerimiento especifico
- **Especializados**: trabajar bajo un proceso lógico con soluciones a las necesidades planteadas. Adapta la solucion al problema

El objetivo principal de las aplicaciones es integrar procesos operativos con las particularidades del negocio.

---

## ERP - Sistema de Planificación de Recursos Empresariales

Es una aplicación que debería permitir la **unificación y organización de todas las áreas** para lograr la t**razabilidad de todos los procesos** y **optimización de los recursos**. Se encarga de integrar todas las funciones esenciales de una organización, proporcionando una solución integral que abarca todas las necesidades de la organización.
>[!NOTE]
>Sistema de planificación de recursos empresariales que unifica y organiza todas las áreas para lograr trazabilidad de procesos y optimización de recursos

Un ERP puede tener diversos módulos como:

- Gestión financiera y contable
- Compras
- Gestión de riesgos
- Gestión de la cadena de suministro
- Recursos humanos
- Gestión de proyectos
- Ventas
- Producción
- Gestión de calidad
- CRM

---

## CRM - Customer Relationship Management

Sistemas de apoyo a la gestión de las relaciones con los clientes, a la venta y al marketing. Es un enfoque para gestionar la interacción de una empresa con sus clientes actuales y potenciales, es una forma de pensar y de actuar de una empresa hacia los clientes/consumidores a traves del tiempo. Abarca a los sistemas que mantienen datos específicos con el fin de mantener la relación de los clientes con la empresa en todo momento.

Un CRM abarca módulos como:

- Servicio y soporte al cliente
- Clientes
- Marketing
- Ventas
- Finanzas
- Planificación
- Gestión de redes sociales
Tiene como enfoque pensar y actuar hacia el cliente para sostener relacion con el tiempo. Es como la parte anterior a que el cliente se convierta en una venta.

##### Diferencia con ERP
El ERP es la aplicacion que gestiona la organizacion como tal (procesos, documentacion, personas, compras, ventas, pagos, etc.). El CRM es como gestiono con los clientes (como me pagan por el servicio/producto, como puedo hacer campañas de mkt, etc.) y como interactuo con el (canales/seguimiento de cliente)

---

## SCM - Supply Chain Management

Es un sistema de gestión del flujo de bienes, datos y finanzas relacionados con un producto o servicio, desde la adquisición de materias primas hasta la entrega del producto en su destino final.

Se refiere a la gama de herramientas informáticas que están diseñadas para controlar los procesos de negocio, realizar las operaciones y gestionar las relaciones con los proveedores. Algunas características comunes incluyen el cumplimiento de órdenes de compra, transporte, inventario y gestión de almacenes, y el proveedor de abastecimiento.

Es la logistica de como gestiono los recursos de produccion dentro de mi organización.

## Integracion con Software enterprise
Cada vez que me intente integrar con el sw enterprise o agregar sw a mi organizacion es comun integrarse con el stack del ERP-CRM-SCM para agregar lo que precise.

---

## Gestión de Colaboración y Documentación

Son sistemas de gestión de documentos que permiten a los equipos crear, compartir, organizar y colaborar en contenido de manera estructurada y eficiente.

Suelen ser útiles en entornos donde la documentación de la organización, los manuales de procedimientos y las directrices operativas necesitan ser actualizados frecuentemente y mantenidos en un formato organizado y accesible.

Ejemplos:

- Google Workspace
- Confluence
- Office 365

---

## Arquitectura de Aplicaciones

La arquitectura de aplicaciones tiene como objetivo acercar la innovación de manera predecible, rentable y con riesgos reducidos mediante procesos de gestión financiera, de capital humano y de gestión de relación con clientes.

>[!DEFINITION]
>Son las aplicaciones que yo defino para resolver los problemas de soporte a procesos de la organizacion

#### Que hace o muestra
Define la cartera de aplicaciones de la empresa, la integración y el modo en que estos activos de TI respaldan los procesos y servicios prestados.
Generalmente tengo en cuenta a la arquitectura de informacion para ver como la gestiono. Tiene como objetivos:
- Escalabilidad -> para crecer en un futuro y soportar mas procesos
- Flexibilidad -> modularidad y poder cambiar
- Rentabilidad
- Implementacion rapida
###### Objetivos y como trabaja
- Se suministra un plano de los sistemas de aplicación, las interacciones entre ellos y sus relaciones con los procesos de negocio centrales de la organización.
- Muestra patrones, mejores prácticas y técnicas que se utilizan para crear, diseñar y mantener aplicaciones que interactúan entre sí y con otras entidades para cumplir con los requisitos del negocio y/o el usuario.
- Busca la escalabilidad, flexibilidad, rentabilidad y despliegue rápido.

### Planos / Entregables Principales

Algunos planos en los cuáles nos podemos basar para comunicar la arquitectura de aplicaciones son:

- Diagramas de contexto -> Es de un nivel 0. La aplicacion es el centro y hay flechas de ida y vuelta para cada ente/persona/aplicaciones con las que se interactua
- **Modelo C4**: Consiste en un conjunto jerárquico de diagramas de arquitectura de software para contexto, contenedores, componentes y código. La jerarquía de los diagramas C4 proporciona diferentes niveles de abstracción (mas alto -> mas abstracto), cada uno de los cuales es relevante para una audiencia diferente.
	- 1. Contexto del sistema. La audiencia es negocio, producto, arquitecto, desarrolladores
	- 2. Contenedores. La audiencia es producto, arquitecto, desarrolladores
	- 3. Son los componentes y es un **diagrama de componentes**. Sirve para arquitectos y desarrolladores
	- 4. Codigo. Es para arquitectos y desarrolladores. Aca es diagrama de clases/secuencia.

---

## Rol del Arquitecto de Aplicaciones
 Diseñar soluciones técnicas para resolver problemas del negocio. Esto incluye soluciones propias como ya existentes
 ### Caracteristicas

- Actualización y mantenimiento -> En base a necesidades
- Gestionar requerimientos -> Como debo soportar procesos
- Identificar y evaluar tecnologías -> Donde estoy y que tecnologias tengo disponibles
- Aplicar seguridad y cumplimiento
- Proveer optimización y escalabilidad -> No atarme a una solucion sino que pueda escalar/cambiar
- Emplear control y monitorización -> tanto interno como externo
- Integración entre los diversos sistemas y aplicaciones

---

## Frameworks
Estructuras metodologicas que organizan conceptos, practicas y herramientas para abrodar problemas complejos en la organizacion
### Modelo operativo
Es un framework que da un conjunto de pasos estructurados y ordenados para obtener un resultado. En este caso, facilita la administraciopn de la ifnormacion que constituye la operación de negocio.
![[Pasted image 20260504195857.png]]

Las herramientas tecnologicas y los metodos de trabajo dan soporte a la operacion de negocio
### ZIFA
Propone la vision de la organizacion. Propone alineamiento y relacionamiento entre la organizacion y sus componentes para asegurar el exito en la gestion del negocio. Me da un
  
| Nivel | Qué (Datos) | Cómo (Funciones) | Dónde (Red / Ubicación) | Quién (Personas) | Cuándo (Tiempo) | Por qué (Motivación) |  
|------|-------------|------------------|--------------------------|------------------|-----------------|----------------------|  
| **1. Alcance / Contextual** | inventario de datos | procesos | red / ubicación | roles | eventos | objetivos |  
| **2. Modelo de Negocio / Conceptual** | | | | | | |  
| **3. Modelo del Sistema / Lógico** | | | | | | |  
| **4. Modelo Tecnológico / Físico** | | | | | | |  
| **5. Componentes Detallados** | | | | | | |  
| **6. Empresa en Funcionamiento** | | | | | | |  
En cada celda va **a quien vas a analizar**(columna) y **como lo vas a analizar**(fila). Cada celda es o suele ser una herramienta o artefacto que permite realizar este analisis entre la pregunta y la capa conceptual.

---  
  
#### ¿Para qué sirve?  
  
1. Ordena la arquitectura empresarial.  
2. Relaciona negocio, datos, aplicaciones e infraestructura.  
3. Mejora la comunicación entre áreas.  
4. Facilita el análisis y la toma de decisiones.  
Permite la organizacion desde distintas perspectivas y niveles de detalle.
---  
### TOGAF
Marco de trabajo que estructura el desarrollo y la implementación de la arquitectura empresarial. Proporciona una metodología estándar para alinear tecnología y objetivos del negocio mediante un enfoque estructurado para diseñar, planificar y gobernar la arquitectura. Su objetivo principal es reducir el riesgo en el desarrollo de sistemas.
**Basicamente, que pasos seguir en el momento en que hago un cambio arquitectural. Todo gira en torno a como gestione los requerimientos**

Es como un marco que a mas alto nivel ve la arquitectura y  sus principios y a medida que se baja se ve como se da soporte a procesos, sistemas de informacion, tecnologias y arquitecturas tecnologicas. Por ultimo se ven opoertunidades soluciones y planificaciones de migracion y las posibles implementaciones a futuro.
#### El ciclo
![[Pasted image 20260504200735.png]]
Se pasa de lo mas amplio y mas a nivel arquitectura a la implementacion y lo mas bajo o avanzado del cambio.


___
### BPM
Es un software para la gestion de procesos de negocios. Modela, automatiza, controla y optimiza los procesos de negocio de una organizacion. Te da una serie de lineamientos y sobre cada un sublineamiento a analizar/planificar para implementar el proceso de negocio.
##### Ciclo
- Definir y modelar el proceso
- Probar y desplegar
- Ejecutar y monitoriar
- Optimizar

___
## Situaciones de Transformación

Es un evento causado por factores internos o externos, que impacta en el contexto y genera un cambio en su organización, en el ambiente laboral, en la manera de trabajar, etc. Los frameworks vistos anteriormente ayudan a afrontar estas situaciones.

- **Financiera**: Puede darse por causas externas (variación de impuestos, modificación costos de producción, cambios en la demanda) o internas (planeación, administración, gestión).
- **Legal**: Obligaciones que pueden estar relacionadas con requisitos de productos particulares, instalaciones de aplicaciones, cambios en el plan de negocio.
- **Ética**: Pueden estar relacionadas con empleado, representante y/o proveedor dentro o fuera del negocio; podría estar relacionado con la gestión de fondos, relaciones humanas (acoso, racismo, homofobia, maltrato animal, etc.).
- **Organizacional**: Relacionadas con procesos, productividad, capacitación, motivación, entre otros sobre los objetivos empresariales, requisitos funcionales y las restricciones técnicas.
- **Tecnológica**: Herramientas que la empresa utiliza, por ejemplo, los servidores, software de base, de aplicaciones, dispositivos, comunicaciones o cualquier tipo que afecte la productividad, modifique el nivel de incertidumbre, afecte a los empleados y tenga un impacto en el negocio.
- **Natural**: Tienen el poder de afectar al negocio. Por ejemplo, se podría dañar o arruinar completamente las instalaciones y los activos fijos de un negocio por inundaciones, huracanes, tornados, nevadas, incendios, etc.
- **De Relaciones**: Como las comunicaciones, las redes sociales o cualquier impacto que afecte la imagen o la reputación de la empresa que pueda ser considerado con relevancia.
Son los que generan nuevos requerimientos en la organizacion -> tengo que cambiar -> uso uno de los frameworks de antes.
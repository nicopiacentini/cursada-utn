# Arquitectura empresarial
>[!DEFINITION]
>Es una practica que tiene como objetivo alinear la estrategia y el modelo operativo de una organiziacion, describiendo como debe organizarse y funcionar para lograr sus objetivos

Alinear la estrategia con el modelo operativo implica interrelacionar si se quiere la parte administrativa (alto nivel) con laparte operativa o de **procesos** de la empresa

>[!DEFINITION]
>Proporciona un plan para apoyar la transformacion de la empresa; por ello, se la debe considerar un recorrido y no un proyecto unico.

Una organizacion participa o lleva a cabo multiples proyectos que la construyen y transforman

>[!DEFINITION]
>Usa metodos para describir una vision completa de la organizacion, analizarla, diseñarla y luego planear e implementar su evolucion. *Contempla cuatro capas o dimensiones*.

Divido a la empresa en capas y tener vision estrategica integral de las partes de la empresa
***En corto, analizo la empresa por partes y trato de alinear dichas partes con el objetivo***
### Capas de la Arquitectura empresarial
Estos pilares son la vision estrategica que tiene el **area de sistemas** para analizar a la empresa. Es decir, *se interpreta que la empresa puede verse de esta forma desde el punto de vista de sistemas*. Estos pilares NO tienen orden.
La estrategia empresarial define y esta compuesta por:
1. **Arquitectura de negocio**: Es la estrategia de la empresa, servicios ofrecidos, organizacion y capacidades empresariales necesarias para prestar servicios
Vendría a ser que todas las decisiones de negocio deben estar alineadas con los objetivos que persigue la organizacion. Entonces todas las soluciones y proyectos que se hagan tambien deben contribuir al negocio.
2. **Arquitectura de la informacion**: Define requisitos de informacion y el modelo de datos de la empresa y ayuda a garantizar que los datos se gestionen para dar soporte al negocio. 
Se suelen encargar los de *data gobernance* o *Arquitecto de datos* indicando metricas de datos. Basicamente se usa para tener una base o standard para persistir datos de la misma forma y no tener discrepancias entre sistemas de la misma organización
3. **Arquitectura de aplicaciones**: Define cartera de aplicaciones de la empresa, la integracion y el modo en que los activos de IT respaldan procesos y servicios prestados. 
Define como o que aplicaciones se usan e interrelacionan en la organizacion (no solo de un proyecto) para cumplir objetivos. Va por el lado de diagrama de componentes y como se integran dichos componentes con otros nuevos. *Cada proyecto que se vaya a realizar tiene que tener en cuenta la incidencia que tiene en el resto de sistemas de la empresa y asi evitar retrabajo*.
4. **Arquitectura de tecnologia**: Identifica tecnologias (sw y hw) que soportan aplicaciones y datos y comprende como se desplegan
Habla de que infraestructura, computadoras, ambientes, versiones de sw y sw de base (azure o google) que tiene en la organizacion. Son las especificaciones. Deben ser revisadas para ver si una nueva aplicacion es compatible.
Estos pilares son **puestos de trabajo**

#### Estrategia empresarial
Los 4 pilares hacen a la estrategia empresarial. Ninguna es independiente de la otra. 
Si decimos que la estrategia empresarial se encarga de tomar desiciones para cumplir con el objetivo de la organizacion ¿Como se relaciona con estos pilares? La respuesta es sencilla, ya que cada desicion que tome la estrategia empresarial debe consultar la factibilidad a cada uno de estos pilares. Al mismo tiempo, cada movimiento o cambio en estos pilares debe coincidir o alinearse con la estrategia empresarial. 
Las tecnologias e informacion deben dar soporte a la parte funcional o de procesos.
###### Definir el proyecto
Siempre se piensa desde el beneficio del negocio y el alcance del proyecto, no desde el producto como tal. Es decir, pensar un proyecto sobre por que lo estoy haciendo. Pensar el proyecto de forma sistemica viendolo con el contexto empresarial(tiempos, beneficios, recursos, como afecta al objetivo de la empresa, tecnologias)
*El proyecto no es lo que hace como tal sino el beneficio/objetivo que le da a mi empresa*.
La Arquitectura empresarial da los lineamientos en los que se debe basar para definirlo correctamente
#### Beneficios de la arquitectura empresarial
- Mejora la toma de decisiones y el rendimiento general -> Me da un contexto para tomar la decision
- Reduce costos operativos -> de retrabajo e indesicion
- Aumenta la agilidad -> Pienso antes de tomar una decision con informacion que ya tengo y como avanzo con mi objetivo y como se alinea con la organizacion. Es mas rapido y ahorra retrabajo
- Facilita la comunicacion entre areas -> ya se de antemano como avanzo con mi objetivo y como mi proyecto se alinea con la organizacion
### Actores o roles de la arquitectura empresarial
Arquitecto -> tiene mas enfoque funcional (de lo que sabe hacer)
- **Arquitecto Empresarial:** Brinda servicios de arquitectura que transforman el modelo operativo para alinearlo con la estrategia.
    
    - _Ejemplo:_ Decide que la empresa debe pasar de vender solo en tiendas físicas a un modelo omnicanal, reestructurando toda la organización para que los equipos físicos y digitales trabajen juntos.
        
- **Arquitecto de Negocio:** Define modelos de negocio y de capacidades y garantiza que los flujos de valor estén alineados con expectativas del cliente.
    
    - _Ejemplo:_ Define que para la app de pagos, el valor principal es la "velocidad de transacción" y decide qué capacidades necesitamos (ej: pasarela de pagos propia vs. tercerizada) para que el cliente no se vaya a la competencia.
        
- **Arquitecto de Soluciones:** Diseña soluciones tecnológicas para cumplir con las necesidades de negocio, aplicación, servicio e infraestructura.
    
    - _Ejemplo:_ Elige usar una arquitectura de microservicios en la nube, decide qué base de datos usar para el historial de transacciones y cómo se conectará la app con los bancos.
        
- **Arquitecto de Seguridad:** Verifica que las nuevas arquitecturas diseñadas cumplan con la política de seguridad de la organización.
    
    - _Ejemplo:_ Audita que la app de pagos tenga encriptación de extremo a extremo, que los datos de las tarjetas estén anonimizados y que cumpla con normativas como PCI DSS (estándar de seguridad de tarjetas).
        
- **Gerente de Riesgos:** Responsable de evaluar exposición al riesgo y el cumplimiento normativo. Planifica para ver si se pueden cumplir determinadas cuestiones según el riesgo.
    
    - _Ejemplo:_ Analiza qué pasa si el servidor de pagos se cae durante el Black Friday o si hay una brecha de seguridad. Calcula si la empresa puede tolerar financieramente esa pérdida o si hay que contratar un seguro o redundancia extra.
        
- **Arquitecto de Información:** Diseña y gestiona dónde se usan, mueven y almacenan los datos. Apoya inteligencia, privacidad y ciencia de datos.
    
    - _Ejemplo:_ Diseña el "Data Warehouse" donde se guardan los datos históricos de compras para que el equipo de Marketing pueda hacer ofertas personalizadas a los clientes sin violar su privacidad.
        
- **Analista de Negocio:** Perfecciona y optimiza procesos para mejoras generales o normativas y define candidatos para automatización.
    
    - _Ejemplo:_ Observa que el proceso actual de "aprobación de reembolsos" es lento y manual; propone automatizarlo con un bot que valide si el reembolso cumple las reglas, ahorrando 10 horas de trabajo humano por día.
Todos estos roles-puestos pueden ser gerentes/analistas(ve desde el negocio y sus conocimientos y funcion de negocio)/arquitectos(ve de forma sistemica las piezas del proyecto) segun lo que quiera la empresa. Estos roles trabajan de forma interdisciplinaria. Mientras que el **Arquitecto Empresarial** mira la "foto grande" de la empresa, el **Arquitecto de Soluciones** baja eso a tierra con tecnología, y el **Analista de Negocio** se asegura de que el proceso diario sea eficiente.
#### Estrategia empresarial en l apractica de la Arquitectura empresarial
>[!DEFINITION]
>Es la combinacion de decisiones tomadas y acciones llevadas a cabo por la empresa para alcanzar los objetivos empresariales y asegurar una posicion competitiva en el mercado. Siempre se suele pensar a mediano/largo plazo.
- Modelo de negocio -> como funciona la empresa, como gana dinero y como alcanza sus objetivos
- Plan de negocio -> Define objetivos, contexot de mercado, recursos y direccion gneral de la empresa a mediano y largo plazo
- Estrategias empresariales -> determinan las acciones y enfoque especificos que se implementan para alcanzar los objetivos  y sostener la competitividad.
##### Niveles de estrategia empresarial
Calsifica las estrategias empresariales o desiciones de la empresa
- **Nivel 1: Nivel Corporativo (El "Qué"):** Define en qué industrias o mercados participará la empresa y cómo se integran sus partes para crear valor total.
    
    - _Ejemplo:_ La empresa decide comprar una cadena de logística para dejar de depender de terceros y controlar toda la cadena de suministro. Es una decisión de **expansión vertical** que afecta a toda la compañía.
        
- **Nivel 2: Nivel de Unidad de Negocio (El "Cómo competir"):** Se enfoca en cómo cada división específica de la empresa ganará frente a sus competidores directos en su segmento.
    
    - _Ejemplo:_ Si la empresa tiene una división de "Electrodomésticos" y otra de "Servicios Financieros", la unidad de Electrodomésticos decide que su estrategia será **liderazgo en costos** (vender más barato que nadie) mediante la optimización de su cadena de montaje.
        
- **Nivel 3: Nivel Funcional (El "Cómo ejecutar"):** Son los planes de acción detallados para que los departamentos (Marketing, RRHH, Finanzas, TI) respalden la estrategia de la unidad de negocio.
    
    - _Ejemplo:_ El departamento de Marketing lanza una campaña de descuentos agresivos para soportar la estrategia de "liderazgo en costos" del Nivel 2, mientras que RRHH diseña un plan de incentivos para que el personal de ventas mueva más volumen de unidades.

| **Nivel**             | **Enfoque**                                                             | **Pregunta Clave**                 | **Alcance**                      |
| --------------------- | ----------------------------------------------------------------------- | ---------------------------------- | -------------------------------- |
| **Corporativo**       | Diversificación, fusiones, alianzas, expanciones, negocios a participar | ¿En qué negocios debemos estar?    | Global (toda la empresa)         |
| **Unidad de Negocio** | Ventaja competitiva, diferenciación, segmento de clientes.              | ¿Cómo ganamos en este mercado?     | Específico (una unidad/división) |
| **Funcional**         | Eficiencia, procesos, tácticas. Mkt, finanzas, rrhh, tecnología         | ¿Qué hace cada área para lograrlo? | Local (un departamento)          |
#### Para que sirve arquitectura empresarial
1. Modelo de motivacion de negocios: Representa estrategia empresarial y visualiza los objetivos de la empresa. *¿Por que hago y tomo las desiciones que tomo en la organización?*
2. Mapas de capacidades de negocios: Ayudan a entender las capacidades de la empresa y como se apoyan los activos de TI *Ante un nuevo proyecto, debo ver si tengo las capacidades (habilidades o personas) necesarias o si debo subcontratar a alguien o capacitar internamente*
3. Mapas de procesos y flujos de valor: visualizan como se integran productos, servicios y el valor entregado a los clientes 
4. Modelo de negocios: Aporta una vision completa de alto nivel de los elementos estratégicos necesarios para llevar un producto o servicio al mercado
5. Mapa de recorrido de cliente: Permite entender como interactúan los clientes con la organización y su nivel de satisfacción
6. Hojas de ruta de transformacion de TI: Visualizan y comunican como se planifican los proyectos de TI y de negocio a lo largo del tiempo
## Componentes clave de la estrategia empresarial
- **Contexto**: El mismo proyecto o la toma de las mismas decisiones no lleva al mismo resultado porque cambia el contexto -> son dos proyectos diferentes
- **Interesados**: La misma implementacion con distintos interesados es diferente ya que los interesados como tal tienen intereses diferentes
#### Direccion
Proporciona la vision y dirección de la empresa con instrucciones de que hacer, cómo hacerlo y quiénes son responsables. Los valores establecen lo que se debe y no se debe hacer y orientan a todos los niveles
#### Análisis foda
Identifica la situación de la empresa: Fortalezas y oportunidades a aporvechar y amenazas de las que debe cuidarse.
#### Ejecucion y control
Se apoya en procedimientos operativos funcionales, en un plan de adquisiciones y asignación de recursos y en métricas como medidas de control.
#### Mision vision y valores
Se definen al comienzo pero pueden cambiar.
- **Misión**: Es el proposito de la empresa. Da los objetivos y funciones de la organización
- **Visión**: Es la meta a largo plazo de la empresa. Da objetivos a corto y largo plazo. Soporta decisiones directivas.
- **Valores**: Principios de acción para todos los niveles de la empresa. Guian toma de desiciones a la diaria.
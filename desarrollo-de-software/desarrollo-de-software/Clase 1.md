# Resumen de "Introducción a arquitectura.docx"

Este documento presenta una introducción a la arquitectura de software, abordando su definición, las cuestiones clave que resuelve, los criterios para tomar decisiones arquitectónicas y una breve visión de los patrones.

---

### 1 ¿Qué es una Arquitectura de Software?

La arquitectura de software se define como el diseño de más alto nivel de un sistema. Es el conjunto de decisiones que estructuran el resto del diseño, las cuales son difíciles de modificar y deben tomarse con gran cuidado desde el principio. Una de sus funciones principales es posibilitar o garantizar el cumplimiento de los requerimientos no funcionales. En este contexto, la arquitectura se considera una parte del diseño.

Se diferencia entre dos conceptos:

- **Arquitectura de software**: Se ocupa de la forma de estructurar un sistema de software individual.
    
- **Arquitectura de sistema, organizacional o de integración**: Se enfoca en las relaciones entre varios sistemas de software para formar un sistema más grande.
    

---

### 2 Cuestiones arquitectónicas

La arquitectura aborda diversos problemas, conocidos como cuestiones arquitectónicas ("Architectural Concerns"). Estos se dividen en dos grupos principales:

#### 2.1 Físicas

Las cuestiones físicas incluyen el hardware, el despliegue, la infraestructura y la distribución física de los componentes lógicos (nodos). También se consideran las tecnologías críticas, como lenguajes y ciertos frameworks, que son difíciles de cambiar.

#### 2.2 Conceptuales/lógicas

La actividad de diseño consiste en dividir un software en subsistemas, definir sus responsabilidades y cómo se comunican. La idea de "dividir y conquistar" es central en la arquitectura.

La división en subsistemas se puede analizar de dos maneras:

- **Según responsabilidades funcionales**: Por ejemplo, un subsistema para inscripciones, otro para pagar sueldos, etc..
    
- **Según el tipo de responsabilidad**: Separando el dominio de otros aspectos no funcionales como seguridad, persistencia, interfaz de usuario, logging, etc..
    

A estas responsabilidades no funcionales se las denomina "concern" o "aspecto". Un concern es una preocupación que atraviesa los requerimientos funcionales ("cross-aplicación"). Los dos concerns principales en los que se centra este material son:

- **Interfaz de usuario (UI)**: La parte del sistema que gestiona la interacción con el usuario, mostrando información y permitiendo acciones.
    
- **Persistencia**: Se encarga de garantizar que la información del sistema perdure en el tiempo, a menudo almacenándola en un medio permanente como un disco rígido. Esto implica resolver cómo mover los datos entre la memoria de trabajo y el almacenamiento.
    

---

### 3 Criterios de decisión arquitectónicos

Mientras que las decisiones de diseño se basan principalmente en criterios funcionales y cualidades como la mantenibilidad, extensibilidad y simplicidad , las decisiones arquitectónicas priorizan los

**criterios no funcionales**.

Algunos criterios arquitectónicos importantes son:

- Escalabilidad
    
- Disponibilidad
    
- Seguridad
    
- Trazabilidad
    
- Eficiencia
    
- Recuperación ante errores
    

Además, entran en juego limitaciones no tecnológicas como el costo, el tiempo de desarrollo, cuestiones legales y la conformación del equipo.

Una arquitectura incluye decisiones sobre:

- Módulos funcionales, sus responsabilidades y comunicación.
    
- Cómo abordar cada concern y qué herramientas usar.
    
- La tecnología a utilizar (lenguaje, SO, frameworks).
    
- El hardware y la distribución de responsabilidades entre los nodos.
    

---

### 4 Patrones

Los patrones de arquitectura son soluciones conocidas a problemas frecuentes, al igual que en el diseño de software.

#### 4.1 Arquitectura física

Cuando los sistemas empresariales se ejecutan de forma distribuida en varios nodos , se puede clasificar las aplicaciones según cómo se reparte el peso de la lógica entre el servidor y los clientes:

- **Cliente Pesado**
    
- **Cliente Liviano**
    
- **Mixtas** (como RIA o actualizaciones automáticas)
    
- **Stand Alone** (no distribuida)
    

Esto genera problemas como la gestión del estado (stateful vs. stateless), seguridad, actualización de clientes, comunicación y la posible duplicación de lógica y datos.

#### 4.2 Arquitectura lógica

La arquitectura lógica busca desacoplar los componentes que resuelven diferentes concerns (persistencia, UI, dominio). A esto se le suele llamar "división en capas" , aunque existen otros estilos arquitectónicos para lograrlo. El documento menciona varios estilos del paper de Garlan y Shaw, como pipes & filters, orientado a objetos, capas, etc..

Se advierte que la arquitectura en capas, donde las capas se organizan jerárquicamente, puede ser rígida y burocrática, y a menudo no es la mejor opción para el desacoplamiento. La idea de capa puede confundirse con otros conceptos como:

- Capa como "nivel de abstracción".
    
- Capas "lógicas" (presentación-dominio-persistencia).
    
- Capas "físicas" (máquinas o tiers).
    

#### 4.3 Otras taxonomías

Existen otras categorizaciones de patrones arquitecturales para problemas lógicos, como el modelado de presentación (MVC, MVVM) y la comunicación entre componentes. También se mencionan patrones sobre la integración del diseño y la arquitectura, como los EAP de Martin Fowler y el patrón Home/DAO.

---

### 5 Consideraciones generales

El documento enfatiza que, aunque el diseño evolutivo es posible a través de refactoring, una noción general de la arquitectura es necesaria desde el principio, ya que cambiarla sobre la marcha es extremadamente costoso.

Se citan ejemplos de cambios arquitectónicos complejos:

- Cambiar un motor de persistencia.
    
- Introducir una cola de mensajes a mitad de proyecto.
    
- Cambiar de un procesamiento online a por lotes.
    
- Migrar de un lenguaje a otro en una aplicación avanzada.
    

Además, se recalca que una arquitectura no es solo un diagrama, sino que requiere un conocimiento profundo de las tecnologías subyacentes, protocolos de red y detalles de implementación. Los arquitectos deben tener un perfil tan técnico como el de un programador.

Los grandes problemas de arquitectura son recurrentes:

- **Estado**: Encapsular o anular el estado (stateful vs. stateless) para simplificar y escalar el sistema.
    
- **Comunicación**: Controlar la comunicación entre componentes, minimizar la complejidad, manejar errores y ser expresivo.
    
- **Duplicaciones**: A veces es necesario introducir duplicación de datos o lógica por cuestiones de eficiencia, seguridad o compatibilidad entre tecnologías.
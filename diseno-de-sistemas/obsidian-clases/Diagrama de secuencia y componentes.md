# Arquitectura: Vistas, Modelos y Comunicación



---

## Vistas de la arquitectura

Una **vista** es una presentación de un modelo. Es decir, es una descripción completa de un sistema desde una perspectiva particular, según Kruchten.

### Concepto de vista

Entre los conceptos fundamentales de vista se encuentran la **Vista 4+1** propuesta por Kruchten, las **Vistas del SEI** y los distintos **Modelos UML** que representan perspectivas específicas del sistema.

---

## Vistas y Modelos

Existen distintos tipos de vistas que se emplean para representar el sistema:

- La **vista lógica**, que se enfoca en la funcionalidad del sistema desde la perspectiva de los desarrolladores.
    
- La **vista de procesos**, que se centra en los aspectos de concurrencia y sincronización.
    
- La **vista de despliegue**, que muestra la disposición física del sistema.
    
- La **vista física**, que representa la infraestructura real donde se ejecutará el sistema.
    

---

## Vista 4+1

Dentro de esta propuesta se incluyen distintos diagramas fundamentales:

El **Diagrama de Paquetes** muestra cómo un sistema está dividido en agrupaciones lógicas de clases y las dependencias entre esas agrupaciones.

El **Diagrama de Componentes** representa la organización y dependencia entre diversos componentes. Este tipo de diagrama ilustra las piezas de software, controladores embebidos, entre otros, que conforman un sistema. A diferencia de un diagrama de clases, tiene un mayor nivel de abstracción, ya que un componente usualmente se implementa mediante una o más clases u objetos en **tiempo de ejecución**. Estos componentes son considerados bloques de construcción importantes, ya que pueden comprender grandes porciones del sistema.

El **Diagrama de Despliegue** muestra la configuración de los elementos de hardware (nodos) y detalla cómo se asignan los elementos y artefactos del software en dichos nodos.

---

## Modelos UML

En el contexto de los Modelos UML se distinguen tres tipos de vistas:

1. **Vista de módulos:** describe cómo el sistema está estructurado en un conjunto de unidades de código.
    
2. **Vista de conectores y componentes:** describe la estructura del sistema como un conjunto de elementos en tiempo de ejecución y sus interacciones.
    
3. **Vista de asignación:** muestra cómo las unidades de software se relacionan con elementos del entorno como hardware, sistemas de archivos o la organización de los equipos de desarrollo.
    

---

## Vistas SEI

El documento también menciona las vistas propuestas por el SEI (Software Engineering Institute), aunque no se detalla su contenido en esta sección.

---

## Comunicación de la arquitectura: Diagrama de Paquetes

El **Diagrama de Paquetes** es una herramienta que muestra cómo un sistema está dividido en agrupaciones lógicas de clases y cuáles son las dependencias entre estas agrupaciones. Aca se separan las clases segun lo que hacen individualmente. Por ejemplo, las clases relativas a un hecho

### Ejemplo de Diagrama de Paquetes

---

## Comunicación de la arquitectura: Diagrama de Componentes

El **Diagrama de Componentes** permite visualizar la organización y dependencia entre diversos componentes. Este tipo de diagramas se utiliza para representar piezas del software, como controladores embebidos, que formarán parte del sistema. Aca las clases se relacionan por el servicio que brindan en su conjunto.

Un componente tiene un nivel de abstracción más alto que una clase, ya que generalmente se implementa a través de una o más clases u objetos y **paquetes**, los mismos que vimos recien. Se considera un bloque de construcción fundamental del sistema.

Manejan una idea de **componente general**, un gestor de todo mi sistema para comunicarse entre componentes.

Por ejemplo, un componente puede estar representado por un archivo como `calculadora.java`, mientras que otro componente puede ser una base de datos como `BD Entradas`, con el estereotipo `<<base de datos>>`.
##### Estereotipos
Son una manera de identificar tipos de componentes. Varios componentes pueden tener el mismo estereotipo. Es algo gererico como *servicio* o *base de datos*. No son obligatorios.

##### Componentes externos
Pueden existir componentes externos a mi sistema donde no me interesa como hacen las cosas sino la interfaz que exponen. Debo separar mi sistema de lo que no pertenece a el.

### Interfaz entre componentes

Los componentes se comunican a través de interfaces. Un componente provee una interfaz que otro componente puede utilizar. Por ejemplo, el **Componente A** puede usar una interfaz que es provista por el **Componente B**. Esto no implica que la comunicacion sea unidireccional. Estas interfaces tampoco son las interfaces del diagrama de clases.

---

## Comunicación de la arquitectura: Despliegue

Un **Diagrama de Despliegue** representa la configuración de los elementos de hardware (nodos) y la manera en que se distribuyen los elementos y artefactos del software en esos nodos.

### Elementos de un Diagrama de Despliegue

Un **nodo** es un elemento de hardware o software y actúa como contenedor; incluso puede contener otros nodos. Tiene asociado un **estereotipo** que puede repetirse en otros nodos y un nombre. Los nodos pueden ser:
- Servidor
- Dispositivo
- Artifact -> estos manejan el codigo fuente de mi sistema.
- Base de datos
Puede ser que el sistema entero este desplegado en servidor y/o dispositivos. Entonces, por ejemplo, el nodo servidor puede tener nodos artifact dentro de si para manejar el codigo fuente.

##### Relaciones entre nodos
Si estan fuertemente relacionados uso linea solida, si a veces lo llamo y a veces no, uso linea punteada.

Un **artefacto** es un producto del proceso de desarrollo de software. Entre los artefactos se incluyen los modelos del proceso, tales como modelos de Casos de Uso, modelos de Diseño, archivos fuente, ejecutables, documentos de diseño, reportes de prueba, prototipos, manuales de usuario, entre otros.

---

## Vistas 4+1 (Kruchten)

El modelo 4+1 propone una forma de visualizar la arquitectura mediante **cuatro vistas principales** más una vista integradora.

Este enfoque no define modelos específicos sino que propone un marco de vistas que deben ser complementadas con modelos UML.

Las vistas son las siguientes:

- La **vista lógica**, que describe los aspectos funcionales del sistema.
    
- La **vista de procesos**, que modela la concurrencia y la comunicación entre procesos.
    
- La **vista de desarrollo**, que muestra la organización del software desde la perspectiva del desarrollo.
    
- La **vista física**, que representa el mapeo del software en el hardware.
    

A estas cuatro vistas se suma una quinta, conocida como **“+1”**, que está representada por los **Casos de Uso**. Esta vista tiene como función principal unir y relacionar las otras cuatro vistas. A través de esta integración se permite la trazabilidad de componentes, clases, equipos, paquetes, entre otros elementos, en relación con cada caso de uso.


### Diagrama de capas
Es diagramar el sistema como un unico componente compuesto por una serie de capas, escalando en niveles de abstraccion. Empieza en lo mas bajo como infraestructura, datos, persistencia, logica de negocios. Luego sigue con el servicio y la presentacion. Las capas adyacentes se comunican entre si o con una capa integradora que se comunica con todas.
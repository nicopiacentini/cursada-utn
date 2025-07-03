  

## Arquitectura: conceptos introductorios

  

### Definición de arquitectura

- Conjunto de estructuras necesarias para razonar sobre el sistema: elementos de software, relaciones y propiedades (Clements et al., 2010).

- Organización fundamental de un sistema, incluyendo componentes, relaciones y principios que rigen su diseño (ANSI/IEEE Std 1471-2000).

- Organización topológica de módulos parametrizados y sus relaciones (Bhansali 92).

  
  

---

  

## Niveles de Arquitectura

  

### ¿Por qué definición genérica?

- Existen múltiples niveles de arquitectura en SI&TI (Sistemas de Información y Tecnología de Información).

  

### Niveles

1. **Enterprise**: estrategia tecnológica y de negocio.

2. **Sistema**: software e infraestructura.

3. **Software**: aplicaciones o subsistemas específicos.

  

---

  

## Arquitectura Empresarial

  

### Frameworks comunes:

- TOGAF

- Zachman

- TAFIM

- Gartner

  

### Zachman Framework

- **Negocios**: estrategia, estructura organizacional y procesos clave.

- **Información**: estructura y gestión de datos.

- **Tecnología**: hardware, software y comunicaciones de soporte.

- **Aplicaciones**: propiedades fundamentales, relaciones y principios (definición IEEE).

  

### TOGAF

- Enfoque en niveles de sistema y software.

- Proporciona estructura para pensar la arquitectura.

  

---

  

## Concepto de Vista

  

- **Vista**: presentación de un modelo, perspectiva particular del sistema (Kruchten).

- **Modelos de vistas**:

  - Vista 4+1 (Kruchten): lógica, procesos, despliegue, física.

  - SEI views

  - UML

  

---

  

## Arquitectura de Software

  

### Definiciones clásicas

- Estudio de estructura a gran escala y rendimiento (Lane 90).

- Diseño e implementación de estructura de alto nivel, requisitos funcionales y de rendimiento (Kruchten 94).

  

### Otras definiciones

- Módulos activos, mecanismos de interacción, reglas (Boasson 95).

- Componentes, relaciones, principios y evolución (Garlan 95).

- Estilo y método de diseño y construcción (BHayes-Roth 95).

  

### Conceptos según Moriconi (1994)

1. **Componente**

2. **Interfaz**

3. **Conector**

4. **Configuración**

5. **Mapeo**

  

### Definición clave

- Estructuras del sistema, propiedades visibles externamente, relaciones entre elementos (Bass, Clements, Kazman; 2003).

  

---

  

## Beneficios de la Arquitectura

  

- Relación entre objetivos del negocio y atributos de calidad.

- Priorización de objetivos conflictivos.

- Definición clara del enfoque arquitectónico.

- Mejora la calidad del producto.

  

---

  

## Características de la Arquitectura

  

- Debe ser comprensible por cada stakeholder.

- Evolutiva ante nuevos requerimientos.

- Simple y suficiente (“Good Enough”).

- Permite análisis cuantitativo y cualitativo (ATAM).

  

---

  

## Entradas de la Arquitectura

  

- Requerimientos funcionales.

- Atributos de calidad y no funcionales.

- Restricciones técnicas, de negocio, etc.

- Futuros requerimientos.

- Experiencia del arquitecto.

  

---

  

## Atributos de Calidad

  

- **Conflictos típicos**:

  - Seguridad vs. Usabilidad.

  - Performance vs. Modificabilidad.

  - Portabilidad vs. Performance.

  

- **Resolución**:

  - Priorización / jerarquización.

  - Balanceo / “Good Enough”.

  

---

  

## Infraestructura

  

### Componentes

- Software, sistemas operativos, middleware, máquinas virtuales.

  

### Nodos

- Físicos: servidores, CPU, memoria, almacenamiento.

  

### Networking

- Routers, firewalls, switches.

  

---

  

## Decisiones de Infraestructura

  

### On Premise vs. Cloud Computing

- **On Premise**: instalaciones propias.

- **Cloud**: servicios en red para administrar hardware, plataformas y aplicaciones.

  

### IaaS

- Nivel de cloud computing asociado a infraestructura.

  

---

  

## Variables de Decisión

  

- Sensibilidad de la información.

- Capacidad de almacenamiento y procesamiento.

- Costos.

- Elasticidad bajo demanda.

- Conectividad.

  

---

  

## Dimensionamiento y Escalabilidad

  

- **Dimensionamiento**: Hardware Sizing.

- **Escalabilidad**: adaptación al aumento de usuarios.

  

  - **Vertical**: más recursos sobre nodos existentes.

  - **Horizontal**: nuevos nodos (clusterización, balanceo de carga).

  

---

  

## Comunicación de la Infraestructura

  

- Uso del **Diagrama de Despliegue** para representar la relación entre componentes de software e infraestructura.
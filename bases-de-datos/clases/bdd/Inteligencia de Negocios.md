Busca transformar datos en informacion y luego en conocimiento. Es un set de herramientas. Este conocimiento me da informacion para la toma de desiciones en la piramide de desicion.

### Datos informacion y conocimiento
- Dato -> es un valor absoluto, crudo, sin interpretacion y/o contexto. Por ejemplo *carlos* es un dato
- Informacion -> Es un dato contextualizado o relacionado con otro dato. Puedo transformarlo en informacion *contextualizandolo, categorizandolo, calculandolo, corrigiendolo* o *condensandolo* 
- Conocimiento -> Es la aglutinacion de la informacion y la experiencia que me va dando conocimiento. Se adquiere a partir de la relacion de la informacion.

## Tecnologias OLAP
Se empiezan a resolver problemas reptitivos con elementos operativos.  Se introduce el concepto de Business Intelligence (BI) como la herramienta que permite proyectar escenarios futuros utilizando datos internos y externos de procesos. Para ello, se distinguen dos modelos:

### **OLTP (On Line Transactional Processing)**
Gestión diaria de *transacciones*. Ejecuta una transaccion detras de otra **sin procesar nada**.
Las usa el nivel operativo de cualquier organizacion. Se usan para desiciones operativas.
### **OLAP (On Line Analytical Processing)**
Análisis de datos históricos para planificación a futuro. No procesa los datos que recive, su forma de procesar es analizando. Me dan informacion para que yo decida. Son usadas por el nivel mas alto de la piramide. Normalmente desiciones estrategicas. Busca adaptarse a las herramientas de analisis existentes en la empresa. Tambien requiere tener un OLTP abajo de este.
- Patron de interes -> Lo que me va a interesar evaluar en la organizacion. Mi sistema obtiene informacion relacionada con lo que hace mi patron de interes para contrastar y poder evaluar.
    
#### Estructura
Se suele originar de otros sistemas y aplicaciones. Los datos suelen ser capturados por esta misma aplicacion olap. Si no es asi, se necesitan obtener estos datos duplicados de otra aplicacion. La razon para duplicar los datos es:
- Ejecucion de datos sin afectar a las demas partes del sistema
- Multiples fuentes de datos que provienen de distintos sistemas unificados en el OLAP
- Filtracion de datos para generar informes adecuados
- Ajuste y modificacion de datos por diversas razones como correccion de errores  adaptacion de datos
- Actualizacion y consistencia de datos
- Historia de datos
- Distintas perspectivas de datos -> ver alumnos de un profesor y ver profesores de un alumno.
- Actualizacion de datos


##  Bases de Datos Multidimensionales


Edgar Codd, creador del modelo relacional, identificó sus limitaciones para el análisis de datos y propuso el modelo **multidimensional**, que ofrece una mayor capacidad analítica mediante múltiples dimensiones.

En los 70s, IBM implementó APL (A Programming Language), una de las primeras herramientas OLAP. En los 90s, comenzaron a combinarse tecnologías relacionales con multidimensionales, dando lugar a soluciones más potentes, incluyendo **OLAP relacionales**.

### Concepto y Visualización

Las **Bases de Datos Multidimensionales (MDB)** almacenan la información en forma dimensional, evitando el uso de filas y columnas. Utilizan el concepto de **cubos de datos**, donde cada intersección entre dimensiones contiene un valor y es donde se guarda la informacion.

#### Vista de dimensiones
Puedo dejar fijo n dimensiones para liberar una y tener visibilidad por esa.

#### Dispersion
Quedan espacios vacios en el modelo relacional porque indefectiblemente quedan asi. Por ejemplo, en el contexto de la utn, la unica regional que tiene 2 anexos es la frba pero las demas no. Entonces para todas el segundo anexo queda *vacio*. Entonces surgen modelos nuevos

- Hipercubo -> no me importa la dispersion. Meto todo en un mismo cubo grande para ser mas rapido. Pierdo espacio.
- Multicubo -> en vez de tener un gran cubo, tengo muchos cubitos con punteros al siguiente y pierdo espacio en el ultimo cubo



#### Ejemplo de dimensiones:

- Región
    
- Producto
    
- Tiempo
    

Estas dimensiones pueden organizarse jerárquicamente, permitiendo técnicas como **drill-down**.

### 7.2.3 Estructura de almacenamiento

- A más dimensiones, mayor número de celdas (producto cartesiano).
    
- En la práctica, la mayoría de las celdas están vacías (**dispersión de datos**).
    
- Estrategias para manejar la dispersión:
    
    - **Hypercubos**: un único cubo con todas las combinaciones posibles.
        
    - **Multicubos**: varios cubos más pequeños y manejables.
        
    - Elección depende del grado de dispersión y necesidades analíticas.
        

## 7.3 Tecnologías OLAP

### 7.3.1 Introducción

OLAP complementa a OLTP permitiendo analizar la información por patrones relevantes. Se utiliza en áreas como ventas, presupuestos, finanzas, contabilidad de costos, entre otras.

### 7.3.2 Concepto

OLAP sirve para generar reportes, realizar análisis complejos, y proveer información a los ejecutivos para tomar decisiones.

### 7.3.3 Características

- Visión multidimensional de los datos.
    
- Interacción y análisis interactivo (resúmenes, drill-down, pivoteo).
    
- Modelado analítico con cálculos complejos.
    
- Alta velocidad de respuesta.
    

#### Modelo FASMI:

- **Fast**: respuesta rápida.
    
- **Analysis**: capacidad analítica sin programación.
    
- **Shared**: acceso concurrente.
    
- **Multidimensional**: soporte para múltiples jerarquías.
    
- **Information**: acceso contextual a datos.
    

### 7.3.4 Comparación OLTP vs OLAP

|Característica|OLTP|OLAP|
|---|---|---|
|Datos|Normalizados, por aplicación|Desnormalizados, por dimensión|
|Integración|Separada por área|Integrada|
|Acceso usuario|Alta, modifican datos|Sólo consultas|
|Administración|Registro a registro|Masivo|
|Transacciones|Muchas pequeñas|Pocas grandes|
|Tiempo|Datos volátiles|Datos estables|

## 7.4 Integración de Bases de Datos y Herramientas OLAP

OLAP puede integrar datos de múltiples fuentes, incluyendo:

- ROLAP (Relational OLAP): usa bases relacionales.
    
- MOLAP (Multidimensional OLAP): usa bases multidimensionales.
    
- HOLAP (Hybrid OLAP): mezcla ambos modelos.
    

### Ventajas del MOLAP:

- Menor espacio de almacenamiento.
    
- Eliminación de dispersión de datos.
    
- Uso interactivo rápido.
    

### Precauciones:

- Precalcular datos solo cuando sea necesario.
    
- Evitar más de 5 dimensiones por objeto.
    
- Aplicar diseño multicubo para minimizar la dispersión.
    

## 7.5 Arquitecturas OLAP y OLTP

- OLTP: optimizado para transacciones frecuentes (altas/bajas/modificaciones).
    
- OLAP: optimizado para análisis masivo, consultas agregadas y resumen.
    

## 7.6 OLAP: Multidimensional vs Relacional

### Comparación

|Relacional|Multidimensional|
|---|---|
|Tablas y SQL|Cubos y estructuras propietarias|
|OLTP|OLAP|
|Alta disponibilidad|Alta consulta|
|Gigabytes-Terabytes|Más compacto pero menos flexible|

### Aplicaciones:

- **RDBMS**: adecuado para grandes volúmenes y muchos usuarios.
    
- **MDB**: ideal para pocos usuarios y análisis sofisticados.
    

### Costos:

- RDBMS más económico para grandes organizaciones.
    
- MDB requiere capacitación y herramientas especializadas.
    


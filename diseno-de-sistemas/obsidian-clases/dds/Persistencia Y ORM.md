# Persistencia
Es la capacidad de un programa de persistir sus datos mas alla de la ejecucion. Puedo reutilizar los datos de ejecuciones previas. Tiene los siguientes elementos:
##### Medio Persistente
Lugar fisico donde se almacenan los datos
##### Estructura de la base de datos
Formato en el que se guardan los datos. Los archivos que la conforman pueden ser de texto plano, json, xml, etc.
##### Base de datos/Repositorio
Datos persistidos de la aplicacion
##### Metadatos 
Informacion relativa a los datos
##### Mecanismos varios
Para alterar la base de datos y para recuperar informacion de la misma (motor)

# Mapeo Objetos - Relacional (ORM)
Normalmente cuando estas en objetos podes usar una base de datos orientada a objetos y el manejo es mas sencillo. Si estas en estructurado usas una base de datos relacional y tambien funciona. Pero cuando se cruza Objetos - Relacional surge un problema: **no existe un mappeo exacto entre el mundo de objetos y el mundo relacional (impedance mismatch)**.

### Impedance Mismatch
Consiste en el problema o falta de concordancia objeto-relacional, esto consiste en un grupo de dificultades y problemas técnicoconceptuales a los que se enfrentan los diseñadores de bases de datos y los programadores. Estos problemas son generalmente la incompatibilidad entre los tipos de datos de las bases de datos y los tipos de datos del lenguaje de programación.

### ORMs
Es el software que soluciona el Impedance Mismatch. Puede ser hecho a mano o resuelto con motores comerciales como Hybernate. Deben tener en cuenta:
- Identidad
- Relaciones
- Herencia
- Tipos de dato
##### Identidad
En objetos cada objeto sabe quien es, se manejan con referencias para identificarlos y si no lo conocemos no se le puede pedir nada.
A nivel relacional existe la necesidad de que una clave identifique univocamente a cada registro de la tabla (fk). No esta necesariamente presente en el modelo de clases.

##### Herencia
Posibles soluciones:
- Una tabla por clase -> cada diferencia con subclase referencia o no a otras tablas. 
	- ¿Cuándo conviene usarlo? - Cuando lo único que comparten las clases hijas en el padre, es comportamiento (que como sabemos, no se persiste) - Se utiliza cuando se tienen atributos comunes pero también muchos atributos propios de cada subclase
- Una tabla por subclase (tipo subtipo) -> Además de generar una tabla por clase concreta, se genera una tabla para la clase padre.
	- ¿Cuándo conviene usarlo? - Cuando cada clase hija tiene muchos atributos propios pero también tienen muchos en común
- Una unica tabla -> con campos vacios segun corresponda
	- ¿Cuándo conviene usarlo? - Se utiliza cuando las subclases comparten muchos atributos en común. Es decir, cuando en total, sumando todos los atributos de los hijos y el padre, tengo pocos atributos para persistir




### Patrones de acceso a datos

#### Active record
El **patrón Active Record** asocia directamente cada objeto de una clase con una fila de la base de datos, de modo que las operaciones CRUD (crear, leer, actualizar, eliminar) se realizan desde el mismo objeto. Esto facilita el desarrollo porque el modelo contiene tanto los datos como la lógica de persistencia, pero puede generar un fuerte acoplamiento entre la lógica de negocio y la base de datos.

#### Data mapper
El **patrón Data Mapper**, en cambio, separa los objetos de dominio de la lógica de persistencia: los objetos solo representan la lógica de negocio y delegan las operaciones con la base de datos a un componente externo llamado _mapper_. Esto mejora la flexibilidad, mantiene bajo acoplamiento y favorece la escalabilidad, aunque suele implicar mayor complejidad en la implementación.


##### Lazy e Eager loading
Lazy loading → realiza la carga en memoria de los objetos sólo al momento de su utilización. ★ Eager Loading → realiza la carga en memoria de los objetos independientemente de si van a ser utilizados o no


## JPA
Java persistance API. Es la especificación de Java (API) para acceder a la persistencia de objetos.
Los elementos que contiene son:
- Entidades: Son los objetos de nuestro negocio que se persisten. 
- EntityManager: Interfaz que gestiona la persistencia de entidades (objetos) en el contexto. 
- EntityManagerFactory: Crea EntityManagers. 
- Persistence: Esta clase contiene métodos para obtener un EntityManagerFactory. 
- Query: Esta interfaz se usa para obtener objetos que cumplan ciertos criterios más complejos.
### Hybernate
Es la implementación de JPA más usada. Hay otras como Eclipselink o Toplink.
Las entidades son clases **POJO** (sólo atributos con getters y setters). Al crear una instancia, Hibernate no la conoce y se dice que está en estado Transient. Cuando la persistimos o la obtenemos con el EntityManager, pasa a estar administrada por Hibernate. ¿Qué significa administrada? Que mantiene una relación entre el objeto en memoria y el registro en la BD. Cada vez que lo modifiquemos se va a disparar una query.
#### JBDC
Es el conector entre una aplicación Java y un motor de BD particular (MySQL, Oracle, SqlServer, etc). Hibernate genera las queries por nosotros y se comunica con el driver JDBC (una librería), que recibe queries como String y las traslada a la BD.


## Persistencia NO Relacional (NOSQL)
Tambien conocido como NotOnlySQL. Difieren de bases de datos relacionales y no usan SQL como lenguaje de consulta. No hay estructuras fijas como tablas para manejar los datos ni se asegura consistencia o integridad. Lo bueno es que pueden escalar horizontalmente. Buscan resolver problemas que tienen las bases de datos relacionales, como el volumen de datos y los tipos de datos utlizados.
###### Cookies
Datos de la pagina web relativas a la sesion del usuario que son guardadas en la pc del usuario. Algunos usuarios bloquean el uso de cookies, tamaño y cantidad. Tambien se les define caducidad.
Es un tipo de persistencia no relacional.
###### Archivos
Son otra forma de persistir datos no relacional. Pueden ser textos `.txt`  o `.json` por ejemplo.
#### Problemas de persistencia de relacionales
- Logs de actividades
- Grafos
- Diferentes atributos en diferentes registros
- Configuraciones generales de la aplicacion.


### Bases de datos no relacionales
Los tipos son:
##### Orientadas a columnas
Almacena datos en registros con la capacidad de almacenar muchas columnas dinamicas. Dado que los nombres de las columnas y las claves de los registros no son fijos, y que un registro puede tener miles de millones de columnas, los almacenes de columnas anchas pueden considerarse almacenes bidimensionales de clave-valor.
Los almacenes de columnas anchas comparten con los almacenes de documentos la característica de no tener esquema, pero su implementación es muy diferente.
##### Orientadas a documentos
Almacenan y recuperan documentos que pueden ser `.json`, `.xml`, `.bson`, etc. Los documentos almacenados son similares pero no cuentan con la misma estructura.
##### Clave-Valor
Solo se pueden almacenar clave-Valor. Para recuperar un valor debo conocer la clave. Se conoce tambien como tabla de hashes por su utilizacion.
##### De Grafos
Representan los datos como nodos y aristas que son relaciones entre nodos. Permite usar propiedades de grafos como calcular pasos, caminos, etc. Generalmente no hay indices en todos los nodos entonces el acceso directo a nodos esta basado en los valores de los atributos no es posible.

## Modelado para no relacional

### Déficit actual en modelado de datos
Aunque estas bases son _schemaless_, la ausencia de un enfoque formal de modelado impide una comprensión clara de sus estructuras internas. No existen estudios sistemáticos que traten el modelado conceptual en bases de datos orientadas a documentos, a diferencia del amplio soporte que reciben las bases relacionales.
### Propuesta de modelado conceptual
El artículo propone un estándar visual para modelar bases de datos documentales, basado en diagramas similares a los Entidad-Relación (ER). El objetivo no es imponer esquemas rígidos sino facilitar la visualización de la estructura conceptual de los datos. Se detallan dos tipos de relaciones comúnmente usadas en MongoDB y CouchDB: aquellas que se basan en referencias entre documentos (References), y las que anidan documentos dentro de otros (Embedded Documents).
#### Relaciones basadas en referencias
Las referencias permiten que un documento contenga un enlace hacia otro, dejando que la aplicación resuelva esa asociación cuando sea necesario.
#### Documentos embebidos
En este caso, los datos relacionados se almacenan juntos dentro de un solo documento —usualmente en un campo o arreglo— lo que favorece transacciones más eficientes y consistentes.

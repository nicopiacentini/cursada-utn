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
### Relacional
##### PK
- No nula
- no repetible
- minimal
- Debe identificar univocamente a un registro de una tabla
### Normalizacion 
Standard para bases de datos relacionales que la mejoran. Es un standard pero depende del caso -> por ejemplo los atributos calculables ocupan espacio pero me ahorran performance.
- 1FN -> Una relación de datos está en 1FN si cada dato contiene sólo un valor de su dominio o ninguno; si no existen repeticiones ni atributos calculables
- 2FN -> Esta en 1FN y ademas todo atributo no clave depende de la totalidad de la clave.
- 3FN -> Estas en 2FN y ademas todo atributo no clave no depende de otro atributo no clave y ademas no hay transitividad.
# Mapeo Objetos - Relacional (ORM)
Normalmente cuando estas en objetos podes usar una base de datos orientada a objetos y el manejo es mas sencillo. Si estas en estructurado usas una base de datos relacional y tambien funciona. Pero cuando se cruza Objetos - Relacional surge un problema: **no existe un mappeo exacto entre el mundo de objetos y el mundo relacional (impedance mismatch)**.
Generalmente hay una entidad por clase exeptuando clases de comportamiento, clases transitorias.
### Impedance Mismatch
Consiste en el problema o falta de concordancia objeto-relacional, esto consiste en un grupo de dificultades y problemas técnicoconceptuales a los que se enfrentan los diseñadores de bases de datos y los programadores. Estos problemas son generalmente la incompatibilidad entre los tipos de datos de las bases de datos y los tipos de datos del lenguaje de programación.
### ORMs
Es el software que soluciona el Impedance Mismatch. Puede ser hecho a mano o resuelto con motores comerciales como Hybernate. Deben tener en cuenta:
- Identidad
- Relaciones
- Herencia
- Tipos de dato -> dependen de la base de datos y el lenguaje en que se programe. Pueden ser compatibles o no.
##### Relaciones muchos a muchos
Las resuelve el ORM automaticamente sin necesidad de crear una clase intermedia. En caso de querer poner atributos de por medio en la entidad intermedia, debo crear la clase.
##### Identidad
En objetos cada objeto sabe quien es, se manejan con referencias para identificarlos y si no lo conocemos no se le puede pedir nada.
A nivel relacional existe la necesidad de que una clave identifique univocamente a cada registro de la tabla (fk). No esta necesariamente presente en el modelo de clases.
##### Cuando crear pk a mano y no atributo de dominio
Siempre conviene mas usar un id autoincremental como pk.
##### Herencia
Posibles soluciones:
- Una tabla por clase -> cada diferencia con subclase referencia o no a otras tablas. 
	- ¿Cuándo conviene usarlo? - Cuando lo único que comparten las clases hijas en el padre, es comportamiento (que como sabemos, no se persiste) - Se utiliza cuando se tienen atributos comunes pero también muchos atributos propios de cada subclase
	- ![[Pasted image 20250822112221.png]]
- Una tabla por subclase -> Además de generar una tabla por clase concreta con los datos de la clase padre y de la clave concreta.
	- ¿Cuándo conviene usarlo? - Cuando cada clase hija tiene muchos atributos propios pero también tienen muchos en común
	- ![[Pasted image 20250822112201.png]]
- Una unica tabla -> con campos vacios segun corresponda. Estas tienen un discriminador, es decir, un atributo que indica a que subclase pertenece.
	- ¿Cuándo conviene usarlo? - Se utiliza cuando las subclases comparten muchos atributos en común. Es decir, cuando en total, sumando todos los atributos de los hijos y el padre, tengo pocos atributos para persistir.
	- ![[Pasted image 20250822112520.png]]
### Patrones de acceso a datos (como persisto los objetos)

#### Active record
El **patrón Active Record** asocia directamente cada objeto de una clase con una fila de la base de datos, de modo que las operaciones CRUD (crear, leer, actualizar, eliminar) se realizan desde el mismo objeto. Esto facilita el desarrollo porque el modelo contiene tanto los datos como la lógica de persistencia, pero puede generar un fuerte acoplamiento entre la lógica de negocio y la base de datos.
#### Data mapper
El **patrón Data Mapper**, en cambio, separa los objetos de dominio de la lógica de persistencia: los objetos solo representan la lógica de negocio y delegan las operaciones con la base de datos a un componente externo llamado _mapper_. Esto mejora la flexibilidad, mantiene bajo acoplamiento y favorece la escalabilidad, aunque suele implicar mayor complejidad en la implementación.
##### Cuando cargo datos en Memoria
Lazy loading → realiza la carga en memoria de los objetos sólo al momento de su utilización. 
Eager Loading → realiza la carga en memoria de los objetos independientemente de si van a ser utilizados o no
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
#### Base de datos embebida
Es un motor de base de datos embebida dentro de un archivo compilado. Sirve para correr la aplicacion y el motor de base de datos en una sola commputadora. No requiero de un servidor para consultar datos.
## Persistencia NO Relacional (NOSQL)
Tambien conocido como NotOnlySQL. Difieren de bases de datos relacionales y no usan SQL como lenguaje de consulta. No hay estructuras fijas como tablas para manejar los datos ni se asegura consistencia o integridad. Lo bueno es que pueden escalar horizontalmente. Buscan resolver problemas que tienen las bases de datos relacionales, como el volumen de datos y los tipos de datos utlizados.
###### Cookies
Datos de la pagina web relativas a la sesion del usuario que son guardadas en la pc del usuario (en su navegador). Algunos usuarios bloquean el uso de cookies, tamaño y cantidad. Tambien se les define caducidad.
Es un tipo de persistencia no relacional.
###### Archivos
Son otra forma de persistir datos no relacional. Pueden ser textos `.txt`  o `.json` por ejemplo. Son archivos binarios (0 y 1) y de texto. 
- En el de texto puedo guardar archivos de docker o configuraciones globales. Lo malo de ellos es que no escalan bien horizontalmente por ser pesados
- En el binario pueden ser imagenes, archivos compilados, etc.
#### Problemas de persistencia de relacionales
- Logs de actividades
- Grafos
- Diferentes atributos en diferentes registros
- Configuraciones generales de la aplicacion.
- Escalabilidad horizontal
- Rigidez relacionada a la integridad referencial.
### Bases de datos no relacionales
Solucionan problemas de la persistencia relacional, como la escalabilidad horizontal (es poder distribuir una base de datos en 2 computadoras distintas). Ademas son mas flexibles ya que rompen la integridad referencial. Tambien son buenas para escalabilidad vertical(agregar mas disco)
Los tipos son:
##### Orientadas a columnas
Almacena datos en registros con la capacidad de almacenar muchas columnas dinamicas , es decir, una fila puede tener 3 columnas y otra tiene 6. Esto se suele usar mas para manejar cuestiones de herencia donde una entidad tiene atributos que otra no.  Para hacer esto se almacenan todas las columnas en conjunto y para ligar registros se accede mediante la llave de fila o *row key*. Puedo identificar datos por columna. Dado que los nombres de las columnas y las claves de los registros no son fijos, y que un registro puede tener miles de millones de columnas, los almacenes de columnas anchas pueden considerarse almacenes bidimensionales de clave-valor. **Se suelen usar en analisis de datos y en bases de datos con pocas relaciones**. No suelen escalar bien horizontalmente por ser un unico archivo. No se recomiendan para bases de datos con muchas relaciones
##### Orientadas a documentos
Almacenan y recuperan documentos que pueden ser `.json`, `.xml`, `.bson`, etc. Los documentos almacenados son similares pero no cuentan con la misma estructura. Tienen un nivel de flexibilidad en la estructura segun corresponda. A nivel rendimiento, si relacionas muchos documentos entre si el rendimiento baja y no es tan bueno. **Conviene usar cuando hay entidades acotadas o para hacer logs**. Es la que mas se usa para escalabilidad horizontal.
##### Clave-Valor
Solo se pueden almacenar clave-Valor. Para recuperar un valor debo conocer la clave. Se conoce tambien como tabla de hashes por su utilizacion. A cada clave-valor se le asocian datos. Por ejemplo `(usuario1 : 202) -> D({nombre : nicolas, Dni : 43638356})`.
**Conviene usar para accesos rapidos directos, como cache**
##### De Grafos
Representan las entidades como nodos con datos y aristas que son relaciones (directas)entre nodos y su explicacion. Permite usar propiedades de grafos como calcular pasos, caminos, etc. Generalmente no hay indices en todos los nodos entonces el acceso directo a nodos esta basado en los valores de los atributos no es posible. **Es recomendable para dominios con muchas relaciones, porque estas son directas**. Esta todo contentido en un mismo archivo entonces es complicado escalar horizontalmente.
##### Escalabilidad
Como hacer que mi sistema pueda consumir mas recursos a nivel RAM, CPU y almacenamiento
- Vertical -> agrego mas RAM, otra CPU en paralelo o mas almacenamiento a mi computadora original
- Horizontal -> Agrego mas computadoras que ejecuten el mismo u otro programa que mi computadora original.

## Modelado para no relacional

### Déficit actual en modelado de datos
Aunque estas bases son _schemaless_, la ausencia de un enfoque formal de modelado impide una comprensión clara de sus estructuras internas. No existen estudios sistemáticos que traten el modelado conceptual en bases de datos orientadas a documentos, a diferencia del amplio soporte que reciben las bases relacionales.
### Propuesta de modelado conceptual
El artículo propone un estándar visual para modelar bases de datos documentales, basado en diagramas similares a los Entidad-Relación (ER). El objetivo no es imponer esquemas rígidos sino facilitar la visualización de la estructura conceptual de los datos. Se detallan dos tipos de relaciones comúnmente usadas en MongoDB y CouchDB: aquellas que se basan en referencias entre documentos (References), y las que anidan documentos dentro de otros (Embedded Documents).
#### Relaciones basadas en referencias
Las referencias permiten que un documento contenga un enlace hacia otro, dejando que la aplicación resuelva esa asociación cuando sea necesario.
#### Documentos embebidos
En este caso, los datos relacionados se almacenan juntos dentro de un solo documento —usualmente en un campo o arreglo— lo que favorece transacciones más eficientes y consistentes.
## Desiciones para elegir la base de datos

##### Volumen de datos
Si debo partir en varias computadoras documental es capaz de hacerlo pero es medio lento mientras mas datos tiene. Si puedo hacer escala vertical conviene quizas una mas rapida segun otras cosas.
##### Cantidad de relaciones
Si me enfoco principalmente en las relaciones conviene una de grafos.
##### Latencia de CRUD
Es el tiempo que hay entre la accion realizada sobre la base de datos y la respuesta. Por ejemplo la relacional suele tener una menor latencia pero al aumentar el volumen de datos esto puede cambiar.
##### Frecuencia de CRUD
Que tan seguido la uso a la base de datos.
##### Redundancia
Depende de si prefiero performance sacrificando almacenamiento o almacenamiento sacrificando performance. Suele aparecer en la integracion de multiples bases de datos. Asimismo tambien evalua la necesidad de backups.
##### Hardware disponible
Hay bases de datos que ocupan mas espacio para persistir la misma informacion. Asimismo, la disponiblidad de recursos como de procesamiento pertenecen al hardware y distintos motores consumen mas o menos.
##### Costo
Licencias, hardware, etc
##### Requisitos no funcionales
Relativos a la persistencia
##### Arquitectura planteada
Por ejemplo si estoy en microservicios, cada microservicio debera tener su propia base de datos.
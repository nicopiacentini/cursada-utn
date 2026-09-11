# NoSQL 

>Cubre la historia de las bases de datos, los fundamentos técnicos que motivaron la aparición de NoSQL, los teoremas ACID/BASE/CAP, los tipos de bases NoSQL y NewSQL.

>Las no relacionales se eligen por **caso de uso**. Conviene "Usar relacionar hasta que necesite no relacional"
---
## 1. Historia de las bases de datos

La evolución de los sistemas de almacenamiento de datos siguió más o menos esta línea de tiempo:

1.1. **1956** — IBM Model 350: primer disco rígido comercial, con una capacidad de apenas **5 MiB**. Fue el punto de partida de la posibilidad de almacenar datos de forma **persistente y direccionable**.

1.2. **1960** — Bases de datos jerárquicas. Aparecen impulsadas por la invención de los discos rígidos, que permitieron pensar en estructuras de datos persistentes más complejas que archivos planos.

1.3. **1970** — Bases de datos **relacionales**. Edgar Codd propone el modelo relacional, que se convertiría en el estándar dominante durante décadas (SQL).

1.4. **1990** — Bases de datos orientadas a objetos. Intento de resolver el _object-relational impedance mismatch_ (el desajuste entre cómo modelamos objetos en un lenguaje de programación y cómo se representan en tablas relacionales). Une la idea de **base de datos** con la **POO**

1.5. **2000** — Bases de datos NoSQL / NewSQL. Impulsadas por empresas con necesidades de **escala masiva** como **Google**, **Facebook** y **Amazon**, que empezaron a chocar con los límites de escalabilidad vertical de las bases relacionales tradicionales.

### 1.6. El crecimiento de la capacidad de almacenamiento

La presentación muestra un gráfico (escala logarítmica) de la capacidad de discos en GB entre 1980 y 2020, donde se observa un crecimiento exponencial sostenido: de valores del orden de 0.001 GB en 1980 a más de 10.000 GB (10 TB+) hacia 2020. Este crecimiento es clave para entender por qué los cuellos de botella dejaron de estar en la _capacidad_ de almacenamiento y pasaron a estar en la _velocidad de acceso_ a esos datos.

---

## 2. SQL: repaso de conceptos relacionales

### 2.1. Formas normales

El modelo relacional se apoya en un proceso de normalización para evitar redundancia e inconsistencias:

- **1NF** (Primera Forma Normal)
- **2NF** (Segunda Forma Normal)
- **3NF** (Tercera Forma Normal)
- **BCNF** (Forma Normal de Boyce-Codd)
- **4NF** (Cuarta Forma Normal)
- **5NF** (Quinta Forma Normal)

Cada nivel resuelve un tipo distinto de dependencia funcional no deseada entre columnas.

### 2.2. Joins en SQL

Un `JOIN` combina filas de dos o más tablas en base a una columna relacionada. Los tipos principales son:

- **Inner Join**: solo las filas que matchean en ambas tablas.
- **Left Join**: todas las filas de la tabla izquierda, más las que matchean de la derecha.
- **Outer Join** (Full Outer): todas las filas de ambas tablas, matcheen o no.
- **Union**: combina los resultados de dos consultas (sin necesidad de relación de columnas).
- **Cross Join**: producto cartesiano entre ambas tablas (todas las combinaciones posibles).

Ejemplo de sintaxis SQL para cada uno:

```sql
-- Inner Join
SELECT *
FROM tabla1 t1
INNER JOIN tabla2 t2 ON t1.id = t2.id;

-- Left Join
SELECT *
FROM tabla1 t1
LEFT JOIN tabla2 t2 ON t1.id = t2.id;

-- Full Outer Join
SELECT *
FROM tabla1 t1
FULL OUTER JOIN tabla2 t2 ON t1.id = t2.id;

-- Cross Join
SELECT *
FROM tabla1
CROSS JOIN tabla2;
```

### 2.3. Algoritmos de ejecución de joins

El motor de la base de datos no ejecuta un `JOIN` de una única manera: elige (o el optimizador elige) entre distintos algoritmos según el tamaño de las tablas, si están ordenadas, si hay índices, etc.

#### 2.3.1. Nested Loops Join

Por cada fila del _outer input_ (tabla externa), se recorre completo el _inner input_ (tabla interna) buscando coincidencias.

- Complejidad aproximada: `O(n * m)`.
- Es eficiente cuando una de las dos tablas es muy pequeña o hay un índice sobre la tabla interna (Nested Loop indexado).

```text
Outer Input: B, A, E, F, D
Inner Input: A, B, E, B, C

Por cada elemento del outer, se recorre TODO el inner buscando match.
```

#### 2.3.2. Merge Join

Requiere que **ambas** entradas estén ordenadas por la clave de join. Se recorren en simultáneo con dos punteros, avanzando el que tenga el valor menor, similar al _merge_ de un mergesort.

- Complejidad aproximada: `O(n + m)` si ya están ordenadas (si hay que ordenarlas, se suma el costo del sort).
- Es mucho más eficiente que Nested Loops cuando los datos ya vienen ordenados (por ejemplo, por un índice).

#### 2.3.3. Hash Join

Se construye una tabla hash en memoria a partir de la tabla más chica (_build phase_), usando la clave de join como key. Luego se recorre la tabla más grande y se consulta el hash (_probe phase_).

```text
hashValue = hashFunction(key)
```

- Muy eficiente para grandes volúmenes de datos sin necesidad de que estén ordenados.
- Requiere memoria suficiente para construir la tabla hash (si no entra, se hace _hash join particionado_ en disco).

### 2.4. Funciones de hash

Una función de hash transforma una key en un valor (hash) dentro de un rango fijo, usado típicamente para indexar en una estructura o para distribuir datos entre nodos.

```text
keys:              hash function:        hashes:
"John Smith"   -->                   -->   01
"Lisa Smith"   -->                   -->   02
"Sam Doe"      -->                   -->   04
"Sandra Dee"   -->                   -->   15
```

Una buena función de hash debe distribuir las keys de forma lo más uniforme posible para evitar colisiones concentradas (_hotspots_).

---

## 3. El camino hacia NoSQL: fundamentos de I/O

Esta es la sección más técnica de la presentación: explica **por qué** las bases NoSQL toman las decisiones de diseño que toman, partiendo de las características físicas del hardware de almacenamiento.

### 3.1. Lectura secuencial vs. lectura aleatoria

Pregunta central: **¿qué es más rápido, la lectura secuencial de disco o la lectura aleatoria de RAM?** La respuesta (contraintuitiva para muchos) es que, dependiendo del volumen de datos, **la lectura secuencial de disco puede superar ampliamente a la lectura aleatoria**, incluso comparada con RAM, por el efecto acumulado de los distintos niveles de cache (L1, L2, L3, page cache, disk buffer) y el _pre-fetching_.

- Los procesadores están optimizados para trabajar con **workloads secuenciales**: el pre-fetch trae datos contiguos a las caches L1/L2/L3 antes de que se los pida explícitamente.

### 3.2. Direccionamiento aleatorio vs. secuencial

Cifras de referencia mencionadas en la presentación:

|Tipo de acceso|Rendimiento aproximado|
|---|---|
|Lectura aleatoria|~300 reads/seg|
|Lectura secuencial|~200 MB/s|

Para 100 mil millones (100B) de filas, el acceso secuencial puede llegar a ser **~7000 veces más rápido** que el acceso aleatorio.

### 3.3. Tradeoffs al escribir

Hay dos estrategias básicas para escribir una actualización (por ejemplo, pasar de la versión `v1` a `v2` de un registro):

1. **Append-only journal** (I/O secuencial): se agrega la nueva versión al final del archivo. Es rápido de escribir, pero requiere lógica adicional para saber cuál es "la última versión válida".
2. **Update in place** (I/O aleatorio): se sobrescribe el registro original en su posición dentro de un archivo ordenado. Mantiene el archivo ordenado, pero cada escritura es una operación aleatoria costosa.

### 3.4. Lectura eficiente

Dado que podemos escribir secuencialmente rápido a un archivo, el desafío pasa a ser leer eficientemente:

- **Scan**: recorrer todo el archivo de punta a punta.
- **Position & Scan (paginado)**: posicionarse en un punto y escanear solo una porción.
- **Evitar lecturas aleatorias** siempre que sea posible, ya que son el cuello de botella real.

### 3.5. Índices para mejorar la selectividad

Para no tener que escanear todo el _heap file_ (archivo de datos crudo) en cada búsqueda, se agregan **índices** (típicamente árboles B o B+) que mapean claves (por ejemplo, nombres: bob, dave, fred, hary, mike, steve, vince) a posiciones dentro del heap file.

```text
                Index (árbol)
               /    |     \
           bob,dave fred,hary,mike steve,vince
                 |         |            |
              Heap file (datos crudos, orden de inserción)
```

### 3.6. El problema: "Goodbye Sequential Write Performance"

Acá aparece la contradicción central que da origen al diseño de NoSQL: **si cada escritura debe además actualizar un índice ordenado, la escritura deja de ser secuencial y pasa a ser aleatoria**, porque el índice necesita mantenerse ordenado y la nueva key puede caer en cualquier posición del árbol.

```text
Sequential IO (buffer de escrituras)  -->  Random IO (posición en el índice B-Tree)
```

Esto degrada drásticamente el throughput de escritura a medida que el dataset crece, porque cada insert implica una operación aleatoria sobre disco.

### 3.7. Opción A — Índice en memoria (RAM)

La solución más directa: mantener el índice completo en RAM (rápido, acceso aleatorio barato) y los datos crudos en disco.

- **Ventaja**: accesos aleatorios al índice son rápidos.
- **Limitación**: el índice tiene que entrar en memoria. No escala indefinidamente con el volumen de datos.

### 3.8. Opción B — Cronología de archivos de índice pequeños

En vez de un único índice gigante que se actualiza in-place, se van generando **archivos de índice pequeños e inmutables**:

```text
Writes -> batch up -> sort -> write to disk (archivo pequeño, ordenado)
```

Cada archivo nuevo es ordenado _antes_ de escribirse (por lo tanto la escritura a disco de ese archivo es secuencial), y los archivos viejos quedan inmutables.

- Se agrega **metadata en RAM** (rangos de keys, _bloom filters_) para saber rápidamente en qué archivo(s) buscar una key sin tener que leerlos todos, optimizando el acceso aleatorio necesario para lecturas.

### 3.9. LSM Trees (Log-Structured Merge Trees)

Formalización de la idea anterior:

- Una colección de **índices pequeños e inmutables**.
- Escritura **append-only**; la deduplicación de versiones viejas se hace en un proceso de **merge/compactación** de archivos en segundo plano.
- Estructuras de índice livianas en memoria (bloom filters, sparse indexes) que aumentan la performance de lectura.

> **Idea clave**: las LSM Trees **desplazan el problema del acceso aleatorio de la escritura hacia la lectura**. Se paga el costo de "aleatoriedad" al leer (hay que consultar varios archivos/niveles), no al escribir.

Motores como **RocksDB**, **LevelDB**, **Cassandra** y **HBase** usan este patrón internamente.

### 3.10. Opción C — Almacenamiento columnar (Brute force)

En vez de guardar cada fila completa de forma contigua (como hace un motor relacional tradicional, _row-oriented_), se guarda **una columna por archivo**, manteniendo el mismo orden de filas en todos los archivos:

```text
Fila:  A  B  C
        \  |  /
      Archivo A: A1 A2 A3 A4
      Archivo B: B1 B2 B3 B4
      Archivo C: C1 C2 C3 C4
```

- Habilita una **compresión mucho más eficiente**, porque los valores dentro de una misma columna suelen ser más homogéneos entre sí que entre columnas distintas.
- Al mantener el mismo orden de filas en cada columna, se pueden combinar columnas de distintos archivos mediante un simple **Merge Join secuencial** (ver 2.3.2), evitando lookups aleatorios.

```text
Sequential Merge Joins:
  Columna A (ordenada) ---\
                            > Merge secuencial (rápido)
  Columna B (ordenada) ---/

  vs.

  Combinar índices por lookup aleatorio (lento)
```

### 3.11. Resumen del camino a NoSQL (I/O)

|Problema|Solución de diseño NoSQL|
|---|---|
|Random I/O al escribir con índice actualizado in-place|Append-only + LSM Trees|
|Índice no entra en RAM|Archivos de índice pequeños en cronología + bloom filters|
|Joins column-based costosos|Almacenamiento columnar + merge join secuencial|
|Un único servidor no escala|Particionamiento (sharding) horizontal|

---

## 4. Escalabilidad y distribución

### 4.1. "Will this scale?"

Chiste recurrente en la industria (referencia a _TheCooperReview.com_): la pregunta "¿esto escala?" se volvió un comodín que se aplica a cualquier cosa sin que necesariamente se sepa bien qué significa. Sirve como introducción irónica al tema real: cómo escalar bases de datos horizontalmente.

### 4.2. Particionamiento (Partitioning)

Dos estrategias básicas:

4.2.1. **Partitioning - KV (Key-Value)**: los datos se distribuyen entre varios nodos, pero el cliente accede a través de un **único endpoint** que se encarga del _query routing_ (enrutar la consulta al nodo correcto).

4.2.2. **Partitioning - Batch (Divide and conquer)**: cada partición procesa su porción de datos en paralelo (por ejemplo, en un job de MapReduce), y luego los resultados se combinan.

### 4.3. Replicación

Cada partición de datos se replica en varios nodos (no solo se guarda en un único lugar), para:

- Tolerar la caída de un nodo sin perder datos.
- Permitir servir lecturas desde réplicas y así balancear la carga.

### 4.4. Particionamiento por hash simple (módulo)

Forma más directa de repartir datos entre `N` servidores:

```text
hashValue   = hashFunction(key)
serverIndex = hashValue % numberOfServers
```

Ejemplo con 4 servidores:

```text
Server 0: Key 0, Key 4
Server 1: Key 1, Key 5
Server 2: Key 2, Key 6
Server 3: Key 3, Key 7
```

**Problema grave de este esquema**: al agregar o quitar un servidor, el `% numberOfServers` cambia para _casi todas_ las keys, no solo para las del nodo afectado.

- Al **agregar** un servidor (de 4 a 5), todas las keys menos las primeras 4 deben migrar de servidor (se reasignan **a todos** los nodos, no solo al nuevo).
- Al **perder** un servidor (de 4 a 3), todas las keys menos las primeras 2 deben cambiar de nodo.

Esto genera un **reshuffling masivo** de datos ante cualquier cambio en el clúster, algo inaceptable en sistemas grandes.

### 4.5. Consistent Hashing (Perfect Hashing Ring)

Solución: en vez de usar `hash % N`, se ubican los nodos en un **anillo (ring)** de hashing. Cada key se asigna al primer nodo que encuentra recorriendo el anillo en sentido horario desde su posición de hash.

```text
        A
   {John:25}
Ken           {Smith:30}
   {Ken:27}
        C  <--- ...   B (caído)
   {Dave:25}
```

**Ventajas:**

- Al perder un nodo, **solo las keys de ese nodo** se reasignan (al siguiente nodo en el anillo), no todas las keys del sistema.

**Desventajas:**

- Sin más ajustes, la distribución de keys puede no ser homogénea al agregar/quitar servidores (algunos nodos terminan con rangos más grandes que otros).

#### 4.5.1. Virtual nodes (vnodes)

Para mitigar la desventaja anterior, se subdivide el anillo en muchas más particiones que nodos físicos (por ejemplo, un ring con 32 particiones repartido entre 4 nodos reales), asignando varios _vnodes_ a cada nodo físico. Esto homogeneiza mucho mejor la distribución de carga.

```text
2^160 (rango completo del hash, ej. SHA-1)
  |
  ring dividido en 32 particiones
  |
  cada partición (vnode) pertenece a: node0, node1, node2 o node3

hash(<<"artist">>, <<"REM">>)  -> determina en qué vnode/partición cae
```

### 4.6. Coordinación y replicación en el anillo (ejemplo: Riak/Dynamo-style)

Un cliente puede conectarse a **cualquier nodo** del clúster (no necesariamente el dueño del dato). Ese nodo actúa de **coordinador**: reenvía la consulta al/a los nodo(s) reales dueños de la key (incluyendo réplicas, marcadas como `A` en el diagrama), agrega las respuestas, y responde al cliente.

```text
client -> nodo 5 (coordinador)
nodo 5 -> nodo 1 (réplica A), nodo 3 (réplica A), nodo 2 (réplica A)
nodo 5 <- respuestas de las réplicas
client <- nodo 5 (respuesta consolidada)
```

### 4.7. Arquitectura de sharding con réplicas (ejemplo: MongoDB)

Patrón típico de un sistema distribuido con sharding y alta disponibilidad:

```text
Application
    |
  Driver
    |
 Query Router  ...  Query Router  ...  Query Router
    |                    |                   |
 Shard 1              Shard 2             Shard N
 - Primary            - Primary           - Primary
 - Secondary          - Secondary         - Secondary
 - Secondary          - Secondary         - Secondary
```

- Cada **shard** contiene una porción de los datos (partición horizontal).
- Dentro de cada shard hay un **Primary** (recibe escrituras) y **Secondaries** (réplicas para lectura/failover).
- Los **Query Routers** dirigen cada consulta al shard correspondiente según la _shard key_.

---

## 5. Big Data

> "Big data should be defined at any point in time as **'data whose size forces us to look beyond the tried-and-true methods that are prevalent at that time.'**" — Adam Jacobs

La definición es deliberadamente relativa: lo que hoy es "big data" mañana puede no serlo, porque las herramientas "probadas" evolucionan.

> No existe un limite que determina que tamaño de info es bigdata y que no. El limite esta mas sobre el nivel de procesamiento que requieren. Esto puede significar que relacional se quede corto
#### Incluye
- **Volumen**: escala a un nivel que no soporta un unico nodo o computador
- **Velocidad**: Se procesa con streams de altra frecuencia, throughput sostenido y baja latencia
- **Variedad**: Texto, eventos, graficos, etc
#### Volumen y velocidad
Sistemas con mucho trafico y/o volumen pueden tener 2 posibles patrones:
- Poco de muchos: se guarda poco por usuario pero hay muchos usuarios
- Mucho de cada uno: Pocos usuarios pero cada uno genera mucho
> Aca tiene sentido evaluar alternativas de lo que es relacional.

___
### Requerimientos no funcionales
Que tenemos que garantizar con los datos?
- Robustez: Puede fallar pero no en silencio
- Escalabilidad: Crecer sin reescribir el sistema
- Disponibilidad: Poder responder incluso si se me cae un server
- Consistencia: Que los datos sean iguales 

#### Escalabilidad horizontal
Podes hacer shrading y dividis tus datos en cada servidor o podes replicar tus datos en cada servidor, esto tiene consistencia eventual. Esto permite:
- Alta disponibilidad
- Escala casi sin techo
- Mas barato
#### Disponiblidad
Cualquier maquina puede fallar por mas infra que tengas. La unica salida es **tener mas nodos** o redundancia. Mientras mas me acerco a esto, mas debo sacrificar la consistencia. 
Tiene estrategias:
##### Replicacion
##### Sharding
Distribuir la data en N servidores sin depender de negocio. La asignacion se calcula con un algoritmo. Esto se puede implementar:
- **Con hash distribuido** - Te mando a un nodo segun un hash
	- Rapido pero fragil ante cambios
	- Cada elemento tiene una key que se puede hashear. Se calcula cash modulo N donde N es al cantidad de servidores.
	- *Puede no escalar bien:*
		- *Si se cae un servidor -> El hash debe cambiar y reasignar todos los elementos, haciendo que el elemento que estaba en un servidor pase a otro*
		- *Si agrego un servidor -> lo mismo, tengo que rehashear*
	- Basicamente, quitar o agregar nodos implica un mega rehasheo entre todos los servidores
- **Hash consistente**
	- Anillo de hashes que minimiza rebalance
	- Hasheo la key y las IPs de los servidores
	- Cada hash cae en un punto de un anillo y se asigna al servidor inmediatamente posterior en sentido horario.
	- *Si saco o pongo un servidor el movimiento de rehasheo se hace a lo sumo en 2 servidores nada mas y no se recalcula el hash para todos los servidores, como si ocurre en hash distribuido*
	- El resto de servidores queda intacto
	- *Todos los huerfanos caen en el mismo servidor -> **carga desbalanceada***
- Hash consistente+ virtual nodes
	- Distribucion pareja al caer/sumar nodos.
	- Cada servidor fisico aporta N nodos virtuales al anillo y se distribuyen aleatoriamente
	- Cada **Vnode** tiene su propio hash
	- Carga pareja
		- Si se te cae un nodo fisico, sus datos de sus vnodes se distribuyen entre vnodes de demas servidores porque los vnodes estan distribuidos aleatoriamente -> **carga balanceada***
##### Activo/Activo
Ambos nodos sirven para lectura y escritura al mismo tiempo. Se puede escalar y tiene mucha disponibilidad. Los nodos se sincronizan. El problema esta en **la consistencia** de los datos.


> El hash recibe el dato a guardar y devuelve el id o dato del servidor donde deberia guardarse. Hay distintas fucniones de hash posibles y depende del modelo.
##### Activo/Pasivo
Tenes un nodo activo que maneja escrituras y escrituras y uno pasivo que sirve para lecturas y replica al activo. 
- Si se cae el activo cambia al pasivo
- Tiene lecturas distribuidas
- La escritura tiene poco impacto
- La lectura tiene gran impacto porque se reparte la carga entre ambos
La replicacion puede ser **asincrona** o **sincrona**

##### Sharding + replicacion
Hay un factor de replicacion que define replicas de cada nodo. Es un sharding pero replicas los nodos. 
- Debo elegir entre consistencia (escritura sync) o latencia (escritura async)
- Se puede leer del coordinador, de cualquier replica o de varias.
- Por la replica tengo disponibilidad -> si se cae un server no pierdo la data.


##### Particionamiento
Redirigis un nodo a una cierta region/cliente, con un limite atado a negocio
- Esta ligado a negocio
- Puede ser transparente o no segun implementacion
- Escala procesamiento, disco y tiempo de respuesta
- Desacopla negocios y aumenta disponibilidad
- Mejora lectura aunque depende de la query
- Approach limitado para cross-partition
Podes distribuir carga, problemas.
> Es muy malo para combinar informacion de distintas bases porque pierde la magia

###### Resolucion de conflictos - Solo para casos de activo/activo (un nodo puede ser de W y R en simultaneo)
Cuando 2 o mas nodos aceptan escrituras y hay que elegir cual gana o cual tiene razon. Hay estrategias:
##### Consenso (Mas consistencia)
Los nodos se ponen de acuerdo antes de escribir. Es consistente pero costoso en latencia. Hay un lider y las escrituras se dan por mayoria
##### Timestamp (mas disponibilidad)
Cada escritura tiene un timestamp. El mas reciente pisa al anterior y requiere relojes sincronizados. La latencia es baja y la disponibilidad es alta pero pierdo consistencia. Si tengo updates concurrentes pueden pisarse
##### Quorum
Tengo nodos de lectura y escritura. La consistencia la da N < W + R. Donde N es la cantidad de nodos, W es cantidad de nodos de escritura y R de lectura. Los nodos pueden ser de escritura y lectura.
Necesito respuesta de N/2 + 1 nodos para dar una operacion por valida. Balancea entre performance y consistencia.
> Se basa en la idea de que la lectura se hace de varios nodos en simultaneo y por ende se puede checkear consistencia y devolver consistentemente. 

> Si N >= W + R hay mecanismos de sincronizacion que garantizan la consistencia eventual.
###### Ejemplo
Tengo N = 3 replicas y tengo W = 2 y R = 2. 
- Escritura exitosa: se confirma la escritura en quorum de 2 nodos y el nodo 3 tiene dato viejo
- Lectura posterior: Consultas 2 nodos y se pregunta a ambos que dato tienen y se devuelve por quorum. 
- Interseccion: Si los datos de los nodos de lectura no coinciden, al comparar timestamps el cliente ve el dato mas nuevo y se asegura consistencia.



---

## 6. SQL vs. NoSQL — comparación general

|Aspecto|SQL|NoSQL|
|---|---|---|
|Optimización|Almacenamiento|Cómputo|
|Modelo de datos|Normalizado|Desnormalizado / Jerárquico|
|Consultas|Ad hoc (flexibles)|Consultas fijas (predefinidas)|
|Escalamiento|Vertical|Horizontal|
|Garantías|ACID|BASE|
|Uso típico|OLTP|OLAP (con matices, depende del motor)|

---

## 7. ACID vs. BASE

### 7.1. ACID (bases relacionales)

Siglas de las 4 propiedades que garantiza una transacción:

7.1.1. **Atomicity (Atomicidad)**: la transacción se ejecuta completa o no se ejecuta en absoluto (todo o nada).

7.1.2. **Consistency (Consistencia)**: la base de datos pasa de un estado consistente a otro estado consistente (respetando constraints, triggers, etc.). Si falla en el medio se vuelve a estado consistente. 
- Ej: Si saco plata de una cuenta y pongo en la otra no queda en el medio sino que se vuelve para atras.

7.1.3. **Isolation (Aislamiento)**: las transacciones concurrentes no se afectan entre sí (cada una ve el sistema como si fuera la única ejecutándose, según el nivel de aislamiento configurado). Se operan secuencialmente.

7.1.4. **Durability (Durabilidad)**: una vez confirmada (_commit_) una transacción, sus datos quedan almacenados de forma persistente, incluso ante fallas.

> Consistencia > Disponibilidad

### 7.2. BASE (muchas bases NoSQL)

Modelo alternativo, pensado para sistemas distribuidos que priorizan disponibilidad y escala por sobre la consistencia inmediata:

7.2.1. **Basically Available (Básicamente disponible)**: el sistema está disponible la mayor parte del tiempo, incluso ante fallas parciales.

7.2.2. **Soft State (Estado blando)**: el estado del sistema puede cambiar con el tiempo, incluso sin nuevas entradas/escrituras (por ejemplo, por procesos de reconciliación/replicación en curso).

7.2.3. **Eventually Consistent (Consistencia eventual)**: si no hay nuevas escrituras, eventualmente todas las réplicas convergen al mismo valor, pero no hay garantía de que esto sea inmediato. Puede que en el medio lea cosas no ultimas

> Disponiblidad > Consistencia

#### Comparativa

| DIMENSIÓN | ACID | BASE |
| :--- | :--- | :--- |
| **Consistencia** | Fuerte, inmediata | Eventual |
| **Disponibilidad** | Puede sacrificarse | Prioridad absoluta |
| **Transacciones** | Multi-operación, rollback | Por operación, típicamente |
| **Escalabilidad** | Vertical, difícil horizontal | Horizontal nativa |
| **Uso típico** | Banca, inventario, reservas | Web, social, big data, analytics |
> Generalmente ACID biene implementado en el motor relacional pero en no relacional debe manejarse desde el lado de la aplicacion

---

## 8. Teorema CAP - Solo aplica a sistemas distribuidos

Formulado por Eric Brewer: en **presencia de una partición** de red, un **sistema distribuido** debe elegir entre **Consistency** y **Availability** — no puede garantizar las tres propiedades simultáneamente.

> Los sistemas relacionales son muy CA, no tanto partition tolerable.
### 8.1. Las tres propiedades

8.1.1. **Consistency (Consistencia)**: El usuario recibe el ultimo dato o falla. No necesariamente todos los nodos tienen el ultimo dato.

8.1.2. **Availability (Disponibilidad)**: todos los clientes pueden acceder a los datos (leer y escribir) incluso ante la presencia de fallas en algunos nodos. Puede no darme el ultimo dato. El sistema siempre responde aunque el dato no sea el ultimo

8.1.3. **Partition tolerance (Tolerancia a particiones)**: el sistema sigue funcionando aunque existan particiones de red (nodos que no se pueden comunicar entre sí).

> En la práctica, como las particiones de red _van a ocurrir_ en cualquier sistema distribuido real, la elección real suele estar entre **CP** (consistencia sobre disponibilidad) o **AP** (disponibilidad sobre consistencia).

### 8.2. Ejemplos prácticos de trade-offs CAP

- **Replicación Master–Slave**: las escrituras van solo al master; los slaves son de solo lectura / backup.
- **Replicación P2P**: todos los nodos pueden aceptar escrituras (peer-to-peer), lo que complica la consistencia.
- **Lectura/Escritura solo en master, slaves como backup**: prioriza consistencia, sacrifica disponibilidad de escritura si el master cae.
- **Escritura con commit en todos los slaves**: prioriza consistencia fuerte, sacrifica latencia/disponibilidad (hay que esperar el ack de todas las réplicas).
- **Sharding sin replicación**: prioriza escalabilidad, sacrifica disponibilidad (si un shard cae, esos datos no están disponibles).
- **Verificar el resultado de varios nodos ("mejor de 3")**: técnica tipo _quorum_ para detectar inconsistencias entre réplicas y decidir cuál valor es el "correcto".

---

## 9. Tipos de bases de datos NoSQL

Categorías principales:

1. Key-Value
2. Document (Documentos)
3. Wide Column
4. Columnar
5. Graph (Grafos)
6. Queue (mencionado como categoría adicional, con asterisco en la fuente)
> Se suelen usar cada una para un caso especifico o se combinan con **persistencia poliglota**

### 9.1. Key-Value

- Los datos se almacenan como pares **clave–valor**.
- _Schemaless_ en el valor (el valor puede tener cualquier estructura interna, la base no la entiende).
- Flexibilidad de consulta prácticamente nula (solo se puede buscar por key).
- Alta escalabilidad y alta performance.
- No se puede hacer queries complejas
- Ejemplos: **Redis**, **Memcached**, **DynamoDB** (en su modo más simple).
- Se suele usar para cache

Ejemplo de tabla clave-valor:

|KEY|VALUE|
|---|---|
|110354-2|`{"nombre":"Rodriguez, Manuel", "anioIngreso":2005, "fechaNacimiento":"01/10/1994"}`|
|110535-5|`{"nombre":"Stursi, Marcos", "anioIngreso":2007, "fechaNacimiento":"20/09/1991"}`|

#### 9.1.1. Variaciones y mejoras (ejemplo: Redis)

Redis extiende el modelo Key-Value simple soportando distintos **tipos de valor** para una misma key:

- Strings
- Bitmaps
- Bit fields
- Hashes (`{A: "foo", B: "bar", C: "baz"}`)
- Lists (`[A -> B -> C -> D -> E]`)
- Sets (`{A, B, C, D, E}`)
- Sorted Sets (`{A: 0.1, B: 0.3, C: 100, D: 1337}`)
- Geospatial Indexes (`{A: (51.5, 0.12), B: (32.1, 34.7)}`)
- HyperLogLogs (estructura probabilística para contar elementos únicos)
- Streams

```bash
# Ejemplos de comandos Redis para distintos tipos
SET usuario:1 "Juan Perez"
HSET usuario:1:datos nombre "Juan" apellido "Perez"
LPUSH cola:tareas "tarea1" "tarea2"
SADD tags:post1 "nosql" "redis" "cache"
ZADD ranking 100 "jugador1" 200 "jugador2"
```

### 9.2. Wide Column
Es un clave-valor pero tiene estructura(Set, B-Tree, M-tree). No tiene schema para campos no indexados
- También se almacena como par clave–valor, pero el **valor tiene una estructura interna rica** (similar a un Set, B-Tree, M-Tree, etc.).
- _Schemaless_ en los datos que no están hasheados/indexados (es decir, hay cierta estructura fija en la clave primaria, pero los atributos pueden variar).
- Poca flexibilidad de consulta en comparación con SQL o Document.
- Alta escalabilidad y alta performance.
- Ejemplos: **DynamoDB**, **Cassandra**, **Bigtable**, **ScyllaDB**, y en cierto modo también **Redis**.

Partition key nos da un set de datos y sort key los ordena. Todo esto dentro de la estructura elegida

#### 9.2.1. Estructura: Partition Key + Sort Key

```text
Primary Key = Partition Key + Sort Key

Product ID (Partition Key) | Type (Sort Key) | Atributos (schema por item)
----------------------------|------------------|------------------------------
1                            | Book ID          | Odyssey, Homer, 1871
2                            | Album ID          | 6 Partitas, Bach
2                            | Album ID:Track ID | Partita No. 1
3                            | Movie ID          | The Kid, Drama/Comedy, Chaplin
```

- Las tablas se organizan como una colección de **particiones**, cada una compuesta por sus items.
- Siempre se debe pensar el patron de acceso a las mismas

#### 9.2.2. Ejemplo de modelado: alumnos y materias

Caso de uso: relación muchos-a-muchos entre `Student` y `Assignature` (materia), vía tabla intermedia `Student_Course`.

Consultas que se necesitan resolver:

- Obtener datos de un usuario por ID.
- Obtener datos de una materia por ID.
- Obtener todos los alumnos que cursaron una materia.
- Obtener todas las materias que cursó un alumno.

**Modelado en una única tabla wide-column**, usando PK (Partition Key `A`) + SK (Sort Key `B`):

```text
PK (A)         SK (B)          StudentName  AssignatureName  Date
StudentID      "-"             Martin
AssignatureID  "-"                          TACS
StudentID      AssignatureID                                 20/10/2020
```

```sql
-- Consultas contra el índice principal (Main Index: A, B)
SELECT * FROM MI WHERE A = StudentID;
SELECT * FROM MI WHERE A = AssignatureID;
```

**Problema**: con este único índice, es fácil obtener "todas las materias de un alumno" (filtrando por `A = StudentID`), pero **no** es eficiente obtener "todos los alumnos de una materia" (no hay forma de filtrar directamente por `AssignatureID` en el sort key).

**Solución: Global Index / Materialized View**, invirtiendo PK y SK:

```text
Main Index:              A, B
Global Index (GI):       B, A   (invertido)
```

La base de datos genera automáticamente una **segunda tabla** (transparente para el desarrollador), manteniendo ambas sincronizadas:

```text
PK (A)         SK (B)          GI-PK (B)      GI-SK (A)      Date
StudentID      AssignatureID   AssignatureID  StudentID      20/10/2020
```

```sql
-- Ahora sí podemos resolver la segunda consulta contra el Global Index
SELECT * FROM GI WHERE A = AssignatureID AND B != "-";
```

> Este patrón (Main Index + Global Secondary Index) es muy común en DynamoDB, Cassandra y motores similares para poder resolver distintos patrones de acceso sin usar joins.

### 9.3. Columnares

- Los datos se almacenan **un archivo por columna**, no por fila.
- Habilita **compresión eficiente** (valores homogéneos dentro de una misma columna).
- Alta escalabilidad y muy buena performance en **agregaciones** (sumar, promediar, contar sobre una columna sin tener que leer las demás).
- Ejemplos: **Parquet**, **Vertica**.

```text
Logical Table:        Row layout (tradicional):
 a  b  c               a1 b1 c1 a2 b2 c2 a3 b3 c3 ...
a1 b1 c1
a2 b2 c2              Column layout (columnar):
a3 b3 c3               a1 a2 a3 a4 a5 | b1 b2 b3 b4 b5 | c1 c2 c3 c4 c5
                        \___________/   \____________/   \____________/
                        encoded chunk    encoded chunk     encoded chunk
```

- Ideal para cargas **OLAP** (analítica sobre grandes volúmenes, pocas columnas a la vez, muchas filas).

### 9.4. Orientadas a documentos

- Colecciones de **documentos** (típicamente JSON/BSON).
- Estructura **jerárquica** (permite objetos anidados y arrays).
- Se pueden hacer **queries** sobre el contenido de los documentos (a diferencia de Key-Value puro).
- Se pueden crear **índices sobre cualquier campo**.
- _Schemaless_: cada documento puede tener una estructura distinta.
- Muy flexibles.
- Ejemplos: **MongoDB**, **CouchDB**.
- Es mas flexible que columnar pero menos escalabilidad extrema

```json
{
  "first_name": "Paul",
  "surname": "Miller",
  "cell": 447557505611,
  "city": "London",
  "location": [45.123, 47.232],
  "profession": ["banking", "finance", "trader"],
  "cars": [
    { "model": "Bentley", "year": 1973, "value": 100000 },
    { "model": "Rolls Royce", "year": 1965, "value": 330000 }
  ]
}
```

Ejemplo de query en MongoDB:

```javascript
// Buscar todas las personas de Londres con más de un auto
db.personas.find({
  city: "London",
  "cars.1": { $exists: true }
});
```

### 9.5. Orientadas a grafos

- Las entidades base son **nodos** y sus **relaciones** (cada uno con propiedades propias).
- Permiten ejecutar **consultas semánticas** (recorridos de grafo, caminos más cortos, patrones de relación).
- Es complicado de distribuir porque no tiene sharding -> Enfoca en CA, no escala horizontalmente
- Se suele usar cuando tenes muchas relaciones
- Muy flexibles en cuanto a modelado.
- Ejemplos: **Neo4j**.

Ejemplo (Cypher, el lenguaje de consultas de Neo4j) — encontrar actores que trabajaron con Gene Hackman pero no con Robin Williams:

```cypher
MATCH (gene:Person {name:"Gene Hackman"})-[:ACTED_IN]->(movie:Movie),
      (other:Person)-[:ACTED_IN]->(movie),
      (robin:Person {name:"Robin Williams"})
WHERE NOT (robin)-[:ACTED_IN]->(movie)
RETURN DISTINCT other
```

> Este tipo de consulta —encontrar relaciones indirectas de varios saltos— sería mucho más costosa de expresar y ejecutar en un modelo relacional (requeriría múltiples self-joins).

---

## 10. NewSQL

Intento de combinar lo mejor de ambos mundos: **las garantías del modelo relacional clásico con la escalabilidad horizontal de NoSQL.** Esta tiene:
- Relacional clasico con tablas, joins y sql standard
- Escalable por diseño con sharding automatico, multiples nodos y alta disponibilidad
- ACID distribuido
Tienen una estructura muy sofisticada para que los problemas de particion sea muy raros. Sacrificand disponibilidad para momentos muy raros.
> Se mueven sobre CAP segun necesidad

> Son muy costosas de implementar y por ende no se usan tanto.

|                         | RDBMS (SQL) | NoSQL | NewSQL |
| ----------------------- | ----------- | ----- | ------ |
| Transacciones ACID      | ✅           | ❌     | ✅      |
| Soporte SQL             | ✅           | ❌     | ✅      |
| Estandarizado           | ✅           | ❌     | ❌      |
| Escalamiento horizontal | ❌           | ✅     | ✅      |
| Alta disponibilidad     | ❌           | ✅     | ✅      |

- Ejemplos RDBMS: MySQL, PostgreSQL, Oracle.
- Ejemplos NoSQL: MongoDB, Cassandra, Redis.
- Ejemplos NewSQL: Google Cloud Spanner, VoltDB, CockroachDB.
___
## Como elegir?
Debo seguir estas reglas:
1. Entender la carga, patrones de lectura/escritura y requisitos de consistencia
2. ACID por default. Lo sacrifico por un caso concreto
3. Tipo de consulta, complejidad de queries, agregaciones e importancia de consistencia
4. 
### OLTP Vs OLAP

| DIMENSIÓN | OLTP | OLAP |
| :--- | :--- | :--- |
| **Propósito** | Transacciones en tiempo real | Análisis y reportes |
| **Volumen por query** | Pocos registros | Millones de registros |
| **Frecuencia** | Muchísimas queries/seg | Pocas queries, pesadas |
| **Latencia target** | Milisegundos | Segundos a minutos |
| **Fuente** | BD primaria | Data warehouse, replicas, ETL |


---

## 11. Bibliografía citada en la presentación

- [Elements of Scale: Composing and Scaling Data Platforms](http://highscalability.com/blog/2015/5/4/elements-of-scale-composing-and-scaling-data-platforms.html)
- [ACM Queue — The Pathologies of Big Data](https://queue.acm.org/detail.cfm?id=1563874)
- [SSD Performance 2015 — Ben Stopford](http://www.benstopford.com/ssd-performance-2015/)
- [Coding for SSDs, Part 5: Access Patterns and System Optimizations](http://codecapsule.com/2014/02/12/coding-for-ssds-part-5-access-patterns-and-system-optimizations/)
- [Video de referencia (YouTube)](https://www.youtube.com/watch?v=HaEPXoXVf2k&t=380s)
- [Visualizing Merge Join Internals — Bert Wagner](https://bertwagner.com/2018/12/18/visualizing-merge-join-internals-and-understanding-their-implications/)

---

## 12. Repaso rápido (para memorizar)

- **ACID** = Atomicity, Consistency, Isolation, Durability → bases relacionales.
- **BASE** = Basically Available, Soft state, Eventually consistent → muchas bases NoSQL.
- **CAP** = Consistency, Availability, Partition tolerance → solo 2 de 3 ante una partición de red real.
- **LSM Trees**: escritura secuencial (append-only), el costo de "aleatoriedad" se traslada a la lectura.
- **Columnar**: compresión + agregaciones rápidas + merge join secuencial entre columnas.
- **Consistent Hashing + vnodes**: minimiza el reshuffling de datos al escalar el clúster.
- **5 tipos de NoSQL**: Key-Value, Document, Wide Column, Columnar, Graph.
- **NewSQL**: ACID + SQL + escalamiento horizontal + alta disponibilidad (sin el estándar unificado que sí tiene SQL clásico).
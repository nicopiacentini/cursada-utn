# Proteccion de datos en persistencia
Trabajamos sobre **la norma europea** para poder expandirnos de ser necesario en un futuro
### Normativas a considerar
Estas son las normativas que se van a intentar seguir. Para posibles expansiones
##### General data protection regulation (GDPR)
Surge en el año 2016. Es en ciertos aspectos poco exigente por ser mas general. Aun asi es mas exigente que la Argentina.
- Objetivo: Proteger a las personas fisicas en lo que respecta al tratamiento de los datos personales y la libre circulacion de datos
- Aplica al tratamiento automatizado de datos personales o tratamiento no automatizado que va a ficheros
- No aplica a tratamiento de datos personales efectuados por una persona fisica en ejercicio de actividades personales o domésticas.
##### Ley de proteccion de datos en Argentina
Surge en el año 2000
- Proteccion integral de datos personales en un archivos, registros, bancos de datos u otros medios de tratamiento de datos.
### Definiciones
- Datos personales (s/europa): Es toda informacion de persona fisica identificada o identificable. La persona fisica es identificable mediante un identificador, como un nombre, localizacion, etc.
- Datos personales (s/Argentina): informacion de cualquier persona fisica determinada o determinable.
- Datos sensibles (s/Argentina): Datos personales que revelan origen racional y tecnico, opiniones politicas, convicciones religiosas, etc. Estas tienen un tratamiento mas especial.
Estas definiciones tienen un nivel de obligaciones una vez definidos.
- Datos biometricos: datos personales obtenidos a partir de un tratamiento fisico especificos.
### Tratamiento
- Es cualquier operacion u operaciones realizada sobre datos personales ya sea automatizada o no (GDRP o Europa).
- Operaciones y procedimientos sistematicos que permiten recoleccion, conservacion, ordenacion, etc, y en general el procesamiento de datos personales, asi como su cesion a terceros a traves de comunicaciones, consultas, interconexiones o transferencias.

##### Elaboracion de perfiles
Los perfiles son el tratamiento automatizado de datos personales consistente que usa datos personales para evaluar aspectos de la persona fisica y hacer predicciones o analisis sobre aspectos relativos al rendimiento profesional, situacion economica, etc. (GDRP)
### Manejo de datos en la organizacion
Debo saber que datos tengo y para que los tengo. Debo cuestionarme que hacer con los datos, si construir perfiles o no. Primero para ver si tiene sentido hacerlo. Ademas *las normas inican el control sobre el tratamiento de los datos*. Por eso, se declara un *Responsable de datos* en la organizacion.
#### Consentimiento para obtencion de datos
Requiere consentimiento libre, expreso e informado, que debera constar por escrito o por otro medio que se el equipare, segun las circunstancias.
Se debe informar la finalidad de la obtencion de los datos, quienes seran los destinatarios, responsables de la base de datos, consecuencias de proporcionar los datos y la posibilidad de ejercer derechos de acceso.
**No hace falta consentimiento** cuando se refiere a listas de nombre, DNI, identificacion tributaria o personal, ocupacion, fecha de nacimiento o domicilio.
****
#### Consentimiento para datos sensibles
Solo se pueden obtener y tratar si la ley lo permite por ser de interes general y nadie puede ser obligado a hacerlo. **No** se pueden hacer bases de datos con estos datos. Los datos penales o contraversionales solo pueden ser manejados por el estado.
#### Envio de publicidades
El enviante de la publicidad debe *ofrecer la opcion de borrar mis datos de su registro y que me deje de llegar la publicidad total o parcialmente*. Ademas debe aclararse explicitamente que se trata de una publicidad.
#### Fines de la obtencion de datos
Deben ser recolectados para fines determinados, explicitos y legitimos y deben ser mantenidos solo para eso. Cuando se pierde el fin por el cual fueron obtenidos, deben ser destruidos.
#### Licitud de la obtencion de datos
Condiciones a cumplir (al menos 1):
- Que haya consentimiento
- Que haya un contrato del que interesado es parte
- Que el interesado tenga una obligacion legal
- Que el interesado quiera proteger intereses vitales
- Que el interesado tenga interes
#### El responsable del tratamiento de datos
Debe mostrar que el usuario/interesado consintio el tratamiento de sus datos personales. El interesado debe poder retirar su consentimiento en cualquier momento. Y debe ser tan facil retirar el consentimiento como darlo.

#### Reflexion
Debo cersiorarme de quien agregue datos realmente sea quien dice ser. Debo ver bien como obtengo los datos. Ver periodicamente si los datos que tengo cumplen su fin o si no, los elimino.
## Almacenamiento de datos(ley argentina)
Todo registro de datos debe inscribirse en el Registro que al efecto habilite el organismo de control. El Registro debe indicar el responsable, domicilio, tratamiento, objetivo, etc.
- Todo archivo, registro, base o banco de datos público o privado destinado a proporcionar informes debe inscribirse en el Registro que al efecto habilite el organismo de control (Art 21, inciso 1)
    
- El registro de archivos debe comprender como mínimo: nombre y domicilio del responsable, características y finalidad del archivo, naturaleza de los datos personales contenidos en cada archivo forma de recolección y actualización de datos, destino de los datos y personas físicas a las que pueden ser transmitidos, modo de interrelacionar la información registrada, medios utilizados para garantizar la seguridad de los datos, debiendo detallar la categoría de personas con acceso al tratamiento de la información, tiempo de conservación de los datos, forma y condiciones en que las personas pueden acceder a los datos referidos a ellas y los procedimientos a realizar para la rectificación o actualización de los datos (Art 21, inciso 2)
    
- Los particulares que formen archivos, registros o bancos de datos que no sean para un uso exclusivamente personal deberán registrarse conforme lo previsto en el Art 21 (Art 24)
### Proteccion de datos desde el diseño y por defecto (GDRP)
Por cuestiones de dificultad tecnica, el responsable de los datos debe practicar la **seudonimización**. Es decir, aplicar pseudónimos a los datos que se tratarán tal que no se pueda identificar de quien son a menos que se tenga info adicional almacenada de forma a parte . Entonces no se pueden atribuir los datos a un interesado identibicable o identificado. Por ejemplo, trato a los datos por codigo y no se quien es quien.
## Inferencia de datos
Informacion relativa a usuarios que el no provee sino que estan inferidos a partir de conductas y volumenes de datos de los usuarios. El titular de los datos da consentimiento que no es es pleno ni absoluto. Entonces la inferencia como tal no tiene por que ser moralmente correcta.
Son informacion subjetiva y no verificable. Estas inferencias pueden impactar al usuario, seguro de datos, etc.
### Datos inferidos en California
Segun esta legislacion *los datos inferidos son parte de los datos personales*. Entonces, se los trata como si fuesen datos personales a nivel legal.
# Persistencia no relacional
Esta agena a la idea de tablas o estructuras relacionales. Permite trabajar con datos **no estructurados**. Son particulares en como guardan los datos y que tipo de datos manejan.
Tienen un nivel de planificacion menor debido a que permiten estructuras de datos mas dinamicas.
Puede ser distribuida, son mas veloces y escalables que las bases de datos tradicionales pero pierden la idea de consistencia.
Para elegir una base de datos debo considerar:
- Que quiero persistir
- Como quiero persistirlo (en un grafo, relacional, etc), es decir, que tipo de modelo conceptual requiere(si la base de datos puede hacerlo)
- La eleccion de la base de datos o motor
#### Razon de cambio
La magnitud de datos provoca trabajar con bases noSQL
## Clasificacion
### Orientadas a grafos
Guardan los datos con grafos, con nodos y arcos. Las propiedades o datos a persistir se encuentran tanto en los nodos como en los arcos. Guardo elementos y sus relaciones y la informacion relativas a ambos
#### Ejemplos
 - Neo4j
 - OrientDB
#### Caracteristicas
| **Categoría** | **Ventajas** | **Desventajas** |
|----------------|---------------|------------------|
| **Rendimiento** | - Consultas de relaciones complejas ultra-eficientes.<br>- Performance consistente incluso con crecimiento. | Desafíos frente a la escalabilidad horizontal cuando el volumen de datos distribuidos crece demasiado. |
| **Flexibilidad** | - Flexibilidad de esquema sin penalización.<br>- Visualización natural de patrones en los datos. | Limitaciones en análisis agregados masivos (no tan óptimos como en bases relacionales). |
| **Complejidad** | Reduce la complejidad de modelar y consultar relaciones en comparación con bases tradicionales. | Complejidad operacional significativa (configuración, mantenimiento, monitoreo). |
| **Ecosistema** | Ecosistema en crecimiento con herramientas de visualización y conectores cada vez más completos. | Limitaciones en su ecosistema y tooling (todavía menos maduro frente a RDBMS tradicionales). |

#### Casos de uso
- Redes sociales
- Analisis de influencias
- Deteccion de fraude
- Deteccion de fraude
- Motores de recomendacion
- Gestion del conocimiento
- Gestion de infraestructura de TI
- Bioinformatica y ciencias de la vida
Basicamente *si se puede llevar a un grafo lo que busco modelar, entonces es una buena opcion*
### Orientadas a columnas
Pensadas para procesar grandes volumenes de informacion. 
#### Ejemplos
- Cassandra
#### Caracteristicas
| **Categoría** | **Ventajas** | **Desventajas** |
|----------------|---------------|------------------|
| **Consultas** | Muy eficiente en consultas analíticas que acceden a pocas columnas y muchas filas. | Latencia mayor al recuperar registros completos (muchas columnas) pues los datos deben reconstruirse desde diferentes ubicaciones. |
| **Almacenamiento** | Alta compresión de datos ya que los valores similares son almacenados juntos. | Puede implicar más consumo de memoria al reconstruir registros completos desde varias columnas. |
| **Rendimiento** | Optimizado para operaciones de agregación (SUM, AVG, COUNT) y análisis masivo. | Escrituras/actualizaciones lentas, porque modificar un registro requiere acceder a múltiples ubicaciones físicas. |
Cumple con principios ACID
#### Casos de uso
- Data warehousing
-  Analisis de datos
- Business intelligence y analytics
- sistemas de monitoreo
- analisis financiero
### Key-Value
Guarda datos como pares de claves unicas y sus valores. Cada clave es un identificador unico.
#### Ejemplos
 - Redis
 - Dynamo
 - React
#### Caracteristicas
| **Ventajas** | **Desventajas** |
|---------------|------------------|
| **Alta velocidad:** Acceso extremadamente rápido para operaciones de lectura y escritura. | **Limitaciones en consultas:** No soporta consultas complejas ni búsquedas por el contenido del valor. |
| **Escalabilidad horizontal:** Fácil distribución de datos en múltiples servidores. | **Sin relaciones intrínsecas:** No maneja asociaciones entre datos de forma nativa. |
| **Simplicidad:** Modelo de datos intuitivo y sencillo de implementar. | **Sin transacciones complejas:** Limitaciones en operaciones que involucren múltiples claves. |
| **Flexibilidad de esquema:** No requiere estructura fija, los valores pueden ser de cualquier tipo. | **Consistencia eventual:** Muchas implementaciones sacrifican consistencia inmediata por disponibilidad. |
| **Rendimiento consistente:** Tiempo de respuesta predecible incluso con grandes volúmenes de datos. | **Sobrecarga de aplicación:** La lógica de datos debe manejarse principalmente en la capa de aplicación. |
| **Alta disponibilidad:** Facilidad para implementar sistemas distribuidos y redundantes. | **Dificultad para agregaciones:** No está optimizada para análisis o resúmenes de datos. |
| **Ideal para cachés:** Perfecto para almacenamiento temporal de datos frecuentemente accedidos. | **Mayor complejidad para migraciones:** Cambios estructurales pueden ser difíciles de implementar. |

#### Casos de uso
- Tokenizar autorizaciones
- Catche de aplicaciones
- Temporalidad de carritos de compras
- perfiles de usuario
### Orientadas a Documentos
Almacenan y recuperan la informacion en documentos JSON con estructuras diferentes y cada registro puede tener columnas distintas.
#### Ejemplos
- MongoDB
- AmazonDB
#### Caracteristicas
| **Categoría** | **Ventajas** | **Desventajas** |
|----------------|---------------|------------------|
| **Flexibilidad** | Permiten almacenar documentos con diferentes estructuras en una misma colección, facilitando cambios en el modelo de datos sin migraciones complejas. | Favorecen datos anidados y desnormalizados, lo que puede generar duplicación de información y dificultar las actualizaciones. |
| **Consultas y datos** | Ofrecen capacidades para realizar consultas potentes dentro de estructuras jerárquicas y datos anidados sin necesidad de operaciones complejas. | El almacenamiento de documentos completos y la indexación de campos anidados puede requerir más espacio y procesamiento. |
| **Escalabilidad** | Diseñadas para distribuirse en múltiples servidores y manejar grandes volúmenes de datos y tráfico. | En muchos casos las transacciones ofrecen garantías ACID limitadas, lo que complica operaciones que requieren alta consistencia. |
| **Ecosistema y desarrollo** | Aceleran el desarrollo al trabajar con formatos de datos similares a los que se usan en el código, como JSON. | Su ecosistema de herramientas y personal capacitado aún es menos maduro que el de las bases relacionales tradicionales. |

#### Casos de uso
- Gestion de contenidos
- Sistemas E-Commerce
- Apps web y moviles
- Analisis de datos en tiempo real
### Orientadas a datos que cambian con el tiempo
Permiten almacenamientos con cronologias.
#### Ejemplos
- InfluxDB
- TimescaleDB
#### Caracteristicas
Buen rendimiento y compresion de datos historicos. Mucho consumo de almacenamiento y hace falta hacer limpieza de datos. Estan diseñadas para crecer pero se complica en la distribucion. Estan poco desarrolladas
#### Casos de uso
- Monitoreo de infraestructura
## Resumen
Usar una base de datos relacional o no relacional depende del contexto y que queremos valorar y que no.
## Persistencia poliglota
Consiste en usar multiples persistencias en una misma aplicacion utilizando bases de datos distintas segun lo que nos corresponda y debamos usar.
### Ventajas
- Se elige la base mas adecuada para cada caso
- Mejor rendimiento y escalabilidad
- Mas flexibilidad al manejar tipos de datos
### Desventajas
- complejidad en administrar muchas bases de datos
- se deben integrar y sincronizar tecnologias
- mas dificil desarrollar y probar
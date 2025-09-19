# Proteccion de datos en persistencia
Trabajamos sobre **la norma europea** para poder expandirnos de ser necesario en un futuro
### Normativas a considerar
Estas son las normativas que se van a intentar seguir.
##### General data protection regulation (GDPR)
Surge en el año 2016. Es en ciertos aspectos poco exigente. Aun asi es mas exigente que la Argentina.
- Objetivo: Proteger a las personas fisicas en lo que respecta al tratamiento de los datos personales y la libre circulacion de datos
- Aplica al tratamiento automatizado de datos personales o tratamiento no automatizado que va a ficheros
##### Ley de proteccion de datos en Argentina
Surge en el año 2000
- Proteccion integral de datos personales en un archivo o fichero
### Definiciones
- Datos personales (s/europa): Es toda informacion de persona fisica identificada o identificable. La persona fisica es identificable mediante un identificador, como un nombre.
- Datos personales (s/Argentina): informacion de cualquier persona fisica determinada o determinable.
- Datos sensibles: Datos personales que revelan origen racional y tecnico, opiniones politicas, convicciones religiosas, etc. Estas tienen un tratamiento mas especial.
Estas definiciones tienen un nivel de obligaciones una vez definidos.
- Datos biometricos: datos personales obtenidos a partir de un tratamiento fisico especificos.
### Tratamiento
Es cualquier operacion u operaciones realizada sobre datos personales ya sea automatizada o no (GDRP).
##### Elaboracion de perfiles
Los perfiles son el tratamiento automatizado de datos personales consistente que usa datos personales para evaluar aspectos de la persona fisica y hacer predicciones en funcioncion de dicha prediccion tomar desiciones.
### Manejo de datos en la organizacion
Debo saber que datos tengo y para que los tengo. Debo cuestionarme que hacer con los datos, si construir perfiles o no. Primero para ver si tiene sentido hacerlo. Ademas *las normas inican el control sobre el tratamiento de los datos*. Por eso, se declara un *Responsable de datos* en la organizacion.
#### Consentimiento para obtencion de datos
Requiere consentimiento libre, expreso e informado, que debera constar por escrito o por otro medio que se el equipare, segun las circunstancias.
Se debe informar la finalidad de la obtencion de los datos, quienes seran los destinatarios, responsables de la base de datos, consecuencias de proporcionar los datos y la posibilidad de ejercer derechos de acceso.
**No hace falta consentimiento** cuando se refiere a listas de nombre, DNI, identificacion tributaria o personal, ocupacion, fecha de nacimiento o domicilio.
#### Consentimiento para datos sensibles
Solo se pueden obtener y tratar si la ley lo permite y nadie puede ser obligado a hacerlo. No se pueden hacer bases de datos con estas
#### Envio de publicidades
El enviante de la publicidad debe *ofrecer la opcion de borrar mis datos de su registro y que me deje de llegar la publicidad*. Ademas debe aclararse explicitamente que se trata de una publicidad
#### Fines de la obtencion de datos
Deben ser recolectados para algo en especificos y deben ser mantenidos solo para eso. Cuando se pierde el fin por el cual fueron obtenidos, deben ser destruidos.
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
### Proteccion de datos desde el diseño y por defecto (GDRP)
Por cuestiones de dificultad tecnica, el responsable de los datos debe practicar la **pseudonimización**. Es decir, aplicar pseudónimos a los datos que se tratarán. Entonces no se pueden atribuir los datos a un interesado identibicable o identificado. Por ejemplo, trato a los datos por codigo y no se quien es quien.
## Inferencia de datos
Informacion relativa a usuarios que el no provee sino que estan inferidos a partir de conductas y volumenes de datos de los usuarios. El titular de los datos no es pleno ni absoluto.
Son informacion subjetiva y no verificable. Estas inferencias pueden impactar al usuario, seguro de datos, etc.
### Datos inferidos en California
Segun esta legislacion *los datos inferidos son parte de los datos personales*. Entonces, se los trata como si fuesen datos personales a nivel legal.
# Persistencia no relacional
Esta agena a la idea de tablas o estructuras relacionales. Permite trabajar con datos **no estructurados**. Son particulares en como guardan los datos y que tipo de datos manejan.
Para elegir una base de datos debo considerar:
- Que quiero persistir
- Como quiero persistirlo (en un grafo, relacional, etc)
- Que base de datos utilizo
#### Razon de cambio
La magnitud de datos provoca trabajar con bases noSQL
## Clasificacion
### Orientadas a grafos
Guardan los datos con grafos, con nodos y arcos. Las propiedades se encuentran tanto en los nodos como en los datos. Guardo elementos y sus relaciones y la informacion relativas a ambos
#### Ejemplos
 - Neo4j
 - OrientDB
#### Caracteristicas
- Rendimiento -> Consulta de relaciones muy eficientes. Tiene performance muy consistente. Es mala en la escalabilidad horizontal
- Flexibilidad -> Flexibilidad de esquema sin penalizacion. Visualizacion natural de patrones en datos. Limitada en analisis de agregados masivos
#### Casos de uso
- Redes sociales
- Analisis de influencias
- Deteccion de fraude
### Orientadas a columnas
Pensadas para procesar grandes volumenes de informacion. 
#### Ejemplos
- Cassandra
#### Caracteristicas
Orientadas a agregacion y tiene almacenamiento mas disperso y fragmentados de los datos. Mayor consumo de recursos que otras bases de datos. Tiene filas y columnas y atributos. Cumple con los principios ACID.
#### Casos de uso
- Data warehousing
-  Analisis de datos
### Key-Value
Guarda datos como pares de claves unicas y sus valores. Cada clave es un identificador unico.
#### Ejemplos
 - Redis
 - Dynamo
 - React
#### Caracteristicas
Muy buena performance pero no se banca muchas querys complejas. Tampoco se pueden hacer transacciones complejas. No tiene estructura fija. Se puede perder consistencia. Es muy veloz.
#### Casos de uso
- Tokenizar autorizaciones
- Catche
- Temporalidad de carritos
### Orientadas a Documentos
Almacenan y recuperan la informacion en documentos JSON con estructuras diferentes y cada registro puede tener columnas distintas.
#### Ejemplos
- MongoDB
- AmazonDB
#### Caracteristicas
Podes tener registros super flexibles con distintos atributos. No hace falta mappeo y se puede trabajar con estructuras similares dentro del codigo.
#### Casos de uso
- Gestion de contenidos
- Sistemas E-Commerce
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

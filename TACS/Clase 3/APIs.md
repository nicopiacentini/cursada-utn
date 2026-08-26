# TACS - APIs

## Índice

1. [Comunicar procesos](##1-comunicar-procesos)
2. [Sockets](#2-sockets)
3. [RPC y RMI](#3-rpc-y-rmi)
4. [Serialización de datos](#4-serialización-de-datos)
5. [Transporte y mensajería: SOAP](#5-transporte-y-mensajería-soap)
6. [REST](#6-rest)
7. [Alejándose de REST puro](#7-alejándose-de-rest-puro)
8. [GraphQL](#8-graphql)
9. [gRPC](##9-grpc)

---

## 1. Comunicar procesos

Antes de hablar de APIs, conviene retomar una pregunta más básica de Sistemas Operativos: **¿cómo comunicamos procesos entre sí?** Esto se conoce como **IPC (Inter-Process Communication)**.

Dentro de una misma PC disponemos de varios mecanismos:

- Memoria compartida.
- Pipes.
- Sockets.
- Semáforos.
- Archivos (en Linux todo es un archivo).
- RPC.

El siguiente escalón es más interesante: **¿cómo comunicamos procesos que corren en PCs distintas?** Ahí la memoria compartida y los semáforos dejan de ser una opción directa, y necesitamos mecanismos que entiendan la red. Sobre esa pregunta se construye todo lo que sigue.

---

## 2. Sockets

Los sockets son la abstracción más baja con la que solemos trabajar para comunicar procesos a través de la red. En términos del modelo OSI se ubican **entre la capa 4 (transporte) y la capa 5 (sesión)**, es decir, por debajo de HTTP. Utilizan **TCP o UDP** como protocolo de transporte, y el desarrollador debe elegir cuál.

El flujo típico en un modelo cliente-servidor depende del tipo de socket:

**TCP (stream, orientado a conexión):**

1. El servidor crea el socket y hace `bind` a una dirección (IP + puerto).
2. Hace `listen` y queda bloqueado en `accept` esperando conexiones.
3. El cliente hace `connect`; el servidor acepta y ambos intercambian datos con `read`/`write` (o `recv`/`send`).

**UDP (datagram, sin conexión):**

1. El servidor crea el socket y hace `bind`.
2. Queda bloqueado en `recvfrom` esperando mensajes.
3. El cliente hace `sendto` y el servidor responde.

### 2.1. Ventajas

- Permiten mantener la conexión abierta.
- Dan **mayor control** sobre la conexión.

### 2.2. Desventajas

- Son de **bajo nivel**: la API es propensa a errores, la implementación implica conocer el 'cómo'.
- Obligan a **implementar un protocolo por encima** para obtener determinadas features que no vienen out of the box (delimitación de mensajes, framing, reintentos, etc.).
- Hay que **elegir el tipo de socket** (Datagram, Stream, Raw) y el protocolo de transporte (TCP o UDP).
- La **seguridad y autenticación** quedan enteramente a cargo del desarrollador.

### 2.3. Preguntas que uno debería poder responder si usa sockets

Trabajar directo con sockets implica asumir un montón de decisiones. Vale la pena *challengear* cualquier implementación con preguntas como:

- ¿Qué pasa si la conexión se corta? ¿Hay política de **retries**?
- ¿Se valida la integridad de los datos recibidos? ¿Checksum? ¿Protección contra buffer overflow?
- ¿Se usa autenticación? ¿Los datos viajan encriptados?

Estas preguntas terminan empujándonos a la búsqueda de **mejores abstracciones**

---

## 3. RPC y RMI

Históricamente, una primera abstracción sobre sockets fue **RPC (Remote Procedure Call)**, y su versión orientada a objetos, **RMI (Remote Method Invocation)**.

La idea es simple: hacer que una llamada remota **se parezca lo más posible a una llamada local**.

### 3.1. Flujo de RMI

- **Cliente:** define una interfaz y los métodos que llamará al servidor.
- **Servidor:** hace `bind` a una dirección, escucha requests e implementa los métodos de esa interfaz.
- **Llamada:** el cliente hace un *lookup* del address del servidor, invoca el método, y recibe una respuesta.

### 3.2. Ventajas

- Más simple para el developer que sockets.
- Tenemos **tipos de datos** y firmas de métodos.

### 3.3. Desventajas

- **Fuerte acoplamiento** tecnológico: el cliente y el servidor deben compartir lenguaje (o un stack compatible).
- Se acopla también a detalles de implementación del lenguaje (orden y tipos de parámetros, serialización interna). El contrato está acoplado, no es tan extensible.
- Existen **múltiples implementaciones** incompatibles entre sí (JRMP, RMI-IIOP, JINI).
- La llamada es **síncrona en apariencia**, pero atraviesa la red: los errores de red y los timeouts no se modelan naturalmente.
- El manejo de errores se hace con **excepciones**, lo cual mezcla el canal de flujo normal con el de errores y tiene impacto en performance.
- **No comunica lenguajes distintos** de forma transparente.

> **Abstracción local inexistente.** El gran talón de Aquiles de RPC/RMI es que *parece* una llamada local pero no lo es. Si el desarrollador olvida eso, modela mal la comunicación.

---

## 4. Serialización de datos

Si vamos a enviar datos entre procesos, y entre máquinas con arquitecturas y lenguajes distintos, necesitamos acordar **cómo se representan esos datos en el cable**.

### 4.1. El problema del mismatch

Comparemos tipos primitivos entre lenguajes:

| Concepto    | Java                              | JavaScript            |
| ----------- | --------------------------------- | --------------------- |
| Booleano    | `boolean` / `Boolean`             | `Boolean`             |
| Enteros     | `byte`, `short`, `int`, `long`    | `Number` (o `BigInt`) |
| Decimales   | `float`, `double`                 | `Number`              |
| Carácter    | `char`                            | (no existe)           |
| Cadena      | `String`                          | `String`              |
| Ausencia    | `null`                            | `null` y `undefined`  |
| Otros       | `Object`, Collections             | `Object`, arrays, `Symbol`, `Function` |

El mapeo no es uno a uno. Si hubiera que armar comunicación entre Java y JavaScript el estándar sería engorroso: varios enteros de Java colapsan en un solo `Number` de JS (que además no distingue entero de flotante), no hay `char` del lado de JS, hay dos formas de "ausencia" (`null` vs `undefined`), boxing en Java, Collections de Java vs arrays y mapas de JS... todo esto representa problemas para hacer IPC.

El problema no termina en el lenguaje:

- **Procesador:** word de 8, 16, 32, 64 bits.
- **Arquitectura de CPU:** i386, ARM, Apple M, microcontroladores, CISC vs RISC.
- **Endianness:** big endian vs little endian. Una tarjeta de red y el sistema operativo interpretan bytes distinto.

> El uso de **máquinas virtuales** (JVM, V8) ayuda a homogeneizar entornos en distintos sistemas operativos, pero no elimina la necesidad de un formato de serialización bien definido cuando cruzamos la frontera del proceso.

### 4.2. Plain-text encoding

La familia de formatos textuales es la más difundida. Son human-readable, simples.

#### XML — Extensible Markup Language

- Lenguaje basado en **tags que abren y cierran**.
- Soporta strings y números, pero **sin XSD es imposible distinguir tipos** de forma confiable.
- Los arrays se representan como **tags repetidos**; la interpretación de "esto es un array" es convención, no sintaxis ni parte del estándar.
- Soporta **comentarios**.
- **XSD (XML Schema Definition):** estándar escrito en XML que permite **validar documentos XML** y sus tipos de datos.

**Ventajas:** machine y human-readable, esquema de auto-validación (XSD), soporta comentarios.
**Desventajas:** tags repetitivos lo hacen pesado (mitigable con compresión), difícil de leer sin herramientas, ambigüedad de tipos sin XSD.
**Usos típicos:** RSS, XHTML, SOAP.

#### JSON — JavaScript Object Notation

- **Estructura jerárquica** clara.
- **Tipos diferenciados**: distingue `string`, `boolean`, `null`, números. Como es transporte, no se encarga de limitar la precisión.
- **Arrays nativos**.
- **JSON Schema:** estándar para validar documentos JSON.

**Ventajas:** muy legible, tipado, arrays claros.
**Desventajas:** **sin comentarios**, y `number` no distingue entre entero y punto flotante.
**Usos típicos:** JavaScript, APIs HTTP.

#### YAML — YAML Ain't Markup Language

- **Superset de JSON.**
- **Indentación obligatoria** (más legible para humanos).
- Soporta **referencias** (reutilización de nodos).
- Permite **tipos de datos custom** y forzar la interpretación de un tipo.

> El tipado tiene quirks: por ejemplo, el literal `no` (sin comillas) se interpreta como `false`.

**Ventajas:** legibilidad, referencias, tipos custom.
**Desventajas:** **no hay esquema de validación oficial** (existen varios no estandarizados).
**Usos típicos:** Swagger / OpenAPI, archivos de configuración de infraestructura.

> **XML para HTML, JSON para APIs, YAML para configs suele ser el uso más típico.**

En cuanto a peso en el cable: XML tiende a ser más pesado que JSON. La **compresión** (gzip, brotli) mitiga la diferencia, pero requiere CPU para comprimir y descomprimir (mayor trabajo de cómputo, ahorro en network).

### 4.3. Binary encoding

Los formatos binarios buscan resolver las limitaciones anteriores: compatibilidad entre lenguajes, performance de serialización y longitud del mensaje.

Ejemplos representativos:

- **Protocol Buffers (Protobuf)** por Google.
- **Cap'n Proto.**
- **Thrift** por Facebook.
- **FlatBuffers.**
- **Avro.**

#### Protocol Buffers en detalle

**Características:**

- **Language-neutral:** soportado en múltiples lenguajes, agnóstico, suele traer una library o tool para integrarlo.
- **Platform-neutral.**
- **Alta performance** en ser/deserialización.
- **Self-describing messages** (opcional): permite serializar/deserializar sin requerir siempre el archivo `.proto`.
- **Proto3 JSON mapping:** puede emitir JSON para interoperabilidad.
- **Evolucionable:** manteniendo la numeración de campos, los mensajes pueden cambiar sin romper compatibilidad.

**Desventajas:**

- **No human-readable.**
- Disponible en menos lenguajes que JSON, además de requerir libs third-party.

**Flujo de uso:**

1. Se define la estructura del mensaje en un archivo `.proto`.
2. Protobuf **autogenera (transpila)** código del lenguaje requerido.
3. Ese código generado se usa en la aplicación para serializar/deserializar.

> **¿Qué es el número al lado de cada campo?** Es la clave de la **retrocompatibilidad**. Mientras se respete la numeración, el esquema puede evolucionar agregando, renombrando o deprecando campos sin romper clientes viejos.

---

## 5. Transporte y mensajería: SOAP

**SOAP (Simple Object Access Protocol)** fue una de las primeras estandarizaciones fuerte de comunicación entre servicios web.

Características:

- **Extensible:** admite extensiones como seguridad (WS-Security).
- **Neutral respecto al transporte:** puede correr sobre HTTP, SMTP, AMQP.
- **Independiente de paradigma.**
- Estructura de mensaje en **envelope**, con **header** y **body**. Los parámetros del request van en un nodo (`<m:...>`).
- **WSDL (Web Services Description Language):** formato XML para describir servicios de red. Provee *discovery* y documentación, y permite **autogenerar clientes** desde la definición.

> El gran valor de WSDL era permitir que las herramientas generaran código cliente automáticamente a partir de la definición del servicio. Su gran costo: la verbosidad y la necesidad de mantener la definición actualizada en el servidor.

---

## 6. REST

**REST (Representational State Transfer)** es un **estilo de arquitectura**: un conjunto de buenas prácticas, restricciones y consejos para el diseño de APIs. Fue formulado por Roy Fielding.

### 6.1. Principios

1. **Cliente-Servidor:** la API es un contrato entre dos partes, que evolucionan **independientemente**.
2. **Stateless:** toda request debe contener **toda la información necesaria** para ser resuelta. El servidor no mantiene estado conversacional; si hay estado, vive en el cliente y se reenvía en cada request.
3. **Cache aware:** las respuestas deben poder marcarse como cacheables.
4. **Interfaz uniforme:** recursos identificados por URIs con IDs únicos, representados con sustantivos en plural. Un recurso puede tener **múltiples representaciones** (HTML, JSON, XML).
5. **Sistema de capas:** entre cliente y servidor pueden existir N intermediarios (caches, proxies, load balancers, auth, etc.), **transparentes para el cliente**.
6. **Código bajo demanda (opcional):** el servidor puede enviar código ejecutable al cliente. Esto no se suele usar, es desaconsejado por riesgos de seguridad y performance.

### 6.2. HTTP como transporte

Aunque REST es agnóstico en teoría, en la práctica casi siempre corre sobre **HTTP**. La anatomía de un request HTTP incluye: método, path, query parameters, headers y body.

### 6.3. Richardson Maturity Model

Es una escala para evaluar cuán RESTful es una API.

#### Nivel 0 — *Swamp of POX*

"Plain Old XML". Un único endpoint, un único verbo (POST), payload XML (o JSON). Técnicamente habla HTTP, pero no lo aprovecha. **No es REST.**

#### Nivel 1 — Recursos

Se introducen **recursos con URIs propias**, identificados con **sustantivos en plural**. La API se parece a un filesystem.

- ✅ `GET /users/123`
- ❌ `POST /getUser?id=123`

#### Nivel 2 — Verbos HTTP y Status Codes

Se aprovechan los **verbos** HTTP y los **códigos de estado** para expresar semántica.

##### Verbos

| Verbo     | Propósito                            |
| --------- | ------------------------------------ |
| `GET`     | Traer un recurso                     |
| `POST`    | Crear un recurso                     |
| `PUT`     | Modificar (reemplazar) un recurso    |
| `PATCH`   | Modificar parcialmente un recurso    |
| `DELETE`  | Eliminar un recurso                  |
| `OPTIONS` | Consultar operaciones sobre un recurso |

##### Seguridad e idempotencia

- **Seguro:** sin efectos de lado, *read-only*.
- **Idempotente:** el estado final del servidor es el mismo tras 1 o N ejecuciones de la misma request.

| Método    | Seguro | Idempotente |
| --------- | :----: | :---------: |
| `GET`     |   Sí   |     Sí      |
| `OPTIONS` |   Sí   |     Sí      |
| `PUT`     |   No   |     Sí      |
| `DELETE`  |   No   |     Sí      |
| `PATCH`   |   No   |     No*     |
| `POST`    |   No   |     No      |

> **¿Por qué `GET` es idempotente y seguro?** Porque no modifica el recurso: hacerlo una o N veces da el mismo resultado y no altera el estado del servidor.
>
> **`PUT` no es seguro** —pisa el recurso— **pero es idempotente** porque siempre lo pisa con el mismo contenido.
>
> **`PATCH` puede o no ser idempotente**, depende de cómo se modele: un `PATCH` que aplique una operación absoluta (`set x=5`) es idempotente; uno que aplique una operación relativa (`x += 1`) no.
>
> **Un DELETE que primero devuelve `204` y luego `404` ¿sigue siendo idempotente?** Sí. La idempotencia se define sobre **el estado final del recurso en el servidor**, no sobre el código de respuesta. Tras la primera llamada, el recurso deja de existir; las siguientes llamadas no cambian ese estado.

##### Códigos de respuesta

**1xx — Informativo**

- `101 Switching Protocols`: cambio de protocolo (por ejemplo, upgrade a WebSockets).

**2xx — Éxito** (suelen ser bastante semánticos)

- `200 OK`: respuesta general para `GET`, `POST` o `PUT`.
- `201 Created`: un `POST` creó un recurso.
- `202 Accepted`: request recibida, se procesará **asincrónicamente**.
- `204 No Content`: respuesta sin body, solo headers. Habitual en `PUT` y `DELETE`.

**3xx — Redirección** (el cliente debe completar una acción adicional)

- `301 Moved Permanently`: el recurso se movió a la URL del header `Location`.
- `302 Found`: movido temporalmente; el cliente HTTP debería redirigir.
- `304 Not Modified`: usado con `If-None-Match`; el cliente puede reutilizar su copia cacheada.
- `307 Temporary Redirect`: redirección temporal preservando el método.

**4xx — Error del cliente**

- `400 Bad Request`: request malformada. El cliente **no debería reintentarla igual**.
- `401 Unauthorized`: sin autenticar. No enviaste credenciales (o son inválidas).
- `403 Forbidden`: autenticado pero sin permisos.
- `404 Not Found`: el endpoint existe pero el recurso no. A veces se usa para enmascarar `403` y no filtrar información.
- `405 Method Not Allowed`: verbo no ruteado para ese recurso.
- `406 Not Acceptable`: falló la *content negotiation* (poco común; lo habitual es defaultear).
- `409 Conflict`: conflicto con el estado actual del recurso. El cliente debería poder resolverlo y reintentar.
- `412 Precondition Failed`: falló una precondición (típicamente ETags).

**5xx — Error del servidor**

- `500 Internal Server Error`: algo explotó del lado del servidor.
- `502 Bad Gateway`: el servidor, actuando como proxy/cliente de otro servicio, falló.
- `503 Service Unavailable`: el servicio no está disponible.
- `504 Gateway Timeout`: timeout actuando como proxy.

> **Nota sobre `502`:** si nuestro servicio expone un `502` al cliente, estamos filtrando que internamente actuamos como proxy de otro sistema. Va **en contra del principio de capas** de REST y abre una superficie de ataque, porque un atacante puede deducir la arquitectura.

#### Nivel 3 — HATEOAS

**HATEOAS (Hypermedia As The Engine Of Application State)**. La idea:

1. **Navegabilidad:** la respuesta incluye links a los siguientes recursos alcanzables.
2. **Descubribilidad:** un cliente puede navegar una API desconocida como navega una página web.

Existen múltiples estándares: HAL, JSON API, JSON-LD, Collection+JSON, CPHL, Siren, Uber, Yahapi. La falta de un estándar único explica, en parte, su baja adopción. Uno de los usos más comunes y prácticos hoy es **paginación** (por ejemplo, links `next`/`prev` con cursores, donde construir la URL no sería obvio para el cliente).

Una API RESTful no suele llegar al nivel 3, pero es aconsejable y común que implemente el nivel 2.

### 6.4. Stateless en profundidad

**Problema:** cliente que interactúa con un cluster de n servers se autentica contra el Server I. Luego, por load balancing, sigue la comunicación y su próxima request cae en el Server II. ¿Cómo sabe el Server II que el cliente está autenticado?

**Opciones no-stateless** (todas con costos):

- **Sticky sessions:** atar el cliente a un servidor. Rompe la elasticidad horizontal, y trae costo alto al rebalancear nodos que se caen.
- **Session replication:** replicar estado de sesión entre servidores. Costoso y complejo, escala peor cuanto más nodos se tenga.
- **Session en DB central:** introduce un SPOF.

**Solución stateless** (por ejemplo, con **JWT**):

- El cliente manda en cada request toda la información necesaria para autenticarse (un token firmado con un secret, con datos no sensibles).
- El servidor verifica el token en cada request, sin mantener estado conversacional.
- Distinción clave: **session vs cookie**. La cookie es un header y un mecanismo de transporte; la sesión es un patrón de estado.

### 6.5. Escalabilidad

- **Vertical:** agregar recursos a la misma máquina (más CPU, más RAM, mainframe).
  - Tiene **límites teóricos** (cantidad de hilos, RAM, diminishing returns a partir de cierta escala).
  - **No siempre es mala idea:** motores SQL, mainframes bancarios, sistemas con alto costo de distribución.
- **Horizontal:** agregar más máquinas. Habilitada por el diseño **stateless**, inmutabilidad, y esquemas tipo k8s (kubernetes) que orquestan millicores a pods en vez de VMs enteras.

### 6.6. Caching

El caching vive en los headers de request y response.

#### `Cache-Control`

- `private`: cacheable solo en el cliente (browser, app). Apropiado para contenido personalizado.
- `public`: cacheable en intermediarios (CDN, proxies). Se reutiliza entre usuarios. **Cuidado con casos como el header `Authorization`.**
- `max-age=N`: la respuesta es fresca por N segundos desde su generación (`s-maxage` en caches públicas).
- `no-cache`: se puede cachear, pero **debe revalidarse** contra el origen antes de reutilizarse.
- `no-store`: la respuesta **no debe guardarse**.
- `stale-while-revalidate`: permite servir una respuesta *stale* mientras se revalida en background.

#### Validación condicional

- `If-Modified-Since`: "devolveme el recurso solo si cambió desde esta fecha".
- `ETag`: identificador único (hash) de esta versión del recurso, devuelto en la response.
- `If-None-Match`: "si el ETag matchea, devolveme `304 Not Modified` y ahorramos el body".
- `If-Match`: usado en `PUT`/`PATCH`. "Solo aplicá la modificación si el ETag coincide con el que te paso". Si no coincide, `412 Precondition Failed`.

> **Sobre ETags.** El servidor **siempre** tiene que calcular el hash del recurso (no nos ahorramos CPU ni latencia del cómputo). Lo que ahorramos es el **envío del body** por la red. Para responses grandes, el ahorro es sustancial. Un ETag es esencialmente una función de hash: dominio grande → dominio chico, con posibilidad de colisión.

#### `Vary`

Le indica a las caches qué dimensiones, **más allá de método y URL**, distinguen respuestas. Ejemplos:

- `Vary: Accept` (content negotiation).
- `Vary: Accept-Encoding` (gzip, brotli).
- `Vary: Authorization` (clave para no servir contenido privado a otros usuarios).
- `Vary: *` → incacheable.

> Para que algo sea cacheable efectivamente, **el valor debe repetirse entre requests**. Si *varía* por usuario y no marcamos `Vary`, podemos servir contenido incorrecto.

### 6.7. Locking con ETags (optimistic locking)

El flujo:

1. `GET /users/12345` → `ETag: "686897..."`.
2. El cliente modifica localmente.
3. `PUT /users/12345` con `If-Match: "686897..."`.
4. Si el ETag coincide, el servidor aplica el `PUT`. Si no, devuelve `412` porque hubo modificaciones intermedias.

Para resolver el `412`, el cliente puede:

- Sobreescribir forzosamente (p. ej. usando `If-None-Match: *`).
- Hacer un nuevo `GET`, resolver el conflicto, y reintentar el `PUT`.

Este patrón se llama **optimistic concurrency control**: asumimos que rara vez hay conflictos, y cuando los hay, los detectamos y resolvemos.

---

## 7. Alejándose de REST puro

En la práctica las APIs reales rara vez son 100% RESTful. En la práctica aparecen preguntas y se toca un techo bastante rápido:

> *¿Cómo arman una API restful para listar los usuarios de un sistema filtrando por fecha de nacimiento, país y sexo?*

Las respuestas típicas se apoyan en **query params**, que no son REST:

- **Combinaciones y selección** de filtros: `GET /users?country=AR&gender=F`.
- **Paginación:** `?page=2&size=50` o con cursores.
- **Ordenamiento:** `?sort=createdAt:desc`.

### Problemas que introducimos

- **Cache aware:** cada combinación de query params genera una URL distinta, lo que fragmenta el cache.
- **Documentación obligatoria:** los params no se descubren solos; el cliente necesita que alguien los documente.
- **Versionado:** no está estandarizado en REST. Las tres estrategias más usadas:
  - **En la URL:** `/v1/users`. Simple, pero rompe la idea de que la URL representa un recurso.
  - **En un header custom:** `X-API-Version: 2`. Limpio pero menos visible.
  - **Vía `Content-Type`:** `application/vnd.myapi.v2+json`. Correcto formalmente, pero complejo de operar.

---

## 8. GraphQL

GraphQL es un **lenguaje de queries y mutaciones** sobre datos (no solo queries, también permite modificar). Está *orientado a grafos*: el cliente describe qué forma tiene la respuesta que quiere, y el servidor la construye.

### 8.1. Características

- **Transport agnostic:** HTTP, WebSockets, etc.
- **Tipado:** el schema define tipos estrictos.
- **Introspección:** similar a `OPTIONS`; el cliente puede preguntarle al servidor qué tipos y campos soporta.
- **Validación** automática de queries contra el schema.
- **Fix de over/under-fetching.**
- **Fix del problema N+1.**
- **Paginación y autenticación** integradas con patrones estándar.

### 8.2. Over-fetching y under-fetching

En REST, las respuestas tienen forma fija. Eso lleva a dos problemas:

- **Over-fetching:** el endpoint devuelve campos que el cliente no necesita (ancho de banda desperdiciado).
- **Under-fetching:** faltan campos que el cliente necesita, y tiene que hacer **más requests** para completar su vista.

GraphQL deja que el cliente **declare qué campos necesita**, y devuelve exactamente eso.

### 8.3. Problema N+1

Suponiendo que las tasks son subrecurso del usuario, y queremos listar las tasks de todos los usuarios de un board:

```
GET /boards/1/users       → lista N usuarios
GET /users/1/tasks
GET /users/2/tasks
...
GET /users/N/tasks
```

Terminamos haciendo **1 + N requests**. En GraphQL lo resolvemos con una sola query que anida usuarios y sus tasks. Alguien tiene que implementar ese *resolver* del lado del servidor, o sea que el problema no desaparece pero se mueve se capa. La diferencia es que la **interfaz para pedirlo** ya viene dada.

### 8.4. Flujo típico

- El **servidor** publica un **schema**.
- El **cliente** hace `POST` con la query en el body.
- El servidor responde con la data en la forma pedida.

También se puede hacer `GET` con la query codificada en la URL, pero tiene una desventaja: **URLs muy largas** que además no se pueden comprimir porque viajan en la línea de request.

### 8.5. Queries — features

- **Aliases:** renombrar campos en la respuesta.
- **Fragments:** reutilizar pedazos de query.
- **Variables** y **valores por defecto**.
- **Directivas:** `@include(if: Boolean)`, `@skip(if: Boolean)`.
- **Mutations:** para modificaciones.
- **Query caching*** (ver más abajo).
- **GraphiQL:** IDE web para explorar el schema y probar queries con introspección y autocompletado.

### 8.6. Caching en GraphQL

Como los requests son `POST` con body, el caching HTTP tradicional deja de aplicar directamente.

Consideraciones:

- **HTTP caching sigue valiendo** para los endpoints que lo permitan.
- **El caching de `POST` no es posible** en la mayoría de caches HTTP.
- Hay tensión entre **customization** (clientes pidiendo formas distintas) y **optimization** (reutilizar respuestas).
- **ETag y `Last-Modified`** siguen siendo aplicables a nivel aplicación.
- Existen capas de **app cache, server cache y shared cache**.

**Automatic Persisted Queries (APQ):** técnica para mitigar el problema del tamaño de URLs y habilitar `GET` + cacheable:

1. Se calcula un **hash de la query** del lado del cliente.
2. El cliente manda solo ese hash.
3. Si el engine del servidor **conoce** la query (la tiene registrada), la ejecuta. Si no, responde pidiendo el texto completo; el cliente lo manda, el servidor la registra con ese hash, y las próximas veces alcanza con el hash.

Así las requests son pequeñas, cacheables en HTTP `GET`, y el cliente no necesita enviar la query completa cada vez.

> GraphQL **rompe deliberadamente la semántica de REST**. Tiene diferentes trade-offs, y puede usarse en combinación con APIs REST en una arquitectura.

---

## 9. gRPC

Con gRPC **pegamos la vuelta y volvemos a RPC**, pero reversionado: un framework moderno de Google construido sobre HTTP/2 y con Protocol Buffers como formato por defecto.

### 9.1. Características

- **Framework RPC** completo.
- **Integración seamless con Protocol Buffers** como IDL y formato de payload.
- **Payload agnostic** en teoría (Protobuf es el default).
- **Client-side load balancing:** los clientes eligen a qué servidor pegarle.
- **Tracing** integrado.
- **Health checking.**
- **Authentication.**
- **Cascading call-cancellation:** cancelar una llamada cancela las llamadas hijas en cadena.
- **Flow control a nivel aplicación.**
- **Full-duplex streaming** (habilitado por HTTP/2).
- **Generación de código** adaptado a cada lenguaje (análogo a Protobuf).

### 9.2. HTTP/2

gRPC corre sobre **HTTP/2**, lo que le permite:

- **Multiplexing:** múltiples requests en paralelo sobre la misma conexión TCP.
- **Streaming bidireccional** y full-duplex.
- Encabezados comprimidos (HPACK).

### 9.3. Desventajas

- **Documentación** históricamente pobre comparada con REST.
- **Error handling custom**, distinto del modelo HTTP clásico al que muchos clientes están acostumbrados.
- **Menor soporte en browsers** (requiere gRPC-Web con un proxy).

### 9.4. ¿gRPC es más performante que REST?

**Depende.** Lo que gRPC te da out-of-the-box (full-duplex, auth, multiplexing, serialización binaria) HTTP + JSON **no te lo da**. Para un CRUD simple que no explota las features de gRPC, REST puede ser más simple, más cacheable y más operable. La cantidad de APIs REST, especialmente con JSON, también hizo que se implementen libraries más eficientes y que la comunidad sea más amplia (menos bugs, más battle-tested).

Como siempre decimos, tecnologías más de nicho, mejores en cierto caso de uso o más nuevas no implican un sucesor o una mejora.
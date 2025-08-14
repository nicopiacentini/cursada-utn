
Prof : Bulgarelli
Jueves 8:30-12:30 aula 5
Sabado 9:15 - 12:30 virtual excepto parciales y recuperatorios -> Seminario para 
cliente-servidor web, cliente pesado.
Parcial -> teorico practico escrito, 1 solo.
Mail -> flbulgareli@frba.utn.edu.ar
Trabajamos con JavaScript y su Ecosistema y mongoDB 
JavaScript -> node JS(*instalar la version 22* para el servidor), React para el lado del cliente, Docker, MongoDB. Es el stack de MERN

---

### ¿Qué es una Arquitectura de Software?

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


## Cliente-Servidor
El cliente hace peticiones al servidor y el servidor responde y actua en pos de las mismas. Los roles pueden cambiar -> el cliente puede pasar a ser servidor en determinadas situaciones.

##### WebHooks
Es una reinvension del cliente servidor donde el cliente tambien puede ser servidor y el servidor tambien puede ser cliente.

#### Bases de datos no relacionales
Como mongoDB no tiene tablas, filas, fks o pks.


##### SW Gubernamental VS SW Comercial
Tiene caracteristicas a la parte comercial. Los datos con los que se trabajan y el tipo de funcionalidades son distintos.
Por ejemplo el sw comercial es mas iterativo incremental en cambio, lo que es gubernamental suele redondar sobre el mismo tipo de problemas y no requiere el tipo iterativo incremental y no necesita ser rapido, como si necesita lo comercial que debe ser rapido.



### Procesos
Son programas en ejecucion, que ocupan ram, usan el fs, etc. Estos pueden tener vida larga o vida corta. Dentro de vida larga, existen los que no terminan nunca como un repl (interprete), programas de red que esperan interaccion con la red o paquete que entrara o saldra.
En esta materia vamos a ver los de vida larga, mayoritariamente los de red.
Los procesos pueden ser centralizados o distribuidos:
- Centralizado -> en una maquina
- Distribuido -> corre en varios procesos, uno por maquina. Es como un proceso *virtual*

### Arquitectura
Diseño en el alto nivel. No hay correlacion directa con el hardware. 
#### Arquitectura Logica
Como se organizan los componentes software, quien interactua con quien y a partir de que
#### Arquitectura Fisica
Como se despliegan los componentes logicos a lo largo del hardware/nodos
- Monolitica -> el *proceso* corre en una sola maquina. No hay red.
- Distribuida -> Existe una red, que una maquina se conecta con otra persona, cosa, computadora, etc
Red -> conexion entre 2 cosas, sean personas, computadoras, etc. La conexion puede darse por cable, red, http (cliente servidor forzado), https, etc.

##### Arquitecturas distribuidas (fisicas)
- Con jerarquia -> cliente-servidor (comercial, rapido)
- Sin jerarquia -> P2P: son eficientes, no rapidos

#### Protocolos Web
Sistema de protocolos que se manejan con cliente-servidor. Es uno de los servicios que corre en internet. Es la idea de consumision de servicios, apretar botones, interfaz grafica. Se debe utilizar un buscador como google.
Los protocolos mas comunes son:
- Http -> intercambio cliente servidor basado en texto plano (html). Ojo no es binario. Utiliza verbos indicando la operacion que voy a hacer (GET, POST, PUT, PATCH, DELETE). El navegador es un cliente del cliente-servidor. Las url se les hacen los verbos.
- Rest
- Html -> Lenguaje de marcado, texto plano, respuestas de http.
- CSS -> protocolo para darle estilo al html
- JavaScript (ECMAScript) -> Hace que la pagina no sea estatica, es decir, poderle dar funciones, estructura, etc.
	- ECMAScript -> el *standard* que debe seguir javascript.

Los clientes http (navegadores) deben bancar JavaScript.

#### Cliente liviano 
El cliente o navegador no ejecuta nada, solo hace peticiones http por cada boton/accion y el servidor devuelve un html, es decir, el contenido ordenado y mostrado

#### Cliente Pesado
Aca ante cada peticion, el servidor quizas en vez de mandar un html, manda un archivo mas liviano, como un json/xml/etc. Ahora el javascript que corre desde el lado del cliente, recibe el json y genera el html.
- Frontend -> realiza validacion, y exposicion de objetos, html, css, etc. Muestra videos, fotos y **dibuja la interfaz grafica**. Registra las interacciones y se ejecuta en el cliente
- Backend -> Se ejecuta en el servidor. Tiene que ver con la seguridad, optimizacion, implementacion de logica de dominio. Es decir, todo menos el front como dibujar o hacer validaciones.


## Redefinicion de Monolitico VS Distribuido
Monolitico puede tener conexion o red con el cliente y con la base de datos. Entonces queda:
- Monolitico -> El Backend corre en una computadora, que se conecta con una base de datos y envia cosas al cliente. Las unicas 2 conexiones son obvias y por eso entra en monoliticoAca ante cada peticion, el servidor quizas en vez de mandar un html, manda un archivo mas liviano, como un json/xml/etc. Ahora el javascript que corre desde el lado del cliente, recibe el json y genera el html.
- Frontend -> realiza validacion, y exposicion de objetos, html, css, etc. Muestra videos, fotos y ￼￼dibuja la interfaz grafica￼￼. Registra las interacciones y se ejecuta en el cliente
- Backend -> Se ejecuta en el servidor. Tiene que ver con la seguridad, optimizacion, implementacion de logica de dominio. Es decir, todo meno
- Distribuido -> El Backend corre en mas de un Servidor/Computadora. La conexion con la base de datos y con el cliente se toman como dadas por hecho, no cuentan.

##### El servidor
Es el componente de sw que se ejecuta en una maquina, responde a peticiones. Ahora el nodo donde corre este sw tambien se le puede llamar nodo servidor.
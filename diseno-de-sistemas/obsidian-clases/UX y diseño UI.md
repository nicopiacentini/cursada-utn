## Definiciones y relacion
### UX
Es lo que ocurre entre la interfaz de usuario y el usuario como tal. Abarca aspectos de accesibilidad.
### UI
Es la parte visual de sistema. Es todo lo que ve el usuario en la pantalla y todo con lo que interactua.
### Relacion
Son codependientes, uno no puede vivir sin el otro.
## Factores de la experiencia de usuario
#### Utilidad
Debe ser util para el usuario y aportarle algun valor. No puede ser inerte. El sistema puede hacer tal cosa
#### Deseable
El diseño debe ser atractivo para el usuario
#### Accesible
Para la mayoria de las personas
#### Creible
Los usuarios deben creer y confiar en lo que dice la interfaz
#### Ubicable
Cada elemento de la interfaz deb poder ser ubicable y accesible desde cualquier parte
#### Usable
Que el usuario usar la interfaz
#### Valioso
Debe aportar valor al usuario. Es mas abstracto y subjetivo
##### Valioso vs Util
La utilidad refiere a lo especifico que puede hacer la interfaz y el valor es mas subjetivo y relativo a otros aspectos.
### Modelos mentales
Las cosas o aspectos que tenemos preconsevidas a objetos nuevos en base a conocimientos previos. Los iconos se basan en modelos mentales para que se transmita una idea.
### Patrones
Soluciones predeterminadas a problemas conocidos.
#### Patrones de lectura
Como el usuario va a leer la pagina. Ej *de arriba a abajo y de izquierda a derecha*. Al mismo tiempo importa como se usa el telefono para interfaz mobile
##### Patron en F
Es como las personas solemos leer
Se escanean primero la parte izquierda y a los primeros parrafos de la pagina, luego la parte mas inferior y por ultimo la parte izquierda de forma vertical
#### Patrones de diseño
El usuario esta acostumbrado a un determinado standard al cual nos debemos acoplar. Por ende se recomienda usar patrones repetitivos para que el usuario se sienta comodo.
#### Patrones de navegacion
Permiten navegar/recorrer el sitio/interfaz.
- Drawer -> Son como *cajones* o secciones ocultas al costado
- Tab bar -> seccion arriba que permite cambiar pestañas
- Bottom navigation -> scroll con el dedo
- Pestañas 
- App bar 
- Bread crumbs -> Es un apartado de la forma `categoria/subcategoria/subsubcategoria` donde se puede acceder a categorias anteriores
- Barras de progreso
- Paginado  -> para info acotada o no sobrecargar el usuario o no mandar muchos datos de una
- Scroll infinito -> quiero que el usuario consuma constantemente
- Carrussel
- Menu acordeon
#### Patrones de interaccion
Como el usuario interactua con mi sistema. Se debe tener en cuenta el espacio de interaccion de el usuario con la interfaz.
- Listas -> serie de opciones para elegir con muchas funcionalidades
- Buscador -> para buscar en mi sitio
- Alertas
- Acceso rapido -> para acceder a partes de la interfaz
- Introduccion de datos
- Notificaciones
- Campos de texto
- Tarjetas
- Floating action button -> desconectado de la demas interfaz, por encima
## Arquitectura de informacion
Forma de organizar y etiquetar la informacion en un sitio web. Segmenta la informacion que se muestra en pantalla para que sea util, claro y logico para el usuario. El 75% de problemas de usabilidad estan relacionados con problemas de arquitectura de informacion.
### Principios de la arquitectura de la informacion
##### Principio de objetos
Las partes o secciones de mi sitio deben tener una relacion o conexion.
##### Principio de elecciones
Darle opciones al usuario mientras esta en un sitio o plataforma tratando de reducir la carga cognitiva de esas opciones. Esto favorece que el usuario tome desiciones concientes
##### Principio de divulgacion progresiva
Implica que la informacion suministrada al usuario debe ser suministrada progresivamente, o deUX y diseño UI a poco.
##### Principio de ejemplos
Ubicar ejemplos representativos en el enlace de forma que ademas de un titulo podemos ver ejemplos de lo que nos espera is hacemos click.
##### Principio de las puertas delanteras
Un usuairo puede acceder al sitio de distintas formas, no todos entran a traves de la homepage, quizas entran por hipervinculo u otras formas. La idea es que desde cualquier parte del sitio pueda llegar a cualquier otra parte.
##### Principio de clasificacion multiple
Le debo permitir al usuario hacer algo de la mayor cantidad de maneras posibles.
##### Principio de navegacion enfocada
Se debe guiar al usuario a travez de la interfaz web. Quiero que use las cosas de la forma que quiero.
##### Principio de crecimiento
Se plantea que un sitio debe poder crecer en un futuro de las posibles siguientes formas:
- Ampliar la cantidad de items del mismo contenido
- Ampliar la cantidad de productos de la marca
- Agregar productos o contenidos nuevos.
## Wireframes
Es como un boceto de como se va a ver la pagina de forma estatica y sin informacion. Es una forma de desarrollar la idea de la interfaz. Va a tener evoluciones con distinto nivel de especificidad.
## Wireflows
Como se conectan distintas pantallas de la pagina. Un wireframe muestra una pagina de mi interfaz y el wireflow los conecta.
## Sistema de grillas
Es una forma de organizar la pantalla a traves de columnas. Estas son del mismo ancho y son equidistantes (pasillos), mientras que a los costados hay margenes. La idea es que las cajas o tags html se acoplen o acomoden al tamaño de estas columnas. En desktop se suelen usar 12 columnas y en mobile 2 columnas.
## Sistemas de diseño
Son metodologias para iterar y crear la vista final del producto. Son normas de diseño y escalabilidad que aplican patrones.
- Material UI
- Design systems
### Atomic Design
Es un sistema de diseño. La idea es que hace una analogia anarquica sobre los animales, compuestos por celulas, compuestos por atomos y sobre las paginas. La idea es dividir la iteracion en 5 etapas hasta conseguir un producto terminado
- Atomos -> etiquetas, botones, entradas, inputs. Son componentes separados super pequeños. La idea es que sean reutilizables
- Moleculas -> son conjuntos de atomos ya reutilizables. Por ej un formulario
- Organismos ->  conjunto de moleculas
- Plantillas -> conjunto de organismos
- Paginas -> es una instancia particular de plantillas
## Elementos de lenguaje visual
Son los componentes que ve el usuario y le suministran informacion acerca del sitio. Esta compuesto por:
##### Tipografia
Segun el tipo de informacion que maneja se utilizan distintos tipos. Da como *mensajes subliminales* sobre la informacion que brinda. Existen variables como
- Direccion
- Peso
- Proporcion
No sobrecargar de texto toda la fila ni tampoco usar opco texto con poco ancho. La idea es que por linea hayan entre 50 y 75 caracteres y ~10 palabras por linea
###### Alineaciones
Se utilizan todos menos el Justificado
###### Jerarquias
Se juega con lineas y tipografias segun el tipo de texto. Un titulo va mas grande
##### Color
Generan efectos sobre el usuario. La idea es seguir una paleta para que se identifique de esa forma al sitio
###### Paletas
Son una serie de colores consistentes con la idea de que sean amigables juntos. Buscamos que no sean inconsistentes. Existen las paletas secundarias
###### Manual de marca
Define paleta de colores, logo y tipografia de una organizacion que se usa en su pagina, comunicaciones, etc.
###### Regla 60-30-10
Dice que de todos los colres usados en la interfaz:
- 60% debe ser de un tipo
- 30% de otro
- 10% de un tercero
##### Iconografia
##### Ilustraciones
## Accesibilidad 
Busca maximizar la cantidad de usuarios que puedan usar el sistema y que cualquier persona pueda usarlo. Se maneja con los siguientes principios
##### Perceptible
Que el usuario pueda obtener la info del sitio
##### Operable
Que el usuario pueda interactuar lo mas posible con el sitio
##### Comprensible
Que lo que muestra el sitio sea entendido por el usuario
##### Robusto
Que la mayor cantidad de personas puedan usar el sitio
#### Leyes de accesibilidad
- W3C
- Ley 26.325
### Herramientas de accesibilidad
Sirven para revisar que tan accesible es mi sitio web
- Contrast checker
- Color blind
- Daltonismo
- Color safe -> genera paletas de colores que permiten contraste
## Evaluacion de producto
Como se que la interfaz creada funciona. El primer parametro a ver es de accesibilidad que se evalua con herramientas mencionadas anteriormente. Luego se evalua a nivel usuario
#### Con usuairo
Test con usuario para que interactue con la interfaz. Luego se pueden llevar a cabo entrevistas, encuestas, cuestionarios para dar feedback. Tambien se puede realizar un test de A/B donde se pide al usuario que eliga entre comparativas. Y por ultimo existen otros metodos como eyetracking, mapas de calor, etc.
#### Sin usuarios
Evaluacion heuristica. Es un metodo de inspeccion de usabilidad sin usuarios. Se busca que mi interfaz cumpla con los principios de usabilidad heuristica. Los principios son:
### Principios de heuristica
##### Visibilidad del estado del sistema
En todo momento el sistema/interfaz debe informar al usuario en que estado se encuentra y como proseguir tomando las desiciones adecuadas. Esto se puede ver con **barras de progreso**
##### Consistencia entre sistema y mundo real
El sistema debe usar lenguaje de los usuarios con metaforas, palabras o frases conocidas y que coincidan con los modelos mentales del usuario. Aca entran aspectos de iconografía. Se intentan usar tambien palabras claves reconocidas
##### Control y libertad para el usuario
El usuario se arrepiente de las desiciones tomadas y por ende el sistema debe permitir arrepentirse/volver hacia atras. Esto se logra con alertas, pop-ups!, etc.
##### Consistencia y estandares
Los usuarios deben seguir las normas y estandares del sitio y para esto el sistema debe poder explicarse por si mismom como se usa. Una forma de hacer esto es por ejemplo, determinando que esta habilitado y que no con opacidad
##### Prevencion de errores
Los usuarios son automaticos entonces pueden cometer errores sin querer. Para evitar esto hay que informar constantemente donde esta el sistema, en que estado, mandar alertas, pop-ups!, etc.
##### Minimizar el uso de la memoria
Como el usuario no tiene razocinio cognitivo competente, hay que minimizar la cantidad de memoria que requiere usar el usuario para usar el sistema.
##### Flexibilidad y eficiencia de uso
Se usan aceleradorees y short-cuts para que sea mas eficiente el uso
##### Dialogos externos y diseño minimalista
La idea es un diseño con lo justo y necesario que no sobrecarque al usuaio
##### Reconocer, diagnosticar y recuperar errores
Los mensajes de error deben expresarse en un lenguaje claro y deben poder ser reparables
##### Ayuda y documentacion
El sistema debe guiar al usuario a lo largo de su uso. Entonces la documentacion del sitio debe ser facil de encontrar, centrada en utilidades. Se suelen usar preguntas frecuentes
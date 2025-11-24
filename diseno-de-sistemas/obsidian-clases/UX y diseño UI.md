## Definiciones y relacion
### UX
Es lo que ocurre entre la interfaz de usuario y el usuario como tal. Lo que experimenta el usuario antes, durante y despues de usar un producto o servicio. Abarca aspectos de accesibilidad, usabilidad e interaccion.
### UI
Es la parte visual de sistema. Es todo lo que ve el usuario en la pantalla y todo con lo que interactua.
### Relacion
Son codependientes, uno no puede vivir sin el otro. 

UX es lo que te hace sentir una marca o producto al momento de interactuar con él, mientras que UI es una capa visual de colores, texturas, formas y elementos.

Por eso, UX no es lo mismo que UI. Detrás de un producto o aplicación increíble tuvo que haber trabajo previo de investigación y una correcta estrategia que se tradujo en una interfaz atractiva. UI no es, ni nunca será por sí sola una solución.


## Factores de la experiencia de usuario
#### Utilidad
Cada elemento debe ser util para el usuario y aportarle algun valor en mayor o menor medida. No puede ser inerte o estar ahi por ser "lindo". 
#### Deseable
El diseño debe ser atractivo y amigable para atraer y retener usuarios. Buscan generar emociones en el usuario.
#### Accesible
Para la mayoria de las personas sin mayor inconveniente, independientemente de las limitaciones del individuo o de las limitaciones de su contexto de uso.
#### Creible
Los usuarios deben creer y confiar en lo que dice la interfaz. Si perdemos su confianza los perdemos por siempre
#### Ubicable
Cada elemento de la interfaz deb poder ser ubicable y accesible desde cualquier parte. De lo contrario el usuario se frustra y abandona. Entonces debo generar una correcta navegacion de facil acceso
#### Usable
Que el producto sea facil de utilizar para cualquier persona. Para que el producto sea eficiente y los usuarios puedan usarlo correctamente hay que tener en cuenta la facilidad de uso. Se valora la simpleza
#### Valioso
Debe aportar valor al usuario. Debo mejorar la satisfaccion del usuario para que siga utilizando el producto. Es mas abstracto y subjetivo
##### Valioso vs Util
La utilidad refiere a lo especifico que puede hacer la interfaz y el valor es mas subjetivo y relativo a otros aspectos.
# Modelos mentales
Las cosas o aspectos que tenemos preconsevidas a objetos nuevos en base a conocimientos previos. Informan expectativa del usuario frente a lo que se va a encontrar. Los iconos se basan en modelos mentales para que se transmita una idea.
## Patrones
Soluciones predeterminadas a problemas conocidos. Nos ayudan a aumentar la usabilidad de nuestro producto digital debido a que son soluciones ya conocidas por los usuarios, reducen la curva de aprendizaje que el usuario atravesará cuando intente resolver una tarea en nuestro producto, esto genera esa sensación en la personas de “producto intuitivo”. Estos patrones permiten reducir la carga cognitiva, aumentar la usabilidad , mejorar la experiencia del usuario,tener mas consistencia en nuestros diseños  . No tenemos que reinventar la rueda, tenemos que ver y conocer de que forma ya están resueltos algunos problemas
### Patrones de lectura


El usuario ingresa a un sitio, hace un vistazo rápido en busca de algún link que se asemeje a lo que necesita, y deja gran parte de la página sin leer.  No lee palabra por palabra, sino que “escanea” palabras clave que encajen con sus intereses del momento. La lectura detallada ocurre luego de haber escaneado y encontrado información importante.
Como el usuario va a leer la pagina. Ej *de arriba a abajo y de izquierda a derecha*. Al mismo tiempo importa como se usa el telefono para interfaz mobile
##### Patron en F
Es como las personas solemos leer:
1. Escanean información, presentando más atención a la parte izquierda y a los primeros párrafos de la página.  
2. Luego la vista se desplaza a la parte inmediatamente inferior, haciendo un movimiento horizontal más corto.  
3. Finalmente, escanean el contenido de la izquierda en un movimiento vertical.
### Patrones de diseño
El usuario esta acostumbrado a un determinado standard al cual nos debemos acoplar. Por ende se recomienda usar patrones repetitivos para que el usuario se sienta comodo.
#### Patrones de navegacion
Permiten navegar/recorrer los componentes de la aplicacion evitando desorientacion.
- Drawer -> Son como *cajones* o secciones ocultas al costado que muestran nuevas pantallas a mostrar
- Tab bar -> Se puede utilizar para filtrar contenidos, o cambiar entre pantallas que tengan, de acuerdo a la arquitectura de información, el mismo nivel de jerarquía.
- Bottom navigation -> scroll con el dedo
- Pestañas 
- App bar 
- Navigation bar -> Son de 3 a 5 destinos de primer nivel para navegar entre ellos.
	- Navegacion historica -> ir para atras lleva a la pantalla anterior
- Bread crumbs -> Es un apartado de la forma `categoria/subcategoria/subsubcategoria` donde se puede acceder a categorias anteriores relativo desde el home. Ubica al usuario
- Barras de progreso -> muestra los pasos de una operacion
- Paginado  -> para info acotada o no sobrecargar el usuario o no mandar muchos datos de una
- Scroll infinito -> quiero que el usuario consuma constantemente (redes sociales)
- Carrussel
- Menu acordeon
#### Patrones de interaccion
Como el usuario interactua con mi sistema. Se debe tener en cuenta el espacio de interaccion de el usuario con la interfaz, es decir, si estoy en mobile, la forma en la que se sostiene el celular condiciona a como debo acomodar los componentes.
- Listas -> serie de opciones ordenadas verticalmente para elegir con muchas funcionalidades
- Buscador -> para buscar en mi sitio
- Alertas -> solo para mensajes de envio necesario urgente. A veces se hacen con toasts.
- Acceso rapido -> para acceder a partes de la interfaz
- Introduccion de datos -> evitar uso de teclados. Usar checks, desplegables, microfonos, camaras, etc.
- Notificaciones -> pequeños avisos que informan al cliente 
- Campos de texto -> se debe notar que son tal
- Tarjetas
- Floating action button -> desconectado de la demas interfaz, por encima
- Modals -> son como secciones ya sean desplegables, cajones o notificaciones que permiten darle a los usuarios opciones o indicaciones para el uso de la aplicación o la web. Puede estar relacionado con noticias, novedades, descuentos o avisos de mejora, además de tooltips
## Arquitectura de informacion
Forma de organizar y etiquetar la informacion en un sitio web de la forma mas clara posible. Segmenta la informacion que se muestra en pantalla para que sea util, claro y logico para el usuario. El 75% de problemas de usabilidad estan relacionados con problemas de arquitectura de informacion.
### Principios de la arquitectura de la informacion
##### Principio de objetos
Las partes o secciones de mi sitio deben estar organizados considerando su proposito en la plataforma o interfaz. Por ejemplo, ordenar productos segun su tipo
##### Principio de elecciones
Darle opciones al usuario mientras esta en un sitio o plataforma tratando de reducir la carga cognitiva de esas opciones. Esto favorece que el usuario tome desiciones concientes. Incluye la idea de no abrumarlo
##### Principio de divulgacion progresiva
Implica que la informacion suministrada al usuario debe ser suministrada progresivamente, o de UX y diseño UI a poco. Esto implica, mostrar informacion al usuario segun la vaya requiriendo, no toda de una.
##### Principio de ejemplos
Ubicar ejemplos representativos en el enlace de forma que ademas de un titulo podemos ver ejemplos de lo que nos espera is hacemos click.
##### Principio de las puertas delanteras
Un usuairo puede acceder al sitio de distintas formas, no todos entran a traves de la homepage, quizas entran por hipervinculo u otras formas. La idea es que desde cualquier parte del sitio pueda llegar a cualquier otra parte.
##### Principio de clasificacion multiple
Le debo permitir al usuario hacer algo de la mayor cantidad de maneras posibles. Cuando los usuarios necesitan encontrar información dentro de un conjunto grande y diverso, es útil ofrecer **más de una forma de clasificación u organización** para que puedan acceder al contenido según su propio modelo mental.
##### Principio de navegacion enfocada
Se debe guiar al usuario a travez de la interfaz web. Quiero que use las cosas de la forma que quiero. La navegación debe mostrar solo lo esencial y guiar al usuario hacia lo que realmente importa, evitando distracciones.
##### Principio de crecimiento
Se plantea que un sitio debe poder crecer en un futuro de las posibles siguientes formas:
- Ampliar la cantidad de items del mismo contenido
- Ampliar la cantidad de productos de la marca
- Agregar productos o contenidos nuevos.
## Wireframes
Es como un boceto de como se va a ver la pagina de forma estatica y sin informacion. Es una forma de desarrollar la idea de la interfaz. Va a tener evoluciones con distinto nivel de especificidad. Muestra la disposicion de componentes y su contenido.
## Wireflows
Como se conectan distintas pantallas/wireframes de la pagina. Un wireframe muestra una pagina de mi interfaz y el wireflow los conecta.
Resuelven el problema que tienen los wireframes para dar dinamismo entre pantallas e indicar el flujo que tiene el usuario al interactuar con las interfaces de mi sistema.
## Sistema de grillas
Es una forma de organizar la pantalla a traves de columnas. Estas son del mismo ancho y son equidistantes (pasillos), mientras que a los costados hay margenes. La idea es que las cajas o tags html se acoplen o acomoden al tamaño de estas columnas. En desktop se suelen usar 12 columnas y en mobile 2 columnas. Se usan columnas segun se requiera.
## Sistemas de diseño
Son metodologias para iterar y crear la vista final del producto. Son normas de diseño y escalabilidad que aplican patrones.
- Material UI
- Design systems
### Atomic Design
Es un sistema de diseño. La idea es que hace una analogia anarquica sobre los animales, compuestos por celulas, compuestos por atomos y sobre las paginas. La idea es dividir la iteracion en 5 etapas hasta conseguir un producto terminado
- Atomos -> etiquetas, botones, entradas, inputs. Son componentes separados super pequeños. La idea es que sean reutilizables
- Moleculas -> son conjuntos de atomos ya reutilizables. Por ej un formulario
- Organismos ->  conjunto de moleculas, por ejemplo un header
- Plantillas -> conjunto de organismos, por ejemplo una plantilla con nabvar, footer y lo que este en medio
- Paginas -> es una instancia particular de plantillas, como una homepage, product detail page, etc.
## Elementos de lenguaje visual
Son los componentes que ve el usuario y le suministran informacion acerca del sitio. Esta compuesto por:
##### Tipografia
Segun el tipo de informacion que maneja se utilizan distintos tipos. Puede servir como para potenciar como para debilitar un mensaje. Da como *mensajes subliminales* sobre la informacion que brinda. Existen variables como
- Direccion
- Peso
- Proporcion
No sobrecargar de texto toda la fila ni tampoco usar poco texto con poco ancho. La idea es que por linea hayan entre 50 y 75 caracteres y ~10 palabras por linea
###### Alineaciones
Se utilizan todos menos el Justificado
###### Jerarquias
Se juega con lineas y tipografias segun el tipo de texto. Un titulo va mas grande
##### Color
Generan efectos sobre el usuario. La idea es seguir una paleta para que se identifique de esa forma al sitio y a la marca.
###### Paletas
Son una serie de colores consistentes con la idea de que sean amigables juntos. Buscamos que no sean inconsistentes. Existen las paletas secundarias
###### Paletas secundarias
Sirven para dar informacion al cliente o usuario sin usar la paleta de la marca. Para hacerlo usa colores como verde para success, rojo para fail, etc.
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

**Perceptible**: Significa que el usuario puede identificar el contenido y los elementos de la interfaz mediante los sentidos. 
**Operable**: Significa que un usuario puede usar correctamente los controles, botones, navegación y otros elementos interactivos.
**Comprensible**: Los usuarios deben poder comprender el contenido y aprender y recordar cómo usar su sitio.
Robusto: El contenido debe ser lo suficientemente robusto como para que una amplia variedad de usuarios pueda interpretarlo con fiabilidad, permitiéndoles elegir la tecnología que utilizan para interactuar con sitios web, documentos en línea, contenido multimedia y otros formatos de información.
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
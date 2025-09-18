- Autenticacion -> decir quien sos.
- Autorizar -> dejar acceder a un usuario a algo. Para dejar acceder hay que autenticar a quien llega.
- Video navegador.
___
# Testing
Se utiliza para detectar fallas en tiempo de ejecución de **logica, funcionalidades nuevas y funcionalidades existentes** para que cumplan con lo que deban hacer. Se buscan evitar *errores de regreción*. Estos son aquellos que se ocacionan en algo que antes andaba bien pero luego del cambio andan mal. Los tipos de testing son:
### Prueba manual
Es engorrosa, es simular ser el usuario. Me sirve si quiero probar algo una vez sola. Sin embargo, al evolucionar constantemente, debo retestear constantemente.
### Pruebas automaticas
Son ideales para las pruebas de regresión. Son automáticas y retestean solas. Estas se clasifican en:
#### Unitarias
Son aquellas que se dedican a probar un componente nativo de ese paradigma de programacion. Por ejemplo en funcional se prueba una funcion y en objetos un objeto. Es decir, **se prueba la minima unidad testeable en dicho paradigma**.
#### Integracion
Integra mas de un componente nativo del paradigma. Es decir, *prueba la interaccion entre los elementos de la prueba*. Estos elementos son los que tambien se testean en las pruebas unitarias. Suele utilizar *mocks* (objetos diseñados solo para testear y que pasen por otros objetos). Dentro de estas suelen estar las pruebas de controladores/http
#### Humo/Smoke
Trata sobre levantar una porcion del sistema y verifico que se pueda levantar y pueda hacer algo. No valido que lo que haga sea correcto.
#### End to end
Tambien conocidos como punta a punta o *E2E*. Levanta el sistema completo con a veces algunos compomentes *mock* por cuestiones de complejidad o tiempo. Suelen ser los mas dificiles de aplicar/usar. Se aplican sobre la *UI*
### Necesidad y documentacion
Todas las pruebas son necesarias en mayor o menor medida. Ademas, las pruebas deben ser documentadas y lo suficientemente claras.
### Diferencia con monitoreo
Es la accion de estar permanentemente validando la salud del sistema. El testing se hace cada tanto mientras que el monitoreo es constante.
# Frontend
Se usa *ReactJs* pero no es la unica. Al manejarnos con cliente pesado el cliente tiene logica dentro de todo *pesada*. React impone una arquitectura logica pesada en el cliente. 
### Arquitectura
En la materia estamos con una arquitectura cliente pesado - servidor monolitico. Esto no implica que se utilize una *aplicacion web*. Al mismo servidor se pueden conectar distintos clientes utilizando distintas aplicaciones siempre y cuando usen tecnologias de web y el protocolo http. El punto es que hay *distintas teconologias para hacer la interfaz grafica y no todas tienen por que ser una aplicacion web (por ejemplo un navegador. La UI se ejecuta NO en una aplicacion del cliente sino en su navegador)*.
##### Aplicacion web
Es la que corre en el navegador. Hay arquitecturas web cuyo cliente no es un navegador y por ende se las conoce como *nativas*
### Diseño responsive
Las aplicaciones web responsive implican que las interfaces se adaptan al tamaño de la pantalla del dispositivo. Lo que cambia es:
- el tamaño de los elementos de la interfaz
- la disposicion de los componentes 
- el espaciado
Lo que se logra es que una aplicacion web diseñada para celular sea facil de adaptar a computadora y viceversa.
#### Tecnologias  web que resuelven los problemas
- HTML
- CSS 
- JS
- localStorage
- cors
- sesion
- DOM -> arbol de objetos generados a partir de html
- historial
### Problemas a resolver
##### Interaccion back-front
##### Cuestiones de UI
- Imagen
- Tamaño
- Disposicion
- tipografia -> que tipo de fuente uso para que sea comoda para el usuario.
- Color -> que color usa para cada cosa.
- Consistencia visual
##### Validacion de datos
##### UX
##### Compatibilidad entre navegadores
Cada navegador tiene su propio entorno de ejecucion. Sin embargo, muchos suelen compartir la tecnologia que llevan por detras. Ademas, los motores de busqueda que maneja cada uno son distintos. Hoy en dia, generalmente los navegadores cuentan con los parches suficientes para garantizar esta compatibilidad
##### Accesibilidad
##### Manejo de sesion

##### Arquitecturas
En el cliente se utiliza el MVC, MVVM, MVP para este tipo de problemas. Hoy en dia existen las tecnologias *Reactivas* para la interfaz grafica. Esta basada en MVC y se basa en la idea de componentes visuales que pueden:
- renderizar una porcion de vista
- impmenentar logica de dominio
- recibir información de la vista
En vez de pensar a los componentes por separado las reactivas utilizan todos los componentes para hacer todo. Estos componentes toman el html y css para armar sus vistas. Se va de componentes de alto nivel a componentes de bajo nivel. Por ejemplo algunos de los componentes reactivos pueden ser:
- Menu principal
- Perfil/inicio sesion
- pie de pagina/footer
- barra de navegación 
- Barra de breadcrumbs -> para saber en que parte de la pagina estoy (inicio>productos>tecnologia...)
Algunos ejemplos son React, vue y angular
###### Herramientas de validacion
En el servidor sirve para seguridad/consistencia. Estos se validan al ingresar y una vez ingresados se consideran *validos*. Hasta que no son validados no pueden confiarse entonces son obligatorias
En el cliente sirve para mejorar la experiencia de usuario -> opcionales

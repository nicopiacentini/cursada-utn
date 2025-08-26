#### Markdown
Es un formato de archivo para realizar documentaciones. Se utiliza/encuentra en github. Puede usarse en *readme.md* y *github*
## JavaScript
- Orientado a objetos
- lenguaje interpretado -> existe un interprete que *parsea* y ejecuta las instrucciones.
- Tipado dinamico -> los tipos de datos cambian en ejecucion.
#### Entornos de ejecucion
Es un conjunto de herramientas para ejecutar un lenguaje. En el caso de JS, se necesita un interprete como minimo. Es el lugar en donde se ejecuta el codigo. Para JS, hay un entorno de ejecucion en el navegador (_frontend_) y otro para el servidor (_backend_). 
- chrome <- v8
	- A esta consola tambien puedo correrla haciendo `ctrl + shift + i` y picando en consola. Entonces se abre el interprete de chrome, es decir, *v8*.
- firefox <- spidermonkey
Estos son entornos de ejecucion ***distintos*** entre si. Ambos deben tener el interprete como minimo.
#### node
Puedo usar el REPL de node desde la terminal. Es el framework que sigue a ECMAScript para programar el backend.
```bash
node
class ....
```
Normalmente se ejecutan programas en lotes, es decir, scritps. Lo ideal es que el programa dure para siempre si quiero que se ejecute en un servidor.

#### ¿Toda aplicacion Web usa JS?
- Por parte del servidor no hace falta. Existen otros lenguajes que pueden hacerlo y ademas quizas son mas eficientes
- Del lado del navegador/cliente JS es como el mas aceptado y el mas utilizado y por ende termina siendo necesario.
	- Ahora no toda aplicacion requiere codigo o programacion del lado del cliente entonces....
Se pueden hacer aplicaciones web sin JS.
## Cliente-Servidor (arquitectura Web)
![[Pasted image 20250826135504.png]]
#### El cliente
En esta imagen el cliente se ve como un actor. Sin embargo, tambien puede representar piezas de software o agentes de computo. Lo importante es que sea navegador, otra computadora o agente de computo, pueda comunicarse con el servidor mediante lo que necesite (solicitudes http, https, etc.). Programar de este lado es opcional y depende de si uso cliente liviano o cliente pesado.
- Cliente pesado -> hay codigo significativo en el cliente y en el servidor y se ejecuta en ambos. Angular, React, Vue.
- Cliente liviano -> no hay codigo significativo del lado del cliente. Si hay mucho codigo del lado del servidor
###### curl
Es un posible cliente. Pieza de SW que se encarga de hacer comunicaciones con servidores mediante peticiones https entre otras
```bash
curl https://www.google.com
```
##### Navegadores
Son el cliente mas tipico en la arquitectura cliente-servidor para web. 
#### El servidor
Tiene programacion/logica siempre presente

## Frontend y Backend y sus estilos de programacion
#### Diferencias de programacion
- El backend puede usar cualquier lenguaje y el front solo JS.
- Versiones: Segun la version del navegador puedo usar distintos entornos de JS.
- Capacidad de computo: la programacion del lado del cliente podria ejecutarse en entornos con menor capacidad de computo que un servidor.
- Seguridad: Lo que se ejecuta en el servidor esta controlado bajo mi supervision pero en el cliente no, puede ejecutar codigo modificado.
- Conexion: El cliente va a tener un nivel de conectividad limitado y esto no depende de mi.
- El servidor esta bajo presion de computo y tiene que ser capaz de aumentar su capacidad de computo para bancar a varios clientes en simultaneo.
- El cliente esta mas orientado a eventos (cambio de pantalla, clicks, etc.) y por eso introduce la idea de formularios, botones, checkboxes, etc. El del servidor gira entorno al dominio y su comunicacion con el cliente.

#### Comunicacion Cliente-Servidor
Ahora nos vamos a enfocar en la comunicacion entre cliente y servidor, mas especificamente, `http`. Actualmente el mas usado es `https` que agrega una capa de encriptacion. En un nivel mas bajo, hay que abrir sockets del lado del cliente y del servidor pero para agilizar el proceso usamos directamente herramientas de JS.
Se realizan peticiones y respuestas a las mismas. Ante cada una de estos pares hay 1 conexion socket y luego se termina. La termina el servidor. 
El protocolo `http` no sabe identificar a los clientes como tal. A 2 peticiones distintas los trata como clientes distintos.

#### API
Interfaz de programacion de aplicaciones. Es la forma programatica de consumir servicios http de un servidor. Lo distinto esta en como se reciben/interpretan lo que recibo. Una `UI` es similar porque tambien es una forma de consumir http pero lo distinto esta en que es una interfaz hecha para humanos
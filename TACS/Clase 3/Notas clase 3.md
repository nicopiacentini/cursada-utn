# Arquitectura web frontend
> Esta basado en cliente servidor y mas especificamente, en el cliente

#### Clientes http
>[!definition]
>Puede ser un navegador, postman, curl, wget o insomnia 

Naturalmente no todos traen la parte visual. El cliente http esta incluido en el **browser** que incluye standares y mas codigo como de renderizado
##### Browser y urls
> Que pasa cuando pongo una URL en el browser?

###### Flujo

1. Bob enters a URL into the browser.
2. Browser looks up IP in cache → **DNS Cache**
    - 2.1 Browser looks up IP using recursive DNS lookup → **DNS Resolver**
        - Recursive lookup → **DNS Server**
3. Browser establishes TCP connection with the server → **Web Server**
4. Browser sends HTTP request to the server → **Web Server**
5. Server sends back HTTP response → (from **Web Server**)
6. Browser renders HTTP content
#### Web frontend
Si bien frontend es toda la parte de interaccion con usuario, la parte web incluye:
- HTML
- CSS
- JavaScript
- Web APIs: Son apis que usa el browser para interactuar con html, css, etc. Las implementan varios browsers. Ejemplos:
	- DOM
	- fetch
	- crypto
	- wasn
#### Que es Frontend
Son sistemas de cada a usuario. Puede ser una pp servida por HTTP o una app desktop, mobile. Pueden ser tanto **aplicaciones nativas** como **plataformas web**. 
###### Por que es importante?
Por el dinero, llamar la atencion y conseguir clientes

### Como se hace una pagina web
Primero el browser utiliza archivos HTML y trabaja con hechos.
##### HTML
Es un lenguaje de marcado que define la estructura de la pagina y la semantica del contenido. Esto implica que el marcado describe que es cada elemento sin ver el renderizado.
##### CSS
Define la apariencia de los elementos que creo con HTML. Generalmente se trabajan con frameworks. Para utilizarlo se trabaja con especificidad donde podemos asignar un estilo a un elemento html mediante:
- **Tags** con '#'
- **Clases** con '.'
### JavaScript
Es un lenguaje que maneja el browser. Se utiliza para manipular la pagina web. 
###### JavaScript Engine
Es un interprete que recibe codigo js y lo traduce a codigo de maquina para que la pc lo pueda ejecutar. Existen varios engines como:
- V8
- SpiderMonkey
Lo utilizan los browsers y comparten la exposicion de apis web. 
###### Que pasa dentro del engine
1. Parser -> analisis lexico y hace el abstract syntax tree
2. AST (abstract syntax tree)
3. Interpreter que da bytecode (call stack + memory heap)
4. Profiler Revisa bytecode y compila para optimizar
5. Compiler
6. Optimized code
7. Machine code
Esto es un JIT compiler o just in time compiler que basicamente interpreta y compila 

##### Call stack y memory heap
- **Call stack**: Es una pila que trackea las funciones que tiene que hacer. Es decir linea por linea
- **Memory heap**: Se guarda informacion como objetos o variables
##### Event loop
Como js corre en un solo hilo, se puede lograr asincronismo con un callback queue donde las llamadas a funciones async se guardan en dicho callback y vuelven al call stack cuando terminan.
#### EcmaScript
Son los standares que deben manejar los engines de javaScript para manejar compatibilidad de las paginas entre distintos engines y que no sea muy distinto.
>[!Advise]
>Utilizar *caniuse* para ver si una funcion puedo usarla en un browser o no. Lo importante es saber que usa mi usuario para usar lo correcto

#### Dom y CCSOM
Es un arbol de interaccion que usa js para interactuar con html(DOM) y CSS(CCSOM)
###### "Observabilidad en front"
- Amplitude: Analiticas de usuario
- BrowserSTack: Testing entre browser
- Google analytics: Analiticas de usuario
### Performance en frontend
Mientras mas tarda en cargar la pagina mas gente se va de la misma. Las mediciones son:
##### Web vitals
- **Time to first byte (TTFB)**: Incluye tiempos de redirects, cache, DNS, TCP, request y response
- **Largerst contentful paint**
Puedo saber por que es que mi pagina carga lento
#### Mejorar performance
Pasos:
###### 1. Entender que hace el browser 
- Parseo
- Render
- Compilation time
###### 2. Entender el scanner 
El scanner lee el html para acomodarlo y si en el medio metes js se bloquea el main thread y hace que tarde mas en cargar
###### 3. Usar lighthouse
Es una herramienta de google que renderiza las paginas y tira metricas y mejoras posibles

## Monolitico y HTML se queda corto, Cliente servidor no alcanza
Es poco dinamico y necesitas polling para dinamismo, por ejemplo si quiero cambiar algo le tengo que pedir todo de vuelta al servidor. Tengo problemas con **asyncronismo** porque cliente servidor no va con eso
#### AJAX
Es una forma de manejar asincronismo. Trabaja con promises y se basa en traer un poco de data y trabajar con ella mientras llega el resto. Esto permite
- Modularizar el front y poder traerlo en modulos
- Puedo hacer una request a una api para manejar json y no tanto html
	- Se pide un html inicial y luego se trabaja con una api rest que devuelve json
### Frameworks de js
Permiten mejorar la experiencia de usuario y trabajar con el DOM de forma mas facil. Entre ellos se encuentra
### React js
Utiliza la idea de que JS escriba html y css. Genera su propio DOM llamado virtual DOM que se genera a partir del estado de los componentes. Como es un espejo del DOM, cuando cambia algo en el DOM original, se genera un DIF y se actualiza el virtual DOM. Basicamente *si cambio el estado cambia la UI*
Permiten la reutilizacion de componentes que permiten encapsulamiento. 

#### SPA
Se hace un get mas pesado y se devuelve HTML y el codigo react. Luego para actualizar se utiliza AJAX. 
- Mejores transiciones
- Parece aplicacion
- Se lleva mal con SEO
	- Tengo una pagina web y quiero ver como hago para que me la encuentren mas facil de forma organica. 
- Mas complejidad del lado de cliente
- Initial request carga gran parte de la app
#### Estado en react - React props
Los componentes se organizan en un arbol y los padres pueden pasarle objetos a los hijos y cada uno toma la parte que necesita
![[Pasted image 20260825210451.png]]
##### Patron flux
Es un objeto maestro que puede llamar cualquier componente o hijo para utilizar y no hacer prop drilling
![[Pasted image 20260825211039.png]]
#### Props vs state
- Props son read only y no pueden ser modificados
- state puede cambiar y puede ser async. Puede ser modificado con this.setState
El estado solo se puede manejar en el componente que lo crea o en sus hijos si se los pasa
##### React hooks - Use cases
Son funciones que simplifican los metodos que usa react. Ejemplos son:
###### 1. `useState`

**Casos de uso:**

- Manejar estado local (Manage State)
- Alternar valores booleanos (Toggle Value)
- Guardar el valor de un input (Store Input)

**Ejemplo:**

jsx

```jsx
import { useState } from "react";

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <button onClick={() => setCount(count + 1)}>
      Contador: {count}
    </button>
  );
}
```

---

##### 2. `useEffect`

**Casos de uso:**

- Traer datos de una API (Fetch Data)
- Ejecutar código cuando algo cambia (Update on Change)
- Limpiar tareas al desmontar el componente (Clean Up Tasks)

**Ejemplo:**

jsx

```jsx
import { useState, useEffect } from "react";

function Usuario({ id }) {
  const [usuario, setUsuario] = useState(null);

  useEffect(() => {
    fetch(`/api/usuarios/${id}`)
      .then((res) => res.json())
      .then((data) => setUsuario(data));

    return () => {
      // limpieza, por ejemplo cancelar una suscripción
    };
  }, [id]); // se ejecuta cada vez que cambia "id"

  return <p>{usuario ? usuario.nombre : "Cargando..."}</p>;
}
```

---

##### 3. `useContext`

**Casos de uso:**

- Compartir estado entre varios componentes (Share State)
- Manejar el tema de la app (Theme)
- Configuración global (Global Config)

**Ejemplo:**

jsx

```jsx
import { createContext, useContext } from "react";

const TemaContext = createContext("claro");

function Boton() {
  const tema = useContext(TemaContext);
  return <button className={`btn-${tema}`}>Botón</button>;
}

function App() {
  return (
    <TemaContext.Provider value="oscuro">
      <Boton />
    </TemaContext.Provider>
  );
}
```

---

##### 4. `useReducer`

**Casos de uso:**

- Manejar estados complejos (Complex State)
- Lógica de estado con múltiples acciones (State Logic)
- Manejo de formularios (Manage Forms)

**Ejemplo:**

jsx

```jsx
import { useReducer } from "react";

function reducer(state, action) {
  switch (action.type) {
    case "incrementar":
      return { count: state.count + 1 };
    case "decrementar":
      return { count: state.count - 1 };
    default:
      return state;
  }
}

function Contador() {
  const [state, dispatch] = useReducer(reducer, { count: 0 });

  return (
    <div>
      <p>Contador: {state.count}</p>
      <button onClick={() => dispatch({ type: "incrementar" })}>+</button>
      <button onClick={() => dispatch({ type: "decrementar" })}>-</button>
    </div>
  );
}
```

---

##### 5. `useCallback`

**Casos de uso:**

- Memorizar funciones para evitar recrearlas (Memoize Functions)
- Optimizar el rendimiento (Performance Optimization)
- Controlar dependencias (Dependency Array)

**Ejemplo:**

jsx

```jsx
import { useState, useCallback } from "react";

function Lista({ onAgregar }) {
  return <button onClick={onAgregar}>Agregar item</button>;
}

function App() {
  const [items, setItems] = useState([]);

  const agregarItem = useCallback(() => {
    setItems((prev) => [...prev, prev.length]);
  }, []); // la función no se vuelve a crear en cada render

  return <Lista onAgregar={agregarItem} />;
}
```

---

##### Resumen rápido

|Hook|Para qué sirve|
|---|---|
|`useState`|Manejar estado simple en un componente|
|`useEffect`|Ejecutar efectos secundarios (fetch, suscripciones, limpieza)|
|`useContext`|Compartir datos globales sin pasar props manualmente|
|`useReducer`|Manejar lógica de estado más compleja, tipo Redux|
|`useCallback`|Memorizar funciones para optimizar el rendimiento|
###### Navegacion en browser y js
Se hace por documentos en browser pero react utiliza un *react router* que permite moverme entre las paginas

### Formas de servir una app en front
###### CSR client side rendering
Es lo que hace react. Se pide javascript y luego se renderiza html en cliente
##### Static site generation
Son paginas web tradicionales estaticas pero se codean de forma dinamica. Generalmente se trabaja con CDN para devolver el html
##### Server side rendering
El servidor entrega html renderizado con css y json que corre directo en navegador. Se navega con eso.
Suele poner un servicio que interpreta js y genera html tradicional y ademas sirve la aplicacion de manera que las navegaciones se hacen desde el cliente
###### Incremental static regeneation
Elige que pagina renderizar al cliente segun lo que pida.

#### Web sockets y SSE
##### Web sockets
Conexion full duplex que se debe establecer una conexion por cliente
##### SSE
La inicia el cliente pero no garantiza que la informacion llega. No hace tantas conexiones com web sockets pero no es full duplex
#### UX responsive
- viewport -> cuanto mide una pantalla de alto y ancho
- Breakpoints -> puntos fijos de cuando cambia la logica. Se hace la logica para cada viewport y asi la UI es responsive
- Mobile first -> El breakpoint es XS
- Media query -> cuando cambia el breakpoint a otro
#### Module bundlers
Tener muchos archivos de react y que eso se transforma en lo que entienda el browser. Esta es la tarea del bundler. Permite modules modernos de js, loaders, compatibilidad cross-browser, polyfills (hace que algo que no funcione en un browser funcione igual) minifiying, uglifiying y hot reload
##### CORS
Feature de los browsers que pide un checkeo de que realmente se puede pedir un determinado recurso. 
##### Flujo

**1. JavaScript hace una llamada XHR cross-domain**

**2. ¿Es GET o HEAD?**

- **Sí** → ¿Hay headers HTTP custom? _(ir al paso 5)_
- **No** → ¿Es POST?

**3. ¿Es POST?**

- **No** → Hacer llamada OPTIONS al servidor con todos los detalles custom (_preflight_)
- **Sí** → ¿El content-type es estándar?

**4. ¿El content-type es estándar?**

- **No** → Hacer llamada OPTIONS al servidor (_preflight_)
- **Sí** → ¿Hay headers HTTP custom?

**5. ¿Hay headers HTTP custom?**

- **Sí** → Hacer llamada OPTIONS al servidor (_preflight_)
- **No** → Hacer la XHR real directamente

**6. Tras el preflight: ¿el servidor respondió con los headers `Access-Control-*` apropiados?**

- **Sí** → Hacer la XHR real
- **No** → ERROR

---

##### Dos caminos posibles

###### 🟢 Path of standard latency (camino verde)

Se toma cuando la petición **no requiere preflight**: es un GET/HEAD simple, o un POST con content-type estándar y sin headers custom. En este caso el navegador va directo a "Make actual XHR" sin latencia extra.

###### 🔴 Path of added latency (camino rojo)

Se toma cuando la petición **sí requiere preflight**: no es GET/HEAD ni POST estándar, el content-type no es estándar, o hay headers HTTP custom. El navegador primero hace una llamada **OPTIONS** al servidor, y solo si la respuesta incluye los headers `Access-Control-*` correctos, procede con la petición real. Si no, se produce un **ERROR**.

---

### SSR vs CSR
<table>
  <thead>
    <tr style="background-color:#00b894; color:white; text-align:center;">
      <th><b>Aspecto</b></th>
      <th><b>SSR</b></th>
      <th><b>CSR</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><b>Generación de la vista</b></td>
      <td>Servidor</td>
      <td>Cliente</td>
    </tr>
    <tr>
      <td><b>Stream (dato que se transmite)</b></td>
      <td><i>HTML</i></td>
      <td><i>JSON (o XML) + js que use los hooks para pedir datos o cree el HTML a partir de los datos</i></td>
    </tr>
    <tr>
      <td><b>Tiempo de carga inicial</b></td>
      <td>Rápido (HTML ya renderizado)</td>
      <td>Lento (espera a que cargue todo el JS)</td>
    </tr>
    <tr>
      <td><b>Procesamiento</b></td>
      <td>• Mayor en Servidor<br>• Menor en Cliente</td>
      <td>• Mayor en Cliente<br>• Menor en Servidor</td>
    </tr>
    <tr>
      <td><b>Uso de memoria</b></td>
      <td>• Mayor en Servidor<br>• Menor en Cliente</td>
      <td>• Mayor en Cliente<br>• Menor en Servidor</td>
    </tr>
    <tr>
      <td><b>Lógica de interacción</b></td>
      <td>Servidor</td>
      <td>Cliente</td>
    </tr>
  </tbody>
</table>
# React
Trabaja del lado del cliente (el navegador). Es una biblioteca que crea interfaces de usuario declarativas y basadas en componentes. 
### DOM
Es una representacion estructurada de un HTML o un XML en forma de arbol. Permite al desarrollador interactuar con la estructura de una pagina de forma dinamica, creando, modificando y eliminado elementos y al mismo tiempo, *reaccionando a elementos*
### Caracteristicas
- **Componentes**: bloques reutilizables de codigo
- VirtualDom: Es una copia del DOM en memoria
- Trabaja en el lenguaje **JSX**
#### Componente
Es una pieza de la UI que tiene su propia apariencia y logica. Puede ser desde un boton como puede ser toda la pagina. En el codigo es una funcion de js que devuelve _markup_.
```jsx
function myButton{
	return(
		<button>Soy boton</button>
	);
}
export default myButton;
```
Es decir una funcion javaScript que devuelve un HTML.
#### Virtual DOM
Es una copia en memoria del DOM que esta en el navegador. Es una copia que se tiene en JS para hacer actualizaciones mas rapidas. Es una abstraccion mas ligera. La idea princpal de esta ligerez recae en que ante un cambio no se vuelve a renderizar el DOM por completo sino que se espera a que se realize el cambio y solo se vuelve a renderizar esa parte. Esto se hace mediante la **reconciliacion**.
# Guía paso a paso para crear una SPA con React y Create React App

  

## ¿Qué es React y qué es una SPA?

  

React es una **librería de JavaScript** creada por Facebook para construir interfaces de usuario de manera eficiente. En React se construyen **componentes** (piezas reutilizables de UI) que se combinan para formar la aplicación. Una **Single Page Application (SPA)** es una aplicación web donde solo se carga una página HTML inicial y luego React actualiza el contenido dinámicamente sin recargar todo el navegador. En una SPA solo se actualiza la parte necesaria de la interfaz (por ejemplo, cambiando el componente mostrado) sin recargar la página entera. Esto hace que la experiencia sea más rápida y fluida, ya que solo se intercambian datos puntuales con el servidor tras la carga inicial.

  

## Instalación de Node.js y Create React App

  

Para empezar con React necesitas tener instalado **Node.js** en tu equipo. La versión recomendada actual es Node **14 o superior**. Puedes descargarlo desde [nodejs.org](https://nodejs.org/). Una vez instalado Node.js se incluye **npm** (el gestor de paquetes de Node).

  

La forma más sencilla de configurar un nuevo proyecto React es usar **Create React App**, una herramienta oficial que crea todo el entorno por ti. Primero, instala *Create React App* globalmente con npm (solo la primera vez) ejecutando en la terminal:

  

```bash

npm install -g create-react-app

```

  

Luego crea tu aplicación y entra en la carpeta creada:

  

```bash

npx create-react-app mi-aplicacion

cd mi-aplicacion

npm start

```

  

Esto abrirá `http://localhost:3000` en tu navegador con la app funcionando.

  

## Estructura de carpetas y archivos

  

```

mi-aplicacion/

  README.md

  node_modules/

  package.json

  public/

    index.html

    favicon.ico

  src/

    App.css

    App.js

    index.css

    index.js

```

  

- **node_modules/**: dependencias instaladas por npm.

- **public/**: contiene el HTML principal (`index.html`) y archivos estáticos.

- **src/**: código fuente de React (componentes, hooks, etc.).

- **index.js**: punto de entrada donde React renderiza la app.

- **App.js**: componente principal.

  

## Componentes funcionales

  

Un **componente** es una función que devuelve JSX:

  

```jsx

function Bienvenida(props) {

  return <h1>Hola, {props.nombre}!</h1>;

}

export default Bienvenida;

```

  

## JSX

  

JSX es una extensión de JavaScript que permite escribir HTML dentro del código:

  

```jsx

function Saludo(props) {

  return <h1>¡Hola, {props.nombre.toUpperCase()}!</h1>;

}

```

  

- Se usan llaves `{}` para incluir expresiones JS.

- Atributos en camelCase: `className` en lugar de `class`.

- Todas las etiquetas deben cerrarse (`<img />`).

  

## Props

  

Las **props** son datos que los componentes reciben del padre:

  

```jsx

function TarjetaUsuario(props) {

  return (

    <div>

      <h2>{props.nombre}</h2>

      <p>Edad: {props.edad}</p>

    </div>

  );

}

```

  

Se usan así:

  

```jsx

<TarjetaUsuario nombre="Ana" edad={30} />

```

  

## Estado (useState)

  

El **estado** guarda valores que cambian con el tiempo:

  

```jsx

import { useState } from 'react';

  

function Contador() {

  const [count, setCount] = useState(0);

  

  return (

    <div>

      <p>Has hecho clic {count} veces</p>

      <button onClick={() => setCount(count + 1)}>Clic</button>

    </div>

  );

}

```

  

## Eventos

  

React usa camelCase (`onClick`, `onChange`) y se pasan funciones, no strings:

  

```jsx

function Boton() {

  function manejarClick() {

    alert("¡Haz hecho clic!");

  }

  return <button onClick={manejarClick}>Pulsa aquí</button>;

}

```

  

## useEffect (ciclo de vida)

  

`useEffect` permite ejecutar código después de renderizar (efectos secundarios):

  

```jsx

import { useState, useEffect } from 'react';

  

function ContadorConTitulo() {

  const [count, setCount] = useState(0);

  

  useEffect(() => {

    document.title = `Clicks: ${count}`;

  }, [count]); // Se ejecuta solo cuando cambia count

  

  return (

    <div>

      <p>Has hecho clic {count} veces</p>

      <button onClick={() => setCount(count + 1)}>Clic</button>

    </div>

  );

}

```

  

## React Router (SPA real)

  

Instala React Router:

  

```bash

npm install react-router-dom@6

```

  

En `index.js`:

  

```jsx

import { BrowserRouter } from 'react-router-dom';

import App from './App';

import ReactDOM from 'react-dom';

  

ReactDOM.render(

  <BrowserRouter>

    <App />

  </BrowserRouter>,

  document.getElementById('root')

);

```

  

En `App.js`:

  

```jsx

import { Routes, Route, Link } from 'react-router-dom';

import Inicio from './pages/Inicio';

import Contacto from './pages/Contacto';

  

function App() {

  return (

    <div>

      <nav>

        <Link to="/">Inicio</Link>

        <Link to="/contacto">Contacto</Link>

      </nav>

      <Routes>

        <Route path="/" element={<Inicio />} />

        <Route path="/contacto" element={<Contacto />} />

      </Routes>

    </div>

  );

}

```

  

## Peticiones a APIs

  

Para traer datos de una API se usa `fetch` dentro de un `useEffect`:

  

```jsx

import { useState, useEffect } from 'react';

  

function ListaUsuarios() {

  const [usuarios, setUsuarios] = useState([]);

  const [cargando, setCargando] = useState(true);

  

  useEffect(() => {

    fetch('https://jsonplaceholder.typicode.com/users')

      .then(res => res.json())

      .then(data => {

        setUsuarios(data);

        setCargando(false);

      })

      .catch(err => console.error(err));

  }, []);

  

  if (cargando) return <p>Cargando...</p>;

  

  return (

    <ul>

      {usuarios.map(u => (

        <li key={u.id}>{u.name}</li>

      ))}

    </ul>

  );

}

```

  

## Organización recomendada del proyecto

  

```

src/

  components/   # Componentes reutilizables

  pages/        # Componentes por ruta

  api/          # Llamadas a APIs

  hooks/        # Hooks personalizados

  App.js

  index.js

```

  

**Consejos finales:**

- Divide tu app en pequeños componentes.

- Usa props para pasar datos y `useState` para manejar cambios.

- Usa `useEffect` para efectos secundarios y peticiones.

- Organiza carpetas por función o tipo.

- No recargues la página; React Router controla las rutas.

  

¡Listo! Ya tienes una SPA básica con React.
46:54

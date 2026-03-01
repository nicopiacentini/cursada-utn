# CSS en JS
Es un patron donde el CSS se crea en js y no en un archivo aparte con referencia a classname. Existen 2 bibliotecas para hacer esto:
- emotion/react. Se puede usar con react o con el framework. Trabaja con modulos separados
- Styled-components. Esta todo en un unico paquete e inyecta sus estilos automaticamente. Se encarga de realizar los nombres y estilos que se pisan. Si el componente no se usa, se eliminan sus estilos. Tiene mantenimiento sencillo porque el estilo esta en el componente.
# UseContext
Pasar props es una buena forma de pasar datos a traves del arbol de la ui. Sin embargo, si el arbol es muy grande y quizas tengo que pasar props infinitamente es complicado o puede provocar prop drilling, es decir, que componentes hacen pasamanos de props.
Entonces se usa context: que el componente padre proveea datos a todo componente bajo el. Son 3 pasos:
1. Crear contexto -> es el que tiene definido funciones y estados
	```js
		import {createContext} from 'react'
		export const levelContext = createContext({}) //inicializo con objeto vacio
	```
2. Proveer contexto -> desde el componente que especifica o manda los datos
	```js
		import { LevelContext } from './LevelContext.js';

	export default function Section({ level, children }) {
	  return (
	    <section className="section">
	      <LevelContext.Provider value={level}>
	        {children}
	      </LevelContext.Provider>
	    </section>
	  );
	}

	```
3. Usar contexto -> desde los componentes hijos para actualizar estados, etc.
```js
import { useContext } from 'react';
import { LevelContext } from './LevelContext.js';

export default function Heading({ children }) {
  const level = useContext(LevelContext);
  // ...
}

```

#### Criterio
No siempre conviene usar un context, a veces existen problemas muy simples que se resuelve con props y context esta de mas.

# Custom hooks
Son cuestiones de logica de negocio que se repiten constantemente que se resuelven con funciones personalizadas. Permiten compartir logica con el estado pero no el estado. Cada llamada de hook es independiente. **Cada hook vuelve a correr cada vez que se renderiza el componente**
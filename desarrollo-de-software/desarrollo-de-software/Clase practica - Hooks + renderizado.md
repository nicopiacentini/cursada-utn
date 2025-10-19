### Componente de clase
Es una forma tradicional de hacer componentes previo a los hooks
```js 
class a extends Compoonent{} render(){}
```
## Arbol de renderizado
Esta constituido por los componentes renderizados. Un componente padre contiene a sus hijos y los va renderizando, que a su vez renderiza a sus demas hijos.
#### Renderizado condicional
El componente padre elige renderizar o no a un hijo segun un if. Se puede renderizar html de forma condicional con js
```jsx
return(
	<li className = "item">
		{isPacked ? name + ok! : name }
	</li>
)
return(
	if (isPacked){
		<li className = "item">name + ok!</li>
	}else{
	<li className = "item">name + ok!</li>
	}
)
return(
	<li className = "item">name {ispacked && true} </li>
)
```

## Hooks
Es una funcion de js que usa caracteristicas de react. Solo se llaman en componentes funcionales no en superior
#### Hooks de estado
El estado permite que un componente recuerde informacion. Suelen suar `useState` o `useReducer`
#### Hook de efecto
En base a un monitoreo de variable o estado, se ejecuta un cierto bloque de codigo. `useEffect`
#### Hooks de referencia
Permite guardar valor o referencia a un componente viejo y su renderizado
#### Hooks de contexto
Permite que un componente reciba informacion de cualquier lado. Se va a crear un contexto suscribible por cualquier componente con variables par todos
#### Hooks de performance
Omite el trabajo innecesario mediante cache.
### El estado o State
Es un objeto que representa los datos dinamicos de un componente. Contiene la informacion que puede cambiar con el tiempo y que al cambiar, lo vuelve a renderizar.

### UseState
Define un estado en un componente
```js
const [contador, setContador] = useState(0);
```
Contador es la variable del componente
### UseEffect
```js
useEffect(() => {
..//codigo
}, [dependencias])
```
Las dependencias son los componentes o elementos que al cambiar hacen que se ejecute el useEffect. Si la lista esta vacia, pedimos que solo se ejecute cuando se renderiza al componente.
En el array de dependencias de un `useEffect` en React se deben incluir todas las variables, estados, props o funciones que se usen dentro del efecto y que puedan cambiar con el tiempo. En otras palabras, todo lo que el efecto “observe” y dependa de su valor para volver a ejecutarse. No se deben incluir constantes, valores que nunca cambian, ni funciones, objetos o arrays definidos dentro del propio componente a menos que estén memorizados con `useCallback` o `useMemo`, ya que se recrean en cada render y provocarían ejecuciones innecesarias del efecto.
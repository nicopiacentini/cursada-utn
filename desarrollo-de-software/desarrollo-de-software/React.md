Web tools -> `ctrl + shft + i`
Es como el modo _debug_ del navegador
___
#### Network
Muestra los pedidos http realizados a lo largo del tiempo. Tambien muestra archivos de codigo minificados (sacando comentarios y nombres largos para que ocupe menos espacio) y uglificados (para que sea dificil de entender)
#### Almacenamiento o Aplicacion
Muestra el listado de todas las cosas que en parte se estan guardando en el cliente como por ejemplo:
- cookies
- session storage
- local storage
## Elements en el navegador y console
Es un DOM representado como html que se le puede consultar y *tratar como objetos*. Para trabajarlo puedo seleccionarlo y mandarle mensajes con `$0` en la consola. De esta forma puedo hacer `$0.getAttribute("class")`.
En ultima instancia la consola, los elementos y hasta el dominio estan disponibles en el navegador y pueden ser modificados desde los *web tools*. Esto, sin embargo, *solo afecta a este usuario en especifico, no a todos*. Esto es perjudicioso quizas no para el usuario sino para terceros que consuman de dicha misma sesion. 
La conclusion es que _TODO LO QUE SE ENVIA DESDE EL CLIENTE ESTA NO CHEQUEADO_. Las validaciones del lado del cliente pueden modificarse pero del lado del servidor **siempre** hay que validar.
### Elementos o componentes
Cada uno tiene una parte interna, un *padding* o borde y un margen o parte externa. Se recomienda NO PONER LOS ESTILOS DENTRO DE ESTE. Existen componentes dentro de otros.
##### Atributos
- id: son para identificar al elemento como tal
- name: son especificamente para inputs
#### Styles o estilos
Caracterizan al elemento o componente. Lo recomendable es declararlos en la clase y asociar luego la clase al componente.
##### Fetch
Es una funcion que le hace un get a un endpoint de la forma `fetch("http://dominio:puerto/api")`.
## Manejo de eventos
Es una de las formas en la que el codigo js interactua con el html. Se maneja a partir del DOM. Lo que se hace es tomar el elemento y agregarle comportamiento mediante el metodo `addEventListener` o con `onClick`
```js
objeto.addEventListener("nombreEvento", () => {...})
objeto.onClick = () => {console.log("fue presionado")}
```
Ahora cada vez que se dispare el evento *onClick* se imprime fue presionado por pantalla.
Cada uno de estos agrega un evento nuevo y una consecuencia nueva ante la accion pedida.
Basicamente esta cumpliendo con la funcion de un **callback** ya que al finalizada la operacion se ejecuta el callback pero no se cuando se va a realizar la operacion. Esto es una *inversion de control*.
###### OnKeyPress
Es otra forma de setear un callback cuando se presiona una tecla. `objeto.onKeyPress()`
# React
El servidor directamente manda al cliente una app react que el cliente ejecuta. Entonces, necesariamente necesito un servidor para servir el codigo y poder probarlo. Dicho codigo se va a ejecutar en el cliente por cada sesion o *cliente*.
Esta es la idea base de **cliente pesado** donde el cliente ejecuta codigo, o en este cado, la app react.
#### Index.js
Es el archivo de entrada que sirve para cargar a react y empieze a funcionar
```js
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(`
  <React.StrictMode>
    <App />
  </React.StrictMode>
`);
reportWebVitals();
```
Cuando react Carga, lo hace sobre la etiqueta *root* del *index html* que es un html base, de entrada sobre el que trabaja react.
#### App.jsx
Es un archivo js de react. Como react es un framework para js se encarga de generar nueva vista (en html y css), responder y ejecuta a eventos (en javascritp) y ejecutar logica de dominio (en javaScript).
```js
import logo from './logo.svg';
import './App.css';
import Conversor from './Conversor';

function App() {
  return (// Esto es meter html en js para que puedan ser renderizado
    <div className="App">
      <header className="App-header">
        <Conversor />// esto es una funcion declarada en otro lado
      </header>
    </div>
  );
}

export default App;
```
##### .jsx
Son tipos de archivos de react que soportan estructuras de js y varias estructuras de html. No solo permite html mezclado con js sino que ademas puede llamar otros componentes, funciones o estructuras que sean compatibles.
### Componente react
Se define a partir de una funcion que retorne html de la forma:
```jsx
function App(){
return (// Esto es meter html en js para que puedan ser renderizado
    <div className="App">
      <header className="App-header">
        <Conversor />// esto es una funcion declarada en otro lado
      </header>
    </div>
  );
}
```
Puede anidar html dentro de si llamando componentes dentro de otros.
Devuelve un html que representa a la nueva parte de la vista. Ademas toma un parametro (el diccionario props) o ninguno. Los nombres de las funciones empiezan con mayusculas.
##### Funcion componente
Puedo poner logica dentro pero se ejecuta una unica vez, solo cuando se carga el componente. Ademas, el cambio de estado interno implica que el componente se vuelva a renderizar. Agregando estado, los html son dinamicos y se renderizan ante cambio de estado. Esto puedo hacerlo con:
```jsx
function App(){
	const [millas, setMillas] = useState()
}
```
Cuando declaro estado interno me dan getter y setter para cada atributo.
##### onClick en html
Es basicamente un argumento que tiene codigo en js
```js
function convertir(){
	setKilometros(millasAKilometros(Number(millas)))
}
onClick = {convertir}
```
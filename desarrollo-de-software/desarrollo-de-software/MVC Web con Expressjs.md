## MVC tradicional
Separa claramente los componentes en
- Modelo -> con logica de negocio es actualizado y consultado por el **controller** y notifica de cambios a la **view**
- Controller -> Recive eventos de la vista, la actualiza a ella y al modelo. A este ultimo tambien lo consulta
- View -> recibe actualizaciones del controller y envia eventos al mismo. El modelo le notifica de cambios.
### MVC Web
Tiene problemas con el MVC tradicional que era pensado para correr en una sola computadora. Como Web corre en cliente y servidor tiene estos problemas:
- La presentacion o view esta distribuida en el cliente y en el servidor.
- El model corre en el servidor
- El cliente no puede recibir mensajes del servidor sin peticion previa
Entonces la relacion cambia a la siguiente:
- Controller -> Actualiza y consulta datos del modelo y retorna vistas a la view.
- View -> envia consultas y actualizaciones al controller que responde con la vista a presentar.
- Model -> recive actualizaciones del controller y retorna datos al mismo
#### Tecnologias
Algunas corren en el lado del servidor (server-side) y otras en el cliente (client-side) o navegador. Entonces el servidor tiene mas libertad para ejecutar pues no debe respetar las reglas del cliente. Luego surgen una amplia gama de lenguajes, bibliotecas, herramientas y frameworks para usar. Son mas dificiles de aprender por una curva de aprendizaje mayor
### Express
Framework liviano (solo sirve para comunicacion HTTP y programacion web server-side). Puede adaptarse a cliente liviano y pesado. No fuerza MVC pero con el codigo correcto es super implementable. La gestion de dependencias depende del programador pero es mas facil de aprender.

```node
const express = require('express');

  

const app = express();

const port = 9000;

  

app.get('/',(req, res) => {

res.send('hola pa, todo bien?')

});

  

app.listen(port, () => {

console.log(`servidor escuchando en el puerto ${port}`)

})

  

app.get('/mihtml',(req, res) => {

const nombre = req.query.nombre || 'papu' // html dinamicmo para pasar parametros

res.send(`

<h1>BON DIA ${nombre}</h1> 

<p>aca escribo otra cosas pero mas chica, jaja mira un HTML</p>

`)

});
```

#### Plantillas
Son un formato intermedio entre js y HTML que permiten generar vistas mas facilmente. Permiten legibilizar y reutilizar codigo. Son archivos aparte para generar `HTML`.
El *template engine* es el generador automaitco de htmls que voy a usar.
##### Handlebars
Es un renderizador de plantillas. 
```node
app.engine('hbs', engine({defaultLayout: false}));

app.set('view engine', 'hbs')

app.set('views', './views'); // setea carpeta donde va el hbs a renderizar
```
Ahora para renderizar en la res mando:
```node
res.render('bienvenida', {nombre})
```
#### Redirecciones
```node
app.get('/', (req, res) => {
	res.redirect('/bienvenida')
})

app.get('/bienvenida'.....)
```
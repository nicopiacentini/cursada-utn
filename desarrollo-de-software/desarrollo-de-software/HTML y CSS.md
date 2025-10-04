# HTML (HyperTextMarkupLanguage)
Es un lenguaje de marcado de texto. Indica de que forma y como debe estructurarse el texto en una pagina web. No es un lenguaje de programación. Luego va a ser modificada con estilos con CSS. La idea principal es seguir este modelo de cagas dentro de otras
![[Pasted image 20251004091740.png]]
Cada `<palabra>` es una etiqueta para que se trate de una forma determinada ese texto. generalmente se abren y cierran y en el medio pongo el contenido deseado.
Las etiquetas se abren con `<etiqueta>` y cierran con `</etiqueta>`. Todo lo que este por fuera de etiquetas no se respetan como tal y no tienen estructura.
## Etiquetas
Cada etiqueta trata de forma distinta cada palabra y le pone tipografias y tamaños y lugares distintos. Cada una puede tener hijos (contenidos dentro de el) y padres (etiquetas que la contienen)
##### h1
Sirve para poner un titulo. H1 viene de heading 1 que seria como titulo 1.
```html
<h1>Bon dia!</h1>
```
##### p
Sirve para hacer parrafos y titulos dentro de el
```html
<p>
	<h1>Hola soy un titulo</h1>
	<section>Soy una seccion</section>
</p>
```
##### href
Sirve para poner links con determinados nombres
```html
<a href="">Este es un link</a>
```
Las etiquetas tienen ciertos atributos modificables. Aca por ejemplo tengo que poner en href la url de donde quiera ir.
##### html
Dentro de esta se ponen demas etiquetas.
```html
<html>...</html>
```
##### Header y Footer
Sirven para encabezado y pie de pagina
```html
<header>Soy un header</header>
<footer>Soy un footer</footer>
```
##### Main
Sirve para el contenido principal para la pagina
```html
<main>Soy el papu</main>
```
##### br
Sirve para saltos de linea
```html
<p>
	Soy un parraffo <br>
	Salte de linea
</p>
```
##### Listas ordenadas y desordenadas
###### ol
Es la lista ordenada
```html
<ol>
	<li>item1</li> 
</ol>
```
`<li>` Son la lista de elementos que tambien pueden ser otros tags
###### ul
Es la lista ordenada
```html
<ul>
	<li>item1</li> 
</ul>
```
##### Formularios e inputs

```html
<form action="">
	<input type="text">
	<input type="email">
</form>
```
#### Style
Es un atributo dentro de cada etiqueta que sirve para darle estilo a la misma. Es una forma rapida de poner css dentro de html. Luego se convirtio en una etiqueta especifica y hoy en dia estan en un documento aparte `.css`
```html
<h1 style="color: red; font-size=60px;"> Titulo </h1>
```
#### Clases
Es forma de darle styles a determinadas etiquetas de manera generica. 
```html
<style>
	.fuenteRoja{
		color:red;
		
	}
</style>

<h1 class="fuenteRoja"></h1>
```
#### id
Referencia a un elemento de manera unica.
```html
<style>
	#titulo-clase{
		color:red;
		
	}
</style>```html


<h1 id="titulo-clase">aaaaa</h1>
```
Sirve tambien para luego recojerlo del lado de js.
# CSS
Para referenciar al html tengo que poner en el head de html una etiqueta link de la forma:
```html
<html>
	<head>
		<link rel="stylesheet" href="styles.css">
	</head>
</html>
```
Dentro de cada etiqueta html
##### Display Block
Hace que una etiqueta ocupe el 100% de la pantalla. Por ejemplo los parrafos
##### Display in-line
Hace que la etiqueta ocupe solo lo que necesita de la pantalla. Por ejemplo los bold o <b></b>`<b></b>`
#### Especificidad
Los estilos se aplican en cascada y si 2 se superponen sobre un mismo elemento predomina el que esta mas abajo. Sin embargo Existen niveles de especificidad que predominan por sobre el orden: Un id es mas especifico que una clase que es mas especifica que un tag general. Entonces si pongo un id y luego juego con clases y tags, predomina el estilo del id por tener mas peso.
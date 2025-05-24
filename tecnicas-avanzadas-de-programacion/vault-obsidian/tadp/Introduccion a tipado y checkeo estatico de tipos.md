# Sistema de tipos
Chequea los tipos en base a la definicion operacional
## Tipo
Existen muchas definiciones. Dependen del lenguaje o el contexto utilizado. La definicion de un entero para haskell no es la misma que para C.

##### Metainformacion
Informacion sobre los tipos -> que valores toman, operaciones que aceptan.
### Definiciones
#### Definicion operacional
Es un conjunto de operaciones asociados a un conjunto de valores. Es la definicion mas genereal. Aca el error de tipos es que trate de aplicarle una operacion a un tipo que no la entiende
#### Definicion Rerpresentacional
Como esta representado a nivel computacional. Refiere a que un entero, por ejemplo, son 8 bytes. A alto nivel, no importa. 

#### Definicion Estructural
Que representacion o condiciones estructurales debe cumplir la cosa que analizo para ser considerado como tal. Es una estructura de datos con una forma especifica. Aca el error de tipos es esperar algo de un tipo que no es

### Notacion
Siempre existen los tipos de datos
#### Explicita
Aca puedo manejar la idea de inferencia, porque puedo no escribir el tipo de algo pero se infiere. Cualquier referencia a cualquier cosa tiene que tener su tipo establecido. *este es el tipo de esta cosa*. En lenguajes que manejan inferencia, surge la idea de que cualquier tipo de tipado que haga, debe ser un caso especifico de la inferencia realizada:
```haskell
f :: int -> int
f a = a
-- aca la definicion de f es un caso especifico de f :: x -> x
```

#### Implicita
El tipado esta ahi, pero no escribo nada al respecto.

##### Lenguajes dinamicos o sin tipado y lenguages con tipado estatico
El lenguaje dinamico no te pide que declares el tipo de la variable. Entonces como no tengo que operacion puedo hacer sobre el valor que me llega, es dificil de seguir y debuggear. El problema de los lenguajes dinamicos es que se pierde informacion. Los lenguajes tipados agregan mas informacion que necesito.

### Chequeo
Antes de hacer cualquier cosa, se fija de que se pueda realizar la operacion

#### Eager
Es ancioso. Chequea los tipos previo a la ejecucion de la operacion. Si hay error, mato el programa

#### Lazy
Es vago. Chequea los tipos en el momento. Si entera del error en el momento

###### Tipado fuerte -> notacion explicita + eager check
###### Tipado debil -> notacion implicita + lazy check


### Conformacion
Como estan conformados los tipos

#### Estructural
Me importa que forma tiene el tipo, no me importa el nombre del tipo. Me importan los mensajes que pueden recibir.

#### Nominal
Yo conozco las cosas a partir de un nombre, describo a un tipo segun el nombre con que lo conozco

## Chequeador de tipos
Puede ser que el error sea del programador por mandar mal el mensaje por estar mal escrito, falta de parametros, etc. Pero al mismo tiempo puede ser que no defini el mensaje aun y lo voy a hacer mas adelante. Entonces el **chequeador de tipos** se fija que lo declarado concuerde con lo que se defina en el futuro.

##### El chequeador aproxima
Nunca es perfecto, es matematicamente imposible. Se da que hay programas validos cuando no lo son y marco programas como invalidos cuando en realidad son validos. Estos son errores de tipo 1 y tipo 2. Para saltear ese problema, se saltea la definicion de tipos y se cubren las salvedades para evitar que rompa todo. Esto exede al chequeo de tipos.


# Scala
Modificacion de objetos segun el tipado
Cada vez que referencio a un objeto necesito indefectiblemente asignarle un tipo. Pero esto rompe el polimorfismo. Entonces Para que pueda existir polimorfismo **ambos objetos deben compartir un tipo de objeto** a traves de los mecanismos necesarios.

##### Ejemplo 
```scala
class Guerrero(val potencialOfensivo : Int = 20){
	var energia: Int = 100
	var potencialDefensivo: Int = 10
	def atacaA(otro: Guerrero): Unit = {
		otro.recibiDanio(danio = potencialOfensivo)
	}
	def recibiDanio(danio:Int): Unit = {
		energia -= (danio - potencialDefensivo)
	}
}
```
`var` es una variable mientras que `val` es una property. En Scala TODA REFERENCIA A UN OBJETO ESTA TIPADA. La funcion, el guerrero, las variables de instancia, TODO TIENE TIPO.
`Unit` -> es el tipo sin informacion. Toma un unico valor. Sirve como el void y refiere a que no retorna nada. Al mismo tiempo puedo inferir el tipo del parametro si tiene valor por defecto o se declara en el momento, como paso con `potencialOfensivo` recien o como en este caso:
```scala
var miPalabra = "hola"
```
Mismo caso con el `Unit` que "devuelve" `atacaA`. Scala tambien maneja el `this`(self) implicito. 

#### Subtipado
Es una relacion entre 2 tipos. Sirve  para manejar el polimorfismo. En la definicion de los tipos en los metodos puedo ampliar la definicion. Puedo darle un nombre NOMINAL a 2 clases distnintas sin que hereden uno del otro. Surge la idea de ***interface***. Puedo crear un **trait** para que absorba ambas clases

```scala
trait Defensor{
	def recibiDanio(danio: Int): Unit
}
class Guerrero(potencialOfensivo: Int = 20)extends Defensor{
	def atacaA(otro: Defensor): Unit = {
		otro.RecibiDanio
	}
	def recibiDanio(cantidad: Int): Unit = {
		...
	}
}
class Muralla extends Defensor{
	def recibiDanio(cantidad: Int): Unit = {
		...
	}
}


```
Ahora, si puedo manejar el polimorfismo y no tengo errores de tipados

#### Multiple dispatch
Lo que identifica a un metodo como unico es el nombre de metodo, la aridad de los parametros y el tipo de cada uno de los parametros. Entonces, puedo tener 2 metodos con el mismo nombre. Es distinto a la sobrecarga de tipos

Lo que me importa del objeto es lo que se que puedo hacer con el, no todo lo que puede hacer.

#### Casteo
Como vimos, si le mando un mensaje a un objeto de una clase que no entiende rompe. Si pajaro hereda de objeto, no puedo decirle a una instancia de objeto `.volar()`porque no sabe si el objeto realmente es pajaro. Entonces tengo la salvedad `asInstanceOf[Class]` y entonces puedo castear como necesite.
```scala
alumnos.filter(alumno => alumno.asInstanceOf[Alumno].aprobo)
```
Como alumno es un objeto para que filter sirva para cualquier tipo de objeto, necesito esta salvedad.

#### Tipado estructural
Puedo definir funciones en funcion de la forma que tiene que tener mi cosa.
```scala
class Guerrero{
	def atacaA(otro: {def recibiDanio(danio: Int)}){
		otro.recibiDanio(potencialOfensivo)
	}
}
```
La estructura de recibiDanio es la interpretacion tipada requerida para bypassear el checkeo de tipos.
checkeo Nominal -> mira que cumplas el contrato. Diche explicitamente que puede ser usado de tal forma.
checkeo Estructural -> cuaalquier cosa que tenga la forma correcta puede pasar, independientemente de que el nominal no cumpla. Pierde la idea de compromisos.

###### Uso de Type
Como esto es bastante engorroso puedo usar type de la forma
```scala
type Atacable = {def recibiDanio(danio: Int)}
class Guerrero{
	def atacaA(otro: Atacable){
		otro.recibiDanio(potencialOfensivo)
	}
}

```

Ruby es un lenguage de scripting dinamico -> puedo abrir clases como quiera, sobreescribiendo metodos.

Es muy bueno para instrospection y self-modification
No puedo hacer un diagrama de clases estatico porque es muy dinamico. Ocurren problemas de loading class order.


### Las singleton class se heredan
Lo que busco es que las clases hereden metodos de clase -> por ejemplo *#Object* hereda de *#BasicObject* para que Object tenga los metodos de clase de Basic object

![[Screenshot From 2025-04-26 09-20-00.png|600]]

Las singleton de los objetos permiten tener sus propios metodos sueltos.
#### Method Lookup -> 1 flecha verde, n flechas azules.
- Excepcion en el lookup cuando se llega a *BasicObject*, que hereda de **nil** que es un objeto, si no encuentra el metodo ahi, entonces no existe dicho metodo.
### Por que nil
No tiene razon, cualquier objeto que no tenga flecha roja me sirve.

# Method missing
- Lo que pasa cuando **LE MANDO UN MENSAJE A UN OBJETO QUE NO ENTIENDE**
- Es un **metodo** que esta en Basic Object
- Tira una excepcion de no method error
Como es un metodo -> puedo manejarlo para que haga lo que yo quiera. Puedo overridearlo donde me parezca para que cada clase maneje los no method error como parezca.

#### Ahora por que querria seguir manejando un programa que se cayo?
**PORQUE PUEDO INTERVENIR**. Puede venir un objeto que *capture la excepcion* y me salve del error.

### Peligro: atrapar la excepcion
Si lo hago para todos los objetos puedo entrar en un loop infinito de excepciones, tries y catches.

### Quienes catchean las excepciones
Si yo hago
```ruby
unidades.each{ |u| u.comePollo}

#si atila esta dentro de unidades se va a ejecutar esto en el stack
atila.comePollo

```

Ahora si atila no entiende el mensaje, se lanza una excepcion, el que debe catchearla es unidades.

##### Llamado de method missing
```ruby
atila = Guerrero.new
atila.send(:method_missing, :metodoQueAtilaNoEntiende)
```

#### Catcheo de method_missing
```ruby
private def method_missing(name, *args)
	"hola"
end
```
- El *\*args*  me sirve para decir que no me importa la aridad del metodo, si no lo encuentra, tira este mensaje.
- El *name* es el nombre del metodo y puedo jugar como si fuese un argumento del metodo mas

Como cualquier otro metodo tiene super que tiraria el metodo que tiene arriba en la jerarquia y normalmente me tira la excepcion

```ruby
private def method_missing(name, *args)
	if name.to_s.size > 10
		"hola"
	end
	else 
		super # con la misma cantidad de argumentos que me cayo de la llamada 
				# del que tiro el missing
	end
end
```

### Ahora, que mensajes entiende un objeto con method_missing overrideado
El atila no entiende un metodo que refiere al *method_missing* de la misma forma que los que hereda o tiene definidos. Ahora como usuario del objeto, es indiferente. Como usuario de aplicacion de esto, ES IMPOSIBLE CONCIVIR LA INTERFAZ DE ATILA PORQUE ATILA ENTIENDE INFINITOS MENSAJES.

Por esto se entiende que si hacemos 
```ruby
atila.respond_to?(:mensajeQueAtilaNoEntiende) # => false
```
La razon ->  *respond_to* me muestra los metodos que atila hereda o implementa.

Conclusion -> respond_to esta mal, que pasa si lo overrideo?

```ruby
def respond_to? (name, include_private = "false")
	if name.to_s.size>10
		true
	end
	else
		super
	end
end
```

Ahora respond_to me dice que ejecuta todos los mensajes que tienen mas de 10 caracteres.

Si me quiero olvidar del super:
```ruby
def respond_to_missing? (name, include_private = "false")
	name.to_s.size>10 || super
end
```
El respond_to_missing es usado en el respond_to y si necesito cam:method_missinbiar el respond_to, cambio este:
- El respond_to_missing me tira si entiende el mensaje, no importa donde este
- El respond_to solo me tira si el mensaje esta heredado o implementado en la clase/objeto. Este NO es usado en el lookup porque como es un mensaje, triggerea un lookup de vuelta, que triggerea el mensaje y asi en un loop infinito

Sin embargo, aun no puedo listar mensajes porque son infinitos.

### Mezcla con define_method
```ruby
def respond_to? (name, include_private = "false")
	if name.to_s.size>10
		self.classs.define_method(name) do
			@salud += name.size
		end
	end
	else
		super
	end
end
```

Ahora el method_missing me crea un nuevo metodo si el largo del nombre es mayor a 10 y crea un nuevo metodo con ese nombre que agrega 10 a salud. Este mensaje **esta dentro de atila.methods y el respond_to**.     

# Contexto o Scope de variables

```ruby
x = 10
class A
  puts x
end
# NameError: undefined local variable or method `x' for A:Class

def m
  puts x
end
m # NameError: undefined local variable or method `x' for main:Object
```
**Contexto** -> las cosas que estan disponibles en el lugrar donde estamos ejecutando.
El contexto de la definicion de un metodo es distinto al de la clase y al general. Para cambiar de contexto uso **gates** o puertas hacia los contextos. *Class, def y module* 

**Flat Context** -> me guardo el contexto donde defino las cosas. Esto se hace con closures y lambdas.
```ruby
class Clase
	y = 15
	define_method(:m) do #este imprime 15
		puts y
	end
	def m #este no imprime 15
		y
	end
end
```

**Flat Scope**-> Una clase y su instancia comparten contexto solo dentro de una closure.
```ruby
class m
	y = 15
	self.define_method(:m) do
		puts y 
		y = 1
	end
	self.new.m #imprime 15
	puts y #imprime 1
end
```
Otro ejemplo
```ruby
x = 10
A = Class.new do
	y=15
	self.define_method(:m) do
		puts "x vale #{x}"
		y = 1
	end
	puts "y vale #{y}"
end
# ACA FUNCIONA PORQUE A Y m ESTAN DEFINIDOS EN EL MISMO CONTEXTO
```
#### Variable Global
Es aquella variable que el contexto este arriba de todos, es decir, es padre o raiz y puede ser accedido desde todos los contextos.
Para acceder a contextos puedo hacer
```ruby
Module MisConstantes
	class A
	end


	class B
	end
end

#para acceder a las clases dentro de misconstantes hago
MisConstantes::A
```

**Context Lookup**-> buscar una variable en el contexto padre si no esta en el contexto actual. Buscar el contexto de un codigo es preguntar quien es *self*.
**Self Implicito**-> Es lo mismo escribir self.x a escribir x dentro de una clase u objeto, mas alla de que si x es un metodo o una variable. Primero busca que sea una variable con el **context lookup**. Si no lo encuentra hace el **method lookup**. Es lo mismo tener un objeto x a tener un mensaje x que entiende mi objeto.

Los bloques de codigo tienen contexto y se guardan segun son llamados.
### Bloque
```ruby
class A
end
x = 10 
a = A.new do # esto es un bloque y tiene el contexto de donde es creado. NO SON                #OBJETOS
	puts x
end
```

### Mandar un bloque por parametro -> objetizar bloques de codigo

```ruby
class A
end
x = 10 
a = A.new(proc do # esto es un bloque y tiene el contexto de donde es creado. NO SON                #OBJETOS
	puts x
end)
```

#### Ejecutar el bloque que me llega por parametro
```ruby
class A 
	def algo() #me mandan bloque en llamado de mensaje
		yield 
	end
end
```

```ruby
class A 
	def algo(&un_proc) #me mandan bloque en el llamado de mensaje y me lo convierte a parametro
		un_proc
	end
end
```

### instance_exec
Se usa cuando quiero tomar el contexto donde uso el bloque, no cuando fue definido



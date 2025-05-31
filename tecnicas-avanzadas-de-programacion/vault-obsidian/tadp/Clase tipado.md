```scala
var vaca: Vaca = ???
```
Esto es sintaxis de tipado que apica para cualquier tipo

#### Puedo reemplazar tipos por herencia
```scala
class Animal{
	var peso: Int = 20
	def comer = peso+=10
}
class Vaca extends Animal{
	def gritar = "muuuuuuuuu"
}
class Caballo extends Animal{}

class Lechero {
  def ordeñar(corral: Corral) = corral.animales.foreach(_.ordeñate)
}
```
var animal: Animal = Vaca() /*como una vaca entiende lo que hacer Animal porque ES un animalpuede tomar su lugar*/
```
### Sets
```scala
var animales = set(Vaca(),Vaca(),Caballo(),Granero())
```
Aca Scala define el set como un`set[Object]` porque aproxima a la clase que contenga a todos los elementos del set.
#### Tipo del set
Es necesario que todo el set sea de un tipo. En el ejemplo de animales, las vacas y el caballo son animales pero el granero no. Ahora las operaciones del set tienen sentido a traves de lo que contienen como un algo generico. Es decir, todos los elementos del set deben poder entender el mismo mensaje que les envia el set como tal. Por ejemplo filter me queda como `Set :: filter(a=>Bool): Set`. Ahora el tipo de Set es `a`, siendo a **el tipo menos generico que puede absorber los tipos de los elementos del object**.

#### Subtipo universal *Nothing*
Es un tipo que es nada. No tiene representacion. Lo puedo poner en cualquier lugar y me salvaguarda de cosas cuyo tipo no se todavia. Lo puedo poner con `???`. Como Nothing esta abajo de todo en el arbol de herencia, entiende todos los mensajes. Ahora estos mensajes no hacen nada.
- AnyVal -> valores o datos
- AnyRef -> tipos que pueden ser referenciados

#### Tipo Any
Es el tipo de los que todos los demas tipos son subtipo. Si tengo un set de any, puedo meter cualquier cosa.

### Type Bounds o Tipos parametricos
Si necesito, puedo definir el tipo de una clase cuando la creo
```scala
class Corral[T](val animales: Set[T])
```
Ahora este tipo T es un tipo demasiado generico. Logre fixear el tipo de mi corral pero ahora tengo el problema de que T es cualquier cosa. Puedo achicar su tipo con
```scala
class Corral[T :< Animal](val animales: Set[T])
```

Ahora corral solo recibe el tipo de algo que sea Menor que animal

Estos son los type bounds y limitan la inferencia de un tipo segun supertipo y subtipo:
- Upper Bound <:
- Lower Bound >:
Esto es la utilizacion de tipos variables.

#### Tipos de sets
Si yo tengo un set de animales donde solo tengo vacas y un set de  vacas puedo asignarle al set de vacas mi set de animales? En corto NO. Porque animales puede ser que en un futuro meta un caballo y rompe con la idea original de `Set[Vaca]`,

## Varianza
La forma en la que varía el subtipado de un tipo compuesto en relación a sus parámetros de tipo.

#### Invarianza
Para que un Set de algo sea subtipo de otro set de algo ambos algos deben ser equivalentes.

#### Bivarianza
Si ambos subtipos pertenecen a la misma clase raiz entonces uno es subtipo del otro.

#### Covarianza
Un tipo es subtipo de otro manteniendo la relacion de subtipado de los parametros. Si T<: U Entonces C\[T] <: C\[U]

#### Contravarianza
Si T:>U Entonces C\[T] <: C\[U]
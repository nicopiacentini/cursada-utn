en mvc, si hay interfaz, debe haber controller, no puede haber interfaz sin controller.
En diagrama de secuencia siempre se usa mvc

Modelado:
- opcion 1: actor interfaz controller modelos, con actor depende del ejercicio
- opcion 2 solo modelos
Si me esta pidiendo un actor se lo agrego con opcion 1. Sino no.
Puede existir controller sin interfas PERO NO ES CONVENIENTE


Aca NO se colocan las clases abstractas.


# Patron composite
Es un patron que sigue el modelo de un arbol con la siguente forma
![[Pasted image 20250509115616.png]]

- La relacion Composite-Componente puede ser de agregacion o de composicion. 

- Component puede ser abstracta (si solo imponen metodos) o interface(si tambien tiene atributos)
- Composite tiene como atributo el acceso o referencia a sus componentes.
Es un patron estructural porque refiere a la estructura de las clases
# Patron Singleton
Es un patron que te garantiza que dicha clase, la clase singleton, tenga una sola instancia y que todos tengan un acceso global a ella. Lo que hace es redefinir el constructor para que sea privado y crea un metodo nuevo que se llama get instance. Como la clase se autoreferencia, si la instancia unica no fue creada aun, se crea y se le devuelve esa referencia. Si la instancia ya fue creada, devuelve una referencia a la clase

```java
public class Singleton{
	private static Singleton instance = null;
	private Singleton() {}
	public static Singleton GetInstance(){
		if (instance == null)
			instance = new Singleton();
		return instance;
	}
}
```

Es un patron creacional, porque modifica como se crean las instancias de objeto. Cuando llamo al constructor, me devuelve la referencia a la 

## Principios de diseño
SOLID 
- S -> Single responsability -> cada clase tiene su propia responsablilidad. No darle cosas de mas
- O -> Open/Closed -> Es preferible tener una clase cerrada a modificarse pero abierto a la agregacion de nuevas cosas. Apunta al comportamiento. Prefiero agregar instancias que incluyan comportamiento antes que meter muchos ifs.
- L -> Liskov Sustitution -> Tengo que garantizar que las hijas de las clases puedan efectivamente tomar el lugar el padre de forma satisfactoria. Por ejemplo, si un Pinguino hereda de ave voladora pero no sabe volar, rompo est e principio
- I -> Interface Segregation -> Por cada comportamiento o conjunto de comportamientos, es preferible tener varias interfaces y que las que las hereden, las usen realmente. Esto es mejor que tener una superinterfaz con todo el comportamiento sabiendo que algunas que las clases que hereden de ella ni siquiera la van a usar.
- D -> Dependency Inversion -> Los modulos de alto nivel no depende de lo de bajo nivel pero lo de bajo nivel si puede depender de lo de alto nivel.
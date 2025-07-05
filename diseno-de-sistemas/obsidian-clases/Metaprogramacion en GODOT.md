### Uso de GODOT
Se trabaja con nodos. Son blooques de construccion fundamentales en un juego.
Tiene:
- Nombre
- Propiedades editables
- Reciben callbacks para actualizar cada fotograma -> son los metodos, logica.
- Pueden ser extendidos con nuevas propiedades y funciones -> Herencia en otras palabras.
- Puede agregar a otros nodos hijo -> Se mueven relativos a si mismos. Se propagan atributos, logica, etc.
En resumen, son objetos con atributos como tamaño, posicion, logica, etc.
Cada nodo tiene su lógica intrinseca sin tirar ningun tipo de nodo. Es decir, el comportamientdo de los nodos es dado por su tipo
##### Scripts
Puedo agregarle comportamiento a los nodos con *GDScript* 
Existen ciertos hooks
- Ready -> lo que quiero que haga el nodo cuando entra en esena
- process -> lo que quier que haga constantemente. Se ejecuta cada frame
- Uno mas que no me acuerdo que se acciona ante interaccion.
El lenguaje esta integrado al editor
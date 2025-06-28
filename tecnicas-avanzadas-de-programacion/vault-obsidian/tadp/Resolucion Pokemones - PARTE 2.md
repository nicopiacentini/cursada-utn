
Funciones -> Las puedo declarar como objetos en general con apply o con `def`
en general. La ultima opcion es dentro de la clase.
##### Agregar a la interfaz el metodo
Lo malo es que la tengo que agregar en todas las clases donde las uso


##### Crear funcion descansar de una
Es un objeto mas y lo trato como tal. No tiene interfaz ni es extensible

##### Crear objeto funcion con apply
Es mejor que la funcion porque puedo agregarle atributos y controlando un cierto **estado interno** del objeto con el que estoy trabajando. Ademas puedo ampliarle la interfaz con un `extends`

##### ¿Entonces cual elijo?
Siempre prefiero trabajar con la interfaz mas pequeña que resuelva mi problema.
El que agrega interfaz no conviene mucho y entonces me puedo quedar tanto con el objeto como con la funcion a pelo.


##### Case
Cuando agregas case en una clase agrega metodos adicionales a la clase *forzandote* a trabajar de forma inmutable. Todos los parametros de clase son *val*


#### Companion object
Es un objeto que permite operar con la clase asociada. Es basicamente poder hacer metodos y atributos de clase. Me sirve cuando no tengo clases como objetos o cuando no tengo sintaxis para metodos o atributos estaticos. **Se llama igual que la clase**.
#### Unapply
Es un metodo que *deconstruye* una instancia de una clase. Me sirve para desestructurar un patron para su mas facil legibilidad.


#### TODO
- reever clase monadas.
- reever clase practicas.

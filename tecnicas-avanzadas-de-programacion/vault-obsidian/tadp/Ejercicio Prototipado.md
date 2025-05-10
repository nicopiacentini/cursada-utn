Prototipado es una estructura de objetos donde creas objeto por objeto sin pensar en la totalidad de la clase. Luego clonas a ese objeto varias veces por cada vez que lo necesites. Evita las abstracciones que requiere una clase. Se pierde la nocion de constructores.

El problema esta en que mi objeto principal sobre el que clono todo, si cambia, cambian todos los clones. A fin de cuentas para evitar este problema, se separa este objeto para que **no sea modificable**. En resumen terminas haciendo una clase sin ser una clase.

##### Prototipado es bueno:
Cuando usas muchos singletons y/o no hay necesidad de instanciar muchos objetos. Me sirve cuando hay cosas muy especificas y el dominio se mueve a partir del movimiento de los prototipos.

##### Desarrollo del ejercicio:
Quiero poder crear un objeto u prototipo con envio de mensajes puro. Pierdo la parte estatica de las clases. Quiero poder agregarle atributos y metodos a este objeto. Asimismo quiero poder clonar este objeto manteniendo una referencia hacia el objeto original. 
Por otra parte, tambien busco que se integre con el metamodelo de ruby. Debo elegir el limite entre, eliminar las clases y dejarlas.


###### Valores Boolish
Todos los objetos en ruby pueden ser *truthish* o *falseish*. Me sirve por ejemplo por si tengo nil, es falseish y la existencia de algo es truthish.

###### Shallow copy
Me crea la copia del objeto pero pierdo la referencia -> si cambia un metodo no me queda

###### Deep Copy
Me queda la referncia guardada del prototipo del que copio y se me copian las cosas

## Patron State
Basicamente, tenes n estados dinamicos (puede cambiar) para la clase y segun cada estado ejecuto los mismos metodos pero de forma diferente. Entonces el patron State me permite *elegir la ejecucion que necesito* segun el estado en que me encuentro. Entonces tengo que ejecutar estado.handle() para cada metodo. Cada estado tiene un metodo checkChangeState para ver si debe cambiar el estado en que se encuentra el contexto actualmente. Para eso, el estado **necesariamente conoce** a su contexto.
**Se usa para hacer la misma accion de distinta manera segun el estado del objeto. Puedo cambiar el estado del objeto en tiempo de ejecucion**

![[Pasted image 20250606111015.png]]

## Patron Strategy
Basicamente, tenes distintas formas de hacer la misma cosa o ejecutar el metodo. Pero quien determina como se hace no depende de mi clase actual sino de alguien mas, un externo. Es parecido al State pero no tiene la idea de estado para elegir el metodo. Aca lo elige un externo. Este externo modifica un atributo estrategia, mediante el cual  se ejecuta uno u otro metodo.
Nuevamente, cada estrategia conoce a su contexto para poder ejecutar. **Elegir el comportamiento que va ejecutar el objeto desde afuera. NO PUEDO CAMBIAR DE ESTRATEGIA EN TIEMPO DE EJECUCION**

![[Pasted image 20250606113029.png]]

## Patron Facade
Son unas clases que abstraen logica de negocio. LLaman secuencialidad de operaciones para un negocio. Para el cliente es una fachada. Por ejemplo, cancelar una compra puede incluir actualizar una base de datos y enviar mails. Este patron ordena estas clases y metodos para abstraer logica.
El diagrama de secuencia es 
![[Pasted image 20250606114845.png]]
El diagrama de clases funciona de la forma:
![[Pasted image 20250606115136.png]]

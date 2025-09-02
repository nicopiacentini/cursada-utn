### Necesidad de uso
Originalmente toda pieza de sw que requeria una funcionalidad debia ser implementada a mano por el equipo de trabajo como una funcion. El problema es que esta no se persiste para un nuevo trabajo y debe reescribirse. 
Entonces a partir de ahi surgen las **bibliotecas** como la forma de compartir funciones y estructuras ya desarrolladas entre proyectos.
Las bibliotecas al traer funciones pueden ser utilizada en el ecosistema de un sistema, donde una biblioteca puede ser utilizada en varios subsistemas para no reescribir funcionalidades.
Las bibliotecas se compilan aparte del codigo mio pero se usan en simultaneo. Entonces, resuelven un problema de **reutilizacion de logica**
### El limite de las Bibliotecas
Las bibliotecas traen funciones y abstraen logica. Pero que pasa cuando se tienen que traer una *estructura de trabajo definida?*. Aca aparecen los **frameworks** que ademas de traer funciones son *estructuras de trabajo* que evitan que el desarrollador vuelva a pensar como estructurar determinadas tareas, como el testing.

Entonces los frameworks **deifnen una estructura, una forma de trabajar siguiendo determinados lineamientos**

#### Flujo del programa
Cuando se usan solo bibliotecas, el programador define el flujo del programa, llamados tipos de datos y debe tener en cuenta muchas mas cosas.
En cambio con frameworks se definen codigo y logica a partir de una estructura de trabajo. Luego el flujo es definido por el framework y no por el programador. Es muy rigido en ese sentido y le saca peso al programador. Generalmente tambien definen clases y metodos abstractos para guiar al programador.

##### Diferencias
- En las bibliotecas el programador define como y cuando se llaman/utilizan los componentes. En el framework el codigo es estructurado por este y el programador debe seguir dicha estructura
- Las desiciones de diseño no suelen impactar al diseño del codigo a utilizar con bibliotecas. En los framework las decisiones de diseño suelen condicionar fuertemente el diseño de codigo cliente
- Biblioteca usa control directo y framework usa control inverso


##### Framework pesado
Resuelven muchos problemas asociados a aplicaciones web. Toman mas decisiones por el programador y son mas rigidos en ese sentido (hay que seguir mucho su forma de trabajo). Suelen resolver muchos concerns por si solos y forzar al programador por ese lado.
##### Framework liviano
Solo resuelven algunas cuestiones minimas de algun concern de mi sistema pero no lo guian por completo. Suelen permitir mas flexibilidad pero requieren mas configuracion por parte del sistema puesto que no controlan todo.
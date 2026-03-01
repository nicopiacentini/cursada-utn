## Validacion e integracion de la identidad
Lo va a hacer la herramienta externa *keycloack*
### Motivos de rerenderizado de un componente react
- Por cambio de parametros del componente
- Por un `useffect`, cambio de estado puro. 
- Por un `useState`, cambio de estado impuro. Me da un estado y una funcion para modificarlo.
Estado -> ahora es de una forma y puede cambiar. A nivel funcional implica que no se cambian las variables sino que se crean nuevas
En funcional puedo dividir el estado en 2
- El estado puro -> puedo representar con tecnicas funcionales, es decir, ante un cambio creo uno nuevo
- El estado inpuro -> no me puedo crear una nueva cosa que es la transformacion de la original entonces cambio los atributos a la original.
React lo maneja con estado puro.
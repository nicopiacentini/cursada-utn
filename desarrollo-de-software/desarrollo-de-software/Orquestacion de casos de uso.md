El error: 
*Asignar responsabilidades de casos de uso directamente a clases que representan actores de sistema*.
La solucion:
Separar claramente la logica de la orquestacion del modelo de dominio y las politicas de acceso

## Arquitectura en capas

- **Enrutador** -> es una *pseudocapa* que recibe las peticiones http y se la manda a los controladores.
### Controladores
- Recibe los pedidos del cliente
- Expone posibles opciones al usuario
- Traduce pedidos de cliente a dominio. 
- Llama services que dan respuesta
- Devuelve dicha respuesta al cliente.
- Maneja exepciones
- Hace validaciones superficiales
### Services
- Orquesta la ejecucion de operaciones de negocio
- Llama a objetos de dominio, repositorio y utilidad.
- Separa el como se hace algo (queda en dominio) del cuando se hace (servicio)
- Focaliza las reglas de flujo, NO de negocio.
### Repositorios
- Encapsula el acceso al medio persistente.
- Traduce entidades de dominio a algo persistible y viceversa (orm/odm)
- Pueden hacer operaciones CRUD sobre entidades de dominio
### Dominio
- Tiene las reglas de negocio puras como *reglas*, *validaciones, entidades y objetos de valor*
- Es el corazon del negocio y DEBE ESTAR IMPLEMENTADA DE FORMA INDEPENDIENTE A LA ESTRUCTURA DE FRAMEWORKS.
- Existe separacion de responsabilidades
- Las entidades son autocontenidas
- Se evita mezclar permisos
***Los casos de uso abren la puerta a que hayan controller, service y repositorio por elemento de dominio***


Transformacion a DTO -> solo cuando agrego un atributo que no tiene.
# Implementacion
### Paginacion
Me sirve para reducir el ancho de banda utilizado para cuando me quieren mandar muchos datos, entonces mando de a poco. Lo que permite es que se pidan menos datos per request. Esto genera
- Mejor rendimiento
- Menos consumo de red
- Mejor navegabilidad.
```js
app.get("/productos?page=:page&limit=&limit")
const offset = (page - 1) * limit
const paginados = lista.slice(offset, offset + limit)
```


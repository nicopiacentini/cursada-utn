### JPA
Es una especificacion del entorno Java (una API no http ni de conectividad) que define que metodos debe tener una libreria para acceder a la persistencia de objetos. **Hibernate** es una de las mas usadas.
- Define entidades
- Define relaciones
- Define comportamiento
#### Diseño de JPA
##### Entity 
Son mis entidades, son tambien las clases de mi dominio
##### Entity manager
Interfaz que gestiona la persistencia de objetos en el contexto. Se encarga tambien de resolver problemas de persistencia o relaciones muchos a muchos.
##### Entity Manager Factory
Un creador de entity managers. Segun la estructura de la aplicacion se usa una vez por request o menos
##### Persistance
Es una clase con metodos para obtener el Entity Manager Factory
##### Query
Es una interfaz para ejecutar querys en la base de datos y que estos sean devueltos como objetos.
### Hibernate
Es una de las implementaciones de JPA mas conocidas. Implementa las interfaces de JPA de la siguiente forma:
- Clases
- Interfaces
- Anotaciones 
- Xml
#### persistance XML
Es un .xml con datos acerca al acceso a la base de datos como:
- El driver o implementacion de JDBC
- Usuario y contraseña
- Url donde expone la base de datos.
- Dialectos para varianzas minimas entre querys de distintos motores de bases de datos.
### JDBC
Es el conector entre mi aplicacion y mi base de datos. En este caso, Hibernate se conecta con el JDBC y genera las queries por nosotros. Al mismo tiempo, JDBC es una interfaz que respeta un estandar para conexion con base de datos, cosa de que para el programador intercambiar el conector sea lo mismo para el.


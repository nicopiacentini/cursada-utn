
```java
Javalin app = Javalin.create()  
        .get("/", ctx -> ctx.result("Hello World"))  
        .start(4567);
```
Aca estoy haciendo un bucle infinito para crear mi servidor.

#### Lambda ctx
Es una clase de javalin para responder a la request. Engloba a la request para que yo pueda hacer lo que quiera.

## Configuracion de mapeos

#### Handler
Es una interfaz que yo implemento para manejar el request y generar la response


# Sesiones
Cuando quiero mantener una sesion uniendo los request a travez del tiempo

#### IDSession
No voy a mandar toda la informacion de sesion todo el tiempo. Solo transmito el id de sesion. Este se manda y recibe desde un header llamado autorization
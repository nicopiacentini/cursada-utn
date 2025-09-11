
## ¿Qué es Docker?

Docker es una plataforma que permite **crear, distribuir y ejecutar aplicaciones dentro de contenedores**.  
Un contenedor es una instancia ligera y aislada de una imagen que contiene todo lo necesario para ejecutar un software (código, librerías, dependencias, etc.).

- **Imagen**: plantilla inmutable que contiene el sistema base y las aplicaciones y librerias necesarias. Debe ser descargada
    
- **Contenedor**: instancia en ejecución creada a partir de una imagen.
    
- **Registry**: repositorio de imágenes, como Docker Hub.
    
Un contenedor es **un proceso en tu host**, aislado del resto, que se comporta como si fuera un sistema independiente. Desde adentro, el contenedor “cree” que es una máquina, pero en realidad está usando el kernel del host.

---

## Comandos básicos

### Ver las imágenes descargadas

Muestra todas las imágenes disponibles en tu máquina.

`docker images`

---

### Descargar y ejecutar una imagen

Crea un nuevo contenedor a partir de una imagen y lo ejecuta.  
Si la imagen no existe localmente, se descarga del registry.

`docker run <imagen>`

---

### Listar contenedores activos

Muestra los contenedores que se están ejecutando actualmente.

`docker ps`

---

### Listar todos los contenedores

Incluye tanto los que están corriendo como los que ya se detuvieron.

`docker ps -a`

---

### Detener un contenedor

Finaliza la ejecución de un contenedor en curso.

`docker stop <contenedor>`

---

### Iniciar un contenedor detenido

Vuelve a levantar un contenedor que ya fue creado pero está detenido.

`docker start <contenedor>`

---

### Eliminar un contenedor

Borra un contenedor de la máquina. Debe estar detenido antes de eliminarlo.

`docker rm <contenedor>`

---

### Eliminar una imagen

Quita una imagen del sistema local. Si algún contenedor la usa, no podrá borrarse hasta que esos contenedores se eliminen.

`docker rmi <imagen>`

---

## Flags más utilizados en `docker run`

### Ejecutar en segundo plano

Ejecuta el contenedor en modo “detached” (segundo plano).

`-d`

---

### Publicar puertos

Expone un puerto del contenedor al host para poder acceder a servicios.  
Formato: `<puerto_host:puerto_contenedor>`.

`-p <puerto_host:puerto_contenedor>`

Ejemplo:

`docker run -d -p 8080:80 nginx`

Accede al servidor Nginx en `http://localhost:8080`.

---

### Asignar un nombre al contenedor

Permite darle un nombre personalizado en vez de usar uno aleatorio.

`--name <nombre>`

---

### Montar volúmenes

Comparte directorios entre el host y el contenedor para persistir datos o intercambiar archivos.  
Formato: `<ruta_host:ruta_contenedor>`.

`-v <ruta_host:ruta_contenedor>`

---

### Modo interactivo

Permite ejecutar el contenedor con acceso a una terminal.  
Combina dos flags:

- `-i` = mantiene abierto el `stdin`.
    
- `-t` = asigna una pseudo-terminal.
    

Ejemplo:

`docker run -it ubuntu bash`

Accede a una consola de Ubuntu dentro del contenedor.
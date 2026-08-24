##### Avisos
- Consigna de TP al final de la clase
- Revisar github issues
- https://github.com/features/codespaces
- docs.docker.com/reference
- Trabajar ambos en la ppt del workshop
___
# Docker
##### Ideas basicas
- Instala dependencias necesarias para correr codigo en cualquier maquina
- Corres contenedores en cualquier maquina
- Basicamente, codigo **super desplegable**
- Soluciona el problema de *en mi máquina funcionaba*
### Virtualizacion vs Containers
>[!Idea] Virtualizacion
>Permite ejecutar multiples sistemas o entornos aislados sobre **el mismo hw físico**. 

|                                        | Máquina Virtual (VM)                  | Container                                                                                             |
| -------------------------------------- | ------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Aislamiento**                        | SO completo por VM                    | Proceso aislado en el host                                                                            |
| **Overhead**                           | Alto (GB de RAM por VM)               | Bajo (MB)                                                                                             |
| **Inicio**                             | Minutos                               | Milisegundos                                                                                          |
| **Hipervisor** <br>(como accedo a CPU) | VMware, VirtualBox, KVM               | Docker Engine, containerd                                                                             |
| **Kernel**                             | Propio por VM porque virtualiza el hw | Comparte el kernel del host y corre como proceso del SO host. Puede usar herramientas de dicho kernel |
| **Portabilidad**                       | Media                                 | Muy alta                                                                                              |

> Nada me frena de crear N maquinas virtuales para mis N microservicios, pero como la asignacion de recursos es **estatica** puede que me sobren y no se utilicen. En un container puede correr procesos en maquinas sin overhead de so pero al mismo tiempo estando aislado

> Cada Servicio que corro puede tener versiones distintas del mismo sw. Si yo los corro todos en el mismo server hay colisiones en versiones y en puertos. Si levanto distintos containers puedo **aislar dependencias**
> Si corro 5 procesos de 5 servicios en la misma maquina chocan en, por ejemplo, puerto que usan o versiones de dependencias. Quizas un proceso consume muchos recursos y es un **bad neighbour**

>[!important]
>Las VMs son casas separadas (cada uno con su cpu, ram, disco). Los containers son departamentos de un edificio pues comparten infraestructura pero son independientes

##### Container como proceso
Los containers no se conocen entre si como procesos porque de por si son SOs aparte. Osea, son procesos en un host que no tienen por que conocerse entre si. Al ser procesos corren sobre el kernel del host
- Esto permitira levantar todos los servicios en el puerto 8080 pero que virtualmente cada uno tenga su propio puerto.

### LXC o Linux container
Es una tecnología de virtualizacion a nivel SO de linux. Virtualizas un SO como proceso del host. Entonces no sabe de la existencia de demas procesos en el host. 
Permite ejecutar multiples instancias de SO aislados conocidos como: 
- Servidores privados virtuales
- Entornos virtuales
> LXC **no provee una vm**, en cambio, provee **un entorno virtual que tiene su propio espacio de procesos y redes**. Todos los containers comparten kernel de host
> Cada container corre como proceso de host y entonces no tiene limite de recursos pero esto tambien puede ser malo

##### Diferencias
**VM (Hipervisor)**
- SO completo virtualizado
- Kernel propio
- Arranque lento
- Mayor seguridad de aislamiento

**Container (LXC/Docker)**
- Comparte kernel del host
- Propio espacio de procesos
- Arranque instantáneo
- Lightweight y portable
##### Diferencia con VM
|Característica|VM|Container (LXC/Docker)|
|---|---|---|
|Kernel|**Propio (guest OS)**|**Compartido (host kernel)**|
|Arranque|**1–5 minutos**|**< 1 segundo**|
|Tamaño imagen|**GB**|**MB**|
|CPU overhead|**Alto**|**Casi nulo**|
|Memoria|**Reserva fija**|**Comparte con el host**|
|Portabilidad|**Depende del hipervisor**|**Corre en cualquier lugar**|
|Aislamiento|**Muy fuerte**|Fuerte (namespaces)|
> **Por que container cana en desarrollo?** -> Velocidad de arranque, eficiencia de recursos y portabilidad. *Build once, run anywhere*

#### Problema de LXC
Requiere de un conocimiento especifico o de bajo nivel de linux -> **Dificil de implementar**. Aca surge docker al ser mas amigable y mas poderosa
## Docker
>[!Important] Docker 
>Posibilita **empaquetar una aplicacion con todas sus dependencias** en una *unidad estandarizada* de desarrollo de software
##### Esta unidad incluye:
- Codigo fuente
- Entorno de runtime
- Herramientas y bibliotecas de sistema
- Dependencias
- Archivos de configuracion
> El sw **Siempre corre igual sin importar el ambiente**

##### Demo 1
```bash
docker --version 
docker info
# verifica instalación

docker run hello-world
# corre container hello-world

docker ps
# contenedores corriendo
docker ps -a
# contenedores creados, no necesariamente corriendo
```

>[!Important] Docker con BD
>Docker es efimero y no es recomendable dockerizar una BD porque tampoco busca "guardar estado" ni preservar datos al reciclar el contenedor. Basicamente, si mato y recreo el container **pierdo la informacion**
###### Que hace docker internamente?
1. Busca la **imagen** *hello-world* en cache local
2. No la encuentra - La descarga de Docker Hub
	- Es un registro publico de imagenes con las mas comunes
3. Crea un **container** a partir de la imagen
4. Ejecuta el container
5. El container termina y se detiener
### Image, registry y container
#### Image
Es un template read-only desde donde se crea el container. Deriva de una imagen base y crea un sistema de archivos donde el proceso 1 es mi aplicacion
- Armada por un conjunto de capas que conforman el filesystem
- Se construye con un *Dockerfile*
> Cada imagen referencia una lista de capas o imagenes que representan deltas de filesystem. Estas capas se apilan unaa sobre otra para formar el sistema de archivos root de un **container**

#### Dockerfile
Es un archivo con comandos que **genera una imagen de docker**
##### Image layer
```dockerfile
FROM ubuntu
RUN apt-get update
ENTRYPOINT ["apache2ctl"]
```
Cada comando (from, run y entrypoint) conforma una **image layer** y compone la imagen final. Es decir cada capa modifica el filesystem que utilizara el container final que utiliza la imagen. La lista de comandos que modifican el filesystem de la imagen son:
- FROM - Puedo poner la imagen de un so o directamente un entorno de ejecucion como node o python
- LABEL
- RUN
- COPY - Mueve un archivo a un directorio RELATIVO AL DIRECTORIO BASE O WORKDIR
- WORKDIR - Directorio base donde corre el CMD o ENTRYPOINT
- EXPOSE
- CMD
ETC. 
>[!Important] Comandos de dockerfile
>Cada comando SOLO modifica el filesystem de la imagen final para que luego se cree el container con el filesystem modificado. Es como que cada comando dice: *crea este archivo* o *copia esta carpeta y pegala en este otro lado*, *pone este contenido en este archivo*

>Las capas **se apilan** entonces lee de arriba hacia abajo. Ademas como las capas son *read-only* los archivos que se crean arriba no se borran del todo sino que siguen ahi y ocupan espacio.
###### Ejemplo capas
![[Pasted image 20260818201407.png]]

Cada capa es hasheada criptograficamente por su contenido, que si no cambia docker reutiliza el cache de cada capa. Esto acelera los builds porque quita overhead.
##### Run, Entrypoint y CMD
- CMD - Se ejecuta al iniciar el contenedor a partir de la imagen y puede sobreescribirse. Es la especificacion del PID 1 o del proceso principal del container. Cuando haces docker run corre ese proceso. Una "," es equivalente a un espacio.
- ENTRYPOINT - Es el ejecutable principal y no puede sobreescribirse. Permite pasar como argumento algo que yo ponga desde la terminal
	- Quizas quiero como proceso principal un deamon (CMD) y quiero ejecutar un .sh para crear tablas en una base de datos (ENTRYPOINT)
- RUN - Se ejecuta al construir la imagen y crea una nueva capa en la imagen
> Si pongo CMD para instalar version de python por ejemplo, se corre cada vez que buildeo la imagen y **tarda mas**. En cambio si uso RUN se corre una sola vez porque luego queda cacheado
#### Explorar imagenes y capas
- docker image ls - Lista de imagenes en maquinas y cuando se crearon
- docker pull imagen - descarga imagen
- docker history imagen - ve todas las capas o comandos/instrucciones de una imagen determinada
- docker inspect imagen - inspecciona imagen en detalle y me da JSON
- docker history --no-trunc - ver hashes de cada capa/instruccion

##### Ejemplo crear, buildear y ejecutar una imagen
```bash
# Crear archivos del proyecto
mkdir demo-docker && cd demo-docker

cat > app.py << 'EOF'
from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hola desde Docker! TACS 2026")

HTTPServer(("", 8080), Handler).serve_forever()
EOF

cat > Dockerfile << 'EOF'
FROM python:3.11-slim
WORKDIR /app
COPY app.py .
EXPOSE 8080
CMD ["python3", "app.py"]
EOF

# Construir la imagen
docker build -t mi-app:1.0 .

# Ver la imagen recién creada
docker image ls mi-app

# Correrla
docker run -d -p 8080:8080 mi-app:1.0

# Abrir: http://localhost:8080
```

###### Bindeo de puertos
```bash
docker run -p puertoEnMiMaquina:PuertoEnContenedor

# Puedo hacer:
docker run -p 8080:8080
docker run -p 8081:8080

```
##### Acceder a un contenedor en ejecucion
```bash
docker exec -it nombreDeContenedor bash
```
> EXEC permite ejecutar un proceso nuevo dentro de un contenedor

### Docker registry
Es un repositorio o almacenamiento de imagenes de docker de forma centralizada, similar a Git.
- Docker hub es el registry publico por defecto
- Se pueden hacer registries privados para una empresa
El formato es `[registry]/[usuario]/[imagen]:[tag]`
###### Tag de una imagen
Es una forma de versionar imagens pues permite identificar versiones univocamente. El tag *latest* es el por defecto y te da la ultima version de la imagen.

##### Mas comandos
- Docker pull - descarga una imagen con un tag especifico
- docker login - login a docker hub o al registry que necesite
- docker start - ejecuta un contenedor ya creado pero que no este ejecutando
- docker tag - Taggea una imagen par poder hacerle push
- docker push - sube o pushea una imagen
- docker image prune - limpia imagenes sin usar
- docker system prune -a: Limpia todas las imagenes de sistema
### Docker container
Es una instancia runtime de una **docker image**. Tiene una capa R/W arriba de la imagen para poder modificar el filesystem de la imagen. Es decir, tiene una capa modificable para poder modificar el contenedor pero sin la necesidad de cambiar la imagen.
- Al eliminarse se pierde la capa R/W
- Esta aislado del resto:
	- No puede ver/modificar host u otros containers
	- Namespaces - Tienen una vista privada del sistema (puertos, arbol PID, mountpoints)
	- cgroups - limita recursos
###### Ciclo de vida
**Created** -> **Running** -> **Paused** -> **Stopped** -> **Removed**
```bash
docker create -> created
docker start -> running
docker pause -> paused
docker stop -> stopped
docker rm -> removed
```
###### Linux Namespaces

Proveen **aislamiento de recursos** del sistema operativo:

- **PID** — árbol de procesos propio
- **Network** — interfaces de red propias
- **Mount** — mountpoints propios
- **UTS** — hostname propio
- **IPC** — comunicación entre procesos aislada
- **User** — UID/GID propios

###### Linux cgroups

Limitan y contabilizan el uso de **recursos del sistema**:

- **CPU** — cuotas de procesador
- **Memory** — límite de RAM
- **I/O** — ancho de banda de disco
- **Network** — ancho de banda de red
```bash
docker run -d \
  --name mi-app \
  --memory=512m \
  --cpus=0.5 \
  nginx
```

Los cgroups mitigan el **bad neighbor effect**: un contenedor no puede acaparar todos los recursos del host.

#### Container y layers
La diferencia entre container e imagen esta en la **capa R/W** que tiene el container para modificar el filesystem que tiene. Cuando elimino el container:
- Se elimina la capa R/W
- La imagen queda igual, sin cambios
Multiples containers pueden compartir la misma imagen
> Si el container se elimina LOS DATOS SE PIERDEN. Entonces para persistencia se usan **volumenes docker**
> Ademas, persistir sin volumenes docker hace que se guarde todo en la capa R/W. Esto hace que la sufran los otros contenedores por necesidad de recursos.


##### Eficiencia en Uso de disco
1. Las capas se stackean para cachear y ahorrar espacio
2. Copy-on-Write.
	
###### Copy-on-Write
Cuando un archivo se modifica en un container:
1. Busca el archivo a traves de las capas. Comienza en la capa mas nueva y va bajando
2. Realiza una operacion copy up de la copia encontrada y la pega a la capa R/W
3. Modifica la copia en dicha capa Writable del container
Si lo vuelvo a modificar, al ya estar en capa R/W tarda mucho menos

#### Inspeccionar capas y diff
```bash
# Correr un container que se queda activo
docker run -d --name test-layers ubuntu:22.04 sleep 300

# Ver diferencias vs imagen base (nada aún)
docker diff test-layers

# Crear un archivo dentro del container
docker exec test-layers bash -c "echo 'hola TACS' > /tmp/archivo.txt"

# Ver el diff ahora
docker diff test-layers
# A = Added, C = Changed, D = Deleted

# Inspeccionar storage driver
docker inspect test-layers | grep -A 10 "GraphDriver"

# Ver uso de disco por container
docker system df -v

# Limpiar
docker stop test-layers && docker rm test-layers

# El archivo.txt ya no existe (la capa R/W se eliminó)
```

#### Volumen docker
Es un archivo que se guarda en el host que permite persistir datos del container. Es decir, quita lo efimero y sobreviven al container. Es ideal para base de datos, archivos. 
- Esto puede implicar que si se llena mucho el volumen el host la sufre. 
- Traen la idea de portabilidad de volumenes 
###### Comandos de volumen
```bash
# Crear un volumen nombrado
docker volume create mis-datos

# Usar el volumen al correr un container
docker run -d \
--name app-con-datos \
-v mis-datos:/app/data \
mi-app:1.0

# Listar volúmenes
docker volume ls

# Bind mount: montar directorio del host (dev workflow)
docker run -d \
-v $(pwd)/datos:/app/data \
mi-app:1.0

# Inspeccionar dónde vive el volumen en el host
docker volume inspect mis-datos

# Eliminar volúmenes sin uso
docker volume prune
```
###### Formas de montar volumenes
- **Named volumes** son gestionados por docker y mejor para produccion
	- Portable y se puede hacer back-up
- **Bind mounts** montan un path (carpeta o archivo) del host dentro del contenedor
	- Son para hot reload o ejecucion sin reiniciar el contenedor
- **TMPFS mount**: Esta en memoria y no se persiste ni por host ni en container
	- Sirve para datos sensibles que se que mueren
#### Networking en containers
```bash
# Port mapping: puerto del host -> puerto del container
docker run -d -p 8080:80 nginx
# Abrir en el browser: http://localhost:8080

# Ver redes de Docker
docker network ls
# bridge (default), host, none

# Crear red personalizada
docker network create mi-red

# Containers en la misma red se comunican por NOMBRE
docker run -d --name db --network mi-red postgres:15
docker run -d --name app --network mi-red mi-app:1.0

# Desde 'app', puede resolver 'db' por nombre
docker exec app ping db

# Inspeccionar red
docker network inspect mi-red
```
#### Comandos escenciales

|**Comando**|**Descripción**|
|---|---|
|`docker build -t nombre:tag .`|Construir imagen desde Dockerfile|
|`docker run imagen`|Correr un container|
|`docker run -d imagen`|Correr en background (detached)|
|`docker run -it imagen bash`|Modo interactivo con terminal|
|`docker run -p 8080:80 imagen`|Port mapping host:container|
|`docker run -v host:container imagen`|Montar volumen/bind mount|
|`docker run --rm imagen`|Eliminar container al terminar|
|`docker ps / docker ps -a`|Ver containers activos / todos|
|`docker stop / rm nombre`|Detener / eliminar container|
|`docker image ls`|Listar imágenes locales|
|`docker pull imagen:tag`|Descargar imagen del registry|
|`docker push imagen:tag`|Subir imagen al registry|
|`docker exec -it cont bash`|Entrar a container corriendo|
|`docker logs -f cont`|Ver logs (follow)|
|`docker inspect cont/img`|Metadatos en JSON|
|`docker diff cont`|Ver cambios vs imagen base|
|`docker system prune -a`|Limpiar TODO lo no usado|
#### Docker compose
#### docker compose 
Docker Compose es una herramienta de orquestación diseñada para definir y ejecutar aplicaciones multi-contenedor. En lugar de ejecutar múltiples comandos `docker run` individualmente, 

Compose permite gestionar toda la infraestructura de la aplicación desde un único archivo de configuración. 
##### ¿Qué hace? 
* **Gestión de servicios:** Permite iniciar, detener y reconstruir todos los servicios de una aplicación con un solo comando. 
* **Redes y volúmenes:** Configura automáticamente redes aisladas para que los contenedores se comuniquen entre sí y gestiona la persistencia de datos mediante volúmenes. 
* **Entornos unificados:** Asegura que los desarrolladores y los entornos de producción utilicen exactamente la misma configuración. 
###### ¿Cómo funciona? 
1. **Archivo `docker-compose.yml`:** Es el archivo central (en formato YAML) donde se definen los servicios, redes y volúmenes. 
2. **Motor de Docker:** Al ejecutar `docker compose up`, la herramienta lee el archivo, construye las imágenes si es necesario, crea los contenedores, define las redes y los inicia en el orden correcto. 
3. ##### Sintaxis Básica El archivo utiliza una estructura jerárquica: ```yaml version: '3.8' # Versión del formato del archivo services: nombre-servicio: image: nombre-imagen ports: - "puerto-host:puerto-contenedor" volumes: - ./ruta-local:/ruta-contenedor environment: VARIABLE: valor

- **Comandos útiles:**
    
    - `docker compose up -d`: Inicia los servicios en segundo plano.
        
    - `docker compose down`: Detiene y elimina los contenedores y redes creadas.
        
    - `docker compose ps`: Muestra el estado de los servicios. """
        


## Virtualizacion
Puede ser de hardware o software:
#### Virtualizacion de hardware
Se trabaja con una maquina virtual, es decir, virtualizando los componentes de hardware, como la memoria, la cpu y el disco. Existen distintos tipos
- Alto nivel: VirtualBox, Vmware. Aca no se puede virtualizar la arquitectura 
- Bajo nivel: Qemu. Aca se puede virtualizar la arquitectura (16 bits, 32 bits, etc)
#### Virtualizacion de una pieza de software
Es correr un cierto proceso en un cierto sistema operativo. Se le asigna un pedazo de disco, un puerto. Es mas limitado pero es mas liviano. En docker, necesariamente corre el proceso en linux porque originalmente usaba bibliotecas de su kernel. Hoy en dia, no es tan necesario.
### Razon de virtualizar
- Desplegar aplicaciones: al virtualizar nos garantiza entornos reproducibles 
- Independencia del hardware: al indicar las dependencias requeridas por SO para usar el software desplegado 
- Gestion de versiones
# Docker en accion

## Imagenes y contenedores
Los procesos dockerizados se los llama **contenedores**. Tecnicamente, un varios procesos pueden conformar al contenedor. La imagen es el molde a partir del cual yo creo a mi contenedor. Es un conjunto de definiciones de codigo/archivos/configuraciones/sistema linux que define que pasa cuando corro el contenedor. Las imagenes se crean a mano o descargan de un repositorio
### Imagenes de docker
Tienen la siguiente estructura:
`organizacion/imagen:version-versionDeLinux`
DockerHub es el lugar de descarga donde existen distintas imagenes de organizaciones a descargar. La imagen ya la vimos, es como el codigo y tiene versionado. Luego la versionDeLinux es donde se va a correr mi contenedor. La mas normal es `alpine`
### Docker run
```bash
docker run -it --rm node
```
Corre un proceso `node` dentro de docker. Crea el contenedor de 0.Es un proceso virtualizado, ya que no corre en mi sistema operativo nativo sino que esta envuelto en docker. Normalmente, corre en la ultima version existente de la imagen que pedi correr. Usa las flags:
- `-- rm`:  Borra el contenedor que estas corriendo
- `- it`: hace que los logs del contenedor no se escriban y directamente pueda tirar comandos del contenedor en la terminal
### Docker start
```bash
docker start node
```
Levanta un contenedor que fue frenado. Se puede siempre y cuando el contenedor no este muerto. Con `docker kill` mato al contenedor. El contenedor solo ocupa disco hasta que se empieza a ejecutar.

### Docker ps
Muestra contenedonres que estan disponibles con mi computadora. Con --rm o docker kill los saco de aca
### Docker images
```bash
docker images
```
Muesta las imagenes de docker disponibles en mi sistema. Cuando creo un contenendor (con docker run) debo o descargar la imagen de dockerhub o en su defecto, tener la imagen descargada.

## Construccion de imagenes en docker
Hay que crear un archivo DockerFile. Tiene que tener esta estructura:
```dockerfile
FROM node:22-alpine # a partir de cual capa se construye
WORKDIR /hola-mundo # del sistema de archivos donde se esta trabajando
COPY index.js index.js
ENTRYPOINT [ "node" , "index.js" ] # lo primero que se ejecuta cuando se crea un contenedor con esta imagen
```
Luego tengo que crear la imagen como tal:
```bash
docker build .
```
Ahora ya se creo la imagen.

## Docker compose


https://github.com/ddso-utn/taller-docker

https://docs.google.com/document/d/1xYF69TcGLIcQ3_fJnO7zUet6c5ud1zlFuinaRfNC3rU/edit?tab=t.0#heading=h.z70wxigo0crj
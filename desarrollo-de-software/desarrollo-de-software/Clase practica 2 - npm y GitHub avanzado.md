# Git y Github
Versionador de codigo

## Rama
Es un espacio de trabajo paralelo a otras del mismo repositorio y sus commits son sobre ese *espacio* en especifico.
Es fundamental para trabajar en equipo -> cada persona trabaja en su propia rama
```bash
git branch "nombre" #-> crea rama
git checkout "rama" # cambio de rama

```
##### Merge
Es la forma que tenemos de juntar 2 ramas y tener una sola
```bash
git merge "rama" # ya estoy en otra rama
```
Existen distintos tipos de merge
- Clasico -> se genera un nuevo commit donde se juntan ambas ramas
- Squash -> todos los cambios de la otra rama se ponen en un commit solo de la rama en la que estoy 
- Rebase -> Se mueven todos los commit de la rama que se mergea como commits separados en mi rama actual.
##### Branch protection
Es una forma de proteger una rama poniendo restricciones antes de que me hagan merges.
### Git Flow
Estrategia para versionar y hacer ramas para paralelizar el desarrollo. Las ramas son
##### Develop
Rama donde se suele codear todo
##### Features 
Se codean y agregan nuevos features y una vez que estan listos se mandan a Develop. Por cada feature distinto se agregan mas branches features
##### Release
Se hace un commit en esta branch para empezar a probar el codigo en produccion una vez que ya esta listo el develop.
##### Hotfix
Arreglos rapidos necesarios en main
#### Main
Versiones de codigo ya oficializdo

![[Pasted image 20250823092039.png]]
### Issue
Es un comentario/texto asignable a un usuario para desarrollar algo. Todas las features, branches deben empezar en un issue.
### Github Flow
Es una forma de trabajar donde cada merge se hace con un pull request.
##### Main
Versiones de codigo ya disponibles y subibles
##### Change
Cambios en el main que se integran una vez finalizados

![[Pasted image 20250823093012.png]]
### Pull Request
Es basicamente una formalidad para revisar los merges. Se agrega un texto y un responsable del merge. Del otro lado el responsable va a ver los archivos y puede comentar los cambios, al final aceptando o rechazando el codigo. Luego puede asociarse el pull request a un issue determinado para cerrarlo.

#### Merge conflict
Pasa cuando mergeo y los cambios pisarian/cambiarian cosas de la branch donde mergeo. Para resolverlo lo que se suele hacer es primero traer y mergear la rama principal a mi rama local y mergear ahi y luego de resolver los cambios mergeo la principal con la mia.

##### .gitignore
Un archivo para indicar que archivos/directorios no deben subirse al repo
## Versionado
Hacer efectiva una version de mi codigo para salir a produccion
### Versionado semantico
Forma de preparar la version para poder darle versiones/nombres a codigo. La regla es `MAJOR.MINOR.PATCH`. Los posibles cambios son
- Major -> los cambios que se hacen aca hacen que las personas que se quedan en la version major vieja no pueden seguir usando mi aplicacion/servicio. Cambian la API del componente
- Minor -> agregan nuevas funcionalidades retrocompatibles con versiones anteriores. El codigo viejo no se toco
- Patch -> fixes/arreglos a componentes anteriores.

## Changelog
Archivo que se actualiza con cada cambio. Se suele escribir en markdown. El formato es:
```
## version
### agregado
- agrego esto
- agrego esto otro
### quitado/deleted
- saco esto
```

# npm (node package manager)
Es un gestor de paquetes/dependencias en un proyecto node. Es una herramienta de la terminal llamando `npm`
```bash
npm init
```

##### npm init
Crea un package.json que tiene datos acerca de mi proyecto.

##### npm install
Crea un package-lock.json que indica versiones de dependencias y mi proyecto para que pueda ser launcheado en cualquier lado al instalar las dependencias automaticamente. Cada persona neuva en el repositorio deb hacer npm install
```bash
npm install <nombrePaquete>@<version>
```



### Import 
Es otra forma de manejarse con proyectos. Dentro de un modulo, los archivos se *exportan* funciones, logica,etc.
```js
import algo from "./fidget"


// del otro lado

export algo
```
Dentro del package.json debo indicar que el proyecto es un modulo para hacer esto
```json
type: "module"
```

#### Scripts
En el package.json puedo tener scritps de la forma
```json
Scripts : {
	saludar: "echo hola"
}
```
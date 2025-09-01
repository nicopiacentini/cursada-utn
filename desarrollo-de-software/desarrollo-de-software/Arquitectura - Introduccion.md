# Que es la Arquitectura
Es parte del diseño. Cumple con:
- garantizar requerimientos no funcionales
- Dar estructura al resot del diseño -> Dificil de modificar. Debe ser tomada con anticipacion
- Es de alto nivel por tocar con la parte fisica
### Tipos de arquitectura
- De SW -> define la estructura de un sistema sw (que componentes tiene, como se relacionan, que es cada componente, etc).
- De sistema, organizacional o de integracion -> Relaciona sistemas de SW para hacer un sistema mas grande
# Cuestiones Arquitectonicas
```
Concern arquitectonico -> problemas arquitectonicos 
```
Estos pueden ser divididos en 2 tipos
1. Fisicos: Estan relacionados con el hardware a utilizar (cuales nodos se usan), despliegue (distribuido vs concentrado) y ambientes. Asimismo Realiza la distribucion de componentes logicos en nodos y define tecnologias criticas como lenguajes, frameworks, motor de bd, etc.
2. Conceptuales/Logicos: Dividir una pieza sw en subsistemas menores, darle responsabilidades y formas de comunicarse con demas piezas software. A nivel medio, la division se realiza en *modulos* con distintas responsabilidades. La division de piezas sw se puede hacer:
	1. Segun responsabilidades funcionales: Divido el sw segun responsabilidades que aportan a requisitos funcionales.
	2. Segun tipo de responsabilidad/concern: Divido el SW en responsabilidades/requisitos no funcionales 
#### Concerns
Responsabilidades del sistema que no pasan por lo funcional. Es un problema a responder y atraviesa a todo el sistema y a los requerimientos funcionales. Los que nos importan son
- UI -> como el usuario habla/interactua con mi sistema
- Persistencia -> como y donde guardo los datos de mi sistema y de que forma y cuando me los traigo a memoria.
# Criterios de desicion Arquitectonicos
### Desicion de diseño
Para tomar desiciones que resuelven requisitos funcionales. Considera un poco la parte no funcional (para integrarse con la arquitectura, por ejemplo) llamada cualidades de diseño. Los criterios a tener en cuenta son
- Mantenibilidad
- Extensibilidad
- Simplicidad
- Robustez
### Decision arquitectonica
Esta orientada a la implementacion/resolucion de requerimientos no funcionales y como va a estar construido el sistema. Incorpora requerimientos de diseño y se le suman los:
- Escalabilidad
- Disponibilidad
- Seguridad 
- Trazabilidad
-  Eficiencia
- Recuperacion de errores
# Patrones
Son soluciones conocidas a problemas frecuentes (a nivel diseño). A nivel arquitectura, solo se conocen buenas practicas que pueden o no aplicar al contexto o problema.
### Arquitectura Fisica
Distribucion de componentes logicos en nodos (agentes de computo) fisicos. Tambien existe la arquitectura centralizada (un nodo servidor, el cliente en su navegador otro nodo, y la base de datos otro nodo). La distribucion se puede dar por:
- Mas procesamiento sumando el de distintas maquinas
- Tolerancia al fallo/redundancia en que si falla un nodo esta el otro
- Necesidad de distribucion. (Como puede ser parte de la aplicacion en el cliente usuario navegador y parte en el servidor y base de datos). Segun como se reparte la logica puede ser:
	- No distribuida (un solo nodo)
	- Cliente pesado (cliente ejecuta logica pesada + genera el html)
	- Cliente liviano (cliente recibe el html creado)
	- Mixtas
##### Concerns de arquitectura fisica
Discuciones que se deben tener en arquitectura fisica
- Stateless/statefull -> servidor conoce o no lo que ejecuta/es el cliente
- Seguridad -> El servidor no puede controlar el cliente y por ende no es seguro
- Actualizacion -> a los clientes
- Comunicacion -> entre clientes y servidores
- Duplicacion -> de logica y persistencia
### Arquitectura Logica
Es la forma en la que se divide el software en componentes logicos para resolver los distintos *concerns*, ya sean de logica, persistencia, dominio o UI. A la forma de dividir al sw se lo conoce como **estilos arquitectonicos**.

##### Arquitectura en capas
Se organizan los componentes jerarquicamente en una pila. Cada componente es cliente del que tiene abajo y servidor del que tiene arriba. A veces las capas inferiores estan vedadas del exterior. La capa puede entenderse como: 
- Nivel de abstraccion, donde cada capa es un superior y abstrae logica de la inmediatamente inferior
- Capas logicas donde cada capa tiene una logica/responsabilidad/laburo distinto
- Capas fisicas como maquinas de uso y su implementacion y despliegue. Basicamente cada nodo seria una capa distinta por los componentes que tiene (nodo web, nodo persistencia, etc.)

### Otros Tipos de Arquitectura
1. Sobre problemas logicos
	1. Patrones de interacion
	2. Comunicacion entre componentes del modelo distribuido. Esto es explicitamente patrones de comunicacion, es decir, como se comunican los componentes, NO como se distribuyen
	3. Comunicacion entre componentes del modelo centralizado. Aca lo mismo que arriba.
2. Patrones Sobre integracion de diseño y arquitectura.
	1. Integracion con otros sistemas
	2. patron home para gestion de ciclos de vida.

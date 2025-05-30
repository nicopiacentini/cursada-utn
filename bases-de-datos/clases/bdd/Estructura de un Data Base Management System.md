## Diferencia
**DBMS** -> Sistema de gerenciamiento o gesiton de Base de datos. Es la aplicacion o programa
y determina como se acceden y guardan los datos
**BD** -> Sofware para manejar los datos y la informacion

### Propiedades ACID
Son propiedades que debe cumplir el DBMS para ser considerado como tal

- Atomicidad : Me asegura que una operacion se ejecute o no. Esto significa que ante muchas transacciones realizadas en una BD realizados en un objeto, considera todas las transacciones como una sola, de forma tal que o se ejecutan todas, o no se ejecuta ninguna. Entonces se ejecutan los comandos **en una sola transaccion** 
- Concistencia (integridad): Indica que pasa de un estado consistente a otro estado consistente. Nunca se pierden las referencias cruzadas. Por ejemplo, si tengo una factura asociada a un cliente y a un producto, no puedo borrar ni el cliente ni el producto. No puedo dejar algo colgado o algo apuntando a algo que **no existe**
- Isolation o Aislamiento: el motor es concurrente, es decir, permite atender varios usuarios en simultaneo haciendoles creer que trabajan solos. Para mantener este concepto, el motor debe aislar a cada usuario para no mezclar lo que piden. Este concepto tiene niveles pudiendo ser mas o menos limitante segun como quiera que responda el motor.
- Durabilidad (persistencia): Se refiere a que una vez realizado un cambio y llegado a un estado persistente, no se puede volver para atras. Los datos quedan sobreescritos.

### Arquitectura de un DBMS
Es una arquitectura de 3 capas -> Luego se convierte en arquitectura de 3 capas para diseño
- Nivel externo o capa de presentacion-> interaccion con usuario
	- Esquema externo
- Nivel conceptual o lógico-> que se puede hacer y que no se puede hacer en el motor
	- Esquema Conceptual
- Nivel Interno o fisico -> indica como me voy a guardar todos los datos
	- Esquema interno
Esto nos da la posibilidad de **paralelizar la programación**, es decir, que varios programadores esten programando en simultaneo. En el caso del sql server que instale, el motor contiene el nivel conceptual e interno. La parte externa esta en el SQLServerManagementSystem.

#### La arquitectura permite
-  Vistas de usuario independientes y personalizadas. Cada usuario tiene su propia vista según lo que necesite y no afecta a las de los demas.
-  Oculta detalles fisicos de almacenamientos de los usuarios. El usuario desconoce como es que se almacenan los datos en la BD.
-  El DBMS puede modificar las estructuras de almacenamiento sin afectar a como lo ven los usuarios
-  La estructura interna de la base de datos no se ve afectada por los cambios en los aspectos fisicos del almacenamientos

#### Vista del almacenamiento

###### Nivel externo (el del usuario)
Describe la parte de los datos que es relevante para un usuario en particular. Excluye datos irrelevantes para el usuario y datos que no debería ver.

###### Nivel conceptual 
Aca veo el DER

###### Nivel interno
Aca se almacenan un byte al lado del otro. Veo bloques de disco

#### Vista desde funcionalidad

###### Nivel externo
Hace la relacion entre el usuario y mi base de datos. Puede ser el SSMS o un lenguaje de programacion.

###### Nivel conceptual
Establece la logica de lo que se puede y no se puede hacer. Me encuentro con el parser, scanner

###### Nivel Interno
Maneja la persistencia de la informacion en el DBMS. Este se comunica con el sistema operativo

##### DBDeveloper
Es una persona en informatica que trabaja con la base de datos desarrolla con la base de datos. Trabaja con niveles externo y conceptual

##### DBA 
Administray configura la base de datos. Trabaja con niveles conceptual e interno. Lo prepara para una situacion determinada.

#### Componentes de un DBMS

###### IPL (inital program loader)
Es un programa de carga inicial que levanta la base de datos y dispone la estructura de memoria, cache y disco para procesar operaciones
###### User Manager
Maneja los perfiles, usuarios y roles de acceso en la DBMS.
- Administra usuarios
- Administra permisos de acceso
- Seguridad veritcal
- Seguridad horizontal

###### File Manager
Administracion logica de los archivos en la DBMS

###### Disk manager
Administracion Fisica de la informacion persistida en la DBMS. Administra su disco virtual, es decir, la parte del disco de la maquina que identifica como suyo. Es el punto de contacto con el SO.

- Asignacion de espacio del almacenamiento
- eliminacion del espacio liberado
- acceso a la informacion fisica
- comunicacion con el SO para acceder al disco


## Técnicas de Administración de Memoria

- **Segmentación**: Divide la memoria en _segmentos_ de longitud variable.
    
- **Paginación**: Divide la memoria en _páginas_ de longitud fija.
    

---

## Paginación
No necesariamente se reduce a RAM, puede usarse tambien en disco. El tamaño de las paginas es parecido a el tamaño del cluster del disco.

### Estructura de una Página

- **ID Page**: Identificador único de la página (numeradas y contiguas).
    
- **Body Page**: Área principal donde se almacenan los registros (como renglones).
	- *Renglon* - Unidad minima de grabacion de la pagina
    
- **Footer Offset**: Registro de la posición relativa de cada fila en la página. Es el indice de la pagina donde cada entrada se corresponde con un *renglon* de la pagina. Me ayuda a encontrad un renglon sin necesidad de leer toda la pagina
    

### Funcionamiento

- Los datos ingresan en el `body page`.
    
- En el `footer offset` se guarda la posición relativa de cada fila.
Sirve para realizar un acceso directo a los renglones.

![[Pasted image 20250526082135.png]]

- Puede haber _fragmentación_


#### Fragmentación
Depende del tamaño que le asigne a mi renglon
- **Externa**: Página menor al tamaño del cluster, sobrando espacio en disco.
    
- **Interna**: Fila más pequeña que el tamaño del renglón.
    
- Si una fila es más grande que un renglón, se almacenará en múltiples renglones. De la forma siguiente:
![[Pasted image 20250526083519.png]]

---

## Lógica de Almacenamiento
Es como distribuyo al espacio que tengo disponible.
### Clustering

Técnica para agrupar objetos por algún criterio:

- **Intra File**: Agrupa objetos dentro de un mismo conjunto (ej. filas de una misma tabla en una sola página).
    
- **Inter File**: Agrupa objetos relacionados de conjuntos diferentes (ej. índices y claves primarias asociadas a claves foráneas).
Tanto inter como intra pueden ser aplicados a paginacion. El dbms usa intra file para cada tabla, es decir, en una pagina hay una sola tabla. Ahora, se usa inter file para guardar pks, constraints y fks. Cuando guardo inter file, en el arbol b tengo un puntero a hash para relacionar pks con fks. Esto pasa en las hojas cuando por ejemplo, quiero las materias de tal alumno.
---

## Almacenamiento de Archivos

- El sistema operativo maneja archivos como conjuntos de caracteres ASCII.
    
- Se requiere identificar el contenido mediante un:
    

### Header

- Encabezado con caracteres que definen el contenido del archivo. Es de tamaño constante. Es una estructura fija y maneja la variabilidad de lo que viene despues.
    

---

## Tipos de Archivos

- La **extensión** indica su tipo y aplicación asociada.
    
- El **DBMS** utiliza headers para identificar diferentes tipos de archivos, por ejemplo, para distinguir tablas.
    

---

## Header de Tablas (Ejemplo)

Consulta:

```sql


SELECT nombre, saldo FROM tabla WHERE saldo > 15;
```
![[Pasted image 20250526095150.png]]
El DBMS crea structs de esta forma para cada tabla. El struct table es el header que es de tamaño constante. El struct columna define un vector donde cada posicion es una de las columnas de la tabla. Si table tiene 3 columnas

- El DBMS recupera los datos y construye un string por fila, por ejemplo:
    ![[Pasted image 20250526095541.png]]
    
- Utiliza el header para parsear el string y obtener los valores relevantes.
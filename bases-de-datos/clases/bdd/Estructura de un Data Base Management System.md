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


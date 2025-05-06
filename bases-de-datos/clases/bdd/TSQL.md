Transaq sql

Es un lenguaje de uso en consola, no permite incorporar objetos en la base de datos. Si necesito persistirlo, necesito hacer un archivo _.sql_ pero no puedo incorporarlo como una función en la base de datos que uso.

Acá puedo crear **objetos de lógica** pero no objetos a persistir como tal.

Además sql es interpretado puro -> interpreta código fuente en el momento que ejecuta. El parser y el scanner se activan en tiempo de ejecución

Para el t-sql el código se compila, genera un código objeto que forma parte de la base de datos para que después sea ejecutado.

En la base de datos puedo crear los siguientes objetos

**_Vistas_**: crea una **tabla virtual** que representa los datos de una o mas tablas en forma alternativa. Es como puedo persistir un select, pero el select me queda en memoria. La vista no, tengo que ejecutar el select para que aparezca.

Las creo cuando quiero acceder a una información de forma recurrente y no quiero invocar constantemente al mismo select. NO TIENEN DATOS, SINO LA FORMA DE ACCEDER A ELLOS.  Además, como es una tabla, es susceptible de ponerle un delete, insert, update y un select. Estos 3 primeros son complicados de implementar porque la vista usa mas de una tabla entonces el delete, instert y update deben ser polimórficos para todas las tablas. Lo importante es que siempre me trae la información de la misma forma. Son un medio de acceso a los datos reales creado por el motor al momento de crear la vista. LA VISTA NO SE EJECUTA HASTA QUE ES LLAMADA EN OTRO LADO. Es mas perfomante que un select asociado porque crea los medios de acceso. Estos medios de acceso se crean porque se supone que voy a usar la vista recurrentemente.

```sql
CREATE VIEW [nombre_bdd.] [owner.] nombreVista [(column_name[, …n])] AS

Select statement

CREATE VIEW titles_view

                AS

                SELECT title, type, price, pubdate

                FROM titles

                GO
CREATE VIEW [nombre_bdd.] [owner.] nombreVista [(column_name[, …n])] AS

```


Select statement

```sql
CREATE VIEW titles_view

                AS

                SELECT title, type, price, pubdate

                FROM titles

                GO
```


El select statement no puede tener un order by sin un top, incluir la palabra clave into o hacer referencia a una tabla temporal.

El **into** crea una tabla nueva a partir de un select

Select * from Factura into FacturasBackup

Vista materializada o snapshot -> Una vista materializada es equivalente a una vista con la diferencia que al ejecutar el select se realiza la captura de los datos existentes a ese momento. Al momento de crear la vista se **ejecuta el select y se persisten los datos**. Al ser estática, si cambio algo de las tablas de donde saco esta view, la view no se modifica. Pero una vista normal al ser dinámica si se modifica. Se suelen poner en esta vista cosas que no cambian seguido

**_CREATE MATERIALIZED VIEW nombre_**

                 **_AS <select_statement>_**

·         Funciones: crea una función definida por el usuario que es una rutina guardada en t-sql que devuelve un valor

·         Procedures: colección guardada de instrucciones en t-sql que toma y devuelve parámetros proporcionados por el usuario. Es lo mismo que una función pero este no retorna valores

·         Triggers: clase especial de procedimiento almacenado que se ejecuta automáticamente a partir de la ocurrencia de algún evento, siendo un evento algo que altera el flujo de las cosas. A nivel motor son insert, update y delete.


### Funciones
Añaden funciones de usuario para que se usen en el motor. Se agregan a las funciones nativas que tienen como ambito de ejecucion solo las bases de datos donde son creadas.
La funcion siempre retorna un valor pero la recepcion de parametros es opcional. Para laburar con funciones hago
```sql
DROP function
ALTER function
--aca va el codigo que PISA COMPLETAMENTE AL CODIGO VIEJO
```
La funcion NO puede modificar el esado de los datos y no puede manipular información, es decir, no puede tener ningun INSERT, DELETE o CREATE.
**Efecto de helado** -> si uso la funcion que modifica dentro de un select estoy modificando datos sin querer modificarlos.
Ejemplo de funcion
```sql
CREATE FUNCTION [ owner_name. ] nombre      ( [ @parameter_name [AS] tipo_dato [ = default ] [ ,...n ] ] )

  RETURNS @return_variable TABLE  ( column_definition |   table_constraint  [ ,...n ] )

   [ AS ]

  BEGIN      
	  function_body      
	  RETURN  
  END
```
- BEGIN y END encierran el bloque o contenido de la funcion. La funcion siempre tiene que tener un comando RETURN.
- En RETURNS se especifica lo que va a devolver la funcion, el tipo de dato que va a devolver.
- Las variables empiezan con *@*.
Otro ejemplo
```sql
CREATE FUNCTION SalesByStore (@storeid varchar(30))

  RETURNS TABLE

  AS

  RETURN (SELECT title, qty FROM sales s, titles t

        WHERE s.stor_id = @storeid and t.title_id = s.title_id)
```
Aca la funcion no tiene cuerpo, directamente el comando que ejecuta el select. Esto **no devuelve una tabla, devuelve una variable de tipo tabla**. En otras palabras, las tablas estan persistidas. La ventaja de esto es que puedo meter esto en un FROM. Sin embargo, es mas perfomante usar una vista materializada que una funcion para meter en el from.

```sql
CREATE FUNCTION [ owner_name. ] nombre
( [ @parameter_name [AS] tipo_dato [ = default ] [ ,...n ] ] )

  RETURNS @return_variable TABLE( column_definition | table_constraint  [,...n ] )

   [ AS ]
  BEGIN      
	  function_body      
	  RETURN  
  END
```
Esta funcion hace lo mismo que la anterior, devuelve una variable de tipo tabla. La diferencia es que en este caso me estoy haciendo la tabla a mano, la estoy creando yo.
### Procedures o Procedimiento
Este es como una funcion pero no retorna algo que pueda manejar yo, es decir, solo retorna **true o false**. Aca se mantiene la integridad, si el procedimiento fracaso o me da false, los datos quedan como estaban. Hablando de esto, el procedimiento SI PUEDE MODIFICAR LOS DATOS, puede tener INSERT, DELETE y UPDATE. 
**Efecto helado** -> no se puede ejecutar en un select porque puede modificarlos.
**Consistencia del motor** -> Ante el fallo, vuelve al ultimo estado consistente. Si meto 5 instert pero fallo en el tercero, me anula los 2 primeros y queda todo como estaba.

```sql
CREATE PROC[EDURE] nombre [ @parameter tipo_dato ] [=default ] [ OUTPUT ] [ ,...n]  
  
  AS sql_statement [ ...n ]

  GO
```

- sql_statement, son instrucciones sql incluyendo las que modifican a las tablas
- OUTPUT -> es un parametro opcional. Como en un procedimiento no puedo devolver cosas, puedo meter en OUTPUT los valores que quiero que el procedure modifique. Es como los parametros por referencia en C.
Me sirve para sacar o abstraer la logica del motor.



Una arquitectura normalmente tiene
- Presentacion -> cajitas, javascritp, dibujitos
- Dominio -> logica y bloques
- Persistencia
La persistencia puede absorber el dominio y hacer tambien su laburo convirtiendose en un CLIENTE - SERVIDOR. Esto se hace cuando por transaccionalidad es inmanejable en memoria por lo grande que es.

### Triggers
Es lo mismo que un procedimiento visto tecnicamente, es decir solo retorna true o false y modifica valores en la base de datos. La diferencia con el procedimiento es que cuando quiero usar un procedimiento lo ejecuto con EXEC. En cambio el trigger se ejecuta solo cuando ocurre un evento. 
Un evento es un INSERT, DELETE o UPDATE en una tabla en particular. 
Un TRIGGER va colgado a una tabla en especifico. 
Hay que definir las instancias de ejecucion del trigger para que se haga antes o despues del INSERT, DELETE o UPDATE. Estas instancias son:
- INSTEAD OF -> En vez de hacer un insert, hace el trigger. Se presupone que el insert en este caso lo hace el propio trigger.
- AFTER -> se ejecuta el trigger despues del insert. Si devuelve mal, por consistencia, deshace el insert
En otros motores existe el BEFORE que si devuelve mal no se hace nada

Tiene todos los parametros posibles. Trabaja con 2 tablas **inserted** y **deleted** que existen solo dentro del Trigger.

##### Trigger con insert

Las columnas de inserted son las mismas de la tabla sobre la que hago insert. Las filas que tiene son las que mando a insertar. La tabla deleted no tiene nada

##### Trigger con delete
En inserted no hay nada, en deleted todas las filas que voy a borrar

##### Trigger con update
En la tabla inserted quedan las filas nuevas como van a quedar. En la tabla deleted quedan las filas viejas, como estaba antes.

Ejemplo
```sql
CREATE TRIGGER nombre   ON table | view  

      FOR | AFTER | INSTEAD OF  [ INSERT ] [ , ] [ UPDATE ] [ , ] [ DELETE ] -- evento que dispara el trigger
        
       AS       sql_statement [ ...n ]
```

#### Declaracion de variables
T-SQL es un lenguaje tipado y tengo que declarar las variables.
```sql
DECLARE @miVariable int -- DECLARE @mi_variable tipoDeDato
print @mivariable
```
 Manejo del print
 ```sql
 PRINT msg_str | PRINT @variable | PRINT expresion_string
```

#### Separadores de bloques de codigo
```sql
BEGIN
---bloque_codigo | statement_sql
END 
```
son como los ```{}``` de cualquier otro lenguaje.

#### If y else
```sql
IF boolean_expresion
	sql_statement | statement_block
ELSE
	sql_statement | statement_block
```

si quiero que en el if ejecute 2 comandos, tengo que meterlos en un begin y end. Si no lo hago, el primer comando se ejecuta si el if es verdadero y el segundo se ejecuta *siempre*.

#### Return
corta la ejecucion del procedimiento o funcion. Si hay error, retorna 0. Si no, toma el valor que me tira la funcion.

#### Waitfor
Comando de espera que pausa. Espera hasta que se de determinada condicion
```sql
waitfor {DELAY 'time' | TIME 'time'}
```

#### Bucle while
Como no existe el comando for, hay que usar este.
```sql
while expresion_booleana
	{sql_statement | statement_block}
[BREAK]
{sql_statement | statement_block}
[CONTINUE]
```

### Cursores
Es una variable que permite recibir el resultado de un select. Es parecido a una variable de tipo tabla (variable que recibe el resultado de un select y me permite manejarla como tabla por estar en memoria). Esta en memoria y sirve para poder iterar el select. Con esto me refiero a que si en mi conjunto me trae n elementos, los cursores *permiten recorrer la tabla que contiene*. Lo puedo trabajar de forma mas procedural.
Entonces, cuando hago un SELECT, me devuelve un **cursor** y lo puedo recorrer y examinarlo. Sirve cuando debo tratar de forma distinta a cada uno de los elementos del cursor.
Analogicamente, si un cursor es una clase, cada instancia de el son las filas. 

##### Proceso de ejecucion de cursor
- Declarar el cursor definiendo su select -> aca se me crea en memoria un puntero de C, porque el tamaño no esta definido
- Ejecuto su select y le defino su valor -> aca ya se cuanto mide el resultado y el puntero apunta a ese espacio (uso malloc)
- Recorro el cursor
- Cierro el cursor
- Libero la memoria ocupada (hago free)

##### Declaracion de cursor (aca no se ejecuta nada)
```sql
declare cursor_name CURSOR [LOCAL | GLOBAL] --si es conocido por todos o no
[FORWARD_ONLY | SCROLL] [STATIC | DYNAMIC]
FOR select_statement
```

Caracteristicas
- Visibilidad
	- LOCAL -> solo lo puedo acceder dentro de la ejecucion donde fue creado
	- GLOBAL -> lo puedo ver en cualquier lado
- Scrolling
	- FORWARD_ONLY -> solo puede avanzar
	- SCROLL -> puede avanzar y retroceder
- Cambio
	- STATIC -> el select asociado no se actualiza, la informacion que hay es la que tengo
	- DYNAMIC -> el select se actualiza cuando me muevo en el cursor.
##### Apertura de cursor
Ejecuta el select asociado para abrir y empezar a usar el cursor
```transact-sql
open [GLOBAL] cursor_name
```

##### Cerrar el cursor
No permite mas operaciones sobre el cursor, NO libera memoria
```
close [GLOBAL] cursor_name
```

##### Liberacion de memoria
Libera el espacio ocupado en ram
```
dealocate [GLOBAL] cursor_name
```

##### Recorrido de cursor
Fetch -> obtiene una linea especifica de mi cursor
```sql
FETCH [NEXT | PRIOR | FIRST | LAST]
FROM [GLOBAL] cursor_name
[into @variable [,...n]]
```
En el caso @variable, si hay alguna columna del cursor que tiene ese mismo nombre, guarda el valor de esa fila/columna en esta variable.

#### Variables del sistema
Son aquellas que maneja el motor y no puedo modificar. Empiezan con @@

###### @@FETCH_STATUS
Es el valor del ultimo FETCH realizado, no importa de cual cursor.
-  0 -> FETCH se ejecuto correctamente
-  -1 -> FETCH finalizo con error o la lista esta mas alla del conjunto de resultados (me pase de la cantidad de posiciones)
- -2 -> Falta una fila recuperada

###### @@CURSOR_ROWS
Devuelve la cantidad de filas que resulto de la ejecucion de la ultima apertura de CURSOR
-  -m -> el cursor se llena de informacion de forma asincronica
-  -1 -> cursor dinamico
-  0  -> no se abrieron cursores
-  n -> cursor completamente lleno

###### CURSOR_STATUS
Me devuelve el estado de un cursor
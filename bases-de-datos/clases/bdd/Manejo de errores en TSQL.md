Transact devuelve errores y podemos pedir informacion de los errores con
```sql
ERROR_NUMBER()
ERROR_SEVERITY()
ERROR_STATE()
ERROR_PROCEDURE()--CUAL ME GENERO EL ERROR

```

### Uso de @@Error
Es un Flag global que puedo usar para manejar errores. Si no hay error, toma el valor 0. 

### Severidad del error
Se dividen segun la severidad:
- 0-10 son warnings, puedo ejecutar igual
- 11-16 pueden ser resueltos por el usuario, es decir, el programador
- 17-19 son errores de sw que no pueden ser resueltos por el usuario pero si por el dbao
- 20-24 son errores irrecuperables. Normalmente, relacionados a errores fisicos

### SysMessage
Es una tabla del motor donde estan todos los errores. Puedo crear nuevos errores con `sp_addmessage`.
El comando `RAISERROR` tira un error. Este tira un print del error, y luego corta la ejecucion. La sintaxis es 
```sql
RAISERROR(msg_id|msg_str, severity)
```

### Try - Catch
Basicamente, un tipico bloque try-catch
```sql
begin try

end try

begin catch

end catch

```

### Transaccionalidad
Es atomizar una serie de sentencias. Se hace con:
```sql
begin transaction --me pone @@TRANCOUNT = 1

commit transaction
```

El commit transaction graba lo que esta en las transacciones. Reduce el @@TRANCOUNT en 1.
Luego, puedo volver una transaccion hacia atras usando `rollback transaction`. Cualquier de estas 2, son las formas que tenemos para cerrar transacciones.

#### Funcionalidad
Cuando hago un begin transaction estoy laburando en ram o en cache con una imagen del motor. Si meto un rollback, no pasa nada, elimino la cache. Ahora si commiteo la transaction, recien ahi la bajo a disco. Si la chache no me alcanza, tengo que swapear con disco, que esta dividido en tamaños de pagina.

# Concurrencia y bloqueos
Muchas personas acceden a la misma base de datos en simultaneo. Se controla que se bloqueen datos a partir de los accesos de distintos usuarios. Cuando meto un begin transaction, sobre lo que este trabajando nadie puede ni leer ni escribir. Cuando libero con rollback o con commit, ya cualquiera puede acceder.


### Formas de aislar
El nivel de aislamiento es que tan restrictivo es el motor con la concurrencia y los bloqueos. Esto se puede setear
El motor tiene 4 formas de aislar y funcionan durante la duracion de la sesion. Los niveles son:
- Read commited -> Sigo manteniendo bloqueos compartidos. La lectura se hace desde el disco. Solo evita la lectura sucia.
- Read uncommited -> No hay bloqueos compartidos y los bloqueos exclusivos no estan garantizados. Pueden haber lecturas sucias, datos fantasmas y las lecturas son irrepetibles. Es equivalente a establecer nolock. Trabaja sobre cache. Ahora los datos pasan mas rapido porque no hay ningun tipo de checkeo sobre esto.
- Repeatable read -> Garantiza la lectura repetida y la lectura no sucia. Se establecen bloqueos para todos los datos en la consulta. Esto provoca que no puedan haber actualizaciones. Lee sobre lo commiteado, es decir, desde el disco. Puede tener lectura fantasma
- Serialized -> Evita que nadie inserte o actualize datos sobre el bloque que tiene el bloqueo. Entonces tiene lectura repetible y no tiene datos fantasmas. Bloquea hasta que termina la transaccion.

### Bloqueos
- Compartido -> 2 sesiones bloquean lo mismo y pueden accederlo. Se hace en un select
- Exclusivo -> solo una sesion puede accederlo. Se hace en comandos de modificacion

##### Lectura sucia
Son datos que estoy viendo pero que aun no fueron confirmados. Es ver el cache. Este no saca ni mete filas en la misma query, solo modifica los datos.

##### Lectura no repetida
Cuando leo una fila 2 veces en una transaccion y porque cambia no tiene el mismo contenido y los valores no coinciden.

##### Dato fantasma
Agrega o saca filas en exactamente la misma query



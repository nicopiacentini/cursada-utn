# Transact-SQL (T-SQL)

Transact-SQL es un lenguaje de uso en consola que **no permite incorporar objetos en la base de datos** directamente desde la consola. Si necesito persistir código, debo guardarlo en un archivo `.sql`, pero **no puedo incorporarlo como una función directamente en la base de datos**.

Se pueden **crear objetos de lógica**, pero **no objetos persistentes** como tablas o funciones almacenadas desde consola.

## Diferencias entre SQL y T-SQL

- **SQL** es un lenguaje **interpretado puro**: interpreta el código fuente en el momento de ejecución. El **parser** y el **scanner** se activan en tiempo de ejecución.
- **T-SQL**, en cambio, **se compila**. Genera un **código objeto** que pasa a formar parte de la base de datos para su posterior ejecución.

---

## Objetos que se pueden crear en la base de datos

### Vistas

- Una **vista** crea una **tabla virtual** que representa datos de una o más tablas de forma alternativa.
- Es una manera de **persistir un SELECT**, pero la vista como objeto permanece en la base de datos, mientras que un SELECT común no.
- Se usan cuando necesito acceder repetidamente a una misma consulta.

> **Importante:** Las vistas **no almacenan datos**, sino que definen una **forma de acceder a ellos**.

- Al ser consideradas como tablas virtuales, se les puede aplicar:
  - `SELECT`
  - `DELETE` (difícil de implementar si la vista agrupa múltiples tablas)
  - `INSERT`
  - `UPDATE`

> Estos últimos tres deben comportarse de forma **polimórfica** si la vista involucra múltiples tablas.

- Las vistas son **más performantes** que un SELECT repetido, ya que **el motor crea medios de acceso optimizados** al momento de definir la vista.

> **Nota:** Una vista **no se ejecuta** hasta que es **invocada** por otra instrucción.

### Sintaxis para crear una vista

```sql
CREATE VIEW [nombre_bdd.] [owner.] nombreVista [(column_name[, …n])] AS
SELECT ...
```

Ejemplo


Restricciones:
		El SELECT no puede tener ORDER BY sin TOP.
		No puede incluir la palabra clave INTO.
		No puede hacer referencia a una tabla temporal.

Creación de tabla con INTO


```sql
SELECT * 
INTO FacturasBackup
FROM Factura
```

#### Vista Materializada (Snapshot)
Una vista materializada (o snapshot) es similar a una vista, con la diferencia de que al ejecutarse el SELECT, los datos se capturan y se persisten. Se evalúa una sola vez al momento de la creación.
No se actualiza automáticamente con cambios en las tablas subyacentes. Es útil para almacenar resultados que no cambian frecuentemente.

##### Sintaxis

```sql
CREATE MATERIALIZED VIEW nombre AS
SELECT ...
```
### Funciones
Permiten crear una función definida por el usuario, que es una rutina guardada en T-SQL que devuelve un valor único.

#### Procedures (Procedimientos almacenados)
Una colección de instrucciones en T-SQL. Reciben parámetros del usuario. No devuelven un valor, como sí lo hace una función. Son similares a funciones, pero se utilizan para ejecutar lógica compleja o realizar múltiples operaciones en una sola llamada.

### Triggers (Disparadores)
Son una clase especial de procedimiento almacenado.

Se ejecutan automáticamente cuando ocurre un evento en la base de datos.

Los eventos típicos son:

INSERT

UPDATE

DELETE

Se utilizan para mantener la integridad de los datos o auditar cambios automáticamente.
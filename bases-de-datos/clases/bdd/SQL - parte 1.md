# SQL - DDL, DML, Tipos de datos y consultas

## DCL, DDL y DML

---

### DDL (Data Definition Language)

Define estructuras: tablas, relaciones y bases de datos.

-   **CREATE**: crea base de datos, tablas, vistas.

    ```sql
    CREATE TABLE cliente(
        clie_codigo CHAR(6) NOT NULL PRIMARY KEY,
        clie_razon_social CHAR(100) NULL
    );
    ```

-   ALTER: modifica la estructura (agrega o quita columnas).

    ```sql
    ALTER TABLE cliente ADD clie_provincia INT NULL;
    ALTER TABLE cliente DROP COLUMN clie_provincia;
    ALTER TABLE cliente ALTER COLUMN clie_provincia CHAR(10) NULL;
    ```

-   DROP: elimina una base de datos o tabla.

Tipado de SQL

SQL es un lenguaje tipado: cada columna debe tener un tipo de dato definido.

Tipos de datos

Fecha y Hora

DATETIME: fecha con precisión hasta milisegundos.

SMALLDATETIME: fecha hasta minutos (ocupa menos memoria).

TIMESTAMP: se actualiza al insertar/modificar. Útil para auditoría con triggers.

Texto

CHAR(n): texto de longitud fija.

VARCHAR(n): longitud variable hasta n.

TEXT(n): representa un VARCHAR(MAX).

NCHAR / NVARCHAR: igual que los anteriores pero en formato Unicode.

Binarios (BLOB)

BINARY(n): binario de longitud fija.

VARBINARY(n): binario de longitud variable.

Claves y restricciones

Primero se crean todas las tablas.

Luego se agregan las claves primarias (PRIMARY KEY).

Finalmente, se agregan las claves foráneas (FOREIGN KEY).

Constraints

CHECK: restricción personalizada sobre valores.

UNIQUE: como PRIMARY KEY pero permite un solo NULL.

DEFAULT: valor por defecto si se inserta NULL.

Autoincremental: valores que se incrementan automáticamente, con una semilla inicial.

DML (Data Manipulation Language)

Subconjunto de SQL que permite modificar datos.

Comandos

INSERT

Con columnas específicas:

```sql
INSERT INTO tabla (col1, col2, …)
VALUES (val1, val2, …);
```

### Sin especificar columnas 
Sin especificar columnas (deben ir todos los valores): 
```sql 
INSERT INTO tabla VALUES (val1, val2, …);
```


### UPDATE

Modifica uno o más registros (no es unitario):


```sql
UPDATE tabla
SET col1 = val1, col2 = val2
WHERE condición;
```

### SELECT

Permite consultar filas de una o varias tablas. Devuelve un recordset o dataset (porción de la tabla).


```sql
SELECT col1, col2, …
FROM tabla
WHERE condición
GROUP BY col1, …
HAVING condición
ORDER BY col1, …;
```

SELECT * : devuelve todas las columnas.
Se pueden usar múltiples tablas en el FROM, y se hace un producto cartesiano entre ellas.

### WHERE

Condiciones de selección:

```sql
WHERE cond1 (=, <>, >, <)
  AND cond2
  OR cond3
  NOT cond4
  LIKE 'string_%'
  BETWEEN valor1 AND valor2;
```

### LIKE 'A%': empieza con A.

- '\_' representa cualquier carácter individual.

- %: representa cualquier cadena de caracteres.

### GROUP BY

Agrupa filas por valores compartidos de columnas:

SQL

```sql
SELECT col1, COUNT(*)
FROM tabla
GROUP BY col1;
```

Funciones de agregación. Se aplican sobre grupos:

- COUNT(): cantidad de registros por grupo.

- SUM(): suma de los valores del campo agrupado.

- MIN() / MAX(): mínimo / máximo.

- AVG(): promedio.

### HAVING

Se usa junto con GROUP BY. Filtra los resultados agrupados:

```sql
SELECT col1, COUNT(*)
FROM tabla
GROUP BY col1
HAVING COUNT(*) > 3;
```

### ORDER BY
Ordena filas por las columnas especificadas:

```sql
SELECT col1
FROM tabla
ORDER BY col1 ASC; -- o DESC
```
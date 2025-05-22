
  

# SQL JOINs y Subconsultas

  

## JOIN IMPLÍCITO

Tengo 2 tablas y les hago la intersección bajo una condición:

```sql

SELECT * FROM cliente, factura

WHERE clie_codigo = fact_cliente

```

  

## JOIN

Cláusula que permite unir 2 o más tablas para acotar el producto cartesiano que aparece en el FROM cuando agarro 2 tablas:

```sql

SELECT * FROM cliente JOIN factura ON clie_codigo = fact_cliente

```

Prefiero siempre usar este caso porque `WHERE` se usa más para un filtrado específico, una condición adicional.

  

## INNER JOIN

Es una intersección, funciona igual que el `JOIN` pero otros motores lo escriben de esta forma.

  

## GROUP BY

Si quiero contar la cantidad de ocurrencias, debo agrupar por los campos no calculables.

  

## LEFT/RIGHT JOIN

A una de las tablas me la trae siempre con todas las filas. Es decir, las que cumplen con el join y las que no.

  

- **LEFT JOIN**: en este caso, me agrega en el resultado todo lo que esté a la izquierda del igual que no cumpla con la restricción además de lo que traería normalmente. En este caso, me trae todos los clientes con factura más los que no tienen factura.

- **RIGHT JOIN**: le da prioridad a todo lo que está en la derecha.

  

## CASE

Permite establecer condición múltiple dentro de un SELECT (es como un switch de C). Hay 2 formas:

  

- **Con valor de columna**:

```sql

CASE columna

    WHEN valor1 THEN exp1

    WHEN valor2 THEN exp2

    WHEN valor3 THEN exp3

    ELSE opcion

END

```

  

- **Con condición**:

```sql

CASE

    WHEN condicion1 THEN exp1

    WHEN condicion2 THEN exp2

    WHEN condicion3 THEN exp3

    ELSE opcion

END

```

  

## TOP

Delimita la cantidad de filas desde el principio. En este caso, me devuelve las `n` primeras filas de la tabla ordenadas de mayor a menor por columna 1:

```sql

SELECT TOP n col1, col2 FROM table

ORDER BY col1

```

  

## UNION

Une varios resultados de SELECT distintos. Solo puede llevar un `ORDER BY` al final.

  

- Debo elegir la misma cantidad de columnas en cada SELECT.

- Cada columna debe ser del mismo tipo y tamaño.

  

```sql

SELECT col1, col2 FROM tabla1

UNION

SELECT col3, col4 FROM tabla2

```

- `col1` y `col3` deben ser del mismo tipo y tamaño.

- El `UNION` es disyuntivo -> **NO REPITE FILAS**.

- Si no quiero disyunción -> pongo `UNION ALL`.

  

## SUBCONSULTAS

Utilización recursiva de un SELECT dentro de otro SELECT. El que está adentro se resuelve primero.

  

Puede colocarse dentro de cualquier `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `GROUP BY` y `HAVING`.

  

- En la línea del SELECT (una fila y una columna):

```sql

SELECT col1, (SELECT col5 FROM tabla2 WHERE col3 = tabla1.col1)

FROM tabla1

```

  

- En el WHERE o HAVING (debe devolver expresión válida en condición):

```sql

SELECT col1, col2 FROM tabla1

WHERE col1 = (SELECT col3 FROM tabla2 WHERE col3 = tabla1.col1)

```

  

```sql

SELECT col1, col2 FROM tabla1

WHERE col1 IN (SELECT col3 FROM tabla2)

```

  

```sql

SELECT col1, col2 FROM tabla1

WHERE EXISTS (SELECT col3 FROM tabla2 WHERE col3 = col1)

```

  

- En el `GROUP BY` -> debe devolver un valor (una fila y una columna).

- En el `ORDER BY` -> debe devolver una fila y una columna.

- En el `FROM` -> debe devolver una tabla.
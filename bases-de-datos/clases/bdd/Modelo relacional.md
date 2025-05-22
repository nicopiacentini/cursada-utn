# Modelos Relacionales

El modelo relacional está basado en el **álgebra booleana** y el **álgebra de predicados**. Surge para resolver problemas de **consistencia** y **redundancia**.

Existen dos tipos de modelos:

- **Modelo lógico**: Es el DER (Diagrama Entidad-Relación) y la definición de atributos.
- **Modelo físico**: Surge cuando el modelo lógico se implementa.

En este contexto:

- Los **elementos** son **tablas**.
- Los **atributos** son **columnas**.
- Las **filas** representan los **valores que toman esos atributos**.

---

## Conceptos Clave

- **Relación**: Conjunto de **tuplas**, sin importar su orden.
- **Tupla**: Conjunto **no vacío** de atributos.  
  > 💡 Una **dupla** son 2 elementos.
- **Atributo**: Característica de interés. Tiene un **dominio**.
- **Dominio**: Valores posibles de un atributo, **acotado por el contexto**.
- **Valor nulo**: Representa un valor **desconocido**.  
  No es ni `TRUE` ni `FALSE`. Permite agregar valores indefinidos a una tabla.

---

## Claves

- **Primary Key**  
  Atributo (o conjunto de atributos) **no nulo**, que **identifica unívocamente** una tupla.

- **Foreign Key**  
  Atributo (o conjunto de atributos) que es **Primary Key en otra relación**.  
  Implementa el concepto de **integridad referencial**.

  Tipos de claves foráneas:
  - 🔹 **Identificativa**: Forma parte de la primary key en su propia tabla.
  - 🔹 **No identificativa**: **No** forma parte de la primary key en su propia tabla.

---

## Integridad Referencial

La integridad referencial implica que una tabla que hace referencia a otra debe **aludir siempre a una fila válida** de esa tabla.

Garantiza que la relación entre dos tablas **permanezca sincronizada** durante:

- Inserciones
- Actualizaciones
- Eliminaciones

---

## Características del Modelo Relacional

- ✅ **Independiente de la implementación**:  
  El modelo es **abstracto** y no depende del motor o la estructura física.

- ✅ **Independiente del orden**:  
  El orden de los elementos **no altera** la interpretación del conjunto.

- ✅ **Tablas normalizadas**:  
  Las tablas deben pasar por un proceso de **normalización**.

---

## Normalización

Proceso repetitivo que **estandariza** el diseño de las tablas, evitando **redundancia** y garantizando una estructura coherente con el modelo relacional.

### Formas Normales

#### 🔸 1FN (Primera Forma Normal)

- Tiene Primary Key.
- No debe haber:
  - Atributos **calculables** (obtenibles a partir de otros).
  - Atributos **repetitivos** (múltiples valores del mismo tipo en una fila).
  - Atributos **compuestos** (como `struct` en C).

#### 🔸 2FN (Segunda Forma Normal)

- Está en 1FN.
- Todos los atributos **no clave** dependen de **toda la clave primaria**.  
  Si la clave tiene dos atributos, los demás deben depender de ambos.

#### 🔸 3FN (Tercera Forma Normal)

- Está en 2FN.
- Los atributos **no clave** **no dependen de otros atributos no clave**.

---

## Ventajas y Desventajas de la Normalización

### ✅ Ventajas

- Elimina **redundancias**.
- Facilita un **modelo estable y estandarizado**.

### ⚠️ Desventajas

- En ciertos casos, la **redundancia puede ser útil**.
- **Mayor costo computacional** si siempre hay que **recalcular datos**, como sumar el total de una factura en cada consulta.

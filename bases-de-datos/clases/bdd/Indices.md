

  

El objetivo del índice es crear una estructura adicional que mantenga ordenados a los datos de una tabla a partir de una clave.  

Por ejemplo, la creación de una **PK** o un índice **UNIQUE**.

  

El índice puede estar:

- En una tabla aparte

- Dentro de la tabla que ordena  

> A partir de la arquitectura 8086, se encuentra en una tabla aparte.

  

## Posición relativa

  

Distancia al 0 en mi índice.

  

## Tipos de accesos a datos

  

- **Secuencial**: el acceso se realiza en función al modo en que ingresaron los datos.

- **Secuencial indexado**: el acceso se realiza en función a una clave que fue definida.

- **Directo o random**: el acceso se realiza en forma directa a una clave que fue definida.

  

---

  

En la práctica existen 2 métodos para la creación de índices:

  

1. **Hashing** → más usado en arquitectura de mainframe y microcomputadoras  

2. **Árbol binario (B-Tree)** → usado en arquitecturas 8086

  

---

  

## Hash

  

Las funciones hash crean una "huella digital" a partir del contenido de los datos.

  

Una buena función hash:

- Evita **colisiones** → los resultados de salida para un conjunto de entradas son todos distintos.

- **Distribuye claves uniformemente** → respecto a los valores de entrada.

- Es **fácil de calcular** → tiempo de ejecución O(1).

  

**Funcionamiento**:  

Se crea una tabla (vector de dos dimensiones):

- Dimensión 1 → claves

- Dimensión 2 → posiciones relativas en la tabla de datos

  

```text

hash(clave) → índice numérico

```

  

### Resolución de colisiones

  

Cuando la función hash devuelve la misma clave para dos valores distintos.

  

#### Métodos:

- **Encaminamiento**: lista con todos los valores que tienen la misma clave.

- **Direccionamiento abierto**: busca otra posición en la tabla.

  

**Técnicas de direccionamiento abierto**:

- **Sondeo lineal**: busca secuencialmente hasta encontrar una posición vacía.

- **Sondeo cuadrático**: busca `n` posiciones adelante de la original.

- **Hashing doble**: aplica una segunda función hash para calcular el tamaño del salto.

  

---

  

## Árboles M-arios

  

Se usan para:

- Conjuntos de datos muy grandes

- Operaciones en disco (bloques grandes entre 512 y 4096 bytes)

  

### Árbol B

  

Tipo de árbol M-ario utilizado para crear **índices físicos**.  

Objetivo: **minimizar operaciones de E/S hacia el disco**.

  

- Es **balanceado**

- Operaciones de búsqueda, inserción y eliminación: **O(log n)**

- Grado M: entre 50 y 2000 (dependiendo del tamaño de las claves y de la página de disco)

  

### Tipos de nodos

  

- **Nodo hoja**:

  - Contiene claves ordenadas de menor a mayor.

  - Contiene punteros con la posición relativa de los datos.

  

- **Nodo raíz o rama**:

  - Contiene claves ordenadas.

  - Punteros apuntan a nodos con claves menores o iguales.

  

Buscar en un árbol-B es como en un ABB, pero con múltiples caminos según el número de hijos.

  

---

  

## Operaciones

  

### Inserción

  

1. Buscar el nodo hoja donde debe insertarse.

2. Si hay espacio, se inserta.

  

#### Split

  

Si no hay espacio:

- Se divide el nodo en dos

- Cada mitad queda ordenada

- Una mitad con los valores menores, otra con los mayores

  

### Eliminación

  

1. Buscar el nodo hoja donde se encuentra el valor.

2. Si existe, se elimina.

  

#### Fusión

  

Si el nodo queda vacío:

- Se elimina

- Puede requerir actualizar antecesores

  

---

  

## Factor de Split

  

Indica el porcentaje de llenado de un nodo al que debe realizarse el split.  

> Hay un **desperdicio de espacio** para mantener la **performance constante**.
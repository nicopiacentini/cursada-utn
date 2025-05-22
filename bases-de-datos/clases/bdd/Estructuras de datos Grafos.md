# Grafos

Un grafo puede definirse como `G = (V, A)`, donde:

- `V` representa un conjunto de puntos, llamados **vértices** o **nodos**.
- `A` es un conjunto de relaciones entre pares de vértices, llamadas **aristas** o **arcos**.

De esta forma, un grafo es un conjunto de vértices y arcos que los relacionan.

> Ahora, las **aristas** se llaman **relaciones** y los **vértices** se llaman **nodos** porque contienen información.

---

## Grado

Es la cantidad de arcos o relaciones que **entran o salen** de un nodo.

- **Grado positivo**: la cantidad de arcos que salen de un nodo.
- **Grado negativo**: la cantidad de arcos que entran en un nodo.

> Si el grafo es direccionado y me piden el grado, elijo el más grande entre el positivo y el negativo.

---

Los grafos son una forma de **modelar problemas**, donde:

- Los **nodos** son los elementos del problema.
- Las **relaciones** son las relaciones entre esos elementos.

---

## Naturaleza abstracta de los grafos

Los grafos son **abstractos**: no existen en realidad, son un concepto y tienen una representación computacional.

Esta representación depende de su tamaño y si es estático o dinámico:

### Representación estática

Aunque contempla cambios en el grafo, **no cambia su estructura** frecuentemente. Está pensada para ser modificada muy de vez en cuando.

- **Matriz de adyacencia**: matriz `n x m` donde `n` es la cantidad de nodos. Hay un `1` si dos nodos están relacionados y `0` si no.
  
- **Matriz de incidencia**: matriz `n x m` donde `n` es la cantidad de nodos y `m` la cantidad de relaciones.

### Representación dinámica

Cambia **cada vez que se produce un cambio** en el grafo, es decir, si se agregan o eliminan nodos o relaciones.

- **Lista de adyacencia** o **estructura de graal**: es una lista de nodos y cada uno tiene un puntero a una lista con las relaciones.

> Ejemplo: Si el nodo `a` se relaciona con el nodo `b`, el nodo `a` tiene una lista con las direcciones de los nodos con los que se relaciona, incluyendo `b`.

---

## Características de grafos

- **Grafo libre**: grado 0, no tiene relaciones; todos los nodos están sueltos.
- **Grafo completo**: tiene todas las relaciones posibles entre nodos.
- **Grafo regular**: todos los nodos tienen el mismo grado.
- **Grafo simple**: como mucho una arista une dos vértices para todos los vértices.
- **Grafo complejo**: más de una arista une dos vértices.
- **Grafo conexo**: para cualquier par de vértices, hay un camino entre ellos.
- **Grafo no conexo**: hay un grupo de vértices que no está conectado con el resto.
- **Grafo complementario a otro grafo**: tiene las relaciones que le faltan al otro.

---

## Clasificación de grafos

- **Dirigidos**: relaciones unidireccionales entre nodos.
- **No dirigidos**: relaciones bidireccionales entre nodos.

---

### Grafos restrictos

No deben cumplir necesariamente con reflexividad, simetría y transitividad (es decir, no son equivalencias).

- **Reflexividad**: un nodo se relaciona consigo mismo.
- **Simetría**: si `a` se relaciona con `b`, entonces `b` se relaciona con `a`.
- **Transitividad**: si `a` se relaciona con `b` y `b` se relaciona con `c`, entonces `a` se relaciona con `c`. (Llevar a un esquema directo una relación indirecta.)

Tipos:

- **Anti**: nunca se cumple la característica en ninguna relación.
- **a-**: puede o no cumplirse la característica.

### Grafos irrestrictos

Pueden o no cumplir con las características previamente mencionadas.

---

## Camino, paso y ciclo en grafos

- **Paso**: solo en grafos dirigidos. Hay un camino entre dos nodos siguiendo el sentido de la relación.
- **Camino**: hay una vinculación directa o indirecta entre dos o más arcos, independientemente del sentido.
  > Si hay camino hay paso, pero no necesariamente al revés.
- **Ciclo**: camino que empieza y termina en el mismo nodo.

---

## Búsqueda de caminos en grafos

- **Búsqueda en profundidad (Depth First)**: avanza sin orden jerárquico hasta que no puede seguir más, y luego retrocede. No analiza todos los arcos, va directo al primero disponible.
  
- **Búsqueda en anchura (Breadth First)**: analiza todos los nodos relacionados con uno, y si ninguno es el buscado, pasa al primero de ellos y repite el proceso.

---

## Estructura de datos

Una estructura de datos es un **grafo dirigido y restricto** con las siguientes características:

- **Unicidad en sus relaciones**: en orden de predecesor, cada nodo solo puede tener un único predecesor.

> Se usan para modelar problemas reales porque al ser restrictos, son más administrables.

### Tipos de estructuras

#### Unívocas y biunívocas

- **Unívoca**: tiene un solo predecesor pero muchos posteriores.
- **Biunívoca**: tiene un predecesor y un solo posterior. Cualquier elemento del dominio de entrada tiene un solo elemento distinto en el dominio de salida.
  - Ejemplos: pila, cola, lista.

---

## Listas

Pueden ser **linkeadas** o **estáticas**. Los elementos pueden ser posicionados y ordenados según necesidad.

Tipos:

- **Lineal**: empieza y el último nodo termina en `null`.
- **Circular**: el último nodo apunta al primero.
- **Doblemente enlazada**: cada nodo tiene dos punteros, uno al siguiente y otro al anterior.

---

## Pila

- Representación: dinámica (punteros) o estática (vectores).
- Comportamiento: todos los elementos entran y salen por el mismo tope (**LIFO** - Last In First Out).

---

## Cola

- Tiene dos punteros: al primero que entró y al último que entró.
- Comportamiento: el primer elemento en salir es el primero en entrar (**FIFO** - First In First Out).
- Representación: dinámica o estática.

---

## Árboles

- El **grado** define la cantidad de punteros que tiene cada nodo.
- Funciona como una lista pero con **más de una rama** en su representación.
- Representación estática: **vector**.

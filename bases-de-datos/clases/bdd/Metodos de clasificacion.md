  

**Clasificar** → ordenar en un momento determinado un conjunto de valores, que no se tiene ordenado en el tiempo. Para que queden ordenados en el tiempo hay que usar índices.

  

Los registros que voy a ordenar están dados por:  

- **Clave** → campo por el que voy a ordenar  

- **Datos satélite** → resto de datos que acompañan al registro

  

**Estabilidad** → un ordenamiento es estable cuando ante la igualdad de valores, el que ingresó primero toma la primer posición.

  

**In situ** → ordenar *in situ* implica no pedir más memoria de la que ocupan mis registros originalmente no ordenados para ordenarlos. Es decir, no crear un array nuevo para poner mi array ordenado.

  

## Clasificación de algoritmos según métodos internos y externos

  

- **Método interno** → diseñado para ordenar en memoria RAM porque la performance del algoritmo es menor.  

- **Método externo** → diseñado para ordenar datos en memoria externa o disco porque le alcanza la performance.

  

**Complejidad computacional de un algoritmo** → cuán complejo es para la computadora resolver el algoritmo que le doy. Hay una clasificación de problemas entre:  

- **P** (posibles de resolver por computadora)  

- **NP** (no posibles de resolver por computadora). El algoritmo para NP existe pero no puede ejecutarse para un número determinado de datos.

  

El orden de complejidad se define como **O(f(n))**, siendo *f* una función matemática asociada a un algoritmo que representa la cantidad de comparaciones que se realizan para una cantidad *n* de datos. Me dice cuánto tarda en ejecutarse un algoritmo en función de la cantidad de datos que recibe.

  

### Cómo se evalúa el orden de complejidad

  

- La computadora puede hacer operaciones matemáticas y comparaciones booleanas.

- Para evaluar la complejidad de un algoritmo se evalúa la cantidad de comparaciones realizadas.

- El motivo es que un `if` puede llegar a ser hasta 100 veces más lento que una operación matemática.

  

## Métodos de ordenamiento

  

- **Bubble Sort** → compara por pares, si el de la izquierda es menor que la derecha lo intercambia mientras recorre de izquierda a derecha. El más grande de todos burbujea hasta la última posición.  

  - Complejidad: O(n²) por dos `for` anidados con `if`. Pero si viene ordenado, la complejidad es O(n) porque hago n comparaciones.

  

- **Selection Sort** → compara por pares pero de otra forma. Compara el elemento 0 con los n-1 restantes. Cada iteración encuentra al mínimo.  

  - Complejidad: O(n²)

  

- **Insertion Sort** → compara de izquierda a derecha buscando un marcador → un elemento más grande que todos los que estén a la izquierda. Si el marcador es más grande que el elemento que le sigue, inserta ese elemento en orden en la lista de la izquierda.  

  - Complejidad: O(n²), pero hace menos comparaciones que los anteriores.

  

- **Shell Sort** → modificación del Insertion Sort. Compara por secuencia de incrementos, es decir, compara con k posiciones adelante. Arma grupos de k elementos desordenados internamente, pero ordenados entre grupos.  

  - Complejidad: O(n³/²)

  

### Algoritmos con complejidad subcuadrática (externos)

  

- **Merge Sort** → divide el conjunto a la mitad hasta no poder dividir más, y luego fusiona en orden. Arma un árbol de comparación por niveles.  

  - Complejidad: O(n log n)

  

- **Quick Sort** → elige un pivote, compara todos los elementos con él y divide en menores y mayores, a izquierda y derecha. Repite recursivamente.  

  - Complejidad: O(n log n), salvo si los datos ya están ordenados.

  

- **Mean Sort** → toma como pivote el más parecido a la media. Útil si los datos están acotados.

  

- **B Sort** → elige el elemento que está en el medio del array como pivote.

  

- **Heap Sort** → arma un heap con los datos y luego lo desarma.  

  - **Heap** → árbol binario completo donde el padre es mayor que los hijos.
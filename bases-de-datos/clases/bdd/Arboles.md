# Listas, Colas y Árboles

## Estructuras

- **Listas y colas**: son _biunívocas_ → para un nodo le entra y le sale una sola flecha.
    
- **Árboles**: son _unívocos_ → a un nodo le entra una flecha y le puede salir una o varias.
    

## Conceptos clave

### Grado de un árbol

- Es la cantidad máxima de hijos o subárboles que puede tener un nodo.
    
- Fórmula: `2^grado = cantidad máxima de elementos`.
    

### Nivel

- Es la posición en la que se encuentra cada nodo relativa a la raíz (nivel 0).
    
- En estructuras biunívocas, el nivel es igual a la cantidad de elementos.
    
- En una búsqueda, se compara por niveles: al elegir un nodo para buscar, se examinan todos los niveles inferiores.
    

### Profundidad

- Cantidad de niveles distintos que tiene el árbol.
    

## Representación computacional

### Estática

- Se representa como un vector.
    
- Para cambiar de nivel, se multiplica el índice por el grado.
    
- Para llegar al primer hijo: sumar 1.
    
- Para el segundo hijo: sumar 2, y así sucesivamente.
    
- Para hallar el padre:
    
    1. Calcular el módulo del índice respecto al grado.
        
    2. Restar esa cantidad.
        
    3. Dividir por el grado.
        

> Un elemento `i` tiene sus hijos en `2i + 1`, `2i + 2`, etc., hasta completar el grado.

### Dinámica

- Conjunto de nodos del mismo tipo.
    
- La cantidad de hijos por nodo corresponde al grado del árbol.
    

---

## Características del árbol

- **Completo**: todos los nodos cumplen con el grado o son hijos.
    
- **Balanceado**: todos los subárboles de la raíz pesan lo mismo (tienen igual cantidad de elementos o una diferencia indivisible).
    
- **Perfectamente balanceado**: el árbol está balanceado en todos sus niveles.
    

### Crecimiento en los árboles

- Cantidad máxima de elementos:
    
    (gradoniveles)−1(grado^{niveles}) - 1(gradoniveles)−1
- **Búsqueda en árboles**:
    
    elementos=gradoniveles−1\text{elementos} = grado^{niveles} - 1elementos=gradoniveles−1 ⇒niveles=log⁡grado(elementos+1)\Rightarrow \text{niveles} = \log_{grado} (\text{elementos} + 1)⇒niveles=loggrado​(elementos+1)

---

## Árbol binario de búsqueda (ABB)

- Árbol de grado 2.
    
- El elemento **más pequeño que la raíz** va por la **izquierda**.
    
- El elemento **más grande que la raíz** va por la **derecha**.
    

> Equivale a realizar una **búsqueda binaria** con un vector o lista.

### Para balancearlo:

- La raíz debe ser el **mayor de los menores** o el **menor de los mayores**.
    

---

## Barridos de árboles

### Tipos de recorridos

- **Preorden**: se lee el nodo apenas se llega.
    
- **Postorden**: se lee el nodo al irse y no regresar.
    
- **Inorden**: se lee el nodo al cambiar de rama.
    

### Código de ejemplo

**Preorden**

```c
if (root) {     
	printf(root->dato);     
	preorden(root->izq);     
	preorden(root->der); } 
return;
```


**Inorden**

c

CopyEdit

```c
if (root) {     
	inorden(root->izq);     
	printf(root->dato);     
	inorden(root->der); 
	} return;
```

---

## Árbol de expresión

Se puede resolver una expresión colocándola en un árbol.

- Si se recorre **inorden**, se obtiene la **notación infija**.
    
- Si se recorre **postorden**, se obtiene la **notación postfija (polaca inversa)**.
    


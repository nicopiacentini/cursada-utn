# Matrices Cuadradas Especiales

## Tipos de Matrices Especiales

### Matriz Diagonal

Sea $A \in \mathbb{R}^{n \times n}$. Se denomina **matriz diagonal** si cumple:

$$a_{ij} = 0 \quad \text{si } i \neq j$$

Todos los elementos fuera de la diagonal principal son cero.

**Ejemplo:**

$$A = \begin{pmatrix} 5 & 0 & 0 \ 0 & -3 & 0 \ 0 & 0 & 7 \end{pmatrix}$$

---

### Matriz Triangular Inferior

Sea $A \in \mathbb{R}^{n \times n}$. Se denomina **matriz triangular inferior** si cumple:

$$a_{ij} = 0 \quad \text{si } i < j$$

Todos los elementos por encima de la diagonal principal son cero.

**Ejemplo:**

$$A = \begin{pmatrix} 3 & 0 & 0 \ 1 & 5 & 0 \ 2 & -4 & 8 \end{pmatrix}$$

---

### Matriz Triangular Superior

Sea $A \in \mathbb{R}^{n \times n}$. Se denomina **matriz triangular superior** si cumple:

$$a_{ij} = 0 \quad \text{si } i > j$$

Todos los elementos por debajo de la diagonal principal son cero.

**Ejemplo:**

$$A = \begin{pmatrix} 3 & 1 & 7 \ 0 & 5 & -2 \ 0 & 0 & 8 \end{pmatrix}$$

---

### Matriz Simétrica

Sea $A \in \mathbb{R}^{n \times n}$. Se denomina **matriz simétrica** si cumple:

$$A = A^t \quad \Longleftrightarrow \quad a_{ij} = a_{ji} \quad \forall, i, j$$

**Ejemplo:**

$$A = \begin{pmatrix} 1 & 3 & 5 \ 3 & 2 & 7 \ 5 & 7 & 4 \end{pmatrix}$$

---

### Matriz Dominante Diagonalmente

Sea $A \in \mathbb{R}^{n \times n}$. Se denomina **dominante diagonalmente** (o diagonal dominante) si:

$$|a_{ii}| \geq \sum_{\substack{j=1 \ j \neq i}}^{n} |a_{ij}| \quad \forall, i = 1 \ldots n$$

Esto significa que en **cada fila**, el valor absoluto del elemento de la diagonal principal debe ser **mayor o igual** a la suma de los valores absolutos de los demás elementos de esa fila.

**Ejemplo:**

$$A = \begin{pmatrix} -10 & -2 & 1 & 3 \ 1 & 8 & 5 & 0 \ -2 & 4 & 11 & -5 \ 1 & -1 & 3 & 9 \end{pmatrix}$$

Verificación por filas:

- Fila 1: $|-10| > |-2| + |1| + |3|$ → $10 > 6$ ✓
- Fila 2: $|8| > |1| + |5| + |0|$ → $8 > 6$ ✓
- Fila 3: $|11| = |-2| + |4| + |-5|$ → $11 = 11$ ✓ (mayor o igual)
- Fila 4: $|9| > |1| + |-1| + |3|$ → $9 > 5$ ✓

---

### Matriz Estrictamente Diagonal Dominante

Sea $A \in \mathbb{R}^{n \times n}$. Se denomina **estrictamente diagonal dominante** si:

$$|a_{ii}| > \sum_{\substack{j=1 \ j \neq i}}^{n} |a_{ij}| \quad \forall, i = 1 \ldots n$$

La diferencia con la dominante diagonalmente es que aquí se exige **estrictamente mayor** (no puede ser igual).

**Ejemplo:**

$$A = \begin{pmatrix} 7 & 2 & -3 \ 1 & -5 & 2 \ 4 & -1 & 6 \end{pmatrix}$$

Verificación:

- Fila 1: $|7| > |2| + |-3|$ → $7 > 5$ ✓
- Fila 2: $|-5| > |1| + |2|$ → $5 > 3$ ✓
- Fila 3: $|6| > |4| + |-1|$ → $6 > 5$ ✓

> **Propiedad importante:** Una $A \in \mathbb{R}^{n \times n}$ estrictamente diagonal dominante es **regular** (o sea, inversible).

---

## Descomposición de A para Métodos Iterativos

Para los métodos iterativos se utiliza la descomposición:

$$A = D - L - U$$

Donde:

- **D** es la matriz diagonal (con los elementos de la diagonal de $A$)
- **L** es la matriz triangular inferior con los signos cambiados (elementos debajo de la diagonal de $A$, con signo negativo)
- **U** es la matriz triangular superior con los signos cambiados (elementos encima de la diagonal de $A$, con signo negativo)

$$D = \begin{pmatrix} a_{11} & 0 & \cdots & 0 \ 0 & a_{22} & \cdots & 0 \ \vdots & & \ddots & \vdots \ 0 & \cdots & 0 & a_{nn} \end{pmatrix}, \quad L = \begin{pmatrix} 0 & & \cdots & 0 \ -a_{21} & 0 & & \vdots \ \vdots & \ddots & \ddots & \vdots \ -a_{n1} & \cdots & -a_{n,n-1} & 0 \end{pmatrix}$$

$$U = \begin{pmatrix} 0 & -a_{12} & \cdots & -a_{1n} \ & 0 & \ddots & \vdots \ & & \ddots & -a_{n-1,n} \ 0 & & & 0 \end{pmatrix}$$

---

## Tags

#matrices #algebralineal #SEL #matrizdiagonal #dominantediagonal
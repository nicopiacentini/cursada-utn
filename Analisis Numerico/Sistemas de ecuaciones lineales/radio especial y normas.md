# Radio Espectral, Normas Vectoriales y Matriciales

## Radio Espectral de una Matriz Cuadrada

Sea $A \in \mathbb{R}^{n \times n}$. Se define el **radio espectral** de $A$ al valor real positivo:

$$\rho(A) = \max_i |\lambda_i|$$

siendo $\lambda_i$ los **autovalores** de la matriz $A$.

---

## Autovalores y Autovectores

Sea $A \in \mathbb{R}^{n \times n}$. Se dice que $\lambda \in K$ es un **autovalor** de $A$ si:

$$\exists, v \in K^n \quad / \quad A \cdot v = \lambda \cdot v$$

y $v$ es el **autovector** de $A$ asociado a $\lambda$.

### ¿Cómo se calculan los autovalores?

Como debe cumplirse $Ax = \lambda x$:

$$Ax = \lambda I x \Rightarrow Ax - \lambda Ix = 0 \Rightarrow (A - \lambda I)x = 0$$

Este último es un **S.E.L. homogéneo** con matriz de coeficientes $A - \lambda I$.

Para que tenga soluciones distintas de la trivial (es decir, que sea S.C.I.), es necesario que:

$$|A - \lambda I| = 0$$

Al desarrollar este determinante queda un **polinomio de grado $n$** en la variable $\lambda$, llamado **polinomio característico**, cuyas raíces son los autovalores.

### Ejemplo de cálculo del radio espectral

Calcular $\rho(A)$ para:

$$A = \begin{pmatrix} -1 & 2 & 0 \ -4 & 5 & 0 \ -4 & 2 & 4 \end{pmatrix}$$

Planteamos $|A - \lambda I| = 0$:

$$\begin{vmatrix} -1-\lambda & 2 & 0 \ -4 & 5-\lambda & 0 \ -4 & 2 & 4-\lambda \end{vmatrix} = 0$$

Desarrollando por la tercera columna:

$$(-1-\lambda)(5-\lambda)(4-\lambda) + (4-\lambda) \cdot 8 = (4-\lambda)\left[(5-\lambda)(-1-\lambda) + 8\right]$$

$$= (4-\lambda)\left[-5+\lambda-5\lambda+\lambda^2+8\right] = (4-\lambda)\left[\lambda^2 - 4\lambda + 3\right]$$

$$= (4-\lambda)(\lambda-3)(\lambda-1) = 0$$

Los autovalores son: $\lambda_1 = 4$, $\lambda_2 = 3$, $\lambda_3 = 1$

$$\boxed{\rho(A) = 4}$$

> **Ejercicio propuesto:** Hallar el radio espectral de $A = \begin{pmatrix} -1 & 2 & 0 \ -4 & 5 & 0 \ -4 & 2 & 4 \end{pmatrix}$ → Respuesta: $\rho(A) = 4$

---

## Norma Vectorial

La definición de norma lleva implícito generalizar a un espacio vectorial cualquiera la noción de **módulo de un vector** en un espacio euclídeo.

Sea $V$ un espacio vectorial sobre un cuerpo $K$ y $\vec{x}$ un vector del espacio. Se dice que $|\cdot| : V \to \mathbb{R}$ es un **operador que define la norma** de $\vec{x}$ si cumple:

1. $|\vec{x}| \geq 0$. Si $\vec{x} = 0 \Rightarrow |\vec{x}| = 0$
2. $\forall, \vec{x} \in V,; \forall, k \in \mathbb{R} : |k\vec{x}| = |k| \cdot |\vec{x}|$
3. $\forall, \vec{x}, \vec{y} \in V : |\vec{x} + \vec{y}| \leq |\vec{x}| + |\vec{y}|$ (desigualdad triangular)

### Norma-p

Sea $x = (x_1, x_2, \ldots, x_n)$. Se define la **norma-p** como:

$$|x|_p = \sqrt[p]{|x_1|^p + |x_2|^p + \cdots + |x_n|^p}$$

> **Nota:** $|x|_2$ se denomina **norma 2** y es la comúnmente usada (equivale al módulo euclídeo).

**Ejemplo:** Hallar la norma 2 del vector $x = (3.25,; -4.13,; 0.67)$:

$$|x|_2 = \sqrt{3.25^2 + (-4.13)^2 + 0.67^2} = \sqrt{10.5625 + 17.0569 + 0.4489} = \sqrt{28.0683} \approx 5.298$$

### Norma-infinito

Se define la **norma infinito** como:

$$|\vec{x}|_\infty = \max(|x_1|, |x_2|, \ldots, |x_n|) = \max_i |x_i| \quad \text{con } i = 1, \ldots, n$$

**Ejemplo:** Hallar la norma infinito del vector $x = (3.25,; -4.13,; 0.67)$:

$$|x|_\infty = \max(3.25,; 4.13,; 0.67) = 4.13$$

---

## Distancia entre dos Vectores

Se define como **distancia entre dos vectores** $\vec{x}$ e $\vec{y}$ al escalar:

$$d(\vec{x};, \vec{y}) = |\vec{x} - \vec{y}|$$

Las normas vectoriales se usan para **calcular distancia entre dos vectores** (especialmente en los criterios de parada de los métodos iterativos).

**Ejemplo:** Hallar la distancia entre $v_1 = (3.45, -2.21, 6.08)$ y $v_2 = (3.57, -2.35, 5.99)$:

$$v_1 - v_2 = (-0.12,; 0.14,; 0.09)$$

- **Con norma 2:** $d = \sqrt{0.0144 + 0.0196 + 0.0081} = \sqrt{0.0421} \approx 0.2052$
- **Con norma infinito:** $d = \max(0.12,; 0.14,; 0.09) = 0.14$

---

## Normas Matriciales

Con una idea similar se puede definir una **norma matricial**.

Una norma matricial es una función $|\cdot| : \mathbb{R}^{n \times n} \to \mathbb{R}^+ \cup {0}$ que cumple:

1. Si $A = 0$ entonces $|A| = 0$
2. $|kA| = |k||A|$ para $k \in \mathbb{R}$, $A \in \mathbb{R}^{n \times n}$
3. $|A + B| \leq |A| + |B|$
4. $|A \cdot B| \leq |A| \cdot |B|$

> Las tres primeras propiedades garantizan que es una norma vectorial, y la última que es **compatible con el producto de matrices**.

### Norma 1

$$|A|_1 = \max_{1 \leq j \leq n} \sum_{i=1}^{n} |a_{ij}|$$

La norma 1 es el **máximo de las sumas de los módulos de los elementos de las columnas** de la matriz.

**Ejemplo:** Sea $A = \begin{pmatrix} 3 & 1 \ 2 & 4 \end{pmatrix}$:

- Suma 1ª columna: $3 + 2 = 5$
- Suma 2ª columna: $1 + 4 = 5$
- Por lo tanto: $|A|_1 = 5$

**Ejercicio:** Calcular la norma 1 de $A = \begin{pmatrix} 1 & 0 & -7 \ 0 & 2 & 2 \ -1 & -1 & 0 \end{pmatrix}$

Columnas: $|1|+|0|+|-1|=2$; $|0|+|2|+|-1|=3$; $|-7|+|2|+|0|=9$ → $|A|_1 = 9$

### Norma Infinito (Matricial)

$$|A|_\infty = \max_{1 \leq i \leq n} \left{ \sum_{j=1}^{n} |a_{ij}| \right}$$

La norma infinito es el **máximo de las sumas de los módulos de los elementos de las filas** de la matriz.

**Ejemplo:** Sea $A = \begin{pmatrix} 3 & 1 \ 2 & 4 \end{pmatrix}$:

- Suma 1ª fila: $3 + 1 = 4$
- Suma 2ª fila: $2 + 4 = 6$
- Por lo tanto: $|A|_\infty = 6$

**Ejercicio:** Calcular la norma $\infty$ de $A = \begin{pmatrix} 1 & 0 & -7 \ 0 & 2 & 2 \ -1 & -1 & 0 \end{pmatrix}$

Filas: $|1|+|0|+|-7|=8$; $|0|+|2|+|2|=4$; $|-1|+|-1|+|0|=2$ → $|A|_\infty = 8$

### Norma 2 (Matricial)

$$|A|_2 = \sqrt{\rho(A^* \cdot A)}$$

donde $\rho$ es el **radio espectral** de $A$ (máximo valor en módulo de los autovalores de $A^_A$). Por $A^_$ se denota la matriz traspuesta conjugada de $A$ (si $A$ es real, $A^* = A^t$).

**Ejemplo resuelto:** Sea $A = \begin{pmatrix} 1 & 0 & -7 \ 0 & 2 & 2 \ -1 & -1 & 0 \end{pmatrix}$, calcular $|A|_2$.

Primero calculamos:

$$A^* A = \begin{pmatrix} 1 & 0 & -1 \ 0 & 2 & -1 \ -7 & 2 & 0 \end{pmatrix} \begin{pmatrix} 1 & 0 & -7 \ 0 & 2 & 2 \ -1 & -1 & 0 \end{pmatrix} = \begin{pmatrix} 2 & 1 & -7 \ 1 & 5 & 4 \ -7 & 4 & 53 \end{pmatrix}$$

Calculando los autovalores de $A^*A$:

$$-\lambda^3 + 60\lambda^2 - 315\lambda + 144 = 0$$

La mayor raíz es $\lambda = 54{,}2415921368447$

$$|A|_2 = \sqrt{54{,}2415921368447} \approx 7{,}36488914626994$$

---

## Tags

#autovalores #radioespectral #normas #SEL #metodosnumericos
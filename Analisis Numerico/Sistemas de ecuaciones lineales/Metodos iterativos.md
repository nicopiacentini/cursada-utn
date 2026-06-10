# Métodos Iterativos para Resolución de SEL

## Concepto General

Los métodos iterativos (también llamados **indirectos**) consisten en generar una **sucesión** ${X^{(k)}}_{k=0}^{\infty}$ cuyo límite sea la solución del sistema lineal.

Dado $A \in \mathbb{R}^{n \times n}$, $B \in \mathbb{R}^n$, $X \in \mathbb{R}_n$, $AX = B$ se resuelve por técnicas iterativas si se genera una sucesión que converge a la solución.

La mayoría utilizan un **valor inicial** $X^{(0)}$ y generan vectores mediante:

$$X^{(k)} = T \cdot X^{(k-1)} + C$$

donde $T$ es una **matriz de iteración** y $C$ un **vector** que dependen del sistema $AX = B$.

> **Ventaja:** Una vez que convergen, son más eficientes que los directos.  
> **Desventaja:** No siempre convergen; la sucesión puede divergir.

---

## 1. Método de Jacobi

### Idea del Método

Se **despeja** cada incógnita $x_i$ de la $i$-ésima ecuación y se itera.

### Fórmula Iterativa

$$x_i^{(k)} = \frac{\displaystyle\sum_{\substack{j=1 \ j \neq i}}^{n} \left(-a_{ij} x_j^{(k-1)}\right) + b_i}{a_{ii}} = \frac{-\sum_{\substack{j=1\j\neq i}}^n a_{ij} x_j^{(k-1)} + b_i}{a_{ii}} \quad 1 \leq i \leq n$$

> En cada iteración $k$, **todos los valores usados provienen de la iteración anterior** $k-1$.

El vector inicial más común es el **vector nulo** $X^{(0)} = (0, 0, \ldots, 0)$, aunque también puede usarse el vector $C$.

### Ejemplo completo

Dado el sistema:

$$\begin{cases} 10x_1 - x_2 + 2x_3 = 6 \ -x_1 + 11x_2 - x_3 + 3x_4 = 25 \ 2x_1 - x_2 + 10x_3 - x_4 = -11 \ 3x_2 - x_3 + 8x_4 = 15 \end{cases}$$

**Paso 1 — Despejar cada incógnita:**

$$\begin{cases} x_1 = \dfrac{1}{10}x_2 - \dfrac{1}{5}x_3 + \dfrac{3}{5} \[8pt] x_2 = \dfrac{1}{11}x_1 + \dfrac{1}{11}x_3 - \dfrac{3}{11}x_4 + \dfrac{25}{11} \[8pt] x_3 = -\dfrac{1}{5}x_1 + \dfrac{1}{10}x_2 + \dfrac{1}{10}x_4 - \dfrac{11}{10} \[8pt] x_4 = -\dfrac{3}{8}x_2 + \dfrac{1}{8}x_3 + \dfrac{15}{8} \end{cases}$$

**Matrices T y C de Jacobi:**

$$T = \begin{bmatrix} 0 & \frac{1}{10} & -\frac{1}{5} & 0 \[4pt] \frac{1}{11} & 0 & \frac{1}{11} & -\frac{3}{11} \[4pt] -\frac{1}{5} & \frac{1}{10} & 0 & \frac{1}{10} \[4pt] 0 & -\frac{3}{8} & \frac{1}{8} & 0 \end{bmatrix}, \quad C = \begin{pmatrix} \frac{3}{5} \[4pt] \frac{25}{11} \[4pt] -\frac{11}{10} \[4pt] \frac{15}{8} \end{pmatrix}$$

**Sucesión generada (partiendo de $X^{(0)} = (0,0,0,0)$):**

|$k$|$x_1$|$x_2$|$x_3$|$x_4$|
|---|---|---|---|---|
|0|0|0|0|0|
|1|0.6|2.2727|-1.100|1.8750|
|...|...|...|...|...|
|9|0.9997|2.0004|-1.0004|1.0006|
|10|1.0001|1.9998|-0.9998|0.9998|

La solución tiende a $X = (1;; 2;; -1;; 1)$.

### Matrices T y C de Jacobi (deducción formal)

Partiendo de la descomposición $A = D - L - U$:

$$(D - L - U)X = B \Rightarrow DX = (L+U)X + B \Rightarrow X = D^{-1}(L+U)X + D^{-1}B$$

$$\boxed{T_{\text{Jacobi}} = D^{-1}(L+U)} \qquad \boxed{C_{\text{Jacobi}} = D^{-1}B}$$

### Criterio de Parada

Se detiene el proceso cuando:

$$\frac{|x^{(k)} - x^{(k-1)}|}{|x^{(k)}|} < \varepsilon$$

para alguna norma matricial (comúnmente **norma infinito**).

**Ejemplo numérico del criterio:** En el ejemplo anterior con $k=10$:

$$\frac{|x^{(10)} - x^{(9)}|_\infty}{|x^{(10)}|_\infty} = \frac{8.0 \times 10^{-4}}{1.9998} \approx 10^{-3}$$

> **Importante:** En cualquier ecuación $a_{ii}$ **no debe ser 0**. Si ocurre, se pueden permutar filas o columnas. Si no se puede salvar con permutaciones, el sistema no tiene solución única.

---

## 2. Método de Gauss-Seidel

Es similar al método de Jacobi, pero con un **pequeño pero importante cambio**: al calcular el nuevo valor de $x_i$ en el paso $k$, se usan los **valores ya calculados en ese mismo paso** (en lugar de los del paso anterior).

### Fórmula Iterativa

$$x_i^{(k)} = \frac{-\displaystyle\sum_{j=1}^{i-1} a_{ij} x_j^{(k)} - \sum_{j=i+1}^{n} a_{ij} x_j^{(k-1)} + b_i}{a_{ii}} \quad 1 \leq i \leq n, \quad a_{ii} \neq 0$$

- Los términos con $j < i$ usan valores del **paso actual** $k$
- Los términos con $j > i$ usan valores del **paso anterior** $k-1$

### Ejemplo comparativo (mismo sistema que Jacobi)

Partiendo de $X^{(0)} = (0; 0; 0; 0)$:

- Al calcular $x_1$: se usa $(0,0,0,0)$ → $x_1 = 0.6$
- Al calcular $x_2$: se usa el $x_1$ **recién hallado** → vector $(0.6; 0; 0; 0)$ → $x_2 = 2.3272$
- Al calcular $x_3$: se usa $x_1$ y $x_2$ **recién hallados** → vector $(0.6; 2.3272; 0; 0)$
- Y así sucesivamente...

**Sucesión generada:**

|$k$|$x_1$|$x_2$|$x_3$|$x_4$|
|---|---|---|---|---|
|0|0|0|0|0|
|1|0.6|2.3272|-0.9873|-0.8789|
|...|...|...|...|...|
|4|1.0009|2.0003|-1.0003|0.9999|
|5|1.0001|2.0000|-1.0000|1.0000|

> **Gauss-Seidel converge mucho más rápido que Jacobi** (5 iteraciones vs 10 iteraciones para la misma precisión).

### Matrices T y C de Gauss-Seidel (deducción formal)

Usando las mismas matrices $D$, $L$, $U$ de Jacobi, en Gauss-Seidel se puede demostrar que:

$$(D - L)X^{(k)} = UX^{(k-1)} + B$$

Por lo tanto: $X^{(k)} = (D-L)^{-1} U X^{(k-1)} + (D-L)^{-1} B$

$$\boxed{T_{GS} = (D-L)^{-1} U} \qquad \boxed{C_{GS} = (D-L)^{-1} B}$$

### Ejemplo con criterio de parada

Sea el sistema:

$$\begin{cases} 7x - 2y + 4z = 1 \ x + 5y - 3z = 8 \ 2x - 2y + 6z = 2 \end{cases}$$

Resolver por Gauss-Seidel partiendo de $X^{(0)} = (0, 2, 1)$ con error menor a $0.01$ (norma infinito vectorial).

**Despejando:**

$$x = \frac{1 + 2y - 4z}{7}, \quad y = \frac{8 - x + 3z}{5}, \quad z = \frac{2 - 2x + 2y}{6}$$

(Se realizan las iteraciones sustituyendo en cada paso los valores recién calculados hasta que $|X^{(k)} - X^{(k-1)}|_\infty < 0.01$)

---

## Comparación Jacobi vs Gauss-Seidel

|Característica|Jacobi|Gauss-Seidel|
|---|---|---|
|Valores usados en iteración $k$|Todos de $k-1$|Mezcla de $k$ y $k-1$|
|Velocidad de convergencia|Más lento|Más rápido (generalmente)|
|Paralelizable|Sí (fácil)|Más difícil|
|Matriz T|$D^{-1}(L+U)$|$(D-L)^{-1}U$|
|Matriz C|$D^{-1}B$|$(D-L)^{-1}B$|

---

## Tags

#metodosIterativos #Jacobi #GaussSeidel #SEL #metodosnumericos
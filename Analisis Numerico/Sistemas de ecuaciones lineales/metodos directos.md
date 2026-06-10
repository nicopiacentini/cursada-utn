# Métodos Directos de Resolución de SEL

Los **métodos directos** se caracterizan porque conducen a la **solución exacta** mediante un número finito (aunque muy grande) de operaciones.

Los más usados son: **Gauss**, **Gauss-Jordan** y **Descomposición LU (Crout)**.

---

## 1. Método de Gauss

El método de Gauss se basa en realizar **operaciones elementales entre filas** de una matriz:

- Multiplicación entre filas
- Permutación de filas
- Producto de un escalar por una fila

Se lleva la **matriz de coeficientes** a una **matriz equivalente triangular superior**. Luego se realiza una **sustitución hacia atrás** para hallar las incógnitas.

### Ejemplo resuelto

Dado el sistema:

$$\begin{cases} x_1 + 2x_2 + 3x_3 = 6 \ 2x_1 + 3x_2 + 4x_3 = 9 \ -x_1 + x_3 = -2 \end{cases}$$

Se arma la **matriz ampliada** y se operan las filas:

$$\begin{bmatrix} 1 & 2 & 3 & 6 \ 2 & 3 & 4 & 9 \ -1 & 0 & -1 & -2 \end{bmatrix} \equiv \begin{bmatrix} 1 & 2 & 3 & 6 \ 0 & -1 & -2 & -3 \ 0 & 2 & 2 & 4 \end{bmatrix} \equiv \begin{bmatrix} 1 & 2 & 3 & 6 \ 0 & -1 & -2 & -3 \ 0 & 0 & -2 & -2 \end{bmatrix}$$

**Sustitución hacia atrás:**

$$-2x_3 = -2 \Rightarrow x_3 = 1$$ $$-x_2 - 2x_3 = -3 \Rightarrow x_2 = 1$$ $$x_1 + 2x_2 + 3x_3 = 6 \Rightarrow x_1 = 1$$

$$\boxed{X = \begin{pmatrix} 1 \ 1 \ 1 \end{pmatrix}}$$

---

## 2. Método de Gauss-Jordan

Aplicando operaciones elementales en las filas de la **matriz ampliada**, convierte al sistema en uno equivalente tal que la **matriz de coeficientes sea la identidad**. En ese paso, la columna de los términos independientes es directamente la solución $X$.

### Ejemplo resuelto

Sea el sistema lineal:

$$\begin{pmatrix} 1 & 1 & 4 \ 1 & 3 & 1 \ 1 & 2 & 3 \end{pmatrix} \begin{pmatrix} x \ y \ z \end{pmatrix} = \begin{pmatrix} -2 \ 6 \ 1 \end{pmatrix}$$

Operando sobre la matriz ampliada hasta obtener la identidad:

|Paso|Matriz ampliada|
|---|---|
|Inicial|$\begin{bmatrix} 1 & 1 & 4 & -2 \ 1 & 3 & 1 & 6 \ 1 & 2 & 3 & 1 \end{bmatrix}$|
|Paso 1|$\begin{bmatrix} 1 & 1 & 4 & -2 \ 0 & 2 & -3 & 8 \ 0 & 1 & -1 & 3 \end{bmatrix}$|
|Paso 2|$\begin{bmatrix} 1 & 1 & 4 & -2 \ 0 & 1 & -1 & 3 \ 0 & 2 & -3 & 8 \end{bmatrix}$|
|Paso 3|$\begin{bmatrix} 1 & 0 & 5 & -5 \ 0 & 1 & -1 & 3 \ 0 & 0 & -1 & 2 \end{bmatrix}$|
|Paso 4|$\begin{bmatrix} 1 & 0 & 5 & -5 \ 0 & 1 & -1 & 3 \ 0 & 0 & 1 & -2 \end{bmatrix}$|
|Final|$\begin{bmatrix} 1 & 0 & 0 & 5 \ 0 & 1 & 0 & 1 \ 0 & 0 & 1 & -2 \end{bmatrix}$|

$$\boxed{X = \begin{pmatrix} 5 \ 1 \ -2 \end{pmatrix}}$$

---

## 3. Método de Descomposición LU (Método de Crout)

Consiste en **factorizar** la matriz de coeficientes del sistema lineal en el producto de una **matriz triangular inferior** $L$ y una **triangular superior** $U$:

$$A = L \cdot U$$

Por lo tanto el sistema $AX = B$ nos queda $(LU)X = B$.

Se procede resolviendo **dos sistemas triangulares**:

$$\begin{cases} LY = B & \text{(sustitución hacia adelante)} \ UX = Y & \text{(sustitución hacia atrás)} \end{cases}$$

### Algoritmo de Crout

- Funciona siempre que todos los **menores principales** sean distintos de cero.
- Los menores principales son los determinantes de las submatrices principales $A_i$ (elementos $a_{jk}$ con $1 \leq j, k \leq i$).
- Se supone que la **matriz triangular superior $U$ tiene diagonal de unos**.

### Ejemplo resuelto

Resolvamos el mismo sistema:

$$\begin{cases} x_1 + 2x_2 + 3x_3 = 6 \ 2x_1 + 3x_2 + 4x_3 = 9 \ -x_1 + x_3 = -2 \end{cases}$$

Escribimos $A = LU$:

$$\begin{bmatrix} 1 & 2 & 3 \ 2 & 3 & 4 \ -1 & 0 & -1 \end{bmatrix} = \begin{bmatrix} l_{11} & 0 & 0 \ l_{21} & l_{22} & 0 \ l_{31} & l_{32} & l_{33} \end{bmatrix} \begin{bmatrix} 1 & u_{12} & u_{13} \ 0 & 1 & u_{23} \ 0 & 0 & 1 \end{bmatrix}$$

**Por identificación se obtiene:**

$$\begin{cases} l_{11} = 1 \ l_{11} u_{12} = 2 \Rightarrow u_{12} = 2 \ l_{11} u_{13} = 3 \Rightarrow u_{13} = 3 \ l_{21} = 2 \ l_{21} u_{12} + l_{22} = 3 \Rightarrow l_{22} = -1 \ l_{21} u_{13} + l_{22} u_{23} = 4 \Rightarrow u_{23} = 2 \ l_{31} = -1 \ l_{31} u_{12} + l_{32} = 0 \Rightarrow l_{32} = 2 \ l_{31} u_{13} + l_{32} u_{23} + l_{33} = -1 \Rightarrow l_{33} = -2 \end{cases}$$

Entonces:

$$L = \begin{bmatrix} 1 & 0 & 0 \ 2 & -1 & 0 \ -1 & 2 & -2 \end{bmatrix}, \quad U = \begin{bmatrix} 1 & 2 & 3 \ 0 & 1 & 2 \ 0 & 0 & 1 \end{bmatrix}$$

**Sistema $LY = B$:**

$$\begin{bmatrix} 1 & 0 & 0 \ 2 & -1 & 0 \ -1 & 2 & -2 \end{bmatrix} \begin{pmatrix} y_1 \ y_2 \ y_3 \end{pmatrix} = \begin{pmatrix} 6 \ 9 \ -2 \end{pmatrix}$$

Por sustitución hacia adelante: $y_1 = 6$, $y_2 = 3$, $y_3 = 1$

**Sistema $UX = Y$:**

$$\begin{bmatrix} 1 & 2 & 3 \ 0 & 1 & 2 \ 0 & 0 & 1 \end{bmatrix} \begin{pmatrix} x_1 \ x_2 \ x_3 \end{pmatrix} = \begin{pmatrix} 6 \ 3 \ 1 \end{pmatrix}$$

Por sustitución hacia atrás: $x_3 = 1$, $x_2 = 1$, $x_1 = 1$

$$\boxed{X = \begin{pmatrix} 1 \ 1 \ 1 \end{pmatrix}}$$

> **Cuándo usar LU:** Cuando una matriz no tiene ninguna estructura especial (simétrica, con muchos ceros, etc.) y no converge para los métodos iterativos disponibles, la **descomposición LU es el método más aconsejable**.

---

## Tags

#metodosDirectos #Gauss #GaussJordan #DescomposicionLU #Crout #SEL
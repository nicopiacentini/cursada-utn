# Condicionamiento de un Sistema Lineal

## Concepto

Al resolver un SEL, muchas veces se producen **errores de redondeo** en los elementos, ya que se puede haber llegado al sistema luego de una serie de cálculos previos.

La pregunta clave es: **¿dichos errores de redondeo influyen drásticamente o no en la solución?**

Es decir: ¿a pequeñas perturbaciones en los coeficientes del sistema le corresponden grandes diferencias en la solución? Si fuera así, **no tendría sentido resolver numéricamente el sistema**, ya que no se podría confiar en la solución obtenida.

---

## Ejemplo 1 — Sistema Mal Condicionado

Consideremos el siguiente sistema lineal de 2×2:

$$\begin{pmatrix} 1 & 1 \ 1 & 1.0001 \end{pmatrix} \begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 2 \ 2 \end{pmatrix}$$

**Solución exacta:**

$$\begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 2 \ 0 \end{pmatrix}$$

**Ahora si cambiamos $b_2 = 2.0001$:**

$$\begin{pmatrix} 1 & 1 \ 1 & 1.0001 \end{pmatrix} \begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 2 \ 2.0001 \end{pmatrix}$$

**Nueva solución:**

$$\begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 1 \ 1 \end{pmatrix}$$

> Un error **muy pequeño** en uno de los coeficientes ($\Delta b_2 = 0.0001$) produjo un **error grandísimo** en la solución (cambio de $(2,0)$ a $(1,1)$). Este sistema está **mal condicionado**.

---

## Ejemplo 2 — Sistema Bien Condicionado con Algoritmo Inestable

Consideremos:

$$\begin{pmatrix} 0.0001 & 1 \ 1 & 1 \end{pmatrix} \begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 1 \ 2 \end{pmatrix}$$

**Solución exacta:** $\begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 1.0001 \ 0.9998 \end{pmatrix}$

**Aplicando Gauss con 3 cifras de precisión** (sin intercambio de filas): se obtiene $\begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 0 \ 1 \end{pmatrix}$ — ¡**muy impreciso!**

**Intercambiando las filas primero:**

$$\begin{pmatrix} 1 & 1 \ 0.0001 & 1 \end{pmatrix} \begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 2 \ 1 \end{pmatrix}$$

**Aplicando Gauss con 3 cifras:** se obtiene $\begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 1 \ 1 \end{pmatrix}$ — **buena aproximación**.

> Aquí el **sistema es bien condicionado**, pero el primer enfoque aplicó un **algoritmo inestable**. El problema no era el sistema sino el método.

---

## Ejemplo 3 — Sistema 4×4 Mal Condicionado

Dado el sistema $AX = B$ donde:

$$A = \begin{bmatrix} 10 & 7 & 8 & 7 \ 7 & 5 & 6 & 5 \ 8 & 6 & 10 & 9 \ 7 & 5 & 9 & 10 \end{bmatrix}, \quad B = \begin{bmatrix} 32 \ 23 \ 33 \ 31 \end{bmatrix}, \quad X = \begin{pmatrix} 1 \ 1 \ 1 \ 1 \end{pmatrix}$$

Si se perturba $B$ levemente: $B + \Delta(B) = \begin{bmatrix} 32.01 \ 22.99 \ 33.01 \ 30.99 \end{bmatrix}$

La solución resulta: $X + \Delta(X) = \begin{pmatrix} 1.82 \ -0.36 \ 1.35 \ 0.79 \end{pmatrix}$

**Error relativo en $B$:**

$$\frac{|\Delta(B)|_\infty}{|B|_\infty} = 3.03 \times 10^{-4}$$

**Error relativo en la solución:**

$$\frac{|\Delta(X)|_\infty}{|X|_\infty} = 1.36$$

> La perturbación se **amplificó más de 4000 veces**. Partimos de un error de $3.03 \times 10^{-4}$ y el error en la solución fue de $1.36$.

---

## Análisis Teórico del Condicionamiento

Partiendo de $A(x + \Delta x) = B + \Delta B$:

$$AX + A\Delta(X) = B + \Delta(B)$$

Como $AX = B$, debe ser: $A\Delta(X) = \Delta(B)$, por lo tanto: $\Delta(X) = A^{-1}\Delta(B)$

Tomando norma infinito:

$$|\Delta(X)| = |A^{-1}\Delta(B)| \leq |A^{-1}| \cdot |\Delta(B)| \quad (1)$$

Por otro lado, de $AX = B$ tomando normas:

$$|A| \cdot |X| \geq |B| \Rightarrow \frac{1}{|A| \cdot |X|} \leq \frac{1}{|B|} \quad (2)$$

Multiplicando (1) y (2):

$$\frac{|\Delta(X)|}{|X|} \leq |A| \cdot |A^{-1}| \cdot \frac{|\Delta(B)|}{|B|}$$

---

## Número de Condición de una Matriz

El factor que amplifica los errores relativos se denomina **número de condición de la matriz $A$**:

$$\boxed{K(A) = |A| \cdot |A^{-1}|}$$

para cualquier norma matricial.

### Interpretación

- **$K(A)$ grande** → sistema **mal condicionado** → pequeños errores en $B$ producen grandes errores en la solución.
- **$K(A)$ cercano a 1** → sistema **bien condicionado** → los errores no se amplifican mucho.
- El número de condición indica **cuántas veces se amplifica el error**.

> En el Ejemplo 3: $K(A) = 33 \times 136 = 4488$ (usando norma infinito), lo que explica la amplificación mayor a 4000 veces.

---

## Ejemplo Resuelto — Cálculo del Número de Condición

Sea el sistema $AX = B$:

$$\begin{pmatrix} 1 & 2 \ 1.0001 & 2 \end{pmatrix} \begin{pmatrix} x \ y \end{pmatrix} = \begin{pmatrix} 3 \ 3.0001 \end{pmatrix}$$

**Calcular el número de condición con norma infinito:**

**Paso 1 — Norma infinito de $A$:**

- Fila 1: $|1| + |2| = 3$
- Fila 2: $|1.0001| + |2| = 3.0001$

$$|A|_\infty = 3.0001$$

**Paso 2 — Calcular $A^{-1}$:**

$$A^{-1} = \frac{1}{|A|} \text{Adj} \begin{pmatrix} 1 & 2 \ 1.0001 & 2 \end{pmatrix} = \frac{1}{-0.0002} \begin{pmatrix} 2 & -2 \ -1.0001 & 1 \end{pmatrix} = \begin{pmatrix} -10000 & 10000 \ 5000.5 & -5000 \end{pmatrix}$$

**Paso 3 — Norma infinito de $A^{-1}$:**

- Fila 1: $|-10000| + |10000| = 20000$
- Fila 2: $|5000.5| + |-5000| = 10000.5$

$$|A^{-1}|_\infty = 20000$$

**Paso 4 — Número de condición:**

$$K(A) = |A|_\infty \cdot |A^{-1}|_\infty = 3.0001 \times 20000 = 60002$$

> $K(A) = 60002$ es un valor **muy grande**. No se puede confiar en la solución aproximada obtenida.

---

## Ejercicio Propuesto

Sea el sistema $AX = B$:

$$\begin{pmatrix} 3.3330 & 15920 & -10.333 \ 2.2220 & 16.71 & 9.612 \ 1.5611 & 5.1791 & 1.6852 \end{pmatrix} \begin{pmatrix} x \ y \ z \end{pmatrix} = \begin{pmatrix} 15913 \ 28.544 \ 8.4254 \end{pmatrix}$$

**a)** Verificar que la solución exacta es: $X_1 = (1, 1, 1)^t$

**b)** Usando eliminación gaussiana con 5 dígitos de precisión, verificar que la solución obtenida es: $(1.2001,; 0.99991,; 0.92538)^t$

**c)** Comprobar que la diferencia $R = AX_1 - B = (-0.0051818,; 0.27413,; -0.18616)^t$ con $|R|_\infty = 0.27413$

**d)** Hallar $A^{-1}$ y calcular $K(A)$.

**Respuesta:**

$$A^{-1} = \begin{pmatrix} 0.00012 & -0.14989 & 0.85417 \ 0.000062787 & 0.00012126 & -0.00030664 \ -0.000081282 & 0.13847 & -0.196925 \end{pmatrix}, \quad K(A) = 16000$$

---

## Tags

#condicionamiento #numerodecondicion #SEL #errores #metodosnumericos
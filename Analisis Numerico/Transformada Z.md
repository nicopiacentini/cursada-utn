# Transformada Z

La transformada Z es la contraparte discreta de la transformada de Laplace. Se trabaja con funciones de variable discreta:

$$x(n): \mathbb{N}_0 \to \mathbb{R}$$

El dominio de $x(n)$ es el conjunto de los números naturales con el 0. Estas son funciones o señales en **tiempo discreto** donde el tiempo está representado por los instantes $0, 1, 2, \ldots$

---

## Formas de definir una señal en tiempo discreto

Las funciones se pueden definir de forma **analítica** o **gráfica**.

**Ejemplo (forma analítica):**

$$x(n) = \begin{cases} 1 & n = 0 \ 3 & 1 \leq n \leq 3 \ -1 & n = 4 \ 0 & n > 4 \end{cases}$$

---

## Señales discretas comunes

### Impulso unitario $\delta(n)$

$$\delta(n) = \begin{cases} 1 & n = 0 \ 
0 & n > 0 \end{cases}$$

### Escalón unitario $U(n)$

$$U(n) = 1 \quad n \geq 0$$

### Rampa unitaria

$$x(n) = n \quad n \geq 0$$

### Señal exponencial

$$x(n) = a^n \quad n \geq 0$$

- Si $0 < a < 1$: exponencial **decreciente**
- Si $a > 1$: exponencial **creciente**
- Si $-1 < a < 0$: la función oscila con amplitud decreciente (alternando signo)

---

## Definición de la Transformada Z

Dada una función $x(n)$ con $n \in \mathbb{N}_0$, se define la **Transformada Z** como:

$$\mathcal{Z}{x(n)} = \sum_{n=0}^{\infty} x(n), z^{-n} = X(z)$$

donde $z$ es una **variable compleja**.

Existe también la **antitransformada Z** (transformada inversa):

$$\mathcal{Z}^{-1}{X(z)} = x(n)$$

---

## Región de convergencia

La región de convergencia (ROC) es el conjunto de valores de $z$ (en el plano complejo) para los cuales la suma de la transformada Z converge. Se expresa como una condición sobre $|z|$, por ejemplo $|z| > 1$.

Gráficamente, $|z| > R$ corresponde al exterior de un círculo de radio $R$ centrado en el origen del plano complejo.

---

## Ejemplos de cálculo de la Transformada Z

### Ejemplo 1 — Impulso unitario

$$\mathcal{Z}{\delta(n)} = \sum_{n=0}^{\infty} \delta(n), z^{-n} = 1 \cdot z^0 + 0 + 0 + \cdots = \boxed{1}$$

### Ejemplo 2 — Escalón unitario

Se usa la fórmula de la serie geométrica convergente:

$$S = \sum_{n=0}^{\infty} a^n = \frac{1}{1-a} \quad \text{con } |a| < 1$$

$$\mathcal{Z}{U(n)} = \sum_{n=0}^{\infty} z^{-n} = \sum_{n=0}^{\infty} \left(\frac{1}{z}\right)^n = \frac{1}{1 - \frac{1}{z}} = \boxed{\frac{z}{z-1}} \quad |z| > 1$$

### Ejemplo 3 — Progresión geométrica $a^n$

$$\mathcal{Z}{a^n} = \sum_{n=0}^{\infty} \left(\frac{a}{z}\right)^n = \frac{1}{1 - \frac{a}{z}} = \boxed{\frac{z}{z-a}} \quad |z| > |a|$$

### Ejemplo 4 — Señal de duración finita

$$x(n) = \begin{cases} 2 & n = 0 \ n & 0 < n \leq 3 \ 1 & n = 4 \ 0 & n > 4 \end{cases}$$

$$\mathcal{Z}{x(n)} = 2 + \frac{1}{z} + \frac{2}{z^2} + \frac{3}{z^3} + \frac{1}{z^4}$$

### Ejemplo 5 — Señal no nula solo en índices pares

$$x(n) = \begin{cases} 5 & n \text{ par} \ 0 & n \text{ impar} \end{cases}$$

$$\mathcal{Z}{x(n)} = 5 \sum_{k=0}^{\infty} \left(\frac{1}{z^2}\right)^k = \frac{5}{1 - \frac{1}{z^2}} = \boxed{\frac{5z^2}{z^2 - 1}} \quad |z| > 1$$

### Ejemplo 6 — Señal mixta (pares e impares distintos)

$$x(n) = \begin{cases} 2 \cdot 3^{-n} & n \text{ par} \ \left(\frac{1}{2}\right)^n & n \text{ impar} \end{cases}$$

Separando la suma en términos pares ($n = 2k$) e impares ($n = 2k+1$):

$$\mathcal{Z}{x(n)} = 2\sum_{k=0}^{\infty}\left(\frac{1}{9z^2}\right)^k + \frac{1}{2z}\sum_{k=0}^{\infty}\left(\frac{1}{4z^2}\right)^k = \frac{18z^2}{9z^2-1} + \frac{2z}{4z^2-1}$$

**Región de convergencia:** intersección de $|z| > \tfrac{1}{3}$ y $|z| > \tfrac{1}{2}$, es decir $|z| > \tfrac{1}{2}$.

---

## Tabla de Transformadas Z

|$x[n]$|$X[z]$|ROC: $\|z\| > R$|
|---|---|---|
|$\delta[n]$|$1$|$0$|
|$\delta[n-m]$|$z^{-m}$|$0$|
|$U[n]$|$\dfrac{z}{z-1}$|$1$|
|$n$|$\dfrac{z}{(z-1)^2}$|$1$|
|$n^2$|$\dfrac{z(z+1)}{(z-1)^3}$|$1$|
|$a^n$|$\dfrac{z}{z-a}$|$\|a\|$|
|$n,a^n$|$\dfrac{az}{(z-a)^2}$|$\|a\|$|
|$(n+1),a^n$|$\dfrac{z^2}{(z-a)^2}$|$\|a\|$|
|$\cos(an)$|$\dfrac{z(z-\cos a)}{z^2 - 2z\cos a + 1}$|$1$|
|$\operatorname{sen}(an)$|$\dfrac{z,\operatorname{sen}(a)}{z^2 - 2\cos(a) + 1}$|$1$|
|$e^{an}$|$\dfrac{z}{z - e^a}$|$e^a$|
|$\dfrac{a^n}{n!}$|$e^{a/z}$|$z \neq 0$|

### Desplazamientos (propiedad de traslación)

|Función discreta|Transformada Z|
|---|---|
|$X[n+4]$|$Z^4X[Z] - Z^4X[0] - Z^3X[1] - Z^2X[2] - ZX[3]$|
|$X[n+3]$|$Z^3X[Z] - Z^3X[0] - Z^2X[1] - ZX[2]$|
|$X[n+2]$|$Z^2X[Z] - Z^2X[0] - ZX[1]$|
|$X[n+1]$|$ZX[Z] - ZX[0]$|
|$X[n]$|$X[Z]$|
|$X[n-1]$|$Z^{-1}X[Z]$|
|$X[n-2]$|$Z^{-2}X[Z]$|
|$X[n-3]$|$Z^{-3}X[Z]$|
|$X[n-4]$|$Z^{-4}X[Z]$|

---

## Propiedades de la Transformada Z

### Linealidad

$$\mathcal{Z}{k_1,x_1(n) + k_2,x_2(n)} = k_1,\mathcal{Z}{x_1(n)} + k_2,\mathcal{Z}{x_2(n)}$$

**Ejemplo:** Sea $x(n) = 3(-2)^n - 2 \cdot 5^n$

$$\mathcal{Z}{x(n)} = \frac{3z}{z+2} - \frac{2z}{z-5} \quad |z| > 5$$

### Desplazamiento lateral (traslación a la izquierda)

$$\mathcal{Z}{x(n+1)} = z,X(z) - z,x(0)$$

$$\mathcal{Z}{x(n+2)} = z^2 X(z) - z^2 x(0) - z,x(1)$$

$$\mathcal{Z}{x(n+3)} = z^3 X(z) - z^3 x(0) - z^2 x(1) - z,x(2)$$

Y así sucesivamente.

### Desplazamiento a la derecha

$$\mathcal{Z}{x(n-1)} = z^{-1} X(z)$$

$$\mathcal{Z}{x(n-a)} = z^{-a} X(z)$$

### Multiplicación por $n$

$$\mathcal{Z}{n,x(n)} = -z,[X(z)]'$$

$$\mathcal{Z}{n^2,x(n)} = -z,[-z,[X(z)]']'$$

**Ejemplo:**

$$\mathcal{Z}{n} = -z\left[\frac{z}{z-1}\right]' = -z \cdot \frac{-1}{(z-1)^2} = \frac{z}{(z-1)^2}$$

$$\mathcal{Z}{n^2} = -z\left[\frac{z}{(z-1)^2}\right]' = \frac{z(z+1)}{(z-1)^3}$$

---

## Antitransformada Z ($\mathcal{Z}^{-1}$)

Dada $X(z)$, la antitransformada devuelve la sucesión $x(n)$:

$$\mathcal{Z}^{-1}{X(z)} = x(n)$$

Se utiliza principalmente mediante **fracciones simples** y la **linealidad**.

### Linealidad de $\mathcal{Z}^{-1}$

$$\mathcal{Z}^{-1}{k_1 X_1(z) + k_2 X_2(z)} = k_1,x_1(n) + k_2,x_2(n)$$

### Método de fracciones simples

**Truco clave:** dividir $X(z)$ por $z$, descomponer en fracciones simples, y luego multiplicar el resultado por $z$ para volver a la forma de la tabla.

**Ejemplo 1:**

$$\mathcal{Z}^{-1}!\left{\frac{z^2+2z}{(z-1)(z-3)}\right} = \mathcal{Z}^{-1}!\left{z \cdot \frac{z+2}{(z-1)(z-3)}\right}$$

Se descompone $\dfrac{z+2}{(z-1)(z-3)} = \dfrac{A}{z-1} + \dfrac{B}{z-3}$, con $A = -\tfrac{3}{2}$, $B = \tfrac{5}{2}$.

$$\mathcal{Z}^{-1}!\left{-\frac{3}{2}\cdot\frac{z}{z-1} + \frac{5}{2}\cdot\frac{z}{z-3}\right} = -\frac{3}{2},U(n) + \frac{5}{2}\cdot 3^n$$

**Ejemplo 2:**

$$\mathcal{Z}^{-1}!\left{\frac{2z^2+z}{(z-2)^2(z-1)}\right}$$

Descomponiendo $\dfrac{2z+1}{(z-2)^2(z-1)} = \dfrac{A}{(z-2)^2} + \dfrac{B}{z-2} + \dfrac{C}{z-1}$, con $A=5$, $B=-3$, $C=3$:

$$x(n) = \frac{5}{2}\cdot n\cdot 2^n - 3\cdot 2^n + 3$$

---

## Aplicación: Ecuaciones en diferencias

Una **ecuación en diferencias** es la versión discreta de una ecuación diferencial. El orden viene dado por el mayor desplazamiento presente.

### Ecuación de 1er orden

**Ejemplo:** Resolver $x(n+1) - x(n) = 7$, con $x(0) = 3$.

Aplicando $\mathcal{Z}$ a ambos miembros:

$$z,X(z) - z,x(0) - X(z) = \frac{7z}{z-1}$$

Reemplazando $x(0) = 3$ y despejando:

$$X(z)(z-1) = \frac{7z}{z-1} + 3z$$

$$X(z) = \frac{7z}{(z-1)^2} + \frac{3z}{z-1}$$

Antitransformando:

$$\boxed{x(n) = 7n + 3}$$

**Verificación:** $x(3) = 7(3)+3 = 24$ ✓

### Ecuación de 2do orden

**Ejemplo:** Resolver $x(n+2) - 4x(n+1) + 3x(n) = -2$, con $x(0)=7$, $x(1)=12$.

Aplicando $\mathcal{Z}$:

$$z^2 X(z) - 7z^2 - 12z - 4(zX(z) - 7z) + 3X(z) = \frac{-2z}{z-1}$$

$$X(z)(z^2 - 4z + 3) = \frac{-2z}{z-1} + 7z^2 - 16z$$

$$X(z) = z\cdot\frac{-2 + 7z(z-1) - 16(z-1)}{(z-1)^2(z-3)}$$

Descomponiendo en fracciones simples con $A=1$, $B=5$, $C=2$:

$$\mathcal{Z}^{-1}{X(z)} = \mathcal{Z}^{-1}!\left{\frac{z}{(z-1)^2} + \frac{5z}{z-1} + \frac{2z}{z-3}\right}$$

$$\boxed{x(n) = n + 5 + 2\cdot 3^n}$$

**Verificación:** $x(1) = 1 + 5 + 2\cdot 3 = 12$ ✓
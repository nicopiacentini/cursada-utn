# Sistemas de Ecuaciones Lineales (SEL)

## Definición General

Un sistema de ecuaciones lineales es un sistema $AX = B$ donde:

- $A \in \mathbb{R}^{n \times m}$
- $X \in \mathbb{R}^{m \times 1}$
- $B \in \mathbb{R}^{n \times 1}$

Los sistemas de ecuaciones lineales son muy usados para **modelizar distintos fenómenos**. Áreas como la física, ciencias naturales, economía, ciencias de la computación, etc., los utilizan para plantear y resolver situaciones.

Para los métodos numéricos se trabaja con **sistemas cuadrados**: $AX = B$ donde $A \in \mathbb{R}^{n \times n}$, $X \in \mathbb{R}^{n \times 1}$, $B \in \mathbb{R}^{n \times 1}$.

## Forma General

Dado un SEL:

$$\begin{cases} a_{11}x_1 + a_{12}x_2 + a_{13}x_3 + \ldots + a_{1n}x_n = b_1 \ a_{21}x_1 + a_{22}x_2 + a_{23}x_3 + \ldots + a_{2n}x_n = b_2 \ a_{31}x_1 + a_{32}x_2 + a_{33}x_3 + \ldots + a_{3n}x_n = b_3 \ \ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots \ a_{n1}x_1 + a_{n2}x_2 + a_{n3}x_3 + \ldots + a_{nn}x_n = b_n \end{cases}$$

Matricialmente: $A \cdot X = B$

$$A = \begin{pmatrix} a_{11} & a_{12} & a_{13} & \cdots & a_{1n} \ a_{21} & a_{22} & a_{23} & \cdots & a_{2n} \ a_{31} & a_{32} & a_{33} & \cdots & a_{3n} \ \vdots & \vdots & \vdots & \ddots & \vdots \ a_{n1} & a_{n2} & a_{n3} & \cdots & a_{nn} \end{pmatrix}, \quad X = \begin{pmatrix} x_1 \ x_2 \ x_3 \ \vdots \ x_n \end{pmatrix}, \quad B = \begin{pmatrix} b_1 \ b_2 \ b_3 \ \vdots \ b_n \end{pmatrix}$$

Siendo:

- $A \in \mathbb{R}^{n \times m}$: **matriz de coeficientes**
- $X \in \mathbb{R}^{m \times 1}$: **matriz columna de incógnitas**
- $B \in \mathbb{R}^{n \times 1}$: **matriz columna de términos independientes**

---

## Clasificación según el Tipo de Solución

Un SEL puede ser de tres tipos según su solución:

|Tipo|Nombre completo|Solución|
|---|---|---|
|**S.C.D.**|Sistema Compatible Determinado|Solución única|
|**S.C.I.**|Sistema Compatible Indeterminado|Infinitas soluciones|
|**S.I.**|Sistema Incompatible|Solución vacía|

> Los métodos numéricos vistos **solo encuentran solución única**, por lo tanto se trabaja con **S.C.D.**

---

## Sistemas Cuadrados e Inversibles

Nos interesan los sistemas $AX = B$ con $A \in \mathbb{R}^{n \times n}$, $X \in \mathbb{R}^{n \times 1}$, $B \in \mathbb{R}^{n \times 1}$ y tales que $\det(A) \neq 0$.

### Propiedades de un SEL Compatible y Determinado

Un SEL es S.C.D. (siendo $A$ su matriz de coeficientes) si y solo si se cumplen **todas** las siguientes condiciones:

1. $\det(A) \neq 0$
2. $\text{Rango}(A) = n$ (siendo $n$ la cantidad de ecuaciones o incógnitas)
3. Las filas y columnas de $A$ son **linealmente independientes**
4. Si $AX = 0$ entonces la solución es $X = 0$ (solución nula)
5. Existe $A^{-1}$ tal que $A \cdot A^{-1} = I$ ($A^{-1}$ se denomina **matriz inversa** de $A$)
6. El sistema $AX = B$ tiene **solución única**

### Ejemplo

El siguiente sistema es cuadrado (3 ecuaciones, 3 incógnitas):

$$\begin{cases} x + 6y - 4z = 7 \ -x + 2y - 4z = 1 \ 5x - y + 3z = 3 \end{cases}$$

---

## Clasificación de Métodos de Resolución

Los métodos se clasifican en:

```
Métodos de Resolución de SEL
├── Métodos Directos
│   ├── Gauss
│   ├── Gauss-Jordan
│   ├── Cramer
│   └── Crout (Descomposición LU)
└── Métodos Iterativos (Indirectos)
    ├── Jacobi
    └── Gauss-Seidel
```

- **Métodos directos**: Conducen a la solución exacta mediante un número finito (aunque muy grande) de operaciones.
- **Métodos iterativos**: Generan una sucesión ${X^{(k)}}_{k=0}^{\infty}$ cuyo límite es la solución del sistema. Son más eficientes pero pueden divergir.

> En Matemática Superior el énfasis está en los **métodos iterativos**, ya que los métodos algebraicos como Cramer, Gauss y Gauss-Jordan fueron estudiados en Álgebra y Geometría Analítica.

---

## Tags

#SEL #sistemaslineales #algebra #metodosnumericos
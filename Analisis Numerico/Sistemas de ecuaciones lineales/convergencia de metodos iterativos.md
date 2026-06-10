# Convergencia de los Métodos Iterativos

## Teoremas de Convergencia

### Teorema 1 (Condición necesaria y suficiente)

Para cualquier $X^{(0)} \in \mathbb{R}^n$, la sucesión ${X^{(k)}}_{k=0}^{\infty}$ definida por:

$$X^{(k)} = T \cdot X^{(k-1)} + C \quad \text{con } k \geq 1,; C \neq 0$$

**converge a la solución única** de $X = TX + C$ **si y solo si**:

$$\rho(T) < 1$$

(siendo $\rho(T)$ el radio espectral de $T$)

---

### Teorema 2 (Condición suficiente con norma)

Si:

$$|T| < 1$$

siendo la $T$ de Jacobi o Gauss-Seidel, y **para cualquier norma matricial**, entonces los métodos **convergen para cualquier valor inicial** $X^{(0)}$.

---

### Teorema 3 (Condición práctica — Diagonal Dominante)

> Este teorema es el más práctico para verificar la convergencia rápidamente.

Si $A$ es una **matriz diagonalmente dominante**, entonces para cualquier $X^{(0)}$, los métodos de Jacobi y Gauss-Seidel generan una sucesión ${X^{(k)}}_{k=0}^{\infty}$ que **converge a la solución de $AX = B$**.

---

## Ejemplo de Aplicación del Teorema 3

Sea el SEL:

$$\begin{cases} 2x + 5y + z = 12 \ 2x - 3y + 6z = 3 \ 7x + y - 3z = 7 \end{cases}$$

**Paso 1 — Escribir la matriz de coeficientes:**

$$A = \begin{pmatrix} 2 & 5 & 1 \ 2 & -3 & 6 \ 7 & 1 & -3 \end{pmatrix}$$

**Paso 2 — Verificar si es diagonalmente dominante:**

- Fila 1: $|2| \geq |5| + |1|$ → $2 \geq 6$ ✗ **No cumple**

Como **no es diagonalmente dominante** con el orden actual, hay que **reordenar las ecuaciones**.

**Reordenando** para colocar los coeficientes más grandes en la diagonal:

$$\begin{cases} 7x + y - 3z = 7 \ 2x - 3y + 6z = 3 \ 2x + 5y + z = 12 \end{cases} \Rightarrow A = \begin{pmatrix} 7 & 1 & -3 \ 2 & -3 & 6 \ 2 & 5 & 1 \end{pmatrix}$$

Verificación:

- Fila 1: $|7| > |1| + |-3|$ → $7 > 4$ ✓
- Fila 2: $|-3|$ vs $|2| + |6|$ → $3 < 8$ ✗ **Aún no cumple fila 2**

> Si no es posible ordenar para que sea diagonalmente dominante, se debe verificar por otro criterio (Teoremas 1 o 2) o usar un método directo.

---

## Resumen de Criterios

```
¿Convergen Jacobi / Gauss-Seidel?
│
├─ Criterio fácil: ¿Es A diagonalmente dominante?
│   └─ SÍ → Convergen (Teorema 3)
│
├─ Criterio general: ¿ρ(T) < 1?
│   └─ SÍ ↔ Convergen (Teorema 1, condición necesaria y suficiente)
│
└─ Criterio suficiente: ¿‖T‖ < 1 para alguna norma?
    └─ SÍ → Convergen (Teorema 2)
```

---

## Notas Importantes sobre la Convergencia

- Si $a_{ii} = 0$ en alguna ecuación, **hay que permutar filas o columnas** antes de aplicar los métodos iterativos.
- La convergencia de Gauss-Seidel es generalmente más rápida que la de Jacobi.
- Si el sistema no converge con métodos iterativos y la matriz no tiene estructura especial, **usar descomposición LU**.
- El radio espectral de la matriz de iteración determina la **velocidad de convergencia**: cuanto más pequeño sea $\rho(T)$, más rápido converge.

---

## Tags

#convergencia #Jacobi #GaussSeidel #radioespectral #SEL #metodosnumericos
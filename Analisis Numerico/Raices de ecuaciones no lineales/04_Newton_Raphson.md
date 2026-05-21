# 04 — Método de Newton-Raphson ⭐

> [[00_INDICE|← Volver al índice]] | Anterior: [[03_Regula_Falsi]] | Siguiente: [[05_Punto_Fijo]]

---

## ¿Qué es?

Newton-Raphson es el **método más usado y más eficiente** para encontrar raíces.  
A diferencia de bisección y Regula Falsi (que acortan un intervalo), este método es de **forma abierta**: solo necesita un valor inicial $x_0$ y puede funcionar incluso fuera del intervalo de acotación.

**Idea geométrica:** en lugar de secantes entre dos puntos, se trazan **rectas tangentes** a la curva. La intersección de cada tangente con el eje $x$ da el siguiente valor.

---

## Deducción de la fórmula recursiva

La recta tangente a $f$ en $x = x_0$ es: $$y - f(x_0) = f'(x_0)(x - x_0)$$

Para hallar $x_1$, se hace $y = 0$: $$0 - f(x_0) = f'(x_0)(x_1 - x_0)$$ $$x_1 = x_0 - \frac{f(x_0)}{f'(x_0)}$$

Repitiendo el proceso:

$$\boxed{x_{i+1} = x_i - \frac{f(x_i)}{f'(x_i)}}$$

---

## Ejemplo 1: $x - e^{-x} = 0$

$$f(x) = x - e^{-x} \qquad f'(x) = 1 + e^{-x}$$

Fórmula recursiva: $$x_{i+1} = x_i - \frac{x_i - e^{-x_i}}{1 + e^{-x_i}}$$

Valor inicial: $x_0 = 0.5$

|$i$|$x_i$|$f(x_i)$|$f'(x_i)$|$e(x_i)$|
|---|---|---|---|---|
|0|0.5|−0.10653066|1.60653066|—|
|1|0.566311|−0.00130451|1.56761551|0.066311|
|2|0.56714317|$-1.96 \times 10^{-7}$|1.56714336|0.00083216|
|3|0.56714329|$-4.44 \times 10^{-15}$|1.56714329|$1.25 \times 10^{-7}$|
|4|0.56714329|0|1.56714329|$2.89 \times 10^{-15}$|

> ✨ **Con solo 4 iteraciones se logran 14 dígitos correctos.** El Excel lo muestra como exacto ($f(x) = 0$).  
> Compará esto con bisección, que necesitaría ~47 iteraciones para la misma precisión.

---

## Condiciones de convergencia

### Condiciones NECESARIAS

1. $f(a) \cdot f(b) < 0$ (existe raíz en el intervalo)
2. $f$ continua en $[a,b]$ con derivada continua en $(a,b)$

### Condiciones SUFICIENTES — Condiciones de Fourier

1. $x_0$ **cercano a la raíz** (valor inicial bien elegido)
2. $f'(x) \neq 0$ en $(a,b)$ — si la derivada se acerca a 0, el método puede divergir
3. $f''$ de **igual signo** en $(a,b)$ — sin cambios de concavidad
4. Elegir $x_0$ tal que $f(x_0) \cdot f''(x_0) > 0$

> Las condiciones suficientes garantizan convergencia pero **no son necesarias**: el método puede converger igual si no se cumplen todas.

### ¿Por qué $f'$ no debe acercarse a 0?

El método necesita que: $$\lim_{i \to \infty} \frac{f(x_i)}{f'(x_i)} = 0$$

Si $f'(x_i) \approx 0$, la corrección $f/f'$ se vuelve enorme y el método se dispara lejos de la raíz.

### ¿Qué pasa si hay un punto de inflexión ($f'' = 0$)?

Si hay un cambio de concavidad en el intervalo, las tangentes pueden volverse casi paralelas entre sí, generando un **loop** donde los valores oscilan entre dos puntos sin converger.

---

## Ejemplo 2 (con elección de $x_0$): $f(x) = x^3 + x - e^{-x}$ en $[0,1]$

Verificación de Fourier:

- $f'(x) = 3x^2 + 1 + e^{-x} > 0$ ✓ (siempre positivo)
- $f''(x) = 6x - e^{-x}$: cambia de signo en $(0,1)$, por lo que hay que ser cuidadoso con $x_0$

Se elige $x_0 = 0.5$ (donde $f(0.5) \cdot f''(0.5) > 0$).

---

## Convergencia

|Parámetro|Valor|
|---|---|
|Orden $p$|**2 (cuadrático)**|
|Radio $R$|$\displaystyle \left\|\frac{f''(\varphi)}{2f'(\varphi)}\right\|$, con $a \leq \varphi \leq b$|

La convergencia cuadrática significa que el **número de decimales correctos se duplica** en cada iteración.

---

## Variaciones del método de Newton-Raphson

### 🔹 Método de Von Mises

$$x_{i+1} = x_i - \frac{f(x_i)}{f'(x_0)}$$

La derivada se calcula **solo una vez** (en $x_0$) y se usa como constante en todas las iteraciones.

**Ventaja:** si calcular $f'$ es costoso, solo se hace una vez.  
**Desventaja:** más lento que NR estándar, especialmente si $f'(x_0) \approx 0$.

Geométricamente: en vez de tangentes que cambian en cada paso, se trazan **paralelas** a la tangente inicial.

---

### 🔹 Método de las Secantes

Reemplaza $f'(x_i)$ por el **cociente incremental** (derivada numérica):

$$f'(x_i) \approx \frac{f(x_i) - f(x_{i-1})}{x_i - x_{i-1}}$$

Sustituyendo en la fórmula de NR:

$$\boxed{x_{i+1} = x_i - \frac{f(x_i)(x_i - x_{i-1})}{f(x_i) - f(x_{i-1})}} \qquad \text{con } x_0, x_1 \text{ valores iniciales}$$

**Ventaja:** no requiere calcular $f'(x)$ analíticamente.  
**Desventaja:** necesita dos valores iniciales; puede ser inestable.

---

## Comparación de las tres variantes

**Ecuación:** $x^3 + x - e^{-x} = 0$ con raíz en $[0, 1]$

### Método de Secantes

|$x$|$f(x)$|
|---|---|
|0|−1|
|0.5|0.01847|
|0.49093|−0.00280|
|0.49213|$-1.11 \times 10^{-5}$|
|0.49213127|$6.64 \times 10^{-9}$|
|0.49213127|$\approx 0$|

### Método de Von Mises ($f'(x_0) = 2.35653$)

|$x$|$f(x)$|
|---|---|
|0.5|0.01847|
|0.49216|$7.30 \times 10^{-5}$|
|0.49213152|$5.76 \times 10^{-7}$|
|0.49213127|$4.55 \times 10^{-9}$|

### Newton-Raphson clásico

|$x$|$f(x)$|$f'(x)$|
|---|---|---|
|0.5|0.01847|2.35653|
|0.49216|$7.30 \times 10^{-5}$|2.33797|
|0.49213127|$1.14 \times 10^{-9}$|2.33790|
|0.49213127|0|—|

> 🏆 Newton-Raphson clásico converge más rápido. Las secantes son útiles cuando $f'$ no está disponible analíticamente.

---

## Pseudocódigo — Newton-Raphson clásico

```python
def newton_raphson(f, df, x0, eps=1e-10, max_iter=50):
    """
    f  : función f(x)
    df : derivada f'(x)
    x0 : valor inicial
    """
    x = x0
    for i in range(max_iter):
        fx = f(x)
        dfx = df(x)
        if abs(dfx) < 1e-14:
            raise ValueError("f'(x) ≈ 0, método puede divergir")
        x_new = x - fx / dfx
        if abs(x_new - x) < eps:
            return x_new, i + 1
        x = x_new
    return x, max_iter

# Ejemplo: x - e^(-x) = 0
import math
raiz, iters = newton_raphson(
    f  = lambda x: x - math.exp(-x),
    df = lambda x: 1 + math.exp(-x),
    x0 = 0.5
)
print(f"Raíz ≈ {raiz:.15f} en {iters} iteraciones")
# → Raíz ≈ 0.567143290409784 en 4 iteraciones
```

---

## Pseudocódigo — Método de las Secantes

```python
def secantes(f, x0, x1, eps=1e-10, max_iter=50):
    for i in range(max_iter):
        fx0, fx1 = f(x0), f(x1)
        if abs(fx1 - fx0) < 1e-14:
            raise ValueError("División por cero en cociente incremental")
        x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0)
        if abs(x2 - x1) < eps:
            return x2, i + 1
        x0, x1 = x1, x2
    return x1, max_iter
```

---

## Cuándo usar Newton-Raphson

|Situación|Recomendación|
|---|---|
|$f'(x)$ disponible analíticamente|✅ Newton-Raphson clásico|
|$f'(x)$ difícil de calcular|✅ Método de las Secantes|
|$f'(x)$ es constante o casi constante|✅ Von Mises|
|Raíz múltiple sospechada|➡️ Ver [[06_Raices_Multiples]]|
|No se puede garantizar convergencia|➡️ Combinar con [[02_Biseccion]] como fallback|

---

_Tags: #newton-raphson #tangentes #convergencia-cuadratica #von-mises #secantes_
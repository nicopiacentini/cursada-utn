# 03 — Método de la Regula Falsi (Falsa Posición)

> [[00_INDICE|← Volver al índice]] | Anterior: [[02_Biseccion]] | Siguiente: [[04_Newton_Raphson]]

---

## ¿Qué es?

La Regula Falsi mejora la bisección usando **rectas secantes** en lugar del punto medio.  
En vez de dividir el intervalo exactamente a la mitad, busca la intersección de la recta que une $(a, f(a))$ con $(b, f(b))$ con el eje $x$.

> El método siempre acota la raíz (como bisección) pero **converge más rápido** porque la estimación considera la pendiente de la función.

---

## Deducción de la fórmula

Dados los puntos $(a, f(a))$ y $(b, f(b))$, la recta secante es:

$$y - f(a) = \frac{f(b) - f(a)}{b - a}(x - a)$$

La intersección con el eje $x$ (es decir, $y = 0$) da:

$$\boxed{x_1 = a - \frac{f(a)(b - a)}{f(b) - f(a)}}$$

Esto genera una fórmula recursiva según qué extremo se fije.

---

## ¿Qué extremo fijar? — Criterio clave ⭐

El método **requiere que no haya cambios de crecimiento ni concavidad** en $[a, b]$.

### Regla:

$$\text{Si } \text{sg}(f') = \text{sg}(f'') \Rightarrow \text{se fija } b$$ $$\text{Si } \text{sg}(f') \neq \text{sg}(f'') \Rightarrow \text{se fija } a$$

|Caso geométrico|$f'$ vs $f''$|Extremo fijo|
|---|---|---|
|Creciente + cóncava hacia arriba|mismo signo|$b$|
|Decreciente + cóncava hacia abajo|mismo signo|$b$|
|Creciente + cóncava hacia abajo|signos opuestos|$a$|
|Decreciente + cóncava hacia arriba|signos opuestos|$a$|

---

## Fórmulas recursivas

**Si se fija $a$** (con $x_0 = b$): $$x_{i+1} = a - \frac{f(a)(x_i - a)}{f(x_i) - f(a)}$$

**Si se fija $b$** (con $x_0 = a$): $$x_{i+1} = b - \frac{f(b)(x_i - b)}{f(x_i) - f(b)}$$

---

## Ejemplo completo: $x^3 - e^x = 0$ en $[1, 2]$

### Paso 1 — Acotación de raíces

Graficando $y = x^3$ e $y = e^x$, hay una intersección en $[1, 2]$ (y otra en $[4, 5]$).  
Verificación de Bolzano: $f(1) = 1 - e \approx -1.718 < 0$, $f(2) = 8 - e^2 \approx 0.611 > 0$ ✓

### Paso 2 — Análisis de $f'$ y $f''$

$$f(x) = x^3 - e^x$$ $$f'(x) = 3x^2 - e^x \quad \Rightarrow \quad \text{positivo en } [1,2] \text{ (ya que } e^x > x^2 \text{ recién cerca de } x=4\text{)}$$ $$f''(x) = 6x - e^x \quad \Rightarrow \quad \text{positivo en } [1,2] \text{ (se hace negativo cerca de } x=3\text{)}$$

Ambos positivos → **mismo signo → se fija $b = 2$**

### Paso 3 — Fórmula recursiva

$$x_{i+1} = 2 - \frac{f(2)(x_i - 2)}{f(x_i) - f(2)} \qquad x_0 = 1$$

Calculando $f(2) = 8 - e^2 \approx 0.6109$:

### Tabla de iteraciones

| $i$ | $x_i$ | $e(x_i) = |x_{i+1} - x_i|$ | |-----|--------|--------------------------| | 0 | 1 | — | | 1 | 1.73770516 | 0.73770516 | | 2 | 1.84709505 | 0.10938989 | | 3 | 1.85638640 | 0.00929135 | | 4 | 1.85712117 | 0.00073478 | | 5 | 1.85717893 | $5.78 \times 10^{-5}$ | | 6 | 1.85718347 | $4.54 \times 10^{-6}$ |

En la iteración 6 el error ya está en el orden de $10^{-6}$. ✓

> ✅ A diferencia de bisección, en Regula Falsi **el error SÍ decrece en cada iteración** (cuando se fijó el extremo correcto).

---

## Convergencia

|Parámetro|Valor|
|---|---|
|Orden $p$|1 (lineal)|
|Radio $R$ (fijando $a$)|$\displaystyle R = (\alpha - b)\frac{f''(\varphi)}{2f'(\varphi)}$|
|Radio $R$ (fijando $b$)|$\displaystyle R = (\alpha - a)\frac{f''(\varphi)}{2f'(\varphi)}$|

---

## Ventajas y desventajas

### ✅ Ventajas

- Si se fija el extremo correcto, **siempre converge** y el error decrece en cada paso.
- Más rápido que bisección en la práctica.

### ❌ Desventajas

- Requiere análisis previo de $f'$ y $f''$ para elegir el extremo.
- Si hay un **punto crítico o de inflexión** cercano a la raíz → prácticamente inutilizable.
- Más complejo de implementar que bisección.

---

## Pseudocódigo

```python
def regula_falsi(f, a, b, eps=1e-6, max_iter=100):
    # Asumimos que ya se determinó que se fija b
    x_prev = a
    for i in range(1, max_iter + 1):
        fb = f(b)
        fx = f(x_prev)
        x_new = b - fb * (x_prev - b) / (fx - fb)
        if abs(x_new - x_prev) < eps:
            return x_new, i
        x_prev = x_new
    return x_prev, max_iter
```

---

_Tags: #regula-falsi #falsa-posicion #secantes #convergencia-lineal_
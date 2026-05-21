# 02 — Método de Bisección (Bolzano)

> [[00_INDICE|← Volver al índice]] | Anterior: [[01_Conceptos_Previos]] | Siguiente: [[03_Regula_Falsi]]

---

## ¿Qué es?

El método de bisección (también llamado **búsqueda binaria**) es el más simple y robusto de todos. Se basa directamente en el [[01_Conceptos_Previos#4. Teorema de Bolzano ⭐|Teorema de Bolzano]].

**Idea:** si hay una raíz en $[A, B]$, el punto medio $C = (A+B)/2$ divide el intervalo en dos. En uno de los dos subintervalos la raíz sigue estando (el que cumple Bolzano). Se repite el proceso achicando el intervalo a la mitad cada vez.

> También se usa para **ordenar vectores** y **asignar memoria** en sistemas operativos.

---

## Algoritmo paso a paso

```
Dado [A, B] con f(A)·f(B) < 0:

1) C = (A + B) / 2
2) Si signo(f(B)) = signo(f(C)):
       B := C          ← la raíz está en [A, C]
   Sino:
       A := C          ← la raíz está en [C, B]
3) Repetir 1) y 2) hasta criterio de paro
```

### Criterio de paro recomendado

$$|f(x_i)| < \varepsilon \quad \text{o bien} \quad |x_{i+1} - x_i| < \varepsilon$$

---

## Ejemplo completo: $x - e^{-x} = 0$

**Función:** $f(x) = x - e^{-x}$  
**Intervalo:** $[0, 1]$ (verificación: $f(0)=-1 < 0$, $f(1)\approx 0.632 > 0$ ✓)

### Tabla de iteraciones

|$i$|$a$|$b$|$f(a)$|$f(b)$|$p = (a+b)/2$|$f(p)$|
|---|---|---|---|---|---|---|
|0|0|1|−1|0.63212|0.5|−0.10653|
|1|0.5|1|−0.10653|0.63212|0.75|0.27763|
|2|0.5|0.75|−0.10653|0.27763|0.625|0.08974|
|3|0.5|0.625|−0.10653|0.08974|**0.5625**|−0.00728|
|4|0.5625|0.625|−0.00728|0.08974|0.59375|0.04150|
|5|0.5625|0.59375|−0.00728|0.04150|0.578125|0.01718|
|6|0.5625|0.578125|−0.00728|0.01718|0.5703125|0.00496|
|7|0.5625|0.5703125|−0.00728|0.00496|0.56640625|−0.00116|
|8|0.56640625|0.5703125|−0.00116|0.00496|0.56835938|0.00191|
|9|0.56640625|0.56835938|−0.00116|0.00191|0.56738281|0.00038|

**Con $\varepsilon < 0.01$:** se detiene en el paso 3 → raíz $\approx 0.5625$

> ⚠️ Nota importante: el error **no decrece monótonamente** en cada iteración (ver filas 3→4). Esto es normal y se debe a los sucesivos promedios. A la larga el método converge igual.

---

## Propiedad de acotación del error ⭐

Esta propiedad permite **calcular de antemano** cuántas iteraciones necesitamos:

$$|x_i - \alpha| \leq \frac{b - a}{2^i} \qquad \forall, i \geq 1$$

### Aplicación: ¿cuántas iteraciones para lograr $\varepsilon < 10^{-5}$?

**Ecuación:** $x^3 + 4x^2 - 10 = 0$ en $[1, 2]$

$$\frac{b-a}{2^i} = \frac{1}{2^i} < 10^{-5}$$ $$2^i > 10^5$$ $$i \cdot \log(2) > 5$$ $$i > \frac{5}{\log(2)} = \frac{5}{0.30103} \approx 16.61$$

→ **Se necesitan al menos 17 iteraciones.**

> 💡 La cantidad de iteraciones **NO depende de la ecuación**, solo de la longitud del intervalo y de $\varepsilon$.

**Fórmula general:** $$i > \frac{\log!\left(\frac{b-a}{\varepsilon}\right)}{\log(2)}$$

---

## Convergencia

|Parámetro|Valor|
|---|---|
|Orden $p$|1 (lineal)|
|Radio $R$|1/2|

El error se reduce a la mitad en cada iteración (de ahí $R = 1/2$).

---

## Ventajas y desventajas

### ✅ Ventajas

- **Simplicidad** — el algoritmo es trivial de implementar.
- **Garantía de convergencia** — si cumple Bolzano, **siempre converge**.
- No requiere derivadas.

### ❌ Desventajas

- **Lento** — $p = 1$ y necesita muchas iteraciones para alta precisión.
- El error no decrece en cada paso individual (aunque sí globalmente).
- Requiere que la función cambie de signo (no sirve para raíces dobles tangentes al eje).

---

## Pseudocódigo implementable

```python
def biseccion(f, a, b, eps=1e-6, max_iter=100):
    assert f(a) * f(b) < 0, "No se cumple Bolzano en [a, b]"
    for i in range(max_iter):
        c = (a + b) / 2
        if abs(f(c)) < eps or (b - a) / 2 < eps:
            return c, i          # raíz aproximada e iteraciones usadas
        if f(b) * f(c) > 0:
            b = c
        else:
            a = c
    return (a + b) / 2, max_iter

# Ejemplo: x - e^(-x) = 0
import math
raiz, iters = biseccion(lambda x: x - math.exp(-x), 0, 1, eps=1e-6)
print(f"Raíz ≈ {raiz:.8f} en {iters} iteraciones")
# → Raíz ≈ 0.56714329 en 20 iteraciones
```

---

## Relación con otros métodos

- [[03_Regula_Falsi]] → también acota la raíz, pero usa secantes en vez de punto medio → más rápido.
- [[04_Newton_Raphson]] → no acota, usa tangentes, pero converge cuadráticamente.
- [[05_Punto_Fijo]] → reformula la ecuación, conceptualmente distinto.

---

_Tags: #biseccion #bolzano #convergencia-lineal #búsqueda-binaria_
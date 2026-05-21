# 01 — Conceptos Previos

> [[00_INDICE|← Volver al índice]]

---

## 1. Errores

Sea $x$ el valor **exacto** y $\tilde{x}$ el valor **aproximado**.

### Error absoluto

$$e(x) = x - \tilde{x} \qquad \text{cota: } |e(x)| = |x - \tilde{x}|$$

### Error relativo

$$e_r(x) = \frac{e(x)}{x} \qquad \text{cota: } |e_r(x)| = \left|\frac{e(x)}{x}\right|$$

> **Ejemplo:** Si el valor exacto es $x = 3.14159$ y la aproximación es $\tilde{x} = 3.14$:
> 
> - $|e(x)| = |3.14159 - 3.14| = 0.00159$
> - $|e_r(x)| = 0.00159 / 3.14159 \approx 0.000506$

---

## 2. Redondeo

Dado $x = 521{,}758847923$ con $t = 5$ decimales:

|Tipo|Resultado|Criterio|
|---|---|---|
|**Truncado**|$521{,}75884$|se corta directamente|
|**Simétrico**|$521{,}75885$|se mira el $(t+1)$-ésimo dígito: si $\geq 5$ → se suma 1 al último|

> El redondeo **simétrico** propaga un 50 % menos de error en promedio. Es el estándar.

---

## 3. Notación de representación de máquina

$$F(t,, B,, m,, M)$$

|Parámetro|Significado|
|---|---|
|$t$|cantidad de dígitos decimales|
|$B$|base del sistema de numeración|
|$m$|cota inferior en módulo|
|$M$|cota superior en módulo|

**Ejemplo:** $F(4,, 10,, 15,, 32)$

- Maneja 4 decimales en base 10.
- Mayor valor representable: $10^{32}$
- Menor valor (no nulo) representable: $10^{-15}$
- Los valores **fuera** del rango $[-10^{32},, -10^{-15}] \cup [10^{-15},, 10^{32}]$ no se pueden representar (overflow / underflow).

---

## 4. Teorema de Bolzano ⭐

> Sea $f$ continua en $[a, b]$.  
> Si $\text{sg}(f(a)) \neq \text{sg}(f(b))$ → $\exists, c \in (a,b)$ tal que $f(c) = 0$

En otras palabras: **si la función cambia de signo en el intervalo, hay al menos una raíz adentro.**

### Verificación práctica

Calcular $f(a) \cdot f(b) < 0$.

> **Ejemplo:** $f(x) = x - e^{-x}$, intervalo $[0,1]$
> 
> - $f(0) = 0 - 1 = -1 \quad (<0)$
> - $f(1) = 1 - e^{-1} \approx 0.632 \quad (>0)$
> - $f(0) \cdot f(1) < 0$ ✓ → existe raíz en $(0,1)$

---

## 5. Criterios de paro de algoritmos iterativos

Los algoritmos generan ${x_0, x_1, x_2, \ldots} \to \alpha$.  
Como nunca llegan exactamente a $\alpha$, se detienen cuando el **error es suficientemente pequeño**.

### Criterio 1 — Error absoluto

$$|x_{i+1} - x_i| < \varepsilon$$

### Criterio 2 — Error relativo

$$\left|\frac{x_{i+1} - x_i}{x_{i+1}}\right| < \varepsilon$$

### Criterio 3 — Valor de la función

$$|f(x_i)| < \varepsilon$$

> ⚠️ El criterio 3 **solo es válido** si la función tiene pendiente mayor a 1 en el intervalo de trabajo. Si la función es muy plana cerca de la raíz, $f(x_i)$ puede ser pequeño aunque $x_i$ esté lejos de $\alpha$.

---

## 6. Orden y radio de convergencia

Sea ${x_i} \to \alpha$. Se definen $p$ (orden) y $R$ (radio) como:

$$\lim_{i \to \infty} \frac{|\alpha - x_{i+1}|}{|\alpha - x_i|^p} = R \qquad \text{con } p \geq 1,; R \neq 0$$

|Orden $p$|Nombre|Interpretación|
|---|---|---|
|$p = 1$|Convergencia **lineal**|el error se reduce por un factor $R$ en cada paso|
|$p = 2$|Convergencia **cuadrática**|el error se **eleva al cuadrado** en cada paso → muy rápido|

> - Si $p=1$ y $R < 1$ → converge (cuanto más chico $R$, más rápido)
> - Si $p=1$ y $R > 1$ → diverge
> - A igual $p$, **menor $R$ = método más rápido**

### Resumen de convergencia por método

|Método|$p$|$R$|
|---|---|---|
|[[02_Biseccion\|Bisección]]|1|1/2|
|[[03_Regula_Falsi\|Regula Falsi]]|1|depende de $f$|
|[[04_Newton_Raphson\|Newton-Raphson]]|**2**|$\|f''(\varphi)/2f'(\varphi)\|$|
|[[05_Punto_Fijo\|Punto Fijo]]|1|$\|g'(\alpha)\|$|

---

_Tags: #conceptos-base #error #bolzano #convergencia_

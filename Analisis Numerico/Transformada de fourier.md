# Transformada de Fourier

## Transformada integral

Una transformada integral es un operador T aplicado a una función f(t):

$$T(f(t))=\int_{t_1}^{t_2}K(u,t) f(t) dt=F(u)$$

- Entrada: f(t)
- Salida: F(u)
- Los límites pueden ser $-\infty~ a +\infty$

También existe la inversa:

$$T^{−1}(F(u))=\int_{u_1}^{u_2}K^{−1}(u,t) F(u) du=f(t))$$

> Transforman una función en otra (dominio ↔ frecuencia)

---

## Condiciones sobre f(t)

### Función seccionalmente continua

- Tiene una cantidad finita de discontinuidades
- Los saltos son finitos (no asíntotas)

> Una función continua es un caso particular

### Función integrable

$$\int_{-\infty}^{\infty} f(t)\,dt = k \quad k \in \mathbb{R}$$

> No debe divergir

---

## Definición de Transformada de Fourier
Dada una función f(t) con dominio t real que sea seccionalmente continua e integrable en todo el eje real vamos a definir F(w) como la transformada de Fourier de f(t). Llamaremos F al operador matemático. O sea

$$F(f(t)) = \int_{-\infty}^{\infty} f(t)e^{-jwt} dt = F(w)$$

Inversa:

$$F^{-1}(F(w)) = \frac{1}{2\pi} \int_{-\infty}^{\infty} F(w)e^{jwt} dw = f(t)$$

> f(t): dominio del tiempo  
> F(w): dominio de la frecuencia (espectro)

---

## Interpretación

- t → tiempo
- $\omega_0$ → frecuencia (puede ser compleja)

> La transformada lleva señales al dominio frecuencial


## COMPARACION ENTRE SEF Y TF

### DISCRETO ($n$)

**Serie Exponencial de Fourier (SEF)**

$$S(x) = \sum_{n=-\infty}^{\infty} C_n e^{njw_0x}$$

$$C_n = \frac{1}{2}(a_n - b_nj) \quad (1)$$

$$C_n = \frac{1}{2L} \int_{-L}^{L} f(x) e^{-njw_0x} dx \quad (2)$$

$$C_0 = \frac{1}{2L} \int_{-L}^{L} f(x) = \frac{a_0}{2}$$

---

### CONTINUO ($t$)

**Transformada de Fourier (TF)**

**Transformada Inversa:**

$$F^{-1}(F(w)) = \frac{1}{2\pi} \int_{-\infty}^{\infty} F(w) e^{jwt} d(w) = f(t)$$

**Transformada:**

$$F(f(t)) = \int_{-\infty}^{\infty} f(t) e^{-jwt} dt = F(w)$$
>[!NOTE]
>El eje izquierdo representa el espectro **discreto** dependiente de $n$, mientras que el derecho representa el espectro **continuo** dependiente de $w$ (frecuencia).


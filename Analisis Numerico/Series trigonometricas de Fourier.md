 
##### Funcion Periódica
Es aquella que cumple con la condicion de que $f(x) = f(x + T)$ donde T es un numero real llamado periodo. En corto, la funcion cumple un ciclo cada $T$ y vuelve a su estado original. 
Tambien llamamos **semiperiodo** a $L = T/2$ y esto es importante para el desarrollo de la serie trigonometrica de Fourier.
## La serie trigonométrica de fourier
Una serie trigonométrica de Fourier permite desarrollar en serie de senos y cosenos de distinta frecuencia una función periódica **tal que $\int_{-L}^{L} f(x) dx$ exista (o sea no tienda a infinito)**
#### Ejemplos
1 - **Definición Matemática:**

$$f(x) = x^2 \quad \text{para } -2 < x < 2$$

$$f(x) = f(x + 4) \implies T = 4$$
2 - Representacion grafica

```latex
\documentclass[tikz,border=5pt]{standalone}

\usepackage{pgfplots}
\pgfplotsset{compat=1.18}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    axis lines = middle,
    xlabel = $x$,
    ylabel = {$f(x)$},
    ymin=0, ymax=4.5,
    xmin=-10.5, xmax=10.5,
    samples=100,
    grid = major,
    width=14cm, height=6cm,
    ytick={2, 4},
    xtick={-8, -6, -4, -2, 0, 2, 4, 6, 8},
]
    \addplot [
        very thick,
        blue,
        domain=-10:10,
        samples=401,
    ] {((mod(x+2,4) - 2)^2)};
\end{axis}
\end{tikzpicture}

\end{document}
```
3 - Calculo del area:
$$\int_{-2}^{2} x^2 \, dx = \left[ \frac{x^3}{3} \right]_{-2}^{2} = \frac{8}{3} - \left( -\frac{8}{3} \right) = \frac{16}{3} \approx 5.33$$
#### Definicion
Dada una función periódica integrable en su periodo, o sea:

Dado $f(x) = f(x + T)$ tal que $\int_{-L}^{L} f(x)\,dx$ o bien $\int_{0}^{T} f(x)\,dx$ existan

La serie trigonométrica de Fourier que aproxima a la función es

$$
f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} a_n \cos(n \omega_0 x) + b_n sen(n \omega_0 x)
$$

Vamos a analizar cada uno de los términos de la serie y todos los componentes que la integra

1) $\frac{a_0}{2}$ se denomina valor medio de la serie. ¿Cómo se interpreta?  
Este término es una constante tal que el área encerrada entre la función y esta constante por arriba y por abajo es la misma  

2) Cada par de términos de la sumatoria $a_n \cos(n\omega_0 x) + b_n sen(n\omega_0 x)$  
Se denominan armónicas y hay infinitas. Para $n=1$ se dice que es la primera armónica, $n=2$ la segunda y así sucesivamente.  

3) El coeficiente $\omega_0$ se denomina frecuencia fundamental y se calcula  
$\omega_0 = \frac{\pi}{L}$ siendo $L$ el semiperiodo. También podemos escribir  
$\omega_0 = \frac{2\pi}{T}$ con $T$ periodo de la función.  

4) Usaremos indistintamente $\omega_0$ o $\frac{\pi}{L}$ según convenga  

---

#### Calculo de coeficientes
1. Calculo del $a_0$

$$
f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} a_n \cos(n \omega_0 x) + b_n sen(n \omega_0 x)
$$

Integrando a ambos miembros en el intervalo $(-L, L)$ nos queda

$$
\int_{-L}^{L} f(x)\,dx
=
\int_{-L}^{L} \frac{a_0}{2}\,dx
+
\int_{-L}^{L} \left(
\sum_{n=1}^{\infty} a_n \cos(n\omega_0 x) + b_n sen(n\omega_0 x)
\right) dx
$$
Distribuyendo las integrales e intercambiando por la sumatoria (lo que es totalmente válido) nos queda:

$$
\int_{-L}^{L} f(x)\,dx
=
\int_{-L}^{L} \frac{a_0}{2}\,dx
+
\left(
\sum_{n=1}^{\infty} \int_{-L}^{L} a_n \cos(n\omega_0 x)\,dx
+
\sum_{n=1}^{\infty} \int_{-L}^{L} b_n \\sen(n\omega_0 x)\,dx
\right)
$$

$$
\int_{-L}^{L} \frac{a_0}{2}\,dx = \frac{a_0}{2} \cdot 2L = a_0 L
$$

Para analizar lo que dan los términos de la sumatoria, lo vamos a hacer sin tener en cuenta dicha sumatoria en principio.

$$
\int_{-L}^{L} a_n \cos(n\omega_0 x)\,dx
=
a_n \left( \frac{\\sen(n\omega_0 x)}{n\omega_0} \right)\Bigg|_{-L}^{L}
=
a_n \left( \frac{\\sen\left(\frac{n\pi x}{L}\right)}{\frac{n\pi}{L}} \right)\Bigg|_{-L}^{L}
=
a_n \left( \frac{\\sen(n\pi) - \\sen(-n\pi)}{\frac{n\pi}{L}} \right)
$$

Analizando la expresión obtenida nos damos cuenta que esa integral va a ser 0 ya que $n$ es un número natural y el $\\sen(n\pi)=0$ para todo valor de $n$. O sea que la sumatoria va a dar 0

$$
\int_{-L}^{L} b_n \\sen(n\omega_0 x)\,dx
=
\int_{-L}^{L} b_n \\sen\left(\frac{n\pi}{L} x\right)\,dx = 0
$$

Ya que la función seno es impar y la integral se evalúa entre $(-L;L)$
Volviendo a la igualdad

$$
\int_{-L}^{L} f(x)\,dx
=
\int_{-L}^{L} \frac{a_0}{2}\,dx
+
\left(
\sum_{n=1}^{\infty} \int_{-L}^{L} a_n \cos(n\omega_0 x)\,dx
+
\sum_{n=1}^{\infty} \int_{-L}^{L} b_n \sen(n\omega_0 x)\,dx
\right)
$$

Todo se anula salvo el primer término que nos había dado $a_0 L$

Es decir

$$
\int_{-L}^{L} f(x)\,dx = a_0 L
\quad \text{o sea} \quad
a_0 = \frac{1}{L} \int_{-L}^{L} f(x)\,dx
$$
2. Calculo de $a_n$
Para calcular el $a_n$ vamos a multiplicar la expresión inicial por un término $\cos(m\omega_0 x)$ con $m$ natural

O sea

$$
f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} a_n \cos(n\omega_0 x) + b_n \sen(n\omega_0 x)
$$

$$
f(x)\cos(m\omega_0 x)
=
\frac{a_0}{2}\cos(m\omega_0 x)
+
\sum_{n=1}^{\infty} a_n \cos(n\omega_0 x)\cos(m\omega_0 x)
+
\sum_{n=1}^{\infty} b_n \sen(n\omega_0 x)\cos(m\omega_0 x)
$$

Reemplazando la frecuencia $\omega_0 = \frac{\pi}{L}$ nos queda

$$
f(x)\cos\left(\frac{m\pi}{L}x\right)
=
\frac{a_0}{2}\cos\left(\frac{m\pi}{L}x\right)
+
\sum_{n=1}^{\infty} a_n \cos\left(\frac{n\pi}{L}x\right)\cos\left(\frac{m\pi}{L}x\right)
+
\sum_{n=1}^{\infty} b_n \sen\left(\frac{n\pi}{L}x\right)\cos\left(\frac{m\pi}{L}x\right)
$$

Ahora integramos en el intervalo $(-L, L)$

$$
\int_{-L}^{L} f(x)\cos\left(\frac{m\pi}{L}x\right)\,dx
=
\int_{-L}^{L} \frac{a_0}{2}\cos\left(\frac{m\pi}{L}x\right)\,dx
+
\sum_{n=1}^{\infty} \int_{-L}^{L} a_n \cos\left(\frac{n\pi}{L}x\right)\cos\left(\frac{m\pi}{L}x\right)\,dx
+
\sum_{n=1}^{\infty} \int_{-L}^{L} b_n \sen\left(\frac{n\pi}{L}x\right)\cos\left(\frac{m\pi}{L}x\right)\,dx
$$

Con $n$ y $m$ naturales

Hagamos un rápido análisis de cada término del 2do miembro. Cada integral se puede buscar en tabla y resolverlo.

**1er término:**

$$
\int_{-L}^{L} \frac{a_0}{2}\cos\left(\frac{m\pi}{L}x\right)\,dx
=
\frac{a_0}{2}\int_{-L}^{L} \cos\left(\frac{m\pi}{L}x\right)\,dx
=
\frac{a_0}{2}
\left(
\frac{\sen\left(\frac{m\pi}{L}x\right)}{\frac{m\pi}{L}}
\right)\Bigg|_{-L}^{L}
= 0
$$

Ya que si reemplazamos por los extremos de integración nos da el seno de un número entero de $\pi$, que es 0.

**2do término:**

La integral del segundo término se puede resolver usando identidades trigonométricas, pero vamos a asumir que ya la hemos resuelto

$$
\int_{-L}^{L}
a_n \cos\left(\frac{n\pi}{L}x\right)\cos\left(\frac{m\pi}{L}x\right)\,dx
=
\begin{cases}
0 & \text{si } n \ne m \\
L & \text{si } n = m
\end{cases}
$$

O sea que de toda la suma solo nos queda el término en donde $n=m$, todo el resto se anula

**3er término:**

$$
\int_{-L}^{L}
\sen\left(\frac{n\pi}{L}x\right)\cos\left(\frac{m\pi}{L}x\right)\,dx = 0
$$

Para todo $n$ y $m$ ya que es el producto de una función impar con otra que es par.  
Como es sabido el producto de una función par con una impar es impar y la integral de una función impar en el intervalo simétrico $(-L;L)$ es 0

En síntesis

$$
\int_{-L}^{L} f(x)\cos\left(\frac{m\pi}{L}x\right)\,dx
=
0
+
\sum_{n=1}^{\infty} \int_{-L}^{L} a_n \cos\left(\frac{n\pi}{L}x\right)\cos\left(\frac{m\pi}{L}x\right)\,dx
+
0
$$
Si $m = n$

$$
\int_{-L}^{L} f(x)\cos\left(\frac{m\pi}{L}x\right)\,dx
=
a_n \int_{-L}^{L} \cos^2\left(\frac{n\pi}{L}x\right)\,dx
=
a_n L
$$
>[!SUMMARY] Calculo de $a_n$
>$$
>a_n = \frac{1}{L} \int_{-L}^{L} f(x)\cos(n\omega_0 x)\,dx
>$$
3. Calculo de $b_n$
Para calcular $b_n$, vamos a multiplicar la expresión inicial por un término $\operatorname{sen}(m\omega_0x)$ con $m$ natural ($m \in \mathbb{N}$).

### Expresión Inicial

La serie de Fourier se define como:

$$f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} a_n \cos(n\omega_0x) + b_n \operatorname{sen}(n\omega_0x)$$

Multiplicando ambos miembros por $\operatorname{sen}(m\omega_0x)$:

$$f(x) \operatorname{sen}(m\omega_0x) = \frac{a_0}{2} \operatorname{sen}(m\omega_0x) + \sum_{n=1}^{\infty} a_n \cos(n\omega_0x) \operatorname{sen}(m\omega_0x) + b_n \operatorname{sen}(n\omega_0x) \operatorname{sen}(m\omega_0x)$$

Reemplazando la frecuencia $\omega_0 = \frac{\pi}{L}$:

$$f(x) \operatorname{sen}\left(m\frac{\pi}{L}x\right) = \frac{a_0}{2} \operatorname{sen}\left(m\frac{\pi}{L}x\right) + \sum_{n=1}^{\infty} a_n \cos\left(n\frac{\pi}{L}x\right) \operatorname{sen}\left(m\frac{\pi}{L}x\right) + \sum_{n=1}^{\infty} b_n \operatorname{sen}\left(n\frac{\pi}{L}x\right) \operatorname{sen}\left(m\frac{\pi}{L}x\right)$$

---


Ahora integramos ambos miembros con $n$ y $m$ naturales:

$$\int_{-L}^{L} f(x) \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx = \int_{-L}^{L} \frac{a_0}{2} \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx + \sum_{n=1}^{\infty} \int_{-L}^{L} a_n \cos\left(n\frac{\pi}{L}x\right) \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx + \sum_{n=1}^{\infty} \int_{-L}^{L} b_n \operatorname{sen}\left(n\frac{\pi}{L}x\right) \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx$$

---

### Análisis de los términos del 2do miembro

#### 1er término:

$$\int_{-L}^{L} \frac{a_0}{2} \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx = \frac{a_0}{2} \int_{-L}^{L} \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx = \frac{a_0}{2} \left( \frac{-\cos(m\frac{\pi}{L}x)}{m\frac{\pi}{L}} \right)_{-L}^{L} = 0$$

> **¿Por qué?**
> 
> Si reemplazamos en los extremos de integración:
> 
> $$\frac{a_0}{2m\frac{\pi}{L}} (-\cos(m\pi) + \cos(-m\pi)) = \frac{a_0}{2m\frac{\pi}{L}} (-(-1)^m + (-1)^m) = 0$$
> 
> El coseno de un número entero de $\pi$ oscila entre $1$ y $-1$. Además, $\cos(-m\pi) = \cos(m\pi)$ ya que el coseno es una **función par**.

#### 2do término:

$$\int_{-L}^{L} a_n \cos\left(n\frac{\pi}{L}x\right) \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx = 0$$

Esto sucede porque es una integral en un intervalo simétrico $(-L, L)$ del producto de una **función par** por una **impar**, lo que da como resultado una función impar.

#### 3er término:

$$b_n \int_{-L}^{L} \operatorname{sen}\left(n\frac{\pi}{L}x\right) \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx = \begin{cases} 0 & \text{si } n \neq m \\ L & \text{si } n = m \end{cases}$$

De toda la suma solo queda el término en donde $n=m$, el resto se anula por **ortogonalidad**.

---

### En síntesis

$$\int_{-L}^{L} f(x) \operatorname{sen}\left(m\frac{\pi}{L}x\right) dx = b_n \int_{-L}^{L} \operatorname{sen}\left(n\frac{\pi}{L}x\right)^2 dx = b_n L$$

Por lo tanto, la fórmula final para el coeficiente es:

> [!IMPORTANT] Coeficiente $b_n$
> 
> $$b_n = \frac{1}{L} \int_{-L}^{L} f(x) \operatorname{sen}(n\omega_0x) dx$$
#### Corolario
Dada una funcion periodica $f(x) = f(x + T)$ con $T$ real y $L = T/2$ y la frecuencia fundamental $w_0 = \pi/L = 2\pi / T$
La serie trignometrica de fourier es
$$f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} a_n \cos(n \omega_0 x) + b_n sen(n \omega_0 x)$$
En donde:

- **Componente de continua:**
    
    $$a_0 = \frac{1}{L} \int_{-L}^{L} f(x) \, dx$$
    
- **Coeficientes de los términos coseno:**
    
    $$a_n = \frac{1}{L} \int_{-L}^{L} f(x) \cos(n\omega_0x) \, dx$$
    
- **Coeficientes de los términos seno:**
    
    $$b_n = \frac{1}{L} \int_{-L}^{L} f(x) \operatorname{sen}(n\omega_0x) \, dx$$
    
Tener en cuenta que se eligieron los extremos de integración entre $(-L, L)$, pero en realidad es en un **periodo completo**. Dependiendo de cómo se haya definido la función, elegiremos el periodo más conveniente para resolver los cálculos.
#### Propiedades de la serie trigonometrica

1. **Convergencia de los coeficientes:**
    
    $$\lim_{n \to \infty} a_n = \lim_{n \to \infty} b_n = 0$$
    
    >  Espectros Discretos
    > 
    > Estos valores $a_n$ y $b_n$ de la serie se denominan **espectros discretos**. Son valores discretos ya que $n$ es natural ($n \in \mathbb{N}$).
    
2. **Convergencia en el punto (Teorema de Dirichlet):**
    
    Si llamamos a la STF como $S(x)$ y $a$ es un valor real del dominio, entonces:
    
    $$S(a) = \frac{f(a^+) + f(a^-)}{2}$$
    
    En donde:
    
    - $f(a^+) = \lim_{x \to a^+} f(x)$
        
    - $f(a^-) = \lim_{x \to a^-} f(x)$
        
    
    Estos son los **límites laterales**. O sea que cualquier valor de la serie se calcula haciendo el promedio de los límites laterales. Aunque las funciones periódicas (señales) pueden tener discontinuidades, la serie es siempre continua y se puede calcular su valor para cada elemento del dominio.
#### Simetria de media onda
Existe simetria de media onda $<=> f(t) = - f(t+L)$
Garantiza que las armonicas o coeficientes Pares $a_0, a_{2k}$ y $b_{2k}$ se anulen. Para verlo graficamente, desplazo medio periodo y espejo mi funcion y de ahi se puede ver.
a_2k es nulo


#### Paridad
- Si la funcion original es par:
	- bn = 0
	- Serie de cosenos
- Si la funcion original es impar
	- an = 0
	- a0 = 0
	- Serie de senos
#### Solucion a falta de paridad
En ocaciones, algunas funciones son pares o impares si las corro o muevo tal que:
$$f(t) = g(t) + n ~~~~~ => ~~~~~ Sf(t) = Sg(t) + n$$
Para forzar la **imparidad** puedo hacer $n = a_0/2$ tal que quede mitad de area de cada lado.
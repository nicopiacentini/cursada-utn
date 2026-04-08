# SERIE EXPONENCIAL DE FOURIER (SEF)

## 1. Fundamentos y Deducción

Recordamos la **Serie Exponencial de Fourier (SEF)** a partir de las identidades de Euler:

- $e^{j\varphi}=\cos(\varphi)+j\cdot\sin(\varphi)$ (1)
    
- $e^{-j\varphi}=\cos(\varphi)-j\cdot\sin(\varphi)$ (2)
    

Si sumamos (1) + (2), obtenemos $e^{j\varphi}+e^{-j\varphi}=2\cos(\varphi)$. Por lo tanto, la **forma exponencial del coseno** es:

$$cos(\varphi)=\frac{e^{j\varphi}+e^{-j\varphi}}{2}$$

Si restamos (1) - (2), nos queda $e^{j\varphi}-e^{-j\varphi}=2j\cdot\sin(\varphi)$. Por lo tanto, la **forma exponencial del seno** es:

$$sen(\varphi)=\frac{e^{j\varphi}-e^{-j\varphi}}{2j}$$

O bien: $sen(\varphi)=(\frac{e^{-j\varphi}-e^{j\varphi}}{2})\cdot j$.

### Sustitución en la Serie Trigonométrica de Fourier (STF)

Dada la STF:

$$S(x)=\frac{a_{0}}{2}+\sum_{n=1}^{\infty}a_{n}\cos(n\omega_{0}x)+b_{n}\sin(n\omega_{0}x)$$

Reemplazamos el seno y coseno por sus formas exponenciales:

$$S(x)=\frac{a_{0}}{2}+\sum_{n=1}^{\infty}a_{n}(\frac{e^{nj\omega_{0}x}+e^{-nj\omega_{0}x}}{2})+b_{n}j\cdot(\frac{e^{-nj\omega_{0}x}-e^{nj\omega_{0}x}}{2})$$

Distribuyendo y reagrupando los términos con exponente positivo y negativo:

$$S(x)=\frac{a_{0}}{2}+\sum_{n=1}^{\infty}\frac{1}{2}(a_{n}-b_{n}j)e^{njw_{0}x}+\frac{1}{2}(a_{n}+b_{n}j)e^{-njw_{0}x}$$

Definimos los coeficientes:

- $C_{n}=\frac{1}{2}(a_{n}-b_{n}j)$
    
- $C_{-n}=\frac{1}{2}(a_{n}+b_{n}j)$
    
- $C_{0}=\frac{a_{0}}{2}$
    

---

## 2. Definición Formal de la SEF

Podemos escribir la serie como:

$$S(x)=C_{0}+\sum_{n=1}^{\infty}C_{n}e^{njw_{0}x}+C_{-n}e^{-njw_{0}x}$$

La **forma más simplificada** de escribir la SEF es:

$$S(x)=\sum_{n=-\infty}^{\infty}C_{n}e^{njw_{0}x}$$

Donde $a_n$ y $b_n$ son las integrales conocidas de Fourier. Sin embargo, $C_n$ puede calcularse directamente mediante la integral:

$$C_{n}=\frac{1}{2L}\int_{-L}^{L}f(x)e^{-njw_{0}x}dx$$

> [!NOTE] Espectro Discreto A $C_n$ se lo denomina **espectro discreto**.

### Casos Particulares

Dependiendo de la paridad de la función $f(x)$:

- **Si $f(x)$ es par**: $b_n = 0$, por lo tanto $C_n = \frac{a_n}{2} \in \mathbb{R}$
	    
- **Si $f(x)$ es impar**: $a_n = 0$, por lo tanto $C_n = -\frac{b_n}{2}j \in \mathbb{I}$.
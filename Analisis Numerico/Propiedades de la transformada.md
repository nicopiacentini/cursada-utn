## 1. Propiedades de la Transformada

- **Linealidad:** $\mathcal{L}\{c_{1}f_{1}(t)+c_{2}f_{2}(t)\}=c_{1}\mathcal{L}\{f_{1}(t)\}+c_{2}\mathcal{L}\{f_{2}(t)\}$
    
- **Traslación Nro 1:** Si $\mathcal{L}\{f(t)\}=F(s) \Rightarrow \mathcal{L}\{e^{at} \cdot f(t)\}=F(s-a)$
    
- **Traslación Nro 2:** Si $\mathcal{L}\{f(t)\}=F(s)$ y dado $g(t)=\begin{cases}f(t-a) & t>a \\ 0 & t<a\end{cases} \Rightarrow \mathcal{L}\{g(t)\}=e^{-as} \cdot F(s)$
    
- **Cambio de escala:** $\mathcal{L}\{f(at)\}=\frac{1}{a}F(\frac{s}{a})$
    
- **Derivada primera (continua en 0):** Si $\mathcal{L}\{f(t)\}=F(s) \Rightarrow \mathcal{L}\{f^{\prime}(t)\}=sF(s)-f(0)$
    
- **Derivada primera (discontinua en 0):** $\mathcal{L}\{f^{\prime}(t)\}=sF(s)-f(0^{+})$
    
- **Derivada primera (discontinuidad en $t=a$):** $\mathcal{L}\{f^{\prime}(t)\}=sF(s)-f(0)-e^{-at}[f(a^{+})-f(a^{-})]$
    
- **Derivada segunda:** $\mathcal{L}\{f^{\prime\prime}(t)\}=s^{2}F(s)-sf(0)-f^{\prime}(0)$ (siendo $f$ y $f^{\prime}$ continuas en 0)
    
- **Derivada de orden n:** $\mathcal{L}\{f^{(n)}(t)\}=s^{n}F(s)-s^{n-1}f(0)-s^{n-2}f^{\prime}(0)-\dots-sf^{(n-2)}(0)-f^{(n-1)}(0)$
    
- **Transformada de integrales:** $\mathcal{L}\{\int_{0}^{t}f(u)du\}=\frac{F(s)}{s}$
    
- **Multiplicación por $t^n$:** $\mathcal{L}\{t^{n}f(t)\}=(-1)^{n}F^{(n)}(s)$
    
- **División por $t$:** $\mathcal{L}\{\frac{f(t)}{t}\}=\int_{s}^{\infty}F(u)du$ (siempre que exista $\lim_{t \to 0} \frac{f(t)}{t}$)
    
- **Funciones periódicas:** $\mathcal{L}\{f(t)\}=\frac{\int_{0}^{T}e^{-st}f(t)dt}{1-e^{-sT}}$
    
- **Comportamiento al infinito:** $\lim_{s \to \infty}F(s)=0$
    
- **Teorema del valor inicial:** $\lim_{t \to 0}f(t)=\lim_{s \to \infty}s \cdot F(s)$
    
- **Teorema del valor final:** $\lim_{t \to \infty}f(t)=\lim_{s \to 0}s \cdot F(s)$ (si existen los límites)
    

---

## 2. Propiedades de la Antitransformada ($\mathcal{L}^{-1}$)

- **Linealidad:** $\mathcal{L}^{-1}\{c_{1}F_{1}(s)+c_{2}F_{2}(s)\}=c_{1}\mathcal{L}^{-1}\{F_{1}(s)\}+c_{2}\mathcal{L}^{-1}\{F_{2}(s)\}$
    
- **Traslación Nro 1:** $\mathcal{L}^{-1}\{F(s-a)\}=e^{at} \cdot f(t)$
    
- **Traslación Nro 2:** $\mathcal{L}^{-1}\{e^{-as}F(s)\}=g(t)=\begin{cases}f(t-a) & t>a \\ 0 & t<a\end{cases}$
    
- **Cambio de escala:** $\mathcal{L}^{-1}\{\frac{1}{a}F(\frac{s}{a})\}=f(at)$
    
- **Antitransformada de derivadas:** $\mathcal{L}^{-1}\{F^{(n)}(s)\}=(-1)^{n}t^{n}f(t)$
    
- **Antitransformada de integrales:** $\mathcal{L}^{-1}\{\int_{s}^{\infty}F(u)du\}=\frac{f(t)}{t}$
    
- **Multiplicación por $s$:** $\mathcal{L}^{-1}\{sF(s)\}=f^{\prime}(t)$ (si $f(0)=0$)
    
- **División por $s$:** $\mathcal{L}^{-1}\{\frac{F(s)}{s}\}=\int_{0}^{t}f(u)du$
    
- **Teorema de Convolución:** $\mathcal{L}^{-1}\{F(s) \cdot G(s)\}=\int_{0}^{t}f(u)g(t-u)du$

#### Tabla de transformadas con restricciones
|**f(t),t>0**|**F(s)=L{f(t)}**|**Restricciones**|
|---|---|---|
|$1$|$\frac{1}{s}$|$s > 0$|
|$t$|$\frac{1}{s^2}$|$s > 0$|
|$t^n$ ($n \in \mathbb{N}$)|$\frac{n!}{s^{n+1}}$|$s > 0$|
|$e^{at}$|$\frac{1}{s - a}$|$s > a$|
|$\text{sen}(at)$|$\frac{a}{s^2 + a^2}$|$s > 0$|
|$\cos(at)$|$\frac{s}{s^2 + a^2}$|$s > 0$|
|$\delta(t)$|$1$||
### Fracciones simples para antitransformada
Recordar que si mi denominador tiene raices complejas conjugadas, no pasa nada y completo cuadrados. Pero en el caso en que sean **raices reales** debo hacer fracciones simples:

Sea una función de transferencia o expresión en el dominio de Laplace:

$$F(s) = \frac{P(s)}{Q(s)}$$

**Condición:** $\text{grado de } P(s) < \text{grado de } Q(s)$ (Fracción propia).

---

#### Casos de Descomposición

Según la naturaleza de las raíces del denominador $Q(s)$:
##### 1. Raíces Reales (Simples o Múltiples)

Para un factor en el denominador de la forma $(s - \alpha)^p$:

$$\frac{A}{(s - \alpha)^p}$$

> [!NOTE] Recordatorio
> 
> Si la raíz es múltiple (orden $p$), la descomposición completa requiere una suma de términos desde la potencia 1 hasta $p$.

##### 2. Raíces Complejas Conjugadas

Para un factor cuadrático irreducible en el denominador de la forma $s^2 + bs + c$:

$$\frac{Bs + C}{s^2 + bs + c}$$
##### Caso especial con raices reales simples
Una vez descompuesta mi funcion en un cociente entre numerador y sus raices, para obtener el valor que va sobre una de esas raices (sea $x_1$) debo ir a la funcion original, quitar el termino que contiene mi raiz y evaluar la expresion en $x_1$. Eso me da el valor de numerador que tiene mi raiz elegida. 
En caso de raices de multiplicidad > 1, solo puedo aplicar este truco con el numerador de la fraccion con la raiz entera, es decir, la raiz de mayor multiplicidad
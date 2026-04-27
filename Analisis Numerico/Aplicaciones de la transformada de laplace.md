
# Ecuaciones diferenciales
>[!NOTE] 
>La idea es transformar la ecuacion diferencial por laplace. Luego resolver dicha ecuacion en el dominio de laplace y por ultimo antitransformar.

Esto se puede aplicar debido a que:
$$\mathcal{L}\{f^{(n)}(t)\}=s^{n}F(s)-s^{n-1}f(0)-s^{n-2}f^{\prime}(0)-\dots-sf^{(n-2)}(0)-f^{(n-1)}(0)$$
Ademas aplico:
$$\mathcal{L}\{f^{(n)}(t)\}= \mathcal{L}(0) = \frac{1}{s^2}$$

##### Pasaje de terminos
Generalmente me queda una fraccion al despejar Y(s). Entonces debo evaluar crear una unica fraccion pasando dicho termino o dejar en suma de fracciones. Elegir una u otra depende de lo que sea mas facil, es decir, si sale alguna transformada directo, no hago la megafraccion, paso el elemento y listo.

# Convolucion
Dadas dos funciones $F(s)$ y $G(s)$ tales que

$$
\mathcal{L}^{-1}(F(s)) = f(t), \quad \mathcal{L}^{-1}(G(s)) = g(t)
$$

entonces

$$
\mathcal{L}^{-1}(F(s)\cdot G(s)) = \int_{0}^{t} f(u)\, g(t - u)\, du
$$

o bien

$$
\mathcal{L}\left(\int_{0}^{t} f(u)\, g(t - u)\, du \right) = F(s)\cdot G(s)
$$

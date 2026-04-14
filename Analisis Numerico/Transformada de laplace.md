Dada una funcion $f(x)$ la transformada de laplace de $f(t)$ es:$$ F(s) = \int_{0}^{\inf}{f(t)e^{-st}}dt$$
### Tabla basica de Laplace
| **f(t),t>0**     | **L{f(t)}=F(s)**      |
| ---------------- | --------------------- |
| $1$              | $\frac{1}{s}$         |
| $t^n$            | $\frac{n!}{s^{n+1}}$  |
| $e^{at}$         | $\frac{1}{s - a}$     |
| $\cos(at)$       | $\frac{s}{s^2 + a^2}$ |
| $\text{sen}(at)$ | $\frac{a}{s^2 + a^2}$ |
| $\delta(t)$      | $1$                   |
## Requisitos para Transformar (por laplace)
Para que una funcion pueda tener transformada de laplace, debe ser *seccionalmente contiuna* y de orden exponencial.
### Función de orden exponencial
Una funcion $f(t)$ es de orden exponencial $\alpha$ si para $t -> \inf$ existen $M, ~\alpha~y~t_0$ tal que
$$|f(t)| < Me^{\alpha t},~~ con ~t > t_0$$


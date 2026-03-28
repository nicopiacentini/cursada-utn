Unidad imaginaria
$$j = \sqrt-1$$
Permite encontrar raices de numeros negativos como por ejemplo:
$$\sqrt-4 = 2j$$
Entonces decimos que $2j$ es un numero imaginario puro. 

## Numeros complejos
Cuando lo sumamos o agregamos con un numero real tenemos un ***numero complejo*** de la forma **binomica**:
$$a + bj$$ Con $a, b \in \mathbb{R}$ donde $a = Re(z)$ (a es la parte real de z) y $b = Im(z)$
#### Forma binomica
Tambien existen:
- **Par ordenado** $z = (a;b)$
##### Representacion grafica
En las ordenadas van los imaginarios y en las absisas los reales. Se grafica como un vector que sale del origen y se trata como tal.
##### Igualdad
Sean 2 numeros complejos $z_1 = a_1 + b_1j$ y $z_2 = a_2 + b_2j$ son iguales <=> $a_1 = a_2$ && $b_1 = b_2$  
#### Operaciones en forma binomica
##### Suma
Sean 2 numeros complejos $z_1 = a_1 + b_1j$ y $z_2 = a_2 + b_2j$  entonces:
$$z_1 + z_2 = a_1 + a_2 + (b_1 + b_2)j$$ 
##### Multiplicacion
Sean 2 numeros complejos $z_1 = a_1 + b_1j$ y $z_2 = a_2 + b_2j$  entonces:
$$z_1 * z_2 = a_1 * a_2 - a_2 * b_2 + (a_1 * b_2 + b_1 * a_2)j$$
#### Division
Sean 2 numeros complejos $z_1 = a_1 + b_1j$ y $z_2 = a_2 + b_2j$  entonces:
$$z_1/z_2 = {z_1 * z_2}/|z_1c|^2$$
Donde $z_1c$ es el conjugado de $z_1$
#### Potencia
$$z^{n+1} = z^n * z$$
$$z^1 = z$$
$$z^0 = 1$$
#### Raiz cuadrada
Tener en cuenta que cada complejo tien 2 y solo 2 raizes cuadradas. Entonces:
$z = a +bj~~y~~u=x + yj$ donde $u^2 = z$ 
$$u = \sqrt z = +- \sqrt{(|Z|+a)/2} +- j\sqrt{(|Z|-a)/2}$$
###### Observaciones
1. si b>0 tomo signos iguales para x e y
2. si b<0 tomo signos distintos para x e y 
3. Si b = 0 u = +-$\sqrt a$
### Propiedades de complejos
Son caracteristicas que se pueden obtener de los mismos.
#### Modulo de un complejo
Se refiere a la longitud del vector posicion del complejo. Se calcula como:
Para $z = a + bj$
$$|z| = \sqrt {a^2 + b^2}$$
#### Conjugacion
Da vuelta la parte imaginaria de un complejo al multiplicarla por -1:
$$z = a + bj => z_1 = a - bj$$
Basicamente es espegar en el grafico al complejo sobre los reales. 
### Forma polar de un complejo
Sea $z = a + jb$ un complejo. Las coordenadas polares del mismo son:
$\rho = |z|$
$\phi$ = argumento o angulo que forma el vector con el semieje $\mathbb{R}^+$
- $z = [\rho ; \phi]$
#### Pasaje de polar a binomica
Para $z = a + bj = [\rho ; \phi]$:
- $\cos \phi = a/\rho => a = \rho \cos \phi$
- $sen \phi = b/\rho => b = \rho sen \phi$
$$b = \rho sen \phi ~~~~~~~~~~~~~~~~~~a = \rho \cos \phi$$
#### Pasaje de binomica a polar
Para $z = a + bj = [\rho ; \phi]$:
$$\rho = |z| = \sqrt{a^2 + b^2} ~~~~~~~~~~~~~~~~~~~~~\phi = arctg(b/a)$$
##### Aclaracion con $\phi$
Si el complejo se encuentra en el segundo o el tercer cuadrante, entonces el angulo que me dara arctan va a estar mal y necesitare sumarle $\pi$ de la forma $arctg(b/a) + \pi$

#### Forma trigonometrica
Es una forma similar de la forma polar pero en vez de escrita en coordenadas, esta escrita en una cuenta. 
$$z = \rho(\cos \phi + j \\sen \phi)$$
#### Forma exponencial
Utilizando al identidad de euler, se puede escribir el complejo asi:
$$z = \rho e^{j\phi}$$
#### Operaciones en forma polar
> La suma no puede realizarse en polar

*Sean $z_1 = \rho_1 e^{j\phi_1} ~ y ~ z_2 = \rho_2 e^{j\phi_2}$*

##### Multiplicacion
$$z_1 * z_2 = \rho_1 * \rho_2 * e^{j(\phi_1 + \phi_2)}$$
##### Division

$$z_1 / z_2 = \rho_1 / \rho_2 * e^{j(\phi_1 - \phi_2)}$$
##### Potenciacion
$$z^n = \rho^n * e^{j(\phi * n)}$$
#### Raiz n-ésima de un complejo
Sea $z = [\rho ; \phi], ~  w = [r ; \theta]$ con $z = w^n$. Entonces:
- $r = \sqrt[n]{\rho}$
- $\theta = \frac{\phi + 2k\pi}{n}$ donde $k \in {0, 1, ..., n-1}$ 

### Logaritmos y exponenciales compejos
$z = e^u$ => u es logaritmo natural de z. Sean $z = \rho e^{j\phi}$ y $u = x +yj$
$$u_k = ln(z) = ln \rho + j(\phi + 2k\pi)$$
###### Valor principal de ln z
Es el valor del logaritmo cuando:
- k = 0
- $\phi \in [0 ; 2\pi]$
$$V.P. (ln z) = ln\rho + j\phi$$
#### Potencia compleja de un complejo
Sea 
$z = z_1 ^ {z_2}$


$$z = e^{z_2 * ln (z_1)}$$

- Debo tomar el V.P del logaritmo

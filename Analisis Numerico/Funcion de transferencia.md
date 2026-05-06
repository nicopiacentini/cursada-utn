### Plano complejo ampliado
Como la idea del infinito como elemento unico no existe en complejos (basicamente porque me puedo ir a cualquier lado y seguir hasta el infinito), pongo una esfera en el origen y hago la proyeccion de cada punto de mi plano complejo sobre dicha esfera. Mientras mas al infinito este cada punto, mas al norte esta. Entonces, el norte es el *infinito*.
$$C^{*} = C ~ U~\{{\infty}\} $$
## Funcion de transferencia
Es una funcion $G(s)$ que recibe un estimulo o entrada $X(s)$, actua sobre *un determinado sistema* y produce una salida o respuesta$Y(s)$
$$G:C^{*} \to C^{*}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ G(s)=\frac{Y(s)}{X(s)}$$
En muchos casos ocurre que:
$$G(s) = \frac{P_2(s)}{P_1(s)} = k \frac{\prod (s - z_i)}{\prod (s - p_i)}$$

##### Definición de Cero

$$z \text{ es cero de } G(s) \iff \lim_{s \to z} G(s) = 0$$
Se marca con un `o`
##### Definición de Polo

$$p \text{ es polo de } G(s) \iff \lim_{s \to p} G(s) = \infty$$
Se marca con una `x`
#### Graficos
Se grafica el modulo de G(s) porque sino es imposible. Tambien se pide graficar proyecciones sobre los ejes (Im y Re) haciendo enfasis en los polos y los ceros
#### Determinacion grafica del modulo y fase de la funcion transferencia en un punto
##### Magnitud

$$|G(s)| = k \frac{\prod \text{módulos vectores origen ceros}}{\prod \text{módulos vectores origen polos}}$$

##### Fase (Argumento)

$$\theta = \arg[G(s)] = \sum \arg. \text{ vect. ceros} - \sum \arg. \text{ vect. polos}$$

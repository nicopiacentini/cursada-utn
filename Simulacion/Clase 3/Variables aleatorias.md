
### Funcion de densidad y acumulada
Las funciones **f(x)** y **F(x)** son las dos formas principales de describir el comportamiento de una variable aleatoria continua:
#### Función de Densidad de Probabilidad — f(x)

- **Definición:** Indica la concentración o "intensidad" de la probabilidad en un valor específico.
- **Visualización:** Es la **curva** del gráfico.
- **Cálculo:** La probabilidad no es el valor de la función, sino el **área bajo la curva** en un intervalo determinado.
- **Propiedad:** El área total bajo f(x) siempre es igual a **1**.
#### Función de Distribución Acumulada — F(x)

- **Definición:** Representa la probabilidad de que la variable tome un valor **menor o igual** a x (P(X≤x)).
- **Visualización:** Una curva que siempre **crece** desde 0 hasta alcanzar el 1.
- **Cálculo:** El valor de la función en un punto ya es la probabilidad acumulada hasta allí.
- **Uso común:** P(a<X<b)=F(b)−F(a).
#### Relación Matemática
Se conectan a través del cálculo:

- **De densidad a acumulada:** Se obtiene mediante la **integral**.
$$  
F(x) = \int_{-\infty}^{x} f(t)\,dt  
$$
- **De acumulada a densidad:** Se obtiene mediante la **derivada**.
 $$  
f(x) = \frac{d}{dx} F(x)  
$$
## Aplicacion en simulacion
En los modelos de simulacion los datos que se brindan son **Funciones de densidad de probabilidad** o variables aleatorias $f(x)$. El objetivo es, a partir de conocer la forma o funcion de dicha distribucion, generar valores aleatorios que respondan a la distribución de probabilidad dato para usar en el modelo. Por ejemplo, para determinar los sucesivos valores del IA debemos generar valores aleatorios que respondan a la f.d.p.

##### Numeros aleatorios
Tambien conocidos como numeros aleatorios uniformes, son los valores que **toma** o **recibe** la *variable aleatoria* para asi generar los numeros o intervalos deseados. Naturalmente, una computadora o calculadora es capaz de generar este tipo de numeros facilmente, pero existen metodos a mano que tambien pueden hacerlo como por ejemplo:
- **Método Von Neumann o cuadrados medios**: Partiendo de un numero $X_0$ de $n$ (par) digitos se calcula ${X_0}^2$ y se extraen $n$ digitos centrales para obtener $X_1$
- **Método de congruencia**: Elegis un numero y repetis proceso hasta estar conforme:
  $$n_{i+1} = an_i + c ~(mod ~~m)$$
#### Problema de transformacion
Nuestro metodo o funcion de numeros aleatorios de una maquina o calculadora genera numeros entre $[0..1]$. Sin embargo, la *f.d.p* puede aceptar valor en el dominio que este definida $[a..b]$, que puede ser mas grande o mas chico que el intervalo $[0..1]$.
Entonces tenemos que efectuar una transformacion a partir de los *numeros aleatorios* para obtener de manera equiprobable los valores que acepta la *f.d.p.*
#### Primer estrategia
Si digo que mi computadora puede generar numeros aleatorios equiprobables $\tau$ (supongo numero generico). Luego puedo asignar $F(X) = \tau$, donde $F(X)$ es la funcion de densidad acumulada de $f(x)$, entonces debe existir $F^{-1}(\tau) = x$ para asi con cada $\tau$ obtener el $x$ correspondiente.
Y como estos $x$ están surgiendo de la $F(x)$, al partir de valores equiprobables de $F(x)$ se obtendrán valores de $x$ que responden a la función de densidad de probabilidad $f(x)$ dada originalmente.
#### Metodo de rechazo
*Sea una función de densidad de probabilidad $f(x)$ definida en un intervalo [a, b], acotada y M un valor igual o mayor que le máximo de $f(x)$. Generamos dos valores aleatorios uniformes $\tau_1$ y $\tau_2$ que servirán para definir la absisa $x_1 = a + (b-a) \tau_1$ y la ordenada $y1 = M \tau_2$.* 

Luego verificaremos si el punto está bajo la curva $M \tau_2 ≤ f(a+(b-a) \tau_1)$ Si está afuera se rechaza. Si está debajo de la curva se toma $x = a+(b-a) \tau_1$ Los valores de x así obtenidos responden a la función de densidad de probabilidad. 
El problema de este método es la cantidad de pruebas rechazadas. La eficiencia del método estará dada por e = área bajo la curva / área del rectángulo $= 1 / M (b - a)$ 
Se puede mejorar reemplazando el rectángulo por una función conocida que encierre a $f(x)$
### Sintesis
Los sistemas de computación disponen normalmente de rutinas para generar números pseudoaleatorios con distribución de probabilidad uniforme entre 0 y 1. Si no dispusiéramos de esta facilidad podemos preparar una rutina utilizando métodos tales como el de los cuadrados medios o de congruencia.
Para pasar a la función de densidad de probabilidad dato podemos utilizar rutinas existentes en la bibliografía o bien preparar una rutina empleando métodos tales como el de la función inversa o el del rechazo. 
Desde el punto de vista de la simulación lo más importante es tener claro que cuando en el modelo aparecen variables aleatorias, para poder generar sus valores es necesario conocer su función de densidad de probabilidad y la validez de la simulación quedará en gran medida supeditada a la confiabilidad de ese conocimiento que en muchos casos no es fácil obtener
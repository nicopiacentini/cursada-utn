# Algoritmos Genéticos

---

## 1. Introducción a la Inteligencia Artificial

> Problemas que no se pueden resolver por un enfoque algorítmico tradicional.

Ramas relacionadas: SET(sistemas expertos tradicionales), RNA, **AG (Algoritmos Genéticos)**, Sistemas Inteligentes, SBC, SE.

### 1.1 Definición de Algoritmos Genéticos

> "Los Algoritmos Genéticos son algoritmos matemáticos de optimización de propósito general basados en mecanismos naturales de selección y genética, proporcionando excelentes soluciones en problemas complejos con gran número de parámetros."

Se usan cuando los modelos matematicos tradicionales no funcionan o llevan a muchisimas iteraciones. Tambien cuando tengo muchisimos parametros o mucho espacio de busqueda

##### Caracteristicas
- Hay una solucion objetivo
- Tienen que ser flexibles/ser de proposito general
- Trabajan segun naturaleza del problema con muchas variables
- Son simples de implementar en comparacion con otros modelos de IA

---

## 2. Teoría Evolutista

### 2.1 Teoría de la Evolución por Selección Natural

Darwin y Wallace compartieron sus descubrimientos y los presentaron a la Sociedad Linneana de Londres en 1858. Un año más tarde, Darwin publicó _El origen de las especies por selección natural_, apoyando su teoría en numerosas observaciones de la naturaleza.

### 2.2 Principales Postulados [Darwin, 1859]

1. Las formas de vida no son estáticas sino que **evolucionan**.
2. El proceso de la evolución es **gradual, lento y continuo**.
3. Los organismos parecidos se hallan **emparentados** y descienden de un **antepasado común**.
4. La **selección natural** es la llave que explica todo el sistema.
5. En la poblacion existe variacion
6. Los mas aptos tienen mas probabilidad de dejar descendencia

### 2.3 Ejemplo de Antepasado Común — Genghis Khan (1162-1227)

> En gran parte de Asia y el este de Europa, 1 de cada 12 hombres (8%) comparten un "marcador" en su ADN. Esto equivale a 1 de cada 200 hombres de todo el mundo (~16 millones de personas).

- Y-DNA Haplogroup: **C**

### 2.4 Selección Natural

1. **Producción de variabilidad**: generación de modificaciones espontáneas en los individuos. 2 Padres tienen su propio adn pero no siempre producen al mismo hijo
2. **Supervivencia del más fuerte (apto)** en la lucha por la vida.

### 2.5 Conceptos — Nivel Ecológico

1. Ecosistema - Donde estamos
2. Población - Quienes estamos
3. Individuo - Una persona
4. Genotipo/Cromosoma - Cada una de las posibles soluciones. Como se describe a una solucion
5. Gen - Son las caracteristicas solucion

### 2.6 Herencia

- Rasgos físicos o psicológicos.
- Los genes se encuentran dentro de los cromosomas.

### 2.7 Conceptos — Nivel Genético

1. **Genotipo**: composición genética. "la plantilla"
2. **Fenotipo**: manifestación física de un rasgo distintivo.

### 2. 8 Caracteristicas principales
1. Los mas aptos sobreviven
	- La seleccion natural es una consecuencia de la aptitud
	- El **operador de seleccion** hace de seleccionador natural
2. La descendencia es distinta de los padres, no es igual
	- Surge del operador de cruzamiento. 
	- Simula la cruza
3. Hay variaciones espontaneas (2 hijos de mismos padres no son iguales)
	- Introduce variaciones aleatorias y muy pequeñas
	- Lo hace el operador de mutación
	- Da heterogeneidad 
4. La evolucion no se detiene
	- La población no se mantiene continua sino que va cambiando
	- Lo que no cambia es la estructura de como defino al individuo

---

## 3. Analogía: Teoría de la Evolución ↔ Algoritmos Genéticos

| Teoría Evolución      | Algoritmos Genéticos         | Descripcion                                                                      |
| --------------------- | ---------------------------- | -------------------------------------------------------------------------------- |
| Ecosistema / Ambiente | Problema que quiero resolver | Dentro de un grupo de elementos quiero encontrar el mejor para algo              |
| Individuo             | Posible Solución             | Es el candidato a solucion                                                       |
| Genotipo / Cromosoma  | Descripción de la Solución   | Un individuo tiene su genotipo o caracteristicas de si mismo                     |
| Gen                   | Característica o Atributo    |                                                                                  |
| Fenotipo              | Función de Aptitud           | Es la funcion aplicada a los individuos para determinar que tan bueno es para... |

---

## 4. Estructura del Algoritmo Genético [Holland, 1975]

![[Pasted image 20260909191856.png]]

### 4.1 Diagrama de flujo general

1. Generar población inicial
2. Selección (OPERADOR)
3. Cruzamiento (OPERADOR)
4. Mutación (OPERADOR)
5. ¿Paro? → Si **No**, vuelve a Selección (2) . Si **Sí**, se obtiene la **Población Final**.
Cada vez que paso por el ciclo estoy dando una **vuelta** o **ciclo**
Cada vez que cumplo el criterio de paro estoy dando una **corrida** y termino en la poblacion **final**

>Una corrida va a tener varias vueltas o ciclos
### 4.2 Genotipo / Cromosoma y Fenotipo / Función de Aptitud

- El **cromosoma**/genotipo se representa como una cadena de bits, dividida en genes (`Gen 1, Gen 2, ..., Gen N`).
	- A cada gen se le atribuye una caracteristica
	- No todos los genes tienen la misma longitud
- La fenotipo/**función de aptitud**: `f(x): Cromosoma → ℝ`.
	- Dado un cromosoma indica que tan apto es un individuo para un determinado problema

### 4.3 Espacio de búsqueda (paisaje de aptitud)

> El algoritmo busca el **Máximo Óptimo** dentro de un paisaje de soluciones que puede contener **Máximos Locales** que lo desvíen del resultado ideal.

![[Pasted image 20260908164914.png]]

### 4.4 Demo — Optimization Algorithm Toolkit (OAT)

- Herramienta de demostración: [http://optalgtoolkit.sourceforge.net/](http://optalgtoolkit.sourceforge.net/)
- Comparación entre **Random Search** y **Genetic Algorithm (GA)** sobre una función multimodal (problema M4).

---

## 5. Ejemplo Práctico: "El Acertijo de Einstein"

> Tenemos 5 casas de cinco colores diferentes y en cada una vive una persona de una nacionalidad diferente. Cada dueño bebe una bebida diferente, fuma una marca de cigarrillos diferente y tiene una mascota diferente.

### 5.1 Pistas del acertijo

1. El británico vive en la casa roja.
2. El sueco tiene un perro.
3. El danés toma té.
4. La casa verde está a la izquierda de la blanca.
5. El dueño de la casa verde toma café.
6. La persona que fuma PallMall tiene un pájaro.
7. El dueño de la casa amarilla fuma Dunhill.
8. El que vive en la casa del centro toma leche.
9. El noruego vive en la primera casa.
10. La persona que fuma Brends vive junto a la que tiene un gato.
11. La persona que tiene un caballo vive junto a la que fuma Dunhill.
12. El que fuma Bluemasters bebe cerveza.
13. El alemán fuma Prince.
14. El noruego vive junto a la casa azul.
15. El que fuma Brends tiene un vecino que toma agua.

**Pregunta:** ¿quién es el dueño del pececito?

### 5.2 Paso 1 — Definición del Cromosoma

> Cromosoma -> Codificacion interna del individuo, representación de su solucion. Esta formado por genes que son las **unidades minimas de infrmacion**. Se pueden construir cromosomas simples o complejos

> Individuo -> Instanciacion de cromosoma

**Conceptos**:
Dueño:
- Tiene casa
- Fuma cigarrillo
- Tiene mascota
- Bebe Bebida

**Variables (genes auxiliares):**

- Nacionalidad del Dueño = { británico, sueco, danés, alemán, noruego }
- Ubicación de la Casa = { primera, segunda, tercera, cuarta, quinta }
- Color de la Casa = { roja, verde, blanca, amarilla, azul }
- Tipo de Bebida = { té, café, leche, cerveza, agua }
- Nombre del Cigarrillo = { PallMall, Dunhill, Brends, Bluemasters, Prince }
- Tipo de Mascota = { perro, pájaro, gato, caballo, pececito }

> Cada nacionalidad es el **gen principal**; cada una de las 5 variables auxiliares (casa-ubic, casa-color, bebida, cigarrillo, mascota) se codifica en 3 bits (codificación 001 a 101).

![[Pasted image 20260908163710.png]]


**Ejemplo de individuo (cromosoma completo):**

|Nacionalidad|casa-ubic|casa-color|bebida|cigarrillo|mascota|
|---|---|---|---|---|---|
|británico|quinta|blanca|cerveza|Dunhill|caballo|
|sueco|cuarta|amarilla|té|Brends|pájaro|
|danés|tercera|roja|café|BlueMasters|**pececito**|
|alemán|segunda|azul|leche|Prince|perro|
|noruego|primera|verde|agua|PallMall|gato|

> ⚠️ Este individuo de ejemplo es una solución candidata (no necesariamente válida): al chequear las pistas contra él, solo se cumplen 3 de las 15 condiciones (noruego en primera casa, alemán fuma Prince, noruego junto a casa azul).

### 5.3 Paso 2 — Definición de la Función de Aptitud

Para definir la función de aptitud hay que:

1. **Analizar las pistas:**
    - Determinar condiciones que debe cumplir la solución. Estas aumentan el valor de aptitud del individuo
    - Determinar restricciones que no puede cumplir la solución. Estas disminuyen el valor de aptitud
2. **Analizar la estructura del cromosoma:**
    - Determinar combinaciones inválidas en los genes. Estas penalizan el valor de aptitud.
	    - Por ejemplo, que la casa tenga el valor `111` sabiendo que el valor no es posible.

> Las condiciones cumplidas **aumentan** el valor de aptitud; las no cumplidas lo **disminuyen**; las combinaciones inválidas lo **penalizan**.

**Con esto se determina la operatoria para**:

- a) interpretar la estructura del cromosoma -> Saber que significa cada secuencia de bits
- b) calcular el valor de aptitud

### 5.4 Resultado final del ejemplo

> **Respuesta:** el dueño del pececito es **el alemán**.

---
> [!info] Operadores de un algoritmo genetico
> Estos son La seleccion, el cruzamiento y la mutación y cada uno son algoritmos a elegir
## 6. Generación de la Población Inicial
Necesito generar o determinar
- **Método de generación:**
    1. Al Azar - Tiro randoms para `n` individuos, si alguno sale mal es penalizada por la funcion de aptitud
    2. Ad-Hoc - Generar con individuos concidos, mas guiado.
- **Población:**
    1. Cantidad de individuos con los que trabajo
    2. Varianza de individuos(constante o variable): Que tan distintas quedan las cruzas que se repiten

---

## 7. Métodos de Selección
Arma un subconjunto de individuos a partir de la poblacion inicial para formar parte de la siguiente etapa.

1. Torneo
2. Ranking
3. Ruleta
4. Control sobre número esperado

### 7.1 Selección — Torneo

> Basado en las justas y torneos de la Edad Media, donde los caballeros demostraban su valor. Su origen real era la reglamentación civilizada de las luchas entre clanes germánicos para entrenarse en el arte de la guerra.

**Mecánica:** se enfrentan pares de individuos según su valor de aptitud `f(x)` y el ganador de cada enfrentamiento pasa a la siguiente ronda, hasta obtener un individuo seleccionado.

Ejemplo con población I1 a I7 (valores de aptitud 61, 11, 33, 25, 44, 15, 17): tras los enfrentamientos por parejas, se seleccionan los indiviuos ganadores

| Población original | f(x) |
| ------------------ | ---- |
| I1                 | 61   |
| I2                 | 11   |
| I3                 | 33   |
| I4                 | 25   |
| I5                 | 44   |
| I6                 | 15   |
| I7                 | 17   |

**La nueva poblacion entonces puede contener al mismo individuo repetido si este pelea varias veces**
> Es posible que se pierdan algunos individuos buenos

### 7.2 Selección — Ranking

Se ordena la población de mayor a menor aptitud:

| Población original | f(x) | →   | Población ordenada | f(x) |
| ------------------ | ---- | --- | ------------------ | ---- |
| I1                 | 61   |     | I1                 | 61   |
| I2                 | 11   |     | I5                 | 44   |
| I3                 | 33   |     | I3                 | 33   |
| I4                 | 25   |     | I4                 | 25   |
| I5                 | 44   |     | I7                 | 17   |
| I6                 | 15   |     | I6                 | 15   |
| I7                 | 17   |     | I2                 | 11   |

- Mas lento
- Menos heterogeneo
#### 7.2 Convergencia Prematura

> Riesgo: el algoritmo puede quedar atrapado en un **máximo local** en lugar de alcanzar el **máximo óptimo global**, especialmente si la selección favorece demasiado rápido a los individuos con mejor aptitud momentánea.

### 7.3 Selección — Ruleta

Cada individuo recibe una porción de la "ruleta" proporcional a su aptitud relativa `p(x)`, y se acumula en `P(x)` probabilidad acumulada.

|Población|f(x)|p(x)|P(x)|
|---|---|---|---|
|I1|61|29,61%|29,61%|
|I2|11|5,34%|34,95%|
|I3|33|16,02%|50,97%|
|I4|25|12,14%|63,11%|
|I5|44|21,36%|84,47%|
|I6|15|7,28%|91,75%|
|I7|17|8,25%|100,00%|
|**Total**|**206**|**100,00%**||

> Se genera un número aleatorio entre 0 y 1, y se selecciona el individuo cuyo rango `P(x)` lo contiene.

> Me puede pasar con la ruleta que salgan todos malos porque son la mayoria de la poblacion por ejemplo - **No puedo garantizar que hayan buenos**

### 7.4 Selección — Control sobre número esperado

**a) Pre-selección de los mejores:**

Se calcula `f(x) / Promedio` para determinar cuántas copias de cada individuo pasan directamente (parte entera).

| Población    | f(x)        | f(x)/Prom. | Selecciona |
| ------------ | ----------- | ---------- | ---------- |
| I1           | 61          | 2,0728     | 2          |
| I2           | 11          | 0,3738     | 0          |
| I3           | 33          | 1,1214     | 1          |
| I4           | 25          | 0,8495     | 0          |
| I5           | 44          | 1,4951     | 1          |
| I6           | 15          | 0,5097     | 0          |
| I7           | 17          | 0,5777     | 0          |
| **Promedio** | **29,4286** |            |            |
| Total        | 206         |            |            |
Tomo a un individuo tantas veces como su aptitud sobre el promedio. Con estos individuos me quedo, incluso si se repiten, y con los demas hago ruleta

**b) Selección por ruleta (con la parte fraccionaria restante):**

Se aplica una ruleta sobre `f'(x)` (parte fraccionaria) para completar los individuos faltantes de la población.

|Población|f'(x)|p(x)|P(x)|
|---|---|---|---|
|I1|0,0728|2,43%|2,43%|
|I2|0,3738|12,46%|14,89%|
|I3|0,1214|4,05%|18,93%|
|I4|0,8495|28,32%|47,25%|
|I5|0,4951|16,50%|63,75%|
|I6|0,5097|16,99%|80,74%|
|I7|0,5777|19,26%|100,00%|
|**Total**|**3**|**100,00%**||

---

## 8. Métodos de Cruzamiento
Realizar alguna actividad de a pares para obtener descendencia. Esto reemplaza a los padres que son eliminados

1. Simple
2. Multipunto
3. Binomial
    - Máscara
        - Complemento
        - Doble
    - Azar

### 8.1 Cruza Simple

> Un único punto de corte (por ejemplo, en la posición 4) divide a cada padre (PadreX, PadreY) en dos segmentos, que se intercambian para formar HijoA e HijoB.

![[Pasted image 20260908165626.png|342]]

> Punto de corte = 4

> El punto de corte no debe cortar a los genes
### 8.2 Cruza Multipunto

> Se utilizan dos (o más) puntos de corte (por ejemplo, en las posiciones 4 y 8), generando segmentos alternados entre ambos padres para formar los hijos.

![[Pasted image 20260908165720.png|392]]
Lo que va para un hijo no va para el otro.
### 8.3 Cruza Binomial — Máscara Complemento

> Se define una máscara (ej: `XYXXYXXYYY`) que indica de qué padre toma cada gen el HijoA; el HijoB usa la máscara complementaria.

![[Pasted image 20260908165824.png|427]]

> Si uso mascara complemento es igual a la multipunto

> Si uso mascara doble puedo perder caracteristicas de algun padre. Para los demas NO.
### 8.4 Cruza Binomial — Máscara Doble

> Se definen dos máscaras independientes (una para cada hijo), sin relación de complemento entre ellas.

![[Pasted image 20260908165944.png|428]]

> Recien aca pueden repetirse y perderse caracteristicas/genes de un padre porque las mascaras pueden skipearlo. En el ejemplo se pierde el gen 1 del padreY
### 8.5 Cruza Binomial — Azar

> Para cada gen se genera un número aleatorio `R`: si `R ≤ 0,5` se toma del PadreX, si `R > 0,5` se toma del PadreY. El HijoB puede definirse como el complemento o generarse también al azar.

![[Pasted image 20260908170049.png|428]]

##### Para el otro hijo puedo hacer
- Complemento de hijo A
- Hacer el mismo procedimiento de azar - Tambien puedo perder caracteristicas
---

## 9. Mutación
Altera a los individuos a partir de algo que viene de afuera. Cambia alguna posicion del cromosoma del gen de un individuo. Esto ocurre a veces. El operador siempre se activa pero no siempre muta a la poblacion.

> Cada vez que paso por mutacion, se activa el operador de mutacion. Luego me pregunto si lo ejecuto o hago un cambio. Osea siempre se activa pero no siempre se ejecuta

### 9.1 Proceso de decisión

1. Se recibe la población tras el cruzamiento (`PC`).
2. Se evalúa: **¿Ejecuta mutación?**
    - **No** → `PM = PC` (no ejecuta mutación).
    - **Sí** → `PM = MUTA(PC)` (ejecuta mutación).
3. Se obtiene la población mutada `PM`.

### 9.2 Regla de decisión

- `RandomM > ProbabilidadM` → **NO MUTA**
- `RandomM ≤ ProbabilidadM` → **MUTA** (se invierte el bit correspondiente segun otro random generado)

### 9.3 Comparación según probabilidad de mutación (PM) - Para que sirve?

> A partir de las corridas del OAT sobre la función multimodal, se observa el efecto de distintos valores de `PM`:

- `PM = 0%`: sin mutación, el algoritmo puede estancarse.
- `PM = 0,1%`: mutación mínima. Mas estable pero poca diversidad
- `PM = 1%`: mutación moderada.
- `PM = 10%`: mutación alta, similar comportamiento visual en la demo (la curva de la función no cambia, pero sí la exploración de la población). Amplia la exploracion pero la herencia no se ve tanto en los ciclos y puede llegar a ser una busqueda ciega

> **¿Para qué sirve la mutación?** Introduce diversidad genética que permite escapar de máximos locales y explorar nuevas regiones del espacio de búsqueda.

### 9.4 Métodos de Mutación

1. **Simple**: `ProbabilidadM = constante`
2. **Adaptativa por Convergencia**: `ProbabilidadM = G{ Promedio[f(Ix)] }` En funcion del promedio de aptitud de mutacion
3. **Adaptativa por Temperatura** (ascendente o descendente): `ProbabilidadM = G(Cant, Vueltas)`. Tiene que ver con la cantidad de vueltas

---

## 10. Criterio de Paro
Estos pueden ser:
1. Cantidad de vueltas (iteraciones o ciclos).
2. Tiempo transcurrido.
3. `f(Ix) > Valor` (se alcanzó un umbral de aptitud).
4. `Promedio[f(Ix)] ≈ Valor` (convergencia de la población).
5. Otros criterios combinados.

> Al cumplirse el criterio de paro: `PF = PM` (la población mutada se convierte en la **Población Final**).

---

## 11. Identificación del Individuo Solución

### 11.1 En teoría

> De la **Población Final**, se selecciona el individuo con **mejor aptitud**, y se interpreta su cromosoma para obtener la solución al problema.

### 11.2 En la práctica

> Dado que distintas corridas (con semillas aleatorias distintas) pueden dar resultados diferentes, se debe llevar un **log de corridas** y, entre todas ellas, seleccionar el individuo con mejor aptitud global.

### 11.3 Comportamiento de corridas (ejemplos observados)

1. **Corrida 1**: comportamiento base, con picos de aptitud máxima irregulares.
2. **Corrida 2**: mismos parámetros, resultado distinto (naturaleza estocástica del AG).
3. **Corrida 3**: mismos parámetros, otra variación.
4. **Corrida 4**: ajuste de parámetros → mejora en la convergencia y aptitud promedio.
5. **Corrida 5**: parámetros optimizados → convergencia rápida y estable cerca del valor óptimo (aptitud máxima ≈ 10).

> Esto ilustra la importancia de la **calibración de parámetros** (tamaño de población, probabilidad de cruzamiento, probabilidad de mutación) para lograr una convergencia efectiva.


---

## 12. Frameworks para utilizar Algoritmos Genéticos

|Framework|Lenguaje|Enlace|
|---|---|---|
|ECJ|Java|http://www.cs.gmu.edu/~eclab/projects/ecj/|
|DEAP|Python|https://deap.readthedocs.io/en/master/|
|EpochX|Java|http://www.epochx.org/|
|GAF|.NET|https://www.nuget.org/packages/GAF/|
|JENES|Java|http://jenes.intelligentia.it/|
|Jenetics|Java|https://jenetics.io/|
|JGAP|Java|http://jgap.sourceforge.net/|
|Genetic|JavaScript|https://github.com/dolphin278/genetic|
|PyEvolution|Python|https://pyvolution.readthedocs.io/en/latest/|
|UTgeNes (Gustavo Juhal)|Java|https://github.com/gooznt/utgenes|
|The Watchmaker|Java|http://watchmaker.uncommons.org/|

---

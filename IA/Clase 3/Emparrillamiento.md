# Técnica del Emparrillado (Repertory Grid)
> Esta dentro de los metodos de educcion de conocimiento **privado** o internalizado en el experto

La técnica del emparrillado es una herramienta de adquisición y deducción de conocimiento utilizada en ingeniería del conocimiento. Permite extraer el conocimiento privado de un experto mediante la construcción de un modelo mental.

### 1. Concepto Fundamental
Se basa en la **Teoría de los Constructos Personales** (George Kelly, 1955), que **asume que cada individuo tiene una visión única del mundo**. La técnica permite mapear cómo un experto percibe un dominio específico, identificando elementos clave y sus características distintivas.
Busca identificar que cree el experto como mas interesante para resolver el problema

### 2. Elementos del Emparrillado
*   **Expertos:** Fuente del conocimiento. Se considera una técnica intrusiva porque intenta "abrir la mente" del experto.
*   **Elementos:** Objetos, eventos o conceptos homogéneos y representativos de un dominio.
*   **Características:** Cualidades bipolares (ej. alto/bajo, intenso/leve) que definen a los elementos.

### 3. Etapas del Método
1.  **Diálogo Inicial:** Identificación del dominio y aproximación a los elementos.
2.  **Sesión de Valoración:** Reflexión sobre elementos y características para construir la parrilla.
3.  **Diseño de la Parrilla:** Formalización de la relación entre elementos y características.
4.  **Análisis de Resultados:** Interpretación de los datos mediante árboles resultantes.
##### Ventajas
- Reflexion sobre tema
- Descripcion grafica
- Asocia elementos y caracteristicas
- Refina el problema y mejora conocimiento
- Permite entender

### 4. Tipos de Matrices (Diseño de la Parrilla)
La relación entre elementos y características se representa en una matriz bidimensional:

| Tipo de Matriz | Descripción |
| :--- | :--- |
| **Dicotómica** | Valores binarios (0 o 1). Indica si el elemento posee o no la característica. |
| **Clasificatoria** | Escala de 1 a N (donde N es el número de elementos). Crea un ranking u orden. |
| **Evaluativa** | Escala de 1 a N definida por el experto. Indica el grado de satisfacción o presencia de la característica. |

### 5. Ejemplo Aplicado: Diagnóstico de Coronavirus
En este ejemplo, el dominio es la identificación de síntomas. Se definen cuatro tipos de virus como elementos y cuatro síntomas como características.

#### Elementos del dominio
*   E1: COVID-19
*   E2: MERS
*   E3: SARS
*   E4: Coronavirus 229E

#### Características (Bipolares)
*   C1: Frecuencia respiratoria (Alta / Baja)
*   C2: Fiebre (Intensa / Leve)
*   C3: Dolor de garganta (Intenso / Leve)
*   C4: Dolor de cabeza (Intenso / Leve)

#### Matriz Evaluativa (Ejemplo de estructura)

| Elementos | Frecuencia Resp. | Fiebre | Dolor Garganta | Dolor Cabeza |
| :--- | :---: | :---: | :---: | :---: |
| **COVID-19** | 2 | 3 | 1 | 2 |
| **MERS** | 2 | 1 | 3 | 1 |
| **SARS** | 1 | 2 | 2 | 3 |
| **229E** | 3 | 1 | 1 | 1 |

*(Nota: Los valores numéricos representan el grado de satisfacción según la escala definida por el experto).* 

### 6. Consideraciones finales
*   **Ventajas:** Permite una representación gráfica del pensamiento, formaliza el conocimiento experto y ayuda a refinar el problema.
*   **Inconvenientes:** Puede ser una técnica incompleta si solo se seleccionan los rasgos más representativos y los resultados son intrínsecamente subjetivos a la percepción de cada experto.

# Técnica del Emparrillado: Formalización y Análisis

La técnica del emparrillado es un método estructurado para organizar y analizar información cualitativa a través de matrices. A continuación, se detalla el proceso de formalización explicado en el video:

### 1. Identificacion de los elementos
El objetivo es determinar elementos analizados basándose en sus características.  Estos deben ser:
- Representativos del area
- Homogeneos: Se pueden comparar
- Separados
- No solapables
Los elementos luego se codifican con `E1`, `E2`


### 2. Identificacion de las características
Busco determinar las caracteristicas asociadas a los elementos y que tan asociadas estan. Son cualidadese atribuidas a un elemento o concepto de pensamiento. Tienen valores **Bipolares**. Sus valores deben anotarse en el valor que lo indica el experto. Tambien se codifican de la forma `C1`, `C2`

### 3. Diseno de parrilla
Ordenas los elementos con sus caracteristicas en una matriz. Puede ser:
- **Dicotomica**: Donde asigno valores binarios segun si un elemento tiene una caracteristica
- **Clasificatoria**: Ordena elementos segun la caracteristica, es decir, el que mas tiene la caracteristica al que menos la tiene. No puede tener valores repetidos porque exige orden
- **Evaluativa**: Ofrece una escala de valores brindada por el experto para indicar que tanto aplica una caracteristica a un elemento

### 4. Formalización
Esta compuesto por 2 etapas. Clasifico a la matriz por elementos y por caracteristicas
#### Clasificacion de elementos
Me da una matriz de distancias y que tan relacionado esta

|                | $C_1$ | $C_2$ | $C_3$ | $C_4$ |
| :------------- | :---: | :---: | :---: | :---: |
| **Elemento 1** |   2   |   4   |   3   |   2   |
| **Elemento 2** |   3   |   2   |   2   |   3   |
| Elemento 3     |   1   |   3   |   4   |   1   |
| Elemento 4     |   4   |   1   |   2   |   2   |

La distancia se calcula como la suma de las diferencias absolutas:
{E1, E2} = $|2-4| + |3-2| + |1-3| + |4-1| = 2 + 1 + 2 + 3 = 8$

##### Matriz de relacion de elementos de minimas distancias. 

|     | E1  | E2  | E3  | E4  |
| --- | --- | --- | --- | --- |
| E1  |     | 8   | 7   | 2   |
| E2  | 8   |     | 3   | 6   |
| E3  |     |     |     | 5   |
| E4  |     |     |     |     |

Luego bajo un nivel mas, pivotando sobre la distancia mas pequeña de la matriz anterior:

| E1,E4 |     | E2  | E3  |
| ----- | --- | --- | --- |
|       |     | 6   | 5   |
| E2    |     |     | 3   |
| E3    |     |     |     |
Luego bajo un nivel mas en comparaciones

| E1E4 | E1E4 | E2E3 |
| ---- | ---- | ---- |
| E1E4 |      | 5    |
| E2E3 |      |      |

De esta forma puedo decir como se juntan los elementos:
##### Arbol de minimas distancias
![[Pasted image 20260902192845.png]]

#### Clasificacion de caracteristicas
Como las caracteristicas son bipolares, tengo que analizarlas por uno de los polos y luego por el otro:
Original:


|     |  E1 |  E2 |  E3 |  E4 |
| --- | --: | --: | --: | --: |
| C1  |   2 |   4 |   3 |   2 |
| C2  |   3 |   2 |   2 |   3 |
| C3  |   1 |   3 |   4 |   1 |
| C4  |   4 |   1 |   2 |   2 |

Opuesta:

|     |  E1 |  E2 |  E3 |  E4 |
| --- | --: | --: | --: | --: |
| C1  |   3 |   1 |   2 |   3 |
| C2  |   2 |   3 |   3 |   2 |
| C3  |   4 |   2 |   1 |   4 |
| C4  |   1 |   4 |   3 |   3 |

Ahora calculo distancia 1 diagonal superior:

|     |  C1 |  C2 |  C3 |  C4 |
| --- | --: | --: | --: | --: |
| C1  |   3 |   1 |   2 |   3 |
| C2  |   2 |   3 |   3 |   2 |
| C3  |   4 |   2 |   1 |   4 |
| C4  |   1 |   4 |   3 |   3 |
C1 Y C2 = 3-1 + 1-3 + 2-3 + 3-2 = 4

Entonces me queda:

|a|C1|C2|C3|C4|
|---|--:|--:|--:|--:|
|C1|—|5|4|6|
|C2|1|—|7|3|
|C3|8|3|—|8|
|C4|2|5|4|—|

| a   |  C1 |  C2 |  C3 |  C4 |
| --- | --: | --: | --: | --: |
| C1  |   — |   5 |   4 |   6 |
| C2  |   1 |   — |   7 |   3 |
| C3  |   8 |   3 |   — |   8 |
| C4  |   2 |   5 |   4 |   — |

|a|C1|C2|C3|C4|
|---|--:|--:|--:|--:|
|C1|—|1|4|2|
|C2|—|—|3|3|
|C3|—|—|—|4|
|C4|—|—|—|—|


Ahora distancia d2 diagonal inferior, donde agarro un elemento de la original y otra de la opuesta. Es decir hago las diferencias pero agarro un elemento de cada una


|a|[C1,C2]|C3|C4|
|---|--:|--:|--:|
|[C1,C2]|—|3|2|
|C3|—|—|4|
|C4|—|—|—|
Ahora 2 es minimo entonces tengo que unirlo a C1,C2

|a|[(C1,C2),C4]|C3|
|---|--:|--:|
|[(C1,C2),C4]|—|3|
|C3|—|—|


El arbol me queda:
![[Pasted image 20260902194127.png]]


### ¿Qué ocurre si tengo más de una distancia mínima?

Cuando se aplica un método de clustering jerárquico y aparecen **varias distancias mínimas iguales**, hay que considerar cómo se relacionan los pares que tienen esa distancia.

---

#### Caso 1: las distancias mínimas no comparten elementos

La matriz de distancias es:

| a   | E1  | E2  | E3  | E4  |
| --- | --- | --- | --- | --- |
| E1  | —   | 3   | 2   | 4   |
| E2  | —   | —   | 3   | 2   |
| E3  | —   | —   | —   | 4   |
| E4  | —   | —   | —   | —   |

La **distancia mínima es 2** y aparece en dos pares:

- `d(E1, E3) = 2`
    
- `d(E2, E4) = 2`
    

Como los pares **no comparten elementos**, se pueden realizar ambos agrupamientos al mismo nivel de distancia.

### Primeros agrupamientos

```
[E1, E3]
[E2, E4]
```

La matriz resultante entre los nuevos clusters queda:

| a       | [E1,E3] | [E2,E4] |
| ------- | ------- | ------- |
| [E1,E3] | —       | 3       |
| [E2,E4] | —       | —       |

Por lo tanto, los dos clusters se unen posteriormente a una distancia de **3**.

##### Dendrograma

```
Distancia

  3              ───────────────
                /              \
  2        ─────                ─────
          /     \              /     \
         E1     E3            E2     E4
```

En este caso, el resultado es:

1. `E1` y `E3` se agrupan a distancia `2`.
    
2. `E2` y `E4` se agrupan a distancia `2`.
    
3. `[E1,E3]` y `[E2,E4]` se agrupan a distancia `3`.
    

---

### Caso 2: las distancias mínimas comparten elementos

La matriz de distancias es:

| a   | E1  | E2  | E3  | E4  |
| --- | --- | --- | --- | --- |
| E1  | —   | 2   | 2   | 4   |
| E2  | —   | —   | 3   | 3   |
| E3  | —   | —   | —   | 4   |
| E4  | —   | —   | —   | —   |

La **distancia mínima es 2** y aparece en:

- `d(E1, E2) = 2`
    
- `d(E1, E3) = 2`
    

En este caso, ambos pares **comparten E1**.

Por lo tanto, no se forman dos clusters independientes. Los elementos:

```
E1, E2, E3
```

terminan formando un único cluster a distancia `2`.

##### Primer agrupamiento

```
[E1, E2, E3]
```

Luego se calcula la distancia entre este nuevo cluster y `E4`.

Según la matriz, las distancias relevantes son:

- `d(E1, E4) = 4`
    
- `d(E2, E4) = 3`
    
- `d(E3, E4) = 4`
    

La distancia resultante entre `[E1,E2,E3]` y `E4`, para el criterio mostrado, es `3`.

La matriz reducida queda:

| a          | [E1,E2,E3] | E4  |
| ---------- | ---------- | --- |
| [E1,E2,E3] | —          | 3   |
| E4         | —          | —   |

##### Dendrograma

```
Distancia

  3              ─────────────────
                /                   2        ─────
          /  |           E1  E2  E3             E4
```

En este caso:

1. `E1` se agrupa con `E2` a distancia `2`.
    
2. `E1` también tiene distancia `2` con `E3`.
    
3. Como los agrupamientos comparten `E1`, se forma el cluster `[E1,E2,E3]` a distancia `2`.
    
4. Finalmente, `[E1,E2,E3]` se agrupa con `E4` a distancia `3`.
    

---

#### Idea clave

Cuando hay **más de una distancia mínima**, hay dos situaciones:

| Situación                                            | Resultado                                    |
| ---------------------------------------------------- | -------------------------------------------- |
| Las parejas con distancia mínima son independientes  | Se realizan los agrupamientos en paralelo    |
| Las parejas con distancia mínima comparten elementos | Los elementos se incorporan al mismo cluster |

##### Ejemplo

Si la distancia mínima es `2`:

**Pares independientes:**

```
(E1,E3) = 2
(E2,E4) = 2
```

→ Se forman simultáneamente:

```
[E1,E3]    [E2,E4]
```

**Pares que comparten elementos:**

```
(E1,E2) = 2
(E1,E3) = 2
```

→ Se forma:

```
[E1,E2,E3]
```

Por lo tanto, **un empate en la distancia mínima no necesariamente implica dos agrupamientos separados**. Hay que observar si los pares involucrados comparten elementos.


### 5. Técnica de Emparrillado: Interpretación y Análisis de Resultados

La fase final de la técnica de emparrillado se centra en la interpretación y análisis de los resultados obtenidos durante el proceso. Esta etapa se divide en dos subetapas principales.

#### 1. Análisis y Discusión de los Árboles Ordenados

Consiste en examinar los árboles generados previamente (árbol de elementos y árbol de características) para identificar patrones, agrupaciones y niveles de similitud según el criterio del experto. Tengo que buscar:
- Cardinalidad de grupos y cuantos hay
- Cuantos hay en cada grupo
- Similitud entre elementos por agrupamientos
> A menor distancia -> Mayor similitud. Esto implica que 2 elementos comparten mas caracteristicas comunes que otro grupo de elementos. A partir de esto puedo indagar mas sobre estos elementos para identificar caracteristicas comunes

Hago lo mismo con las caracteristicas. Si pertenecen al mismo grupo es probable que cuando se de una la otra tambien
#### 2. Red de Relaciones entre Características

Esta subetapa evalúa cómo se relacionan las características entre sí basándose en un texto descriptivo. Es fundamental que solo se relacionen características que formen parte de un mismo grupo identificado en el análisis previo.

##### Tipos de Relaciones Tipificadas entre polos
Se analiza la implicancia de los polos de las caracteristicas que estan **agrupadas** y se analizan de a 2
Las relaciones se clasifican según cómo interactúan los polos de las características:

| Tipo de Relación  | Descripción                                                                      |
| :---------------- | :------------------------------------------------------------------------------- |
| **Paralela**      | Los polos se relacionan de forma directa (polo A con polo B, polo C con polo D). |
| **Recíproca**     | si A implica a B, B implica a A                                                  |
| **Ortogonal**     | 1 o dos polos implican a el mismo                                                |
| **Ambigua**       | La relación no sigue un patrón definido o es contradictoria.                     |
| **No Tipificada** | Cualquier relación que no encaje en las categorías anteriores.                   |
> Este analisis ultimo se hace en base a la transcripcion y la prosa de la misma. Generalmente va con el elemento con caracteristica A suele aparecer con caracteristica B....

### Conocimiento obtenido
- Privado
- Declarativo -> es la estructura del dominio (agrupaciones y relaciones entre elementos y caracteristicas)
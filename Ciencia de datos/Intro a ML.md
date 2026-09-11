# Introducción a Machine Learning y Clasificación Binaria

## 1. Introducción a Machine Learning

### Definición de Machine Learning

Se dice que un programa de computadora **aprende de la experiencia** `**E**`**con respecto a una tarea** `**T**` **y una medida de desempeño** `**P**` si su  
desempeño en `T`, medido por `P`, mejora con la experiencia `E`.

Los componentes principales son:

- **Training Set (Experiencia, E):** conjunto de ejemplos o instancias  
    utilizados para aprender.
    
- **Modelo (Programa):** programa que aprende patrones a partir de los  
    datos.
    
- **Measure (Desempeño, P):** medida utilizada para evaluar qué tan  
    bien resuelve la tarea.
    
- **Tarea (T):** objetivo que debe realizar el modelo.
    

> **Importante:** no confundir _modelo_ con _algoritmo_. El algoritmo es  
> el procedimiento utilizado para entrenar o construir el modelo.

### Ejemplo: filtro de Spam

**Tarea (**`**T**`**):** clasificar nuevos emails como spam o no spam.

**Experiencia (**`**E**`**):** conjunto de emails anteriores que ya fueron  
clasificados.

Ejemplo de training set:

```
email 1 → Es spam
email 2 → No Spam
...
email n → label n
```

**Desempeño (**`**P**`**):** cantidad de emails clasificados correctamente sobre  
el total.

El proceso puede representarse como:

```
Training Set (E)
       │
       ▼
     Modelo
       │
       ▼
Ejecutar tarea T
       │
       ▼
 Medir desempeño P
```

---

## 2. Desarrollo tradicional de Software vs. Machine Learning

### Desarrollo tradicional de Software

En un desarrollo tradicional:

1. Investigar el dataset con mails ya clasificados.
    
2. Identificar patrones comunes.
    
3. Diseñar el pseudocódigo o la lógica para identificar esos patrones.
    
4. Escribir el programa de detección.
    
5. Probar el programa.
    
6. Si no funciona correctamente, revisar el error y volver a analizar  
    los patrones.
    
7. Finalmente realizar el deploy.
    

```
Datos + Reglas programadas
          │
          ▼
       Programa
          │
          ▼
        Tarea
          │
          ▼
     Revisar error
          │
          └──────► volver a desarrollar
```

### Desarrollo con Machine Learning

En Machine Learning, el enfoque cambia:

```
Training Set
     │
     ▼
Algoritmo de ML
     │
     ▼
Entrenamiento
     │
     ▼
   Modelo
     │
     ▼
    Tarea
```

El modelo aprende las reglas a partir de los datos.

Según la presentación, esto permite desarrollar programas:

- Más cortos.
    
- Más fáciles de mantener.
    
- Más adaptables al cambio.
    

### Entrenamiento del modelo

Existen diversos algoritmos de Machine Learning.

El objetivo del entrenamiento es **generalizar los datos**, buscando los  
parámetros óptimos del modelo.

---

## 3. ¿Cuándo es útil Machine Learning?

Machine Learning resulta especialmente útil para:

1. Situaciones donde la lógica del programa se vuelve demasiado  
    compleja o imposible de programar y mantener de forma tradicional.
    
2. Patrones que cambian con el tiempo.
    
3. Extraer patrones y conocimiento de datos complejos y de gran  
    volumen.
    

---

## 4. Librería Scikit-learn

**Scikit-learn** es una librería que proporciona herramientas simples  
para:

- Machine Learning.
    
- Data mining.
    
- Análisis de datos.
    
- Limpieza y preprocesamiento de datos.
    
- Algoritmos de clasificación.
    
- Regresión.
    
- Clusterización.
    
- Validación.
    
- Medición de performance.
    

Está construida sobre **NumPy** y **SciPy** y es un proyecto open source  
con licencia BSD.

---

# 5. Clasificación de algoritmos de Machine Learning

Los algoritmos pueden clasificarse utilizando distintos criterios.

## 5.1. Según el tipo de tarea

Algunos tipos de tareas son:

1. **Clasificación**
    
2. **Regresión**
    
3. **Clusterización**
    
4. **Reducción de dimensiones**
    
5. **Asociación**
    

Los criterios de clasificación **no son excluyentes**.

### Regresión

Busca predecir un **valor cuantitativo** a partir de otros valores

Ejemplos:

- Precio de venta de una casa.
    
- Valor de una acción.
    
- Temperatura.
    

### Clasificación

Busca asignar observaciones a **categorías o clases**. Los datos de entrenamiento estan clasificados. Lue

Proceso:

1. Definir grupos o categorías.
    
2. Contar con datos de entrenamiento cuya categoría sea conocida.
    
3. Entrenar el modelo.
    
4. Utilizar el modelo para predecir la categoría de nuevos elementos.
    

Ejemplos:

- Identificar transacciones fraudulentas.
    
- Categorizar clientes riesgosos.
    

---

# 6. Clasificación según el tipo de aprendizaje

Los algoritmos de Machine Learning también se clasifican según el tipo  
de aprendizaje:

1. **Supervisado**
    
2. **No supervisado**
    
3. **Reforzado**
    

---

## 6.1. Aprendizaje Supervisado

En el aprendizaje supervisado, el **Data Scientist actúa como guía**  
para enseñarle al algoritmo.

Se utilizan **labeled data**, es decir, datos de entrenamiento que  
incluyen el resultado deseado en una columna extra. 

```
Muestra N ─────────► Resultado deseado N
       │
       └──── Datos etiquetados
```
> Busca predecir un valor
### Características

- Se utilizan datos etiquetados.
    
- Se busca **predecir un valor.**
    
- Es el tipo de aprendizaje más utilizado.
    

### Tipos de tareas que usa

#### Clasificación

Predice una clase discreta.

Ejemplo:

```
Email → Spam / No Spam
```

#### Regresión

Predice un valor continuo.

Ejemplo:

```
Características de una casa → Precio
```

### Algunos algoritmos

- k-Nearest Neighbors.
    
- Regresión Lineal.
    
- SVMs.
    
- Árboles de decisión.
    
- Algunas redes neuronales.
    

---

## 6.2. Aprendizaje No Supervisado

Busca **identificar patrones sin ayuda humana**.

Se trabaja con datos no etiquetados:

```
Muestra 1
Muestra 2
Muestra 3
...
Muestra N
```

> Busca encontrar relaciones o patrones
### Características

- No se proporciona el resultado esperado.
    
- Busca encontrar relaciones y patrones.
    
- Es más difícil de evaluar y entender.
    

### Tipos de tareas

- Clustering. Agrupar elementos segun criterio
    
- Reglas de asociación.
    
- Visualización.
    
- Reducción de dimensiones. A veces hay datos redundantes o datos correlacionados y se busca quedarse solo con las cosas que importan
    

### Ejemplo: Clustering

Agrupar clientes según su comportamiento de compra.

### Algoritmos mencionados

- **K-Means**
    
- **Principal Component Analysis (PCA)**
    

### Visualización y reducción de dimensiones

La reducción de dimensiones busca **preservar las características  
importantes reduciendo la cantidad de dimensiones**.

Puede permitir:

- Entrenamientos más veloces.
    
- Menores requerimientos de espacio.
    
- Mejores resultados.
    
- Trabajar con algoritmos limitados por la cantidad de dimensiones.
    

#### Ejemplo

Reconocer la actividad de una persona:

- Caminando.
    
- Parado.
    
- Sentado.
    
- Acostado.
    
- Subiendo escaleras.
    
- Bajando escaleras.
    

Dataset:

- 7352 samples.
    
- 30 individuos.
    
	- 561 atributos o dimensiones por sample (acelerometros, giroscopios, tiempo, etc).
    

La reducción de dimensiones permite generar una representación que puede  
explorarse visualmente.
> Permite condensar informacion en menos dimensiones. Muchas veces las dimensiones no se comprenden
> 

---

## 6.3. Aprendizaje Reforzado

En el aprendizaje reforzado, el algoritmo **aprende en base a las  
acciones que realiza**. 
Tomo una accion y dicha accion tiene una medida de qeu tan bien esta: recompensas y penalidades

### Características

- Aprende mediante recompensas y penalidades.
    
- Busca predecir la mejor acción a tomar.
    
- Aprende a lo largo de múltiples intentos y del tiempo.
    
- Trabaja con **estados** y **acciones**.
    
- Utiliza una función de recompensa:
    

```
F(action,enviroment) = reward
```

### Casos de uso

- Vehículos autónomos.
    
- Juegos de estrategia como Go y Ajedrez.
    
- Robótica.
    

---

# 7. Desafíos y problemas de Machine Learning

Los principales problemas mencionados son:

1. Calidad y cantidad de datos.
    
2. Ruido.
    
3. Outliers. Elementos que estan por fuera de lo que quiero representar con mi modelo
    
4. Valores faltantes.
    
5. Falta de estandarización.
    
6. Complejidad del modelo frente al tamaño del dataset y la variacion de los datos
    

---

## 7.1. Features irrelevantes

La cantidad de features disponibles y su relevancia influyen en la  
performance.

La idea general es:

```
Menos features irrelevantes
          +
Más features relevantes
          ↓
   Mejor performance
```

### Feature Engineering

Incluye técnicas como:

- **Feature selection:** seleccionar las características más  
    relevantes.
    
- **Feature extraction:** extraer características útiles a partir de columnas existentes

- **New features:** crear nuevas características a partir de las  
    existentes.
    

---

# 8.  Problemas de Generalización

Un modelo debe aprender patrones que permitan realizar buenas  
predicciones sobre **datos nuevos**, no simplemente memorizar los datos  
de entrenamiento.

---

## 8.1. Overfitting
Basicamente se aprende de datos de forma muy especifica y queda de memoria.
El **overfitting** ocurre cuando el algoritmo aprende los datos  
prácticamente de memoria y, como consecuencia, generaliza mal.

Es más frecuente en modelos complejos.

Hay que buscar un equilibrio entre:

- Complejidad del modelo.
    
- Regularización.
    
- Patrones reales a detectar.
    
- Ruido presente en los datos.
    
- Cantidad de datos disponibles.
    

```
Modelo demasiado complejo
          │
          ▼
Aprende patrones + ruido
          │
          ▼
   Mala generalización
          │
          ▼
      OVERFITTING
```

Los algoritmos de Machine Learning se basan en **inferencias realizadas  
a partir de los datos**.
> Es importante que la presicion/complejidad no este al 100 porque sino podemos caer en esto

---

## 8.2. Underfitting

El **underfitting** ocurre cuando el modelo es demasiado simple para la  
naturaleza de los datos y no es lo suficientemente bueno para clasificar u operar.

Posibles estrategias:

- Utilizar un modelo más poderoso.
    
- Aplicar Feature Engineering.
    
- Reducir las restricciones del modelo.
    

```
Modelo demasiado simple
          │
          ▼
No captura los patrones
          │
          ▼
      UNDERFITTING
```

### Objetivo

Buscar un equilibrio adecuado entre underfitting y overfitting:

```
Underfitting  ────────────────  Overfitting
      ▲                              ▲
      │                              │
  muy simple                    muy complejo

              ★
          objetivo:
       buena generalización
```
> No esta mal si mi modelo tiene errores
---

# 9. Aprendizaje Supervisado: Clasificación Binaria

## 9.1. ¿Qué es la clasificación binaria?

Es un problema en el que las observaciones se agrupan en **una de dos  
clases posibles**. 

Cada predicción representa una decisión entre dos opciones.

### Ejemplos

Problema Clase 0 Clase 1

---
Por ejemplo: 

Spam No Spam Spam  
Diagnóstico No enfermo Enfermo  
Fraude Legítima Fraudulenta  
Imagen Gato Perro  
Noticias Verídica Fake news  
Lluvia No llueve Llueve

---

# 10. Pipeline de Clasificación Binaria

El proceso típico es:

```
┌─────────────────────┐
│ Recolección datos   │
└──────────┬──────────┘
           ▼
┌─────────────────────┐
│ Preprocesamiento    │
└──────────┬──────────┘
           ▼
┌─────────────────────┐
│ Train / Test Split  │
└──────────┬──────────┘
           ▼
┌─────────────────────┐
│ Entrenamiento       │
└──────────┬──────────┘
           ▼
┌─────────────────────┐
│ Evaluación          │
└─────────────────────┘
```

## 10.1. Recolección de datos

Se obtiene un dataset con características que permitan realizar las  
predicciones.

Ejemplos de características:

- Edad.
    
- Ingresos.
    

## 10.2. Preprocesamiento

Incluye:

### Limpieza de datos

Por ejemplo:

- Eliminar datos faltantes.
- Agregar datos faltantes
    

### Codificación de variables categóricas

Por ejemplo:

```
masculino → 0
femenino  → 1
```

## 10.3. División del conjunto de datos

Se separan los datos en:

- **Training set:** utilizado para entrenar.
    
- **Test set:** utilizado para evaluar.
    

Ejemplo:

```
Dataset
├───────────────┬──────────────┐
│ Training 80%  │ Test 20%     │
└───────────────┴──────────────┘
```

## 10.4. Entrenamiento

Se aplica un algoritmo de clasificación binaria.

Ejemplo:

- Árbol de decisión.
    

## 10.5. Evaluación

Se mide el rendimiento del modelo mediante métricas.

Ejemplos:

- Accuracy / precisión.
    
- Recall.
    

---

# 11. Árbol de Decisión

Un **árbol de decisión** es un modelo predictivo que representa  
decisiones y sus posibles consecuencias mediante una estructura de  
árbol. Lo realiza en base a un dataset

Es presentado como uno de los modelos más simples y poderosos.

### Funcionamiento

El árbol:

1. Divide el conjunto de datos en subconjuntos.
    
2. Utiliza características y valores de los datos para realizar las  
    divisiones.
    
3. Continúa dividiendo los subconjuntos.
    
4. En las hojas se obtiene una predicción.
    

Los árboles de decisión pueden utilizarse tanto para:

- Clasificación.
    
- Regresión.
    

---

## 11.1. Ejemplo: ¿Juan sale a caminar?

Se puede construir un árbol utilizando características climáticas.

Características mostradas:

- **Cielo:** Sol, Nublado, Lluvia.
    
- **Humedad:** Alta, Normal.
    
- **Viento:** Fuerte, Débil.
    

Representación conceptual:

```
                    Cielo
              /       |       \
           Sol      Nublado    Lluvia
            │          │          │
         Humedad       Sí       Viento
         /    \                  /   \
      Alta   Normal           Fuerte Débil
       │        │                │      │
       No       Sí               No     Sí
```

El árbol utiliza preguntas sobre las características para llegar a una  
decisión.
Me paro sobre una clase o feature y evaluo que pasa con mi objetivo. Luego repito con las subclases de mi feature hasta llegar a hojas, pudiendo asi estudiar casi todo el dataset

### Hiperparámetros
Es un parametro/feature propio del algoritmo que seteo antes de empezar a aprender. 

Un posible hiperparámetro es la **altura máxima del árbol  
(**`**max_depth**`**)** o que tantas preguntas o nodos voy a hacer/crear.


Controlar la profundidad permite limitar la complejidad y rigidez del arbol. Ahora si me hago muy rigido quedo en overfitting y termina siendo una memorizacion (over-fitting)

---

# 12. Frontera de decisión

La **frontera de decisión** es una línea o superficie que separa las  
diferentes **clases** o tipos en un modelo de clasificación.

En un árbol de decisión, la frontera se genera mediante las divisiones  
realizadas en los nodos. Cada nodo es una pregunta de si o no y esto crea regiones en el espacio de caracteristicas

Estas divisiones crean regiones:

- Rectangulares.
    
- Cuadradas.
    

En un espacio de características:

```
       X
       ↑
       │   Clase A │ Clase B
       │           │
       │           │──────────
       ├───────────┼
       │   Clase A │ Clase B
       │           │
       └───────────┴──────────→ Y
```

## 12.1. Árboles binarios con atributos continuos

La frontera de decisión de estos árboles tiene:

- Forma jerárquica.
    
- Cada región se divide exactamente en dos regiones o ninguna.
    
- Regiones rectangulares.
    
- Cada hoja representa una región del espacio de características.
    
- Cada hoja asigna una etiqueta de clase.
    

---

# 13. Accuracy
Una vez que tenemos las clases definidas tenemos que preguntarnos sobre que tan bien tomo las desiciones el modelo.
La **accuracy** es la proporción de predicciones correctas sobre el  
total de predicciones.

```
              Predicciones correctas
Accuracy = ─────────────────────────────
              Cantidad de predicciones
```

Es una métrica sencilla y útil para comenzar.

> La presentación señala que tiene varios problemas y que en la  
> siguiente clase se continuarán viendo otras métricas.

---

# 14. Train-Test Split

Para evaluar el modelo antes de llevarlo a producción, se separa una  
parte de los datos como **Test Set**.

Una estrategia común es separar el 20% de las  
observaciones para testing.

```
             DATASET
        ┌───────────────┐
        │               │
        │ Training 80%  │
        │               │
        ├───────────────┤
        │ Test 20%      │
        └───────────────┘
```

El Test Set permite medir qué tan bien performa el modelo antes de su  
puesta en producción.

### ¿Por qué no evaluar directamente en producción?

Dos opciones:

- **Opción A:** poner el modelo en producción y comprobar las  
    predicciones. Esto me puede llevar a fallas en produccion. *No se recomienda*
    
- **Opción B:** utilizar el Test Set.
    

Si se observa:

```
Training Error → salen del set de entrenamiento
Generalization Error → Salen del set de testeo
```



---

# 15. Training, Validation y Test Set

Una estrategia más completa incorpora un **Validation Set**, que implica dividir el dataset en 3 partes

Proceso:

1. Entrenar el modelo utilizando el **Training Set**.
    
2. Optimizar y seleccionar el modelo con mejor performance utilizando  
    el **Validation Set**. (por ejemplo, si uso varios modelos con distintos hiperparametros)
    
3. Una vez seleccionado el mejor modelo, comprobar los resultados  
    finales utilizando el **Test Set**.
    
>[!important]
>Con el set de validacion comprueba si los parametros de modelo o hiperparametros elegidos son buenos o no. Con el set de testeo detecto errores de **generalizacion** de mi mejor modelo. Que tan bien se comporta el modelo antes datos nuevos

Una división mostrada en la presentación es:

```
Dataset
├──────────────────┬────────────────┬───────────────┐
│ Training 60%     │ Validation 20% │ Test 20%      │
└──────────────────┴────────────────┴───────────────┘
```

El problema es que no siempre la division va a tener una **representacion equitativa de las clases**. La seleccion es:

---

# 16. Stratified Sampling

El **Stratified Sampling** consiste en dividir el dataset en grupos  
homogéneos llamados **strata**.

Características:

1. Los grupos son mutuamente excluyentes.
    
2. De cada strata se selecciona una cantidad representativa de  
    observaciones.
    
3. Se puede aplicar Random Sampling dentro de cada grupo.
    

Esto busca mantener una representación adecuada de las diferentes  
categorías en los conjuntos resultantes.

---

# 17. Cross Validation --- k-fold

En **k-fold Cross Validation**:

1. Se divide el Training Set en `k` folds.
    
2. En cada iteración:
    
    - Se entrenan los modelos utilizando los folds de entrenamiento.
        
    - Se valida utilizando el fold restante.
        
3. Se repite durante `k` iteraciones.
    

Conceptualmente:

```
Fold 1 │ Fold 2 │ Fold 3 │ Fold 4 │ Fold 5
  Val     Train    Train    Train    Train

Fold 1 │ Fold 2 │ Fold 3 │ Fold 4 │ Fold 5
 Train    Val     Train    Train    Train

...
```

Finalmente:

- El modelo final y la optimización se realizan utilizando el  
    **Training Set completo**.
    
- El error de generalización se mide mediante el **Test Set**.

> Al final me queda una **media** de performance de mi modelo segun la particion que hice en cada foldeo



---

# 18. Optimización de hiperparámetros

Un **hiperparámetro** es un valor configurado **antes del  
entrenamiento** de un modelo que influye en su performance.

La presentación menciona dos estrategias.

## 18.1. Grid Search

Prueba combinaciones a partir de una lista de valores posibles.

Ejemplo conceptual:

```
max_depth = [2, 3, 4]
min_samples = [2, 5]

Combinaciones:
(2,2)
(2,5)
(3,2)
(3,5)
(4,2)
(4,5)
```

## 18.2. Randomized Search

Prueba `N` combinaciones seleccionadas al azar dentro de los valores  
posibles.

```
Espacio de hiperparámetros
          │
          ▼
 Selección aleatoria
          │
          ▼
      N pruebas
          │
          ▼
 Mejor combinación
```

---

# 19. Clasificadores Multiclase

La clasificación multiclase busca clasificar una observación en **más de  
dos clases**.

Puede resolverse mediante:

1. Clasificadores inherentemente multiclase.
    
2. Clasificadores binarios combinados mediante estrategias multiclase.
    

Ejemplos mencionados:

- **Random Forest** como clasificador multiclase. Alglomera arboles de desicion para generar fronteras mas complejas entre clases
    
- **SVM** utilizando estrategias para convertir el problema en  
    múltiples clasificadores binarios. 
    

---

# 20. Estrategia multiclase 1: One-versus-All (OvA)

En **One-versus-All** se crea **un clasificador binario por clase**.

Ejemplo con tres clases:

```
Clasificador 1:
Triángulos vs No Triángulos

Clasificador 2:
Cuadrados vs No Cuadrados

Clasificador 3:
Cruces vs No Cruces
```

Si existen `n` clases:

```
n clases → n clasificadores
```

### Predicción

Cada clasificador genera un score.

La clase elegida para un elemento es la que obtiene el **mayor score**.

Ejemplo:

```
Triángulo → 0.2
Cuadrado  → 0.8  ← elegido
Cruz      → 0.4
```

Resultado:

```
Clase = Cuadrado
```

---

# 21. One-versus-One (OvO)

En **One-versus-One** se crea **un clasificador por cada par de  
clases**.

Si existen `n` clases, se necesitan:

```
n × (n - 1)
────────────
     2
```

clasificadores.

Es decir:

```
Clasificadores = n(n-1)/2
```

### Ejemplo

Con tres clases:

```
A vs B
A vs C
B vs C
```

Total:

```
3 × 2 / 2 = 3 clasificadores
```

### Predicción

Cada clasificador selecciona una de las dos clases.

La clase final es la seleccionada en la **mayor cantidad de pares**.

### Ventaja

Cada clasificador se entrena sobre un subconjunto que contiene solamente  
dos clases.

### Desventaja

Mayor **coste computacional**, debido a la cantidad de clasificadores  
necesarios.

---

# 22. Multi-Label Classifiers

Los clasificadores **multi-label** permiten que cada instancia tenga  
**más de un target o label binario**.

### Ejemplo

Reconocer la presencia de animales en una fotografía.

Una imagen podría tener:

```
Perro  → Sí
Gato   → No
Caballo → Sí
...
```

Por lo tanto, una misma instancia puede pertenecer simultáneamente a  
múltiples etiquetas.

### Relación con los clasificadores anteriores

Los Multi-Label Classifiers constituyen una generalización de los  
conceptos anteriores.

Pueden manejar:

- Múltiples targets o labels.
    
- Targets que pueden ser multiclase.
    

---

# 23. Dataset de Titanic

La presentación utiliza el **dataset del Titanic** como ejemplo práctico  
de clasificación binaria.

## Objetivo

Predecir si un pasajero sobrevivió al accidente en base a sus caracteristicas y condiciones de embarque (primera clase, trabajador, segunda clase, crew, etc).

### Características

El dataset contiene aproximadamente:

- **891 instancias**.
    
- **12 características**.
    

La variable objetivo es binaria:

```
0 → No sobrevivió
1 → Sobrevivió
```

Algunas características utilizadas:

- Clase del pasajero (`Pclass`).
    
- Edad (`Age`).
    
- Sexo (`Sex`).
    
- Tarifa (`Fare`).
    

---

# 24. Preprocesamiento del Titanic con Python

Primero se carga el dataset y se seleccionan las columnas utilizadas.

```
import pandas as pd
from sklearn.model_selection import train_test_split

# Cargar dataset
data = pd.read_csv('titanic.csv')

data = data[['Age', 'Fare', 'Pclass', 'Sex', 'Survived']].dropna()

# Codificar variable categórica 'Sex'
data['Sex'] = data['Sex'].map({'male': 0, 'female': 1})

# Definir X e y
X = data[['Age', 'Fare', 'Pclass', 'Sex']]
y = data['Survived']

# Dividir en train y test
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)
```

### ¿Qué representan `X` e `y`?

```
X → características utilizadas para predecir
y → variable objetivo
```

En este caso:

```
X:
- Age
- Fare
- Pclass
- Sex

y:
- Survived
```

---

# 25. Entrenamiento y evaluación del modelo

Se utiliza un **DecisionTreeClassifier**.

```
from sklearn.linear_model import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

# Crear y entrenar el modelo
model = DecisionTreeClassifier(max_depth=3)

model.fit(X_train, y_train)

# Realizar predicciones
y_pred = model.predict(X_test)

# Evaluar el rendimiento
accuracy = accuracy_score(y_test, y_pred)

print("Accuracy:", accuracy)
```

El árbol utiliza:

```
max_depth=3
```

como hiperparámetro para controlar la altura máxima del árbol.

### Resultado mostrado en la presentación

```
Accuracy: 0.8212290502793296
```

Es decir, aproximadamente:

```
82,12 % de accuracy
```

---

# 26. Visualización del árbol

Finalmente, el árbol puede visualizarse para observar **cómo clasifica  
los datos a partir de sus atributos**.

El flujo completo del ejemplo es:

```
Dataset Titanic
      │
      ▼
Selección de variables
      │
      ▼
Limpieza de datos
      │
      ▼
Codificación de Sex
      │
      ▼
Separación X / y
      │
      ▼
Train / Test Split
      │
      ▼
DecisionTreeClassifier
      │
      ▼
Entrenamiento
      │
      ▼
Predicciones
      │
      ▼
Accuracy
      │
      ▼
Visualización del árbol
```

---

# 27. Resumen conceptual

## Machine Learning

Aprendizaje de un programa a partir de experiencia/datos para mejorar su  
desempeño en una tarea.

## Tipos de aprendizaje

```
Machine Learning
├── Supervisado
│   ├── Clasificación
│   └── Regresión
│
├── No supervisado
│   ├── Clustering
│   ├── Asociación
│   └── Reducción de dimensiones
│
└── Reforzado
    ├── Estados
    ├── Acciones
    └── Recompensas / penalidades
```

## Clasificación binaria

Predicción entre dos clases:

```
Input → Modelo → Clase 0 / Clase 1
```

## Pipeline

```
Datos
  ↓
Preprocesamiento
  ↓
Train / Validation / Test
  ↓
Entrenamiento
  ↓
Optimización
  ↓
Evaluación
  ↓
Modelo final
```

## Problemas principales

- Datos insuficientes o de mala calidad.
    
- Ruido.
    
- Outliers.
    
- Valores faltantes.
    
- Falta de estandarización.
    
- Features irrelevantes.
    
- Overfitting.
    
- Underfitting.
    

## Evaluación y optimización

- Accuracy.
    
- Train/Test Split.
    
- Validation Set.
    
- Stratified Sampling.
    
- k-fold Cross Validation.
    
- Grid Search.
    
- Randomized Search.
    

## Clasificación multiclase

```
Multiclase
├── Clasificador multiclase
├── One-versus-All
└── One-versus-One
```

## Multi-label

Una instancia puede tener simultáneamente múltiples labels.

---
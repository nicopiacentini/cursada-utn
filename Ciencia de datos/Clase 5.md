
# Clase 5 — Evaluación de modelos de clasificación y regresión

> Fuente: presentación "Evaluación de modelos de clasificación y regresión" (UTN.BA) + notebook de la clase (Titanic dataset). Se agregan explicaciones adicionales para reforzar los conceptos.

## Índice

1. [[#1. Métricas de performance para clasificación]]
2. [[#2. Accuracy]]
3. [[#3. Accuracy Paradox]]
4. [[#4. Matriz de confusión (Confusion Matrix)]]
5. [[#5. Precision y Recall]]
6. [[#6. Decision Threshold (umbral de decisión)]]
7. [[#7. Trade-off Precision vs Recall]]
8. [[#8. F1-Score]]
9. [[#9. Espacio ROC]]
10. [[#10. Curva ROC y AUC]]
11. [[#11. Curva de aprendizaje (Learning Curve)]]
12. [[#12. Curva de validación / complejidad]]
13. [[#13. Repaso de regresión]]
14. [[#14. Regresión lineal]]
15. [[#15. Métricas de performance para regresión (RMSE y MAE)]]
16. [[#16. Regresión lineal vs polinomial]]
17. [[#17. Validación cruzada (Cross-Validation)]]
18. [[#18. Optimización de hiperparámetros (Grid Search)]]
19. [[#19. Código de referencia (notebook)]]
20. [[#20. Para leer / referencias]]

---

## 1. Métricas de performance para clasificación

Antes de entrenar cualquier modelo hay que tener claro **cómo se mide si es bueno o no**. En clasificación, las métricas se calculan comparando lo que el modelo predijo contra el valor real (label verdadero).

> 💡 **Nota agregada**: la elección de la métrica correcta depende del problema. No existe una métrica "universal" mejor que las demás — cada una resalta un aspecto distinto del comportamiento del modelo (aciertos globales, falsos positivos, falsos negativos, etc.).

---

## 2. Accuracy

**Definición**: proporción de predicciones correctas sobre el total de predicciones.

$$A_{(modelo)} = \frac{\text{Predicciones Correctas}}{\text{Cantidad de predicciones}}$$

- Es la métrica más simple e intuitiva.
- Ideal para arrancar a entender el rendimiento de un modelo, **pero tiene muchos problemas** (ver el punto siguiente).

---

## 3. Accuracy Paradox

Es el problema central de usar accuracy como única métrica cuando las **clases están desbalanceadas** (una clase es mucho más frecuente que otra).

### Ejemplo ilustrativo (del original)

Si solo el 10% de las imágenes de un dataset son "5", un modelo que **siempre** prediga "Falso" (nunca detecta un 5) va a tener 90% de exactitud, a pesar de ser completamente inútil.

$$\forall i,\ P(i) \rightarrow \text{Falso} \implies 90\%\text{ de exactitud} $$

### Conclusiones del Accuracy Paradox

- Un modelo con un accuracy dado puede tener **menor poder predictivo real** que otro con accuracy más bajo.
- Un modelo puede tener **buena accuracy pero ser completamente inútil**.
- Esto ocurre sobre todo cuando existen clases mucho más frecuentes que otras (datasets desbalanceados).

### Ejemplo numérico (del original)

Se comparan dos clasificadores sobre un dataset con 9850 instancias "No" y 150 instancias "Sí":

**Clasificador A** (intenta predecir de verdad):

|              |Predicho: No|Predicho: Sí|
|---|---|---|
| **Real: No** |9700 (TN)|150 (FP)|
| **Real: Sí** |50 (FN)|100 (TP)|

**Clasificador Fijo** (siempre predice "No"):

|a|Predicho: No|Predicho: Sí|
|---|---|---|
|**Real: No**|9850 (TN)|0 (FP)|
|**Real: Sí**|150 (FN)|0 (TP)|

$$A_{(modelo)} = \frac{TN+TP}{TN+TP+FN+FP}$$

$$A_{(clasificadorA)} = \frac{9700+100}{9700+100+50+150} = 98\%$$

$$A_{(clasificadorFijo)} = \frac{9850+0}{9850+0+0+150} = 98.5\% $$

> ⚠️ El clasificador que **nunca detecta nada** (Clasificador Fijo) obtiene _mejor_ accuracy que el que sí intenta predecir la clase positiva. Esto demuestra por qué accuracy sola no alcanza cuando hay desbalance de clases.

> El accuracy no tiene en cuenta tanto el error en el modelo

---

## 4. Matriz de confusión (Confusion Matrix)

Es la herramienta base para calcular casi todas las demás métricas de clasificación. Cruza la clase **real** contra la clase **predicha**.

| Real\Predicho | Predicho: No                            | Predicho: Sí                           |
| ------------- | --------------------------------------- | -------------------------------------- |
| **Real: No**  | **TN** (True Negative)                  | **FP** (False Positive) — Error tipo I |
| **Real: Sí**  | **FN** (False Negative) — Error tipo II | **TP** (True Positive)                 |

- **TP (True Positive)**: el modelo predijo positivo y era positivo.
- **TN (True Negative)**: el modelo predijo negativo y era negativo.
- **FP (False Positive / Error tipo I)**: el modelo predijo positivo pero en realidad era negativo (falsa alarma).
- **FN (False Negative / Error tipo II)**: el modelo predijo negativo pero en realidad era positivo (se le "escapó" un caso positivo).

> 💡 **Nota agregada**: en la práctica, cuál error importa más (FP o FN) depende del contexto de negocio. Por ejemplo, en un test médico un FN (no detectar una enfermedad que sí está presente) suele ser mucho más grave que un FP.

### Representación gráfica (clasificador de naranjas)

Se ilustra con un clasificador que separa **naranjas** de **manzanas**:

- _True positives_: naranjas correctamente clasificadas como naranja.
- _False positives_: manzanas incorrectamente clasificadas como naranja.
- _False negatives_: naranjas que el modelo dejó fuera (clasificadas como manzana).
- _True negatives_: manzanas correctamente dejadas fuera.

El "círculo" representa las instancias que el modelo decidió clasificar como naranja; todo lo que cae dentro son las **predicciones positivas** del modelo.

---

## 5. Precision y Recall

Estas dos métricas nacen para resolver el problema del Accuracy Paradox, mirando específicamente el comportamiento del modelo sobre la clase positiva.

### Precision (Precisión)

Mide qué tan **exactas** son las predicciones positivas del modelo: de todo lo que el modelo dijo que era positivo, ¿cuánto realmente lo era?

$$P_{(modelo)} = \frac{TP}{TP + FP}$$

> "Que tanto se equivoco diciendo que *si*"
### Recall (Sensibilidad / Exhaustividad)

Mide qué proporción de los casos **realmente positivos** el modelo logró detectar.

$$R_{(modelo)} = \frac{TP}{TP + FN}$$
> Que tantos positivos verdaderos descarte. 

> Se conoce como **sensibilidad** por pensarlo como: *por las dudas lo clasifico como tal*
### Ejemplo numérico 1 (dataset balanceado)

|a|Pred. Neg|Pred. Pos|
|---|---|---|
|**Clase Negativa**|5000 (TN)|100 (FP)|
|**Clase Positiva**|200 (FN)|4000 (TP)|

- Precision = 4000 / 4100 = **0.97**
- Recall = 4000 / 4200 = **0.95**

### Ejemplo numérico 2 (retomando el Accuracy Paradox)

|a|Pred. Neg|Pred. Pos|
|---|---|---|
|**Clase Negativa**|9700 (TN)|150 (FP)|
|**Clase Positiva**|50 (FN)|100 (TP)|

- Precision = 100 / 250 = **0.40**
- Recall = 100 / 150 = **0.66**

Para el **Clasificador Fijo** (siempre predice "No"): Recall = 0/150 = **0** → esto expone claramente que el modelo es inútil, algo que el accuracy (98.5%) no mostraba.

> 💡 **Analogía intuitiva** (agregada): pensá en un buscador de documentos.
> 
> - **Precision alta** = de los documentos que te devuelve, casi todos son relevantes (pocos falsos positivos).
> - **Recall alto** = de todos los documentos relevantes que existen, el buscador te devolvió casi todos (pocos falsos negativos). Es difícil maximizar ambas al mismo tiempo — de ahí el trade-off que se explica más abajo.

### Ilustración gráfica con manzanas/naranjas

Ejemplo con 20 frutas (10 manzanas reales + 10 naranjas reales), separadas por un modelo en dos lados ("Side 1" y "Side 2"):

- **Precisión** = Total naranjas correctas / Total naranjas predichas = **7/10**
- **Recall** = Total naranjas correctas / Total de naranjas reales = **7/9**

(la pequeña diferencia entre 9 y 10 naranjas reales del ejemplo original se debe a cómo se repartieron las frutas en la ilustración)

---

## 6. Decision Threshold (umbral de decisión)

Muchos clasificadores no devuelven directamente "Sí" o "No", sino un **score o probabilidad** (por ejemplo, "80% de probabilidad de ser naranja"). Para convertir ese score en una clase se define un **umbral (threshold) T**:

```
score = Clasificador(instancia)
si score > T  →  Naranja
si score ≤ T  →  Manzana
```

> 💡 **Nota agregada**: por defecto, muchos algoritmos (regresión logística, redes neuronales, etc.) usan T = 0.5, pero **no hay ninguna obligación de usar ese valor**. Cambiar el threshold no reentrena el modelo: solo cambia dónde se traza la línea de decisión sobre las probabilidades ya calculadas.

### Efecto de mover el threshold

Al mover el umbral hacia la derecha (exigir más "confianza" para clasificar como positivo):

- Con threshold intermedio: P = 4/6, R = 4/9 (ambas bajan respecto al caso base).
- Al mover el umbral hacia la izquierda (ser menos exigente, aceptar más casos como positivos):
    - P = 7/13 (baja, porque entran más falsos positivos)
    - R = 7/9 (sube, porque se detectan más positivos reales)

Esto confirma el patrón general:

- **Threshold más alto (más estricto)** → sube Precision, baja Recall.
- **Threshold más bajo (más permisivo)** → sube Recall, baja Precision.
>[!important] 
Si aumento el treshold es como que estoy pidiendo que este muy seguro de que un elemento es de una clase.
 
### Cómo elegir el threshold según el problema

- **Clasificar publicidad para todo público (ATP)**: conviene priorizar **Precision** — es preferible dejar pasar por error alguna publicidad dudosa (FN) antes que etiquetar como "apta" una que no lo es (FP). Se busca _evitar predecir como mainstream_ publicidad que no lo es.
- **Detectar fraude en tarjetas de crédito**: conviene priorizar **Recall** — es preferible investigar transacciones de más (FP) antes que dejar pasar un fraude real sin detectar (FN). Se busca _detectar cualquier transacción con posibilidad de fraude_.

---

## 7. Trade-off Precision vs Recall

Al variar el threshold entre 0 y 1, Precision y Recall se mueven en sentidos opuestos. En un gráfico típico (Precision y Recall vs Threshold):

- El Recall suele empezar cerca de 1 (con threshold bajo, casi todo se clasifica como positivo) y cae a medida que sube el threshold.
- La Precision suele empezar más baja y subir a medida que el threshold se vuelve más exigente (aunque no siempre de forma monótona).

Esto obliga a **elegir un compromiso** según el costo relativo de FP vs FN en el problema real.

---

## 8. F1-Score

Combina Precision y Recall en **una sola métrica**, usando la **media armónica** de ambas:

$$F_{1(modelo)} = \frac{2}{\frac{1}{P_{(modelo)}} + \frac{1}{R_{(modelo)}}} = 2 \times \frac{P_{(modelo)} \times R_{(modelo)}}{P_{(modelo)} + R_{(modelo)}}$$

### Por qué media armónica y no promedio simple

- La media armónica es **poco influenciada por la presencia de un valor muy alto** cuando el otro es muy bajo — es decir, es **sensible a valores chicos**. Si Precision = 1.0 pero Recall = 0.1, el F1 será bajo, mientras que un promedio aritmético simple daría 0.55, ocultando el problema.
- Por eso el F1 **favorece a los clasificadores que tienen Precision y Recall similares y ambos altos**, penalizando a los que sacrifican demasiado uno por el otro.

> 💡 **Nota agregada**: existe también el **F-beta score**, una generalización que permite ponderar Recall por sobre Precision (o viceversa) según un parámetro β, útil cuando un tipo de error es más costoso que el otro.

### Selección del threshold usando F1

Graficando Precision, Recall y F1 en función del threshold, el **punto donde F1 se maximiza** suele usarse como un buen candidato de threshold "balanceado" (aunque el mejor threshold real siempre depende del contexto del negocio).

---

## 9. Espacio ROC

**ROC** = _Receiver Operating Characteristic_ (nombre que viene originalmente de la detección de señales, ej. radares).

Se construye comparando dos tasas:

- **True Positive Rate (TPR)** = $\dfrac{TP}{TP+FN}$ → equivalente al **Recall / Sensitivity**. De las instancias realmente positivas, cuántas se predicen como positivas.
- **False Positive Rate (FPR)** = $\dfrac{FP}{FP+TN}$. De las instancias realmente negativas, cuántas se predicen (incorrectamente) como positivas.

### Interpretación del espacio ROC

- El **clasificador perfecto** se ubica en el punto (0,1): FPR = 0 (ningún falso positivo) y TPR = 1 (detecta todos los positivos).
- La **línea diagonal (de no-discriminación)** representa un clasificador que decide al azar (equivalente a tirar una moneda).
- Los modelos se ubican como puntos en este espacio; **cuanto más arriba a la izquierda**, mejor es el modelo (más cerca del clasificador perfecto).
![[Pasted image 20260910200328.png|406]]

> Clasificador perfecto -> FPR = 0 -> FP = 0 
> Clasificador Aleatorio -> TPR = FPR -> TP = FP -> Mi clasificador no es mejor que tirar una moneda
> Si me quedo en C me quedaria que TP < FP. Osea que construiste  una maquina que predice al reves. Lo mejor que se puede hacer es dar vuelta las clases y tengo un modelo que funciona bien.

---

## 10. Curva ROC y AUC

### Curva ROC

Se obtiene **variando el threshold** de decisión del modelo y, para cada valor, calculando el par (FPR, TPR):

1. Computar la curva ROC (recorrer distintos thresholds).
2. Graficar TPR (eje Y) vs FPR (eje X).

Es otra forma de visualizar el mismo trade-off que ya vimos entre TP rate y FP rate, pero ahora recorriendo **todos los posibles thresholds** en un solo gráfico, en lugar de fijar uno solo.

![[Pasted image 20260910201617.png|354]]
> Quiero llegar lo mas cerca posible de TPR = 1. Para ello
### AUC (Área bajo la curva)

- Es un número entre (idealmente) **0.5 y 1** que resume qué tan bien el modelo separa las clases, sin necesidad de fijar un threshold específico.
- **AUC cercano a 1** → el modelo separa muy bien ambas clases porque la curva se acerca a la esquina de TPR = 1.
- **AUC = 0.5** → el modelo se comporta como un clasificador aleatorio (la curva ROC coincide con la diagonal).
- Sirve para **comparar clasificadores**: 1 > AUC > 0.5 (cuanto más alto, mejor). Si da menos de 0.5 doy vuelta las clases.

> 💡 **Nota agregada**: el AUC tiene una interpretación probabilística muy útil: es la probabilidad de que el modelo le asigne un score más alto a una instancia positiva elegida al azar que a una negativa elegida al azar. Es especialmente útil cuando las clases están desbalanceadas y se quiere evaluar el modelo _independientemente_ del threshold elegido.

---

## 11. Curva de aprendizaje (Learning Curve)

Relaciona el **tamaño del dataset de entrenamiento** con el accuracy (u otra métrica) medida en:

- el mismo conjunto de entrenamiento, y
- un conjunto de validación **fijo** (siempre el mismo, aunque cambie el tamaño del set de entrenamiento).
> Agrego datos al dataset y a medida que lo hago entreno a mi modelo y mido su performance, presicion, sensibilidad, etc. Analizo si realmente me conviene traer mas datos o no.

### Para qué sirve

Permite determinar si el modelo se beneficiaría de **tener más datos**:

- Si el score de validación sigue subiendo a medida que crece el training set → conviene conseguir más datos.
- Si el score de entrenamiento y validación ya convergieron y son similares → agregar más datos probablemente no ayude mucho más.

### Ejemplo del original: GaussianNB vs SVC

- **GaussianNB**: el score de entrenamiento empieza alto y **baja** a medida que crece el dataset, mientras que el de validación sube; ambos convergen alrededor de ~0.85-0.87 — el modelo tiene **poca capacidad** (posible underfitting con datasets grandes).
- **SVC**: el score de entrenamiento se mantiene cerca de 1.0 y el de validación sube rápido y se estabiliza cerca de ~0.98-0.99 — el modelo generaliza muy bien con relativamente pocos datos.

> 💡 **Nota agregada**: una gran brecha persistente entre la curva de train (alta) y la de validación (baja) que no se cierra al agregar datos es un síntoma clásico de **overfitting**. Si ambas curvas convergen en un valor bajo, es señal de **underfitting** (el modelo es demasiado simple para el problema).

---

## 12. Curva de validación / complejidad

Relaciona el valor de **un hiperparámetro** (por ejemplo, la profundidad máxima de un árbol) con el accuracy (u otra métrica), calculado sobre el mismo set de entrenamiento y un set de validación fijo.

### Para qué sirve

Permite visualizar en qué regiones del hiperparámetro el modelo cae en:

- **Underfitting**: tanto el score de train como el de validación son bajos (el modelo es demasiado simple).
- **Zona óptima**: train y validación son altos y similares.
- **Overfitting**: el score de train sigue subiendo (o se mantiene muy alto) mientras que el de validación empeora o se estanca (el modelo memoriza el training set en lugar de generalizar).

### Ejemplo del original (parámetro `C` de un modelo)

Con valores muy chicos de `C` (mucha regularización), tanto train como test tienen accuracy bajo (~0.92, underfitting). Alrededor de `C ≈ 1` ambas curvas alcanzan su pico (~0.98, zona óptima). Para valores de `C` muy grandes (poca regularización), el train se mantiene alto pero el test empieza a caer y se vuelve más inestable (señal de overfitting).

---

## 13. Repaso de regresión

A diferencia de la clasificación (que predice una **categoría**), la **regresión** predice un **valor numérico continuo**.

- Encuentra la **relación** entre las **variables independientes / predictoras** ($X$) y la **variable dependiente / respuesta** ($Y$) para hacer predicciones.
- **Aplicaciones típicas**: predicción de precios, estimación de riesgos, análisis de tendencias, etc.

> ⚠️ **Nota sobre terminología** (agregada): en las slides originales, por una convención distinta a la más habitual en estadística, se llama "variable independiente" a $Y$ (la que se quiere predecir) y "variables dependientes" al vector $X$ (los predictores). En la literatura estándar de estadística/ML suele ser al revés: $X$ son las variables **independientes** (o _features_/predictores) y $Y$ es la variable **dependiente** (la respuesta, que "depende" de $X$). Vale la pena tenerlo en cuenta para no confundirse al leer otras fuentes.

### Modelo general

$$Y = f(X) + \epsilon$$

Donde:

- $Y$: variable a predecir (respuesta).
- $X = (X_1, X_2, \dots, X_n)$: vector de variables predictoras (n dimensiones).
- $\epsilon$: término de error (todo lo que el modelo no logra capturar).

### Ejemplo de negocio (del original)

Predictores: precio de venta del producto, inversión en publicidad, precio de venta de la competencia, unidades vendidas por la competencia.

Preguntas que un modelo de regresión podría ayudar a responder:

- ¿Conviene subir el precio para vender más?
- ¿Estamos gastando poco o mucho en publicidad?
- ¿Qué pasa si a nuestros competidores les va mejor o peor?

---

## 14. Regresión lineal

Es el caso particular en el que $f(X)$ es una **función lineal** de los parámetros:

$$f(X) = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_n X_n$$

- Tiene $N+1$ parámetros (los $\beta_i$, más el intercepto $\beta_0$).
- Con $n=1$ predictor, el modelo es una **recta** en 2D.
- Con $n=2$ predictores, el modelo es un **plano** en 3D.
- Con $n>2$, se generaliza a un **hiperplano** (ya no se puede visualizar directamente, pero la lógica matemática es la misma).
> Tenes la suposicion de que tu modelo puede explicarse con una regresion lineal

---

## 15. Métricas de performance para regresión (RMSE y MAE)

A diferencia de clasificación (donde se cuentan aciertos/errores discretos), en regresión se mide **qué tan lejos** está la predicción del valor real.

### RMSE (Root Mean Square Error)

$$RMSE(X,h) = \sqrt{\frac{1}{m}\sum_{i=1}^{m}\left(h(x^{(i)}) - y^{(i)}\right)^2}$$

Donde:

- $x^{(i)}$: vector con los valores de la medición $i$ para cada feature.
    
- $y^{(i)}$: label, valor real (predicción deseada) para la medición $i$.
    
- $h(x^{(i)})$: valor predicho por el modelo para la medición $i$.
    
- $m$: cantidad total de mediciones.
    
- Mide la **desviación estándar del error** de las predicciones.
    
- Es la métrica más utilizada en problemas de regresión.
    
- Al elevar al cuadrado los errores, **penaliza fuertemente los errores grandes** (outliers).
    

### MAE (Mean Absolute Error)

$$MAE(X,h) = \frac{1}{m}\sum_{i=1}^{m}\left|h(x^{(i)}) - y^{(i)}\right|$$

- Ambas (RMSE y MAE) miden la **distancia** entre el vector de mediciones reales y el vector de predicciones.
- MAE es **menos susceptible a outliers** (valores extremos) que RMSE, ya que no eleva al cuadrado el error.

> 💡 **Nota agregada — cuándo usar cada una**:
> 
> - Usar **RMSE** cuando los errores grandes son particularmente indeseables y se quiere penalizarlos más (ej. errores de predicción muy grandes son mucho peores que varios errores chicos).
> - Usar **MAE** cuando se prefiere una métrica más robusta a valores atípicos, y todos los errores deben "pesar" proporcionalmente a su magnitud, sin exagerar los grandes.
> - Existen otras métricas de regresión no cubiertas en la clase pero muy usadas en la práctica, como el **R² (coeficiente de determinación)**, el **MAPE (error porcentual absoluto medio)**, etc.

---

## 16. Regresión lineal vs polinomial

- La **regresión lineal** ajusta una recta (o hiperplano) a los datos.
- La **regresión polinomial** agrega términos de mayor grado (ej. $X^2$, $X^3$, ...) para poder capturar relaciones **no lineales** entre $X$ e $Y$.

### Trade-off de complejidad

- **Aumentar la complejidad del modelo** (más grados en el polinomio) permite capturar relaciones más complejas, **evitando underfitting**.
- Pero si se aumenta demasiado, el modelo empieza a ajustarse al ruido específico de los datos de entrenamiento en lugar de a la tendencia real, **causando** **overfitting**.

> 💡 **Nota agregada**: este es el mismo fenómeno que se visualiza con las curvas de validación/complejidad de la sección 12 — a medida que sube la complejidad del modelo (ya sea el grado del polinomio, la profundidad de un árbol, etc.), el error de entrenamiento tiende a bajar monótonamente, mientras que el error de validación primero baja y después vuelve a subir. El punto óptimo está en el "valle" de la curva de validación.

---

## 17. Validación cruzada (Cross-Validation)

> Contenido tomado del notebook de la clase, complementa la sección de validación de resultados.

La validación cruzada permite evaluar el modelo con **diferentes particiones** de los datos (distintos splits de train/test) para asegurarse de que el modelo **generaliza bien** y que el resultado obtenido no es producto del azar de una sola partición.

**Cómo funciona (k-fold cross-validation)**: se divide el dataset en $k$ partes ("folds"). En cada iteración, se entrena con $k-1$ folds y se evalúa con el fold restante; esto se repite $k$ veces (rotando cuál fold se usa para validar) y luego se promedian los resultados.

```python
from sklearn.model_selection import cross_val_score

# Validación cruzada
cv_scores = cross_val_score(pipeline, X, y, cv=5, scoring='accuracy')
print(f'Cross-Validation Scores: {cv_scores}')
print(f'Mean CV Score: {cv_scores.mean()}')
```

**Salida de ejemplo (dataset Titanic, árbol de decisión):**

```
Cross-Validation Scores: [0.76536313 0.76404494 0.78089888 0.76966292 0.80898876]
Mean CV Score: 0.7777917268219194
```

- `cv=5` indica que se usan 5 folds (5-fold cross-validation).
- El resultado es un array con el score obtenido en cada fold; el promedio (`cv_scores.mean()`) da una estimación más robusta del rendimiento real del modelo que un único train/test split.

---

## 18. Optimización de hiperparámetros (Grid Search)

El **Grid Search** permite probar sistemáticamente **múltiples combinaciones de hiperparámetros** para encontrar la configuración que mejor rendimiento (según una métrica elegida) da al modelo.

```python
from sklearn.model_selection import GridSearchCV

# Definir parámetros a optimizar
param_grid = {
    'classifier__max_depth': [3, 5, 10],
    'classifier__min_samples_split': [2, 5, 10]
}

# Búsqueda de hiperparámetros
grid_search = GridSearchCV(pipeline, param_grid, cv=5, n_jobs=-1, scoring='accuracy')
grid_search.fit(X_train, y_train)

print(f"Mejores parámetros: {grid_search.best_params_}")
print(f"Mejor Score: {grid_search.best_score_}")
```

**Salida de ejemplo:**

```
Mejores parámetros: {'classifier__max_depth': 5, 'classifier__min_samples_split': 10}
Mejor Score: 0.808941935483871
```

- `GridSearchCV` combina Grid Search con **cross-validation** internamente (`cv=5`): para cada combinación de hiperparámetros prueba con 5-fold CV y se queda con el promedio.
- `n_jobs=-1` usa todos los núcleos del procesador disponibles para paralelizar la búsqueda.
- El prefijo `classifier__` en los nombres de los parámetros indica que ese hiperparámetro pertenece al paso llamado `'classifier'` dentro del `Pipeline` (así es como sklearn permite tunear hiperparámetros de un step específico del pipeline).

> 💡 **Nota agregada**: Grid Search prueba **todas** las combinaciones posibles de la grilla, lo cual puede ser costoso computacionalmente si hay muchos hiperparámetros o muchos valores por parámetro. Una alternativa más eficiente es `RandomizedSearchCV`, que prueba un número limitado de combinaciones elegidas al azar dentro de los rangos definidos.

---

## 19. Código de referencia (notebook)

Esta sección recopila los fragmentos de código más relevantes del notebook de la clase, usando el dataset **Titanic** (de `seaborn`) para predecir la variable `survived` (sobrevivió o no).

### 19.1 Pipeline completo (preprocesamiento + modelo)

```python
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.compose import ColumnTransformer
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, precision_score, recall_score
from sklearn.model_selection import train_test_split
import seaborn as sns
import numpy as np

# Cargar el dataset del Titanic desde seaborn
df = sns.load_dataset('titanic')

# Eliminar columnas irrelevantes o redundantes
df_clean = df.drop(['deck', 'embark_town', 'alive', 'adult_male', 'class', 'alone'], axis=1)

# Rellenar valores faltantes en 'age' con la mediana
df_clean['age'].fillna(df_clean['age'].median(), inplace=True)
# Rellenar valores faltantes en 'embarked' con el valor más frecuente
df_clean['embarked'].fillna(df_clean['embarked'].mode()[0], inplace=True)

# Definir preprocesamiento para variables categóricas
categorical_features = ['sex', 'embarked', 'who']
categorical_transformer = OneHotEncoder(drop='first')

# Definir preprocesamiento para variables numéricas
numerical_features = ['age', 'fare', 'sibsp', 'parch']
numerical_transformer = StandardScaler()

# Combinar preprocesamientos en un ColumnTransformer
preprocessor = ColumnTransformer(
    transformers=[
        ('num', numerical_transformer, numerical_features),
        ('cat', categorical_transformer, categorical_features)
    ])

# Crear el Pipeline completo
pipeline = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('classifier', DecisionTreeClassifier(random_state=42))
])

# Separar features (X) y variable objetivo (y)
X = df_clean[['pclass', 'sex', 'age', 'sibsp', 'parch', 'fare', 'embarked', 'who']]
y = df_clean['survived']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Entrenar el Pipeline
pipeline.fit(X_train, y_train)

# Realizar predicciones
y_pred_pipeline = pipeline.predict(X_test)

# Evaluar el rendimiento del Pipeline
print("Accuracy del Pipeline:", accuracy_score(y_test, y_pred_pipeline))
```

**Salida:** `Accuracy del Pipeline: 0.7649253731343284`

**Explicación**:

- `ColumnTransformer` permite aplicar transformaciones **distintas** a distintos subconjuntos de columnas (escalado a numéricas, one-hot encoding a categóricas) dentro de un mismo objeto.
- `OneHotEncoder(drop='first')` convierte variables categóricas en columnas binarias (dummies), descartando una categoría para evitar colinealidad perfecta (_dummy variable trap_).
- Encapsular todo en un `Pipeline` asegura que el **mismo preprocesamiento** se aplique consistentemente tanto en entrenamiento como en predicción, evitando errores de _data leakage_.

### 19.2 Matriz de confusión y accuracy

```python
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
import matplotlib.pyplot as plt

# Crear pipeline con modelo de árbol de decisión (limitando profundidad)
pipeline = Pipeline(steps=[('preprocessor', preprocessor),
                           ('classifier', DecisionTreeClassifier(random_state=42, max_depth=3))])

pipeline.fit(X_train, y_train)
y_pred = pipeline.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
cm = confusion_matrix(y_test, y_pred) # genera los false positive y false negative

# Visualización con números en cada bloque
plt.figure(figsize=(6, 6))
plt.matshow(cm, cmap=plt.cm.Blues)
plt.title('Confusion Matrix')
plt.colorbar()
plt.ylabel('Actual')
plt.xlabel('Predicted')

for i in range(cm.shape[0]):
    for j in range(cm.shape[1]):
        plt.text(j, i, f'{cm[i, j]}', ha='center', va='center',
                  color='white' if cm[i, j] > cm.max()/2 else 'black')

plt.show()
print(f'Accuracy: {accuracy}')
```

**Explicación**: `confusion_matrix(y_test, y_pred)` devuelve una matriz 2x2 (para clasificación binaria) con TN, FP, FN, TP en el orden `[[TN, FP], [FN, TP]]`. Limitar `max_depth=3` es una forma simple de regularizar un árbol de decisión para evitar overfitting.

### 19.3 Reporte de clasificación (classification_report)

```python
report = classification_report(y_test, y_pred)
print(report)
```

**Explicación**: `classification_report` calcula automáticamente **precision, recall y f1-score para cada clase** (y también promedios como `macro avg` y `weighted avg`), sin necesidad de calcular manualmente cada métrica. Es muy útil cuando hay clases desbalanceadas, ya que muestra el detalle por clase en lugar de un único número global como accuracy.
- 0 -> Desde la clase positiva
- 1 -> Desde la clase negativa
Lo importante es elegir uno y determinar, esta fila es mi clase positiva. Todo depende de la codificacion.

> 💡 En las slides se menciona también cómo se relacionan las métricas por clase con el promedio ponderado (`weighted avg`): dado que $S_0$ y $S_1$ son la cantidad de instancias de cada clase, y $P_0, P_1$ sus precisiones: $$\frac{S_0 \cdot P_0 + S_1 \cdot P_1}{S_0+S_1}$$ es el promedio ponderado por soporte; si $S_0 = S_1$ (clases balanceadas), esto se simplifica al promedio simple $(P_0+P_1)/2$.

### 19.4 Curva ROC y AUC - Treshold

```python
from sklearn.metrics import roc_curve, roc_auc_score

# Calcular probabilidades de la clase positiva
y_prob = pipeline.predict_proba(X_test)[:, 1]

# Curva ROC
fpr, tpr, _ = roc_curve(y_test, y_prob)
auc = roc_auc_score(y_test, y_prob)

plt.figure(figsize=(8, 6))
plt.plot(fpr, tpr, label=f'AUC = {auc:.2f}')
plt.plot([0, 1], [0, 1], 'k--')  # línea del clasificador aleatorio
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('Curva ROC')
plt.legend()
plt.show()

print(f'AUC: {auc}')
```

**Explicación**: `predict_proba(X_test)[:, 1]` devuelve la probabilidad estimada de pertenecer a la clase positiva (columna índice 1) para cada instancia. `roc_curve` recorre internamente todos los thresholds posibles y devuelve los arrays de FPR y TPR correspondientes, listos para graficar.

### 19.5 Precision y Recall variando el threshold manualmente

```python
# Definir los umbrales a probar
thresholds = np.arange(0, 1.1, 0.1)  # Hasta 1.1 para incluir 1

precision_values = []
recall_values = []

for thresh in thresholds:
    y_pred_thresh = (y_prob >= thresh).astype(int)
    precision = precision_score(y_test, y_pred_thresh)
    recall = recall_score(y_test, y_pred_thresh)

    precision_values.append(precision)
    recall_values.append(recall)

    print(f"Threshold: {thresh:.1f}, Precision: {precision:.2f}, Recall: {recall:.2f}")
```

```python
# Graficar precisión y recall vs threshold
plt.figure(figsize=(8, 6))
plt.plot(thresholds, precision_values, label='Precision', marker='o', color='blue')
plt.plot(thresholds, recall_values, label='Recall', marker='x', color='red')
plt.xlabel('Threshold')
plt.ylabel('Score')
plt.title('Curvas de Precision y Recall vs. Umbral')
plt.legend(loc='best')
plt.grid(True)
plt.show()
```

```python
# Graficar Precision vs. Recall (curva Precision-Recall)
plt.figure(figsize=(8, 6))
plt.plot(recall_values, precision_values, marker='o', color='blue')
plt.xlabel('Recall')
plt.ylabel('Precision')
plt.title('Curva Precision vs. Recall')
plt.grid(True)
plt.show()
```

**Explicación**: `(y_prob >= thresh).astype(int)` es la implementación manual de aplicar un threshold sobre las probabilidades predichas, tal como se explicó conceptualmente en la sección 6. Esto permite construir "a mano" las curvas de Precision/Recall vs Threshold que se vieron en la teoría.

### 19.6 Curva de aprendizaje (Learning Curve)

```python
from sklearn.model_selection import learning_curve

train_sizes, train_scores, val_scores = learning_curve(
    pipeline,
    X,
    y,
    cv=5,
    scoring='accuracy',
    train_sizes=np.linspace(0.1, 1.0, 10),
    n_jobs=-1
)

train_mean = train_scores.mean(axis=1)
val_mean = val_scores.mean(axis=1)

plt.figure(figsize=(8, 6))
plt.plot(train_sizes, train_mean, label="Train Score", marker='o')
plt.plot(train_sizes, val_mean, label="Validation Score", marker='x')
plt.xlabel("Training Set Size")
plt.ylabel("Accuracy")
plt.title("Learning Curve - Decision Tree")
plt.legend()
plt.grid(True)
plt.show()
```

**Explicación**: `train_sizes=np.linspace(0.1, 1.0, 10)` indica que se va a entrenar el modelo con el 10%, 20%, ..., 100% del dataset de entrenamiento, midiendo en cada caso el score de train y de validación (usando cross-validation con `cv=5` internamente).

### 19.7 Curva de validación / complejidad

```python
from sklearn.model_selection import validation_curve

param_range = np.arange(1, 15)

train_scores, val_scores = validation_curve(
    pipeline,
    X,
    y,
    param_name="classifier__max_depth",
    param_range=param_range,
    cv=5,
    scoring="accuracy",
    n_jobs=-1
)

train_mean = train_scores.mean(axis=1)
val_mean = val_scores.mean(axis=1)

plt.figure(figsize=(8, 6))
plt.plot(param_range, train_mean, label="Train Score", marker='o')
plt.plot(param_range, val_mean, label="Validation Score", marker='x')
plt.xlabel("Max Depth")
plt.ylabel("Accuracy")
plt.title("Model Complexity Curve - Decision Tree")
plt.legend()
plt.grid(True)
plt.show()
```

**Explicación**: a diferencia de la learning curve (que varía el _tamaño del dataset_), `validation_curve` varía el valor de **un hiperparámetro específico** (`classifier__max_depth` en este caso) manteniendo fijo el tamaño del dataset, para ver en qué rango de valores el modelo empieza a hacer overfitting.

### 19.8 Otros modelos: Random Forest

```python
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from sklearn.ensemble import RandomForestClassifier
import matplotlib.pyplot as plt

pipeline = Pipeline(steps=[('preprocessor', preprocessor),
                           ('classifier', RandomForestClassifier(random_state=42, max_depth=5, n_estimators=50))])

pipeline.fit(X_train, y_train)
y_pred = pipeline.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
cm = confusion_matrix(y_test, y_pred)
# ... (mismo código de visualización de matriz de confusión y curva ROC que antes)

print(f'Accuracy: {accuracy}')
print(f'AUC: {auc}')
```

**Explicación**: `RandomForestClassifier` es un modelo de **ensamble** que combina muchos árboles de decisión (`n_estimators=50` árboles) entrenados sobre distintos subconjuntos aleatorios de datos y features, promediando sus predicciones. Suele generalizar mejor que un único árbol de decisión.

### 19.9 Otros modelos: SVC (Support Vector Classifier)

```python
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report, precision_recall_curve
from sklearn.svm import SVC

pipeline = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('classifier', SVC(random_state=42, probability=True))
])

param_grid = {
    'classifier__degree': [3, 5, 10],
    'classifier__C': [0.1, 0.5, 1, 5, 10],
    'classifier__kernel': ['linear', 'poly', 'rbf', 'sigmoid']
}

grid_search = GridSearchCV(pipeline, param_grid, cv=5, n_jobs=-1, scoring='accuracy')
grid_search.fit(X_train, y_train)
pipeline = grid_search.best_estimator_

print(f"Mejores parámetros: {grid_search.best_params_}")
print(f"Mejor Score: {grid_search.best_score_}")
```

**Explicación**:

- `probability=True` es necesario en `SVC` para poder usar `predict_proba` después (por defecto SVC no calcula probabilidades, solo la clase).
- El grid de hiperparámetros prueba distintos **kernels** (formas de la frontera de decisión: lineal, polinomial, radial, sigmoide), distintos grados de polinomio (`degree`, solo aplica al kernel `poly`) y distintos valores de regularización (`C`).
- `C` controla el trade-off entre un margen de decisión más amplio (más regularización, `C` chico) y clasificar correctamente más puntos de entrenamiento (menos regularización, `C` grande) — es justamente el hiperparámetro usado en la curva de complejidad de la sección 12.

También se calculan, para el SVC, la curva Precision-Recall junto con el F1 en función del threshold:

```python
precision, recall, thresholds = precision_recall_curve(y_test, y_prob)
f1_scores = 2 * (precision[:-1] * recall[:-1]) / (precision[:-1] + recall[:-1] + 1e-8)

plt.figure(figsize=(8, 6))
plt.plot(thresholds, precision[:-1], label='Precision')
plt.plot(thresholds, recall[:-1], label='Recall')
plt.plot(thresholds, f1_scores, label='F1 Score')
plt.xlabel("Threshold")
plt.ylabel("Score")
plt.title("Precision, Recall y F1 vs Threshold")
plt.legend()
plt.grid(True)
plt.show()
```

**Explicación**: `precision_recall_curve` devuelve arrays de precision y recall para distintos thresholds (uno menos que `thresholds`, de ahí el `[:-1]` para alinear los arrays al calcular F1 punto a punto). El `+ 1e-8` en el denominador evita división por cero cuando tanto precision como recall son 0.

### 19.10 Función reutilizable para evaluar cualquier modelo

Este bloque del notebook arma una función genérica que resume **todo lo visto en la clase** (matriz de confusión, ROC, precision-recall, curva de aprendizaje y curva de complejidad) en un solo panel de 6 gráficos, para comparar fácilmente distintos algoritmos:

```python
import numpy as np
import matplotlib.pyplot as plt

from sklearn.pipeline import Pipeline
from sklearn.model_selection import GridSearchCV, learning_curve, validation_curve
from sklearn.metrics import (
    accuracy_score, confusion_matrix, classification_report,
    roc_curve, roc_auc_score, precision_recall_curve
)

from sklearn.svm import SVC
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.naive_bayes import GaussianNB

def evaluate_model(name, pipeline, param_grid=None, complexity_param=None, complexity_range=None):
    # 1. Si hay param_grid, hace GridSearch; si no, entrena directo
    if param_grid:
        grid_search = GridSearchCV(pipeline, param_grid, cv=5, n_jobs=-1, scoring='accuracy')
        grid_search.fit(X_train, y_train)
        model = grid_search.best_estimator_
        print(f"Mejores parámetros: {grid_search.best_params_}")
    else:
        model = pipeline
        model.fit(X_train, y_train)

    y_pred = model.predict(X_test)
    y_prob = model.predict_proba(X_test)[:, 1]

    train_acc = accuracy_score(y_train, model.predict(X_train))
    test_acc = accuracy_score(y_test, y_pred)
    print(f"Train Accuracy: {train_acc:.4f}")
    print(f"Test Accuracy: {test_acc:.4f}")

    fig, axes = plt.subplots(2, 3, figsize=(20, 11))
    fig.suptitle(f"{name} - Evaluación completa", fontsize=18, fontweight='bold')

    # (a) Matriz de confusión
    cm = confusion_matrix(y_test, y_pred)
    ax = axes[0, 0]
    ax.imshow(cm, cmap='Blues')
    for i in range(cm.shape[0]):
        for j in range(cm.shape[1]):
            ax.text(j, i, cm[i, j], ha="center", va="center",
                    color="white" if cm[i, j] > cm.max()/2 else "black")
    ax.set_title("Confusion Matrix")

    # (b) Curva ROC
    fpr, tpr, _ = roc_curve(y_test, y_prob)
    auc = roc_auc_score(y_test, y_prob)
    ax = axes[0, 1]
    ax.plot(fpr, tpr, lw=2, label=f"AUC = {auc:.3f}")
    ax.plot([0, 1], [0, 1], linestyle='--', color='gray')
    ax.set_title("ROC Curve")
    ax.legend()

    # (c) Curva Precision-Recall
    precision, recall, thresholds = precision_recall_curve(y_test, y_prob)
    ax = axes[0, 2]
    ax.plot(recall, precision, lw=2)
    ax.set_title("Precision-Recall Curve")

    # (d) Precision, Recall y F1 vs Threshold (marcando el mejor threshold)
    f1_scores = 2 * (precision[:-1] * recall[:-1]) / (precision[:-1] + recall[:-1] + 1e-8)
    best_idx = f1_scores.argmax()
    best_thresh = thresholds[best_idx]
    ax = axes[1, 0]
    ax.plot(thresholds, precision[:-1], label="Precision")
    ax.plot(thresholds, recall[:-1], label="Recall")
    ax.plot(thresholds, f1_scores, label="F1")
    ax.axvline(best_thresh, color='gray', linestyle='--', alpha=0.7)
    ax.set_title(f"Metrics vs Threshold (best={best_thresh:.2f})")
    ax.legend()

    # (e) Learning Curve
    train_sizes, train_scores, val_scores = learning_curve(
        model, X, y, cv=5, n_jobs=-1, train_sizes=np.linspace(0.1, 1.0, 5)
    )
    ax = axes[1, 1]
    ax.plot(train_sizes, train_scores.mean(axis=1), marker='o', label="Train")
    ax.plot(train_sizes, val_scores.mean(axis=1), marker='o', label="Validation")
    ax.set_title("Learning Curve")
    ax.legend()

    # (f) Complexity Curve (si se pasó un hiperparámetro a analizar)
    ax = axes[1, 2]
    if complexity_param and complexity_range:
        train_scores, val_scores = validation_curve(
            model, X, y, param_name=complexity_param,
            param_range=complexity_range, cv=5, n_jobs=-1
        )
        ax.plot(complexity_range, train_scores.mean(axis=1), marker='o', label="Train")
        ax.plot(complexity_range, val_scores.mean(axis=1), marker='o', label="Validation")
        ax.set_xscale("log" if max(complexity_range)/min(complexity_range) > 10 else "linear")
        ax.set_title("Complexity Curve")
        ax.legend()
    else:
        ax.set_title("No complexity parameter")

    plt.tight_layout(rect=[0, 0, 1, 0.96])
    plt.show()
```

**Uso de la función con distintos modelos:**

```python
# KNN
knn_pipeline = Pipeline([
    ('preprocessor', preprocessor),
    ('classifier', KNeighborsClassifier())
])
knn_params = {'classifier__n_neighbors': [3, 5, 7, 10]}
evaluate_model("KNN", knn_pipeline, knn_params, "classifier__n_neighbors", [3, 5, 7, 10])

# Logistic Regression
log_pipeline = Pipeline([
    ('preprocessor', preprocessor),
    ('classifier', LogisticRegression(max_iter=1000))
])
log_params = {'classifier__C': [0.1, 1, 10]}
evaluate_model("Logistic Regression", log_pipeline, log_params, "classifier__C", [0.1, 1, 10])

# Naive Bayes (sin hiperparámetros a tunear)
nb_pipeline = Pipeline([
    ('preprocessor', preprocessor),
    ('classifier', GaussianNB())
])
evaluate_model("Naive Bayes", nb_pipeline)
```

**Explicación general de esta función**:

- Es un ejemplo excelente de cómo **automatizar y estandarizar** el proceso de evaluación de modelos, aplicando de una sola vez todos los conceptos vistos en la clase (matriz de confusión, ROC/AUC, precision-recall, F1 óptimo, learning curve y complexity curve).
- `KNeighborsClassifier` (KNN) clasifica cada punto según la clase mayoritaria entre sus `n_neighbors` vecinos más cercanos.
- `LogisticRegression` es un modelo lineal para clasificación que estima directamente la probabilidad de pertenecer a la clase positiva; su hiperparámetro `C` cumple un rol de regularización análogo al de SVC (a menor `C`, mayor regularización).
- `GaussianNB` (Naive Bayes Gaussiano) es un clasificador probabilístico simple y rápido, basado en el teorema de Bayes asumiendo independencia entre features y distribución normal de cada una.

---

## 20. Para leer / referencias

**Libros:**

- _Hands-on Machine Learning with Scikit-Learn, Keras & TensorFlow_ — Capítulo 2: _End-to-End Machine Learning Project_ y Capítulo 3: _Classification_.

**Documentación de Scikit-learn:**

- [Scikit Learn: KNN Classifier](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html)
- [Scikit Learn: Logistic Regression](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html)
- [Scikit Learn: Choosing the right estimator](https://scikit-learn.org/stable/machine_learning_map.html)

---

## Resumen visual de conceptos clave (agregado)

| Concepto  | Fórmula clave                                  | Cuándo usarlo                                     |
| --------- | ---------------------------------------------- | ------------------------------------------------- |
| Accuracy  | $(TP+TN)/(TP+TN+FP+FN)$                        | Clases balanceadas, primer vistazo                |
| Precision | $TP/(TP+FP)$                                   | Cuando el costo de un falso positivo es alto      |
| Recall    | $TP/(TP+FN)$                                   | Cuando el costo de un falso negativo es alto      |
| F1-Score  | $2 \cdot \frac{P \cdot R}{P+R}$                | Cuando se busca un balance entre P y R            |
| ROC-AUC   | Área bajo la curva TPR vs FPR                  | Comparar modelos independientemente del threshold |
| RMSE      | $\sqrt{\frac{1}{m}\sum(h(x^{(i)})-y^{(i)})^2}$ | Regresión, penalizando errores grandes            |
| MAE       | $\frac{1}{m}\sum h(x^{(i)})-y^{(i)}$           |                                                   |

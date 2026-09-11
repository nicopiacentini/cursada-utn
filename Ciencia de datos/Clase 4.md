# Machine learning: Los algoritmos que aprenden con datos
## Fundamentos de Machine Learning
*   Un programa aprende de la experiencia E, respecto a una tarea T, si su desempeño medido por P mejora con la experiencia. Tengo una tarea y un algoritmo la hace. Mido su desempeño respecto a una métrica. Mientras mas experiencia mejor hace la tarea
* **Set de entrenamiento**: Es la experiencia y tiene los datos
* **Modelo**: Es el programa y la abstraccion del algoritmo. 
* **Measure**: Es la medida de desempeño

#### Ejemplo con filtro de spam de mails
Set de entrenamiento: Conjunto de emails pasados que ya fueron clasificados en spam o no spam
Modelo: Ejecuta la tarea T de clasificar emails
Measure: Evaluo que tantos mails detecto correctamente del total. 

#### Paso a paso
1. Investigo dataset de mails clasificados
2. Identifico patrones comunes
3. Hago pseudocodigo o logica para identificar patrones del paso 2
4. Escribo programas de deteccion
5. Pruebo el programa y vuelvo al paso 2 si no funciona. 
Una vez hecho esto, para conseguir mas datos tengo que **desplegar** y llevarlo a la realidad para que asi mejore.

> [!important] Desarrollo de ML
> A diferencia de lo anterior que busca un patrones "a mano", la idea de ML es que el propio programa mismo detecte los patrones y mejore solo.  

  **Desarrollo Tradicional vs. ML:**
    *   En el desarrollo tradicional, el programador diseña manualmente la lógica y escribe las reglas de detección.
    *   En Machine Learning, se provee un set de entrenamiento (datos) para que el modelo defina las reglas automáticamente.
    *   Los programas resultantes son más cortos, fáciles de mantener y altamente adaptables al cambio.
*   **Scikit-Learn:** Es la librería principal de ML en Python, open-source y construida sobre NumPy y SciPy, utilizada para preprocesar datos, entrenar algoritmos y validar la performance.
#### Entrenamiento de modelo
Existen muchos algoritmos. Para todos el objetivo es generizar los datos: Buscar parametros optimos del modelo.

##### ML util cuando
1. La loagica es muy compleja o imposible de programar y mantener tradicionalmente
2. Patrones que cambian en el tiempo
3. Extraer patrones y conocimiento de datos complejos y gran volumen
### Clasificacion de algoritmos
Se puede hacer: 
1. Por tipo de tarea que resuelve. 
2. Forma de generalizar nuevos datos
3. Aprendizaje incremental vs batch
4. Supervision del aprendizaje
Los criterios no son excluyentes

#### Por tipo de tarea
##### Regresion
Busca predecir un valor cuantitativo en base a el valor de una accion o temperatura cercana. 
##### Clasificacion
Tengo un dataset y quiero describirlo en labels o cajitas

## Tipos de Aprendizaje
> [!info] Clasificación por Supervisión
> Los algoritmos se dividen según cómo se generalizan a nuevos datos y el nivel de intervención humana.

*   **Aprendizaje Supervisado:** Utiliza datos etiquetados (muestras con su resultado deseado) para entrenar al modelo como guía.
    *   *Regresión:* Busca predecir un valor cuantitativo continuo, como el precio de una propiedad o la temperatura.
    *   *Clasificación:* Divide los datos en grupos o categorías predefinidas discretas, útil para filtros de Spam o categorización de riesgo.
*   **Aprendizaje No Supervisado:** Identifica relaciones y patrones en datos no etiquetados sin ayuda humana.
    *   *Clustering:* Agrupa instancias por comportamiento o características compartidas.
    *   *Reducción de Dimensiones:* Reduce el número de variables conservando las características principales, lo cual acelera el entrenamiento y disminuye el uso de espacio.
*   **Aprendizaje Reforzado:** El algoritmo interactúa con un entorno y aprende basándose en las recompensas y penalidades obtenidas por sus acciones.

## Evaluación y Obstáculos del Modelo
> [!warning] Riesgos de Ajuste
> *   **Over-fitting (Sobreajuste):** El modelo aprende de memoria el ruido de los datos, perdiendo la capacidad de generalizar correctamente.
> *   **Under-fitting (Subajuste):** El modelo resulta demasiado simple para representar la naturaleza del dataset.

*   **Problemas Principales:** Los algoritmos sufren con datos ruidosos, valores faltantes, falta de estandarización y *outliers* (valores atípicos alejados del grupo principal).
*   **Feature Engineering:** Consiste en extraer y crear nuevas características relevantes; tener menos features irrelevantes mejora directamente la performance.
*   **Validación de Datos:** 
    *   *Train/Test Split:* Se divide el dataset (ej. 80% entrenamiento, 20% prueba) para simular el error de generalización antes de producción.
    *   *Stratified Sampling:* Divide la población en grupos (stratas) y selecciona muestras manteniendo la proporción original de las clases.
    *   *Cross Validation (k-fold):* Divide el set en múltiples partes, entrenando y validando de forma iterativa y rotativa para encontrar la media.
*   **Optimización:** Los hiperparámetros (valores configurados antes del entrenamiento) se optimizan explorando listas sistemáticas (*Grid Search*) o iteraciones al azar (*Random Search*).

## Clasificación Binaria y Árboles de Decisión
*   La clasificación binaria fuerza al modelo a agrupar cada observación en una de dos opciones posibles (ej. Spam/No Spam, Fraude/Legítimo).
*   **Árbol de Decisión:** Divide el conjunto de datos en subconjuntos más pequeños evaluando valores específicos, generando una estructura jerárquica.
    *   Esta división genera fronteras de decisión cuadradas o rectangulares en el espacio de características.

```mermaid
graph TD
    A[Cielo] -->|Sol| B[Humedad]
    A -->|Nublado| C[Sí]
    A -->|Lluvia| D[Viento]
    B -->|Alta| E[No]
    B -->|Normal| F[Sí]
    D -->|Fuerte| G[No]
    D -->|Débil| H[Sí]
````

> [!note] Frontera de Decisión
> 
> Es la línea o superficie que separa las diferentes clases de predicción dentro del espacio vectorial.

- **Clasificación Multiclase:**
    
    - _OVA (One-Versus-All):_ Crea un modelo binario para cada clase contra el resto; la predicción final es la del mayor score.
        
    - _OVO (One-Versus-One):_ Entrena un modelo por cada par de clases, aumentando significativamente la carga computacional.
        

> [!tip] Métrica: Accuracy (Exactitud)
> 
> Proporción básica para medir qué tan bien clasifica el modelo.
> 
> $$Accuracy = \frac{\text{Predicciones Correctas}}{\text{Cantidad de predicciones}}$$

## Implementación: Dataset Titanic

El objetivo de este dataset clásico es predecir si un pasajero sobrevivió (1) o murió (0) basándose en atributos como sexo, edad y clase.

Python

``` python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

# Cargar dataset y aislar columnas relevantes
data = pd.read_csv('titanic.csv')
data = data[['Age', 'Fare', 'Pclass', 'Sex', 'Survived']].dropna()

# Codificar variables categóricas a binarias
data['Sex'] = data['Sex'].map({'male': 0, 'female': 1})

X = data[['Age', 'Fare', 'Pclass', 'Sex']]
y = data['Survived']

# Dividir 80% train / 20% test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Instanciar el árbol definiendo la altura máxima como hiperparámetro
model = DecisionTreeClassifier(max_depth=3)
model.fit(X_train, y_train)

# Evaluar
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)
```
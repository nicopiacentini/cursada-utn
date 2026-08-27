
___
# Introducción a Ciencia de Datos — Pandas, Numpy y Matplotlib

> [!info] Sobre esta clase Repaso de **Pandas** para manejo de datos, tipos de atributos/features, limpieza y preparación de datos, y visualización con **Matplotlib** y **Seaborn**.

## 1. Pandas

**Pandas** se utiliza para el manejo y análisis de datos.

- Facilita trabajar con datos estructurados como **tablas**
- La estructura principal es el **DataFrame**
- Soporta formatos comunes como CSV, Excel, JSON y bases de datos SQL

```bash
pip install pandas
```

> [!tip] Documentación oficial https://pandas.pydata.org/docs/index.html

## 2. Estructuras básicas de Pandas

### 2.1 Series

Estructuras **unidimensionales** que pueden almacenar datos de cualquier tipo. Se pueden crear a partir de cualquier secuencia (por ejemplo, una lista).

```python
import pandas as pd

series = pd.Series([10, 20, 30, 40])
print(series)
```

```text
0    10
1    20
2    30
3    40
dtype: int64
```

- El número de la izquierda es el **índice por defecto**
- La columna de la derecha son los **valores**
- `dtype` indica el **tipo de dato**

### 2.2 DataFrame

Estructuras **bidimensionales** con filas y columnas, donde cada columna puede tener un tipo de dato diferente.

#### A partir de un diccionario de listas

```python
data = {
    'Nombre': ['Juan', 'Ana', 'Luis'],
    'Edad': [28, 22, 35],
    'Ciudad': ['Buenos Aires', 'Rosario', 'Córdoba']
}
df = pd.DataFrame(data)
print(df)
```

```text
  Nombre  Edad        Ciudad
0   Juan    28  Buenos Aires
1    Ana    22       Rosario
2   Luis    35       Córdoba
```

#### Otras formas de crear un DataFrame

**Con una lista de listas** + nombres de columnas:

```python
data = [
    ['Juan', 28, 'Buenos Aires'],
    ['Ana', 22, 'Rosario'],
    ['Luis', 35, 'Córdoba']
]
df = pd.DataFrame(data, columns=['Nombre', 'Edad', 'Ciudad'])
```

**Con una lista de diccionarios** (cada diccionario es una fila):

```python
data = [
    {'Nombre': 'Juan', 'Edad': 28, 'Ciudad': 'Buenos Aires'},
    {'Nombre': 'Ana', 'Edad': 22, 'Ciudad': 'Rosario'},
    {'Nombre': 'Luis', 'Edad': 35, 'Ciudad': 'Córdoba'}
]
df = pd.DataFrame(data)
```

> [!note] Visualización en notebooks En Jupyter/Colab se puede usar `display(df)` en lugar de `print(df)` para una tabla con mejor formato. Google Colab, además, ofrece opciones de análisis automático desde esta función.

## 3. Operaciones comunes con Pandas

### 3.1 Lectura de archivos

**CSV** con `read_csv()`:

```python
df = pd.read_csv('archivo.csv')

# Con parámetros de codificación y separador
df = pd.read_csv('archivo.csv', sep=';', encoding='utf-8')
```

**Excel** con `read_excel()`:

```python
df = pd.read_excel('archivo.xlsx')

# Especificando hoja y columnas
df = pd.read_excel('archivo.xlsx',
                    sheet_name='hoja_1', usecols=['col_1', 'Col_2'])
```

### 3.2 Conexión a bases de datos (SQL)

```python
from sqlalchemy import create_engine

# Definir la conexión a la base de datos
engine = create_engine('postgresql+psycopg2://usuario:contraseña@localhost:5432/nombre_db')

# Leer datos desde la base de datos
query = "SELECT * FROM tabla"
df = pd.read_sql(query, con=engine)

# Subir un DataFrame a la base de datos
df.to_sql('nueva_tabla', con=engine, if_exists='replace', index=False)
```

> [!warning] Dependencia externa `create_engine` requiere la librería **SQLAlchemy** (`pip install sqlalchemy`) y, según el motor de base de datos, un driver adicional (ej. `psycopg2` para PostgreSQL, `pymysql` para MySQL).

### 3.3 Acceder a los datos

**Por columna** (devuelve una `Series`):

```python
print(df['Nombre'])   # también: df.Nombre

# Varias columnas a la vez (devuelve un DataFrame)
print(df[['Nombre', 'Edad']])
```

**Por fila**, usando el índice posicional con `.iloc[]`:

```python
print(df.iloc[0])
```

> [!tip] `.iloc` vs `.loc` `.iloc[]` accede por **posición numérica** (0, 1, 2...), mientras que `.loc[]` accede por **etiqueta de índice**. Si el índice del DataFrame no es el default (0,1,2...), ambos pueden dar resultados distintos.

### 3.4 Filtrar datos

Se indexa el DataFrame con una **Serie de booleanos**:

```python
df_filtrado = df[df['Edad'] > 30]

df_filtrado = df[df['Ciudad'].isin(['Córdoba', 'Mendoza'])]
```

### 3.5 Eliminar datos nulos

```python
df_sin_na = df.dropna(subset=['Ciudad'])

# Modifica el DataFrame original sin crear una variable nueva
df.dropna(subset=['Ciudad'], inplace=True)
```

> [!info] Sobre `inplace=True` La mayoría de los métodos que modifican un DataFrame aceptan `inplace=True` para aplicar el cambio directamente sobre la variable original.

### 3.6 Agregar nuevas filas

**Con `.loc[]`** (si el índice ya existe, se sobrescribe; si no, se agrega):

```python
df.loc[len(df)] = ['María', 30, 'Mendoza']
```

**Con `concat()`**:

```python
nueva_fila = pd.DataFrame({'Nombre': 'María', 'Edad': 30, 'Ciudad': 'Mendoza'})

df = pd.concat([df, nueva_fila], ignore_index=True)
```

> [!note] `ignore_index=True` reindexa el DataFrame resultante de forma consecutiva.

### 3.7 Agregar nuevas columnas

**Valor constante:**

```python
df['Nacionalidad'] = 'Argentina'
```

**Con una operación entre columnas:**

```python
df['Edad en 10 años'] = df['Edad'] + 10
```

**Aplicando una función:**

```python
def clasificar_edad(edad):
    if edad < 30:
        return 'Joven'
    else:
        return 'Adulto'

df['Clasificación'] = df['Edad'].apply(clasificar_edad)
```

## 4. Transformación de datos

|Método|Ámbito|Uso|
|---|---|---|
|`apply()`|Series o DataFrame (por fila/columna)|Aplica una función a lo largo de un eje|
|`applymap()`|DataFrame|Aplica una función elemento a elemento|
|`map()`|Series|Aplica una función o diccionario de mapeo|

### 4.1 `apply()`

```python
df = pd.DataFrame({
    'A': [1, 2, 3, 4],
    'B': [10, 20, 30, 40]
})

df['A'] = df['A'].apply(lambda x: x * 2)
```

### 4.2 `applymap()`

```python
df.applymap(lambda x: x * 2)
```

> [!warning] Deprecado en Pandas recientes Desde Pandas 2.1, `applymap()` está deprecado a favor de `df.map()`. Si trabajás con una versión reciente, revisá la documentación antes de usarlo en producción.

### 4.3 `map()`

```python
s = pd.Series([1, 2, 3, 4])

s.map({1: 'A', 2: 'B', 3: 'C', 4: 'D'})
```

## 5. Tablas Pivot con Pandas

Las **tablas pivot** permiten resumir, reorganizar y visualizar datos, observando la relación entre distintas variables. Se crean con `pivot_table()`.

```python
data = {
    'Año': [2021, 2021, 2022, 2022],
    'Producto': ['A', 'B', 'A', 'B'],
    'Ventas': [100, 150, 200, 250]
}
df = pd.DataFrame(data)

tabla_pivot = pd.pivot_table(df,
    values='Ventas', index='Año',
    columns='Producto', aggfunc='sum')
print(tabla_pivot)
```

`aggfunc` define la función de agregación (`'sum'`, `'mean'`, `'count'`, etc.) y admite una **lista** de funciones:

```python
tabla_pivot = pd.pivot_table(df,
    values='Ventas', index='Año',
    columns='Producto', aggfunc=['sum', 'mean'])
```

## 6. Unión de DataFrames (SQL join)

`merge()` permite emular un **join** de tablas al estilo SQL. Ambos DataFrames deben compartir una columna que sirva de **pivote**.

Tipos de join:

- **Inner join**: intersección entre ambos
- **Full outer join**: unión completa
- **Left outer join**: todo lo de la izquierda + coincidencias
- **Right outer join**: todo lo de la derecha + coincidencias

```python
df_puntos = pd.DataFrame({
    'Nombre': ['Juan', 'Nicolas', 'Ana', 'Facundo', 'Luis'],
    'Puntos': [12, 34, 19, 45, 23]
})

df_left = pd.merge(df, df_puntos, on='Nombre', how='left')
print(df_left)
```

> [!note] Valores nulos tras un merge En las filas sin correspondencia, Pandas asigna automáticamente `NaN`. Esto también ocurre al agregar una fila sin especificar valor para alguna columna.

## 7. Exploración de datos — tipos de atributos/features

### 7.1 Features categóricas/discretas

Cualitativos, discretos, con operaciones limitadas:

- **Nominales y binarios**: sin orden (igualdad / desigualdad)
- **Ordinales**: con orden definido (igualdad, desigualdad, mayor y menor)

### 7.2 Features numéricas

Cuantitativos, continuos o discretos, tratados como números:

- Admiten las operaciones anteriores más suma, resta (a veces multiplicación/división)

> [!warning] Cuidado con lo "numérico" que en realidad es categórico Existen atributos que parecen numéricos pero funcionalmente son categóricos (ej. **código postal**).

### 7.3 Ejemplos clasificados

|Atributo|Tipo|
|---|---|
|Cantidad de televisores en la casa|Numérico, discreto|
|Tamaño de un combo (Pequeñas, Medianas, Grandes)|Categórico (ordinal), discreto|
|Número de llamadas realizadas en un mes|Numérico, discreto|
|Duración de la llamada más larga|Numérico, continuo|
|Precio de un libro|Numérico, discreto (dos decimales)|
|Código postal|Categórico (nominal), discreto|
|Temperatura en grados Centígrados|Numérico, continuo|
|Temperatura en grados Farenheit|Numérico, continuo|
|Temperatura en grados Kelvin|Numérico, continuo|

### 7.4 Operaciones válidas por tipo de atributo

|Operación|Nominal|Ordinal|Numérico|
|---|---|---|---|
|Distribución y frecuencia|Sí|Sí|Sí|
|Mediana, percentiles|No|Sí|Sí|
|Suma, resta|No|No|Sí|
|Media/promedio, desviación estándar|No|No|Sí|
|Ratios, porcentajes de variación|No|No|Sí|

_Ejemplos: Sexo ('F' o 'M') → nominal · Calificación (E, MB, B, R) → ordinal · Temp. en Celsius → numérico._

## 8. Limpieza y preparación de datos

> [!quote] Sobre el proceso No es lo más divertido, pero puede llegar a ser **MUY** necesario.

### 8.1 Valores faltantes

Interfieren en los comportamientos y relaciones que el algoritmo intenta aprender. Muchos algoritmos no pueden trabajar directamente con valores faltantes.

> [!danger] Cuidado con el sesgo al ignorar faltantes En el ejemplo de la clase, al descartar filas con `Gender` faltante, el `%Play Cricket` calculado por género cambia sustancialmente (de 50%/50% a 75%/50%). Ignorar valores faltantes sin analizar su causa puede introducir sesgos en el análisis.

#### Estrategias

1. **Descartar mediciones**: remover del dataset las filas a las que le falte una feature
2. **Descartar atributo**: remover la columna completa del análisis
3. **Definir un valor**: completar con un valor por default (cero, promedio, mediana, moda, etc.)
4. **Predecir un valor**: completar usando un modelo entrenado con el subconjunto de datos completos

```python
# 1. Remover mediciones con valores nulos en un atributo
unDataFrame.dropna(subset=["atributo"])

# 2. Remover un atributo (columna) del DataFrame
unDataFrame.drop(columns=["atributo"])

# 3. Definir un valor, por ejemplo la mediana
mediaDelAtr = unDataFrame["atributo"].median()
unDataFrame["atributo"].fillna(mediaDelAtr)

# 4. Remover duplicados
unDataFrame.drop_duplicates(inplace=True)
```

### 8.2 Atributos categóricos

Los algoritmos suelen **preferir atributos numéricos** por los cálculos internos que realizan (distancias, productos matriciales, etc.).

**Label Encoding**: asigna un número entero a cada categoría.

**One-hot-encoding**: crea una columna binaria por cada categoría.

|ID|Color|
|---|---|
|1|Azul|
|2|Negro|
|3|Azul|
|4|Blanco|
|5|Blanco|

Label Encoding → Azul=0, Negro=1, Blanco=2

One-hot-encoding → columnas `Azul`, `Negro`, `Blanco` con 1/0

```python
# Label Encoding
from sklearn.preprocessing import LabelEncoder
df['Color_encoded'] = LabelEncoder().fit_transform(df['Color'])

# One-hot-encoding
df_ohe = pd.get_dummies(df, columns=['Color'])
```

> [!warning] Cuándo usar cada uno **Label Encoding** puede introducir una relación de orden inexistente entre categorías (por ejemplo, sugerir que Blanco > Negro > Azul), por eso es más apropiado para atributos **ordinales**. Para atributos **nominales** (sin orden), es preferible **One-hot-encoding**, aunque este último aumenta la dimensionalidad del dataset.

### 8.3 Feature Scaling (escalado de atributos)

Atributos en **diferentes escalas afectan negativamente** la performance de muchos algoritmos, especialmente los basados en distancias (ej. KNN, K-Means), ya que el atributo con mayor rango numérico domina el cálculo.

> [!example] Ejemplo del apunte Con Altura (1.47–1.72 m), Peso (45–72 kg) y Sueldo (8.300–105.000 ARS) sin escalar, la distancia euclidiana queda dominada por el Sueldo, distorsionando comparaciones entre registros.

#### Normalización / Min-Max

Lleva los valores al rango `[0, 1]`.

$$x_{new} = \dfrac{x - x_{min}}{x_{max} - x_{min}}$$

- Útil aunque los datos no sigan una distribución normal
- **Muy sensible a outliers**, ya que el mínimo y el máximo definen el rango

```python
from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()
df[['Altura', 'Peso']] = scaler.fit_transform(df[['Altura', 'Peso']])
```

#### Estandarización

Centra los datos en torno a la media, con desviación estándar 1.

$$x_{new} = \dfrac{x - \mu}{\sigma}$$

- Rango variable (puede dar problemas en algunos algoritmos que esperan rangos fijos)
- **Menos susceptible a outliers**
- Menos interpretable si los datos no siguen una distribución gaussiana

```python
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
df[['Altura', 'Peso']] = scaler.fit_transform(df[['Altura', 'Peso']])
```

### 8.4 Preparación de datos: manual vs. funciones

Encapsular las transformaciones en funciones reutilizables tiene varias ventajas:

- Aplicar las transformaciones reiteradas veces
- Reutilizar funciones en otros datasets y/o proyectos
- Migrar y utilizarlas en producción
- Probar varias transformaciones de forma simple

> [!tip] Buenas prácticas En proyectos reales, este tipo de transformaciones suele encapsularse en **Pipelines** de `scikit-learn` (`sklearn.pipeline.Pipeline`), lo que facilita mantener el mismo preprocesamiento entre entrenamiento y producción.

## 9. Visualización de datos

A la hora de explorar los datos, o de comunicar un análisis a determinada audiencia, la **visualización** es una herramienta fundamental. Es necesario entender:

- El **contexto** para el cual se necesita la visualización (si va acompañada de información extra)
- La herramienta de visualización adecuada
- La **estética** necesaria para resaltar lo que se quiere indicar

### 9.1 Matplotlib

Librería para generar gráficos (barras, histogramas, scatterplots, error-charts, etc.) a partir de código Python. Puede usarse en scripts, servidores web o Jupyter notebooks.

- Open source, licencia PSF
- https://matplotlib.org/

```python
import matplotlib.pyplot as plt
```

Ejemplo — histograma sobre un DataFrame `housing`:

```python
%matplotlib inline
# solo en un Jupyter notebook
import matplotlib.pyplot as plt

housing.hist(bins=50, figsize=(20, 15))
plt.show()
```

### 9.2 Seaborn

Construida sobre Matplotlib, ofrece:

- Estilo gráfico mejorado por defecto
    
- Integración sencilla con Pandas
    
- Capacidad de crear gráficos complejos de forma más intuitiva
    
- https://seaborn.pydata.org/
    

```python
import seaborn as sns
```

## 10. Ejemplos de gráficos según el tipo de análisis

### 10.1 Distribuciones

**Histograma**: muestra la distribución de una variable numérica dividiendo los datos en **intervalos (bins)** y contando cuántos valores caen en cada uno. Útil para ver la frecuencia y forma general de la distribución.

```python
plt.hist(data, bins=n)
```

**KDE plot** (Kernel Density Estimation): estimación suave de la densidad de probabilidad de una variable, sin depender del tamaño de los bins.

```python
sns.kdeplot(data)
```

**Violin Plot**: combina características de un **boxplot** y un **KDE plot** para mostrar la distribución de una variable numérica.

```python
sns.violinplot(x='categoría', y='valor', data=data)
```

Otras variantes relacionadas: _boxplots_, _strip charts_, _sina plots_, _stacked histograms_, _overlapping densities_, _ridgeline plot_.

```python
sns.boxplot(x='categoría', y='valor', data=data)
sns.stripplot(x='categoría', y='valor', data=data)
```

### 10.2 Cantidades y categorías

Cuando una cantidad depende de distintas categorías (y en general alguna es ordenable, ej. tamaños de una prenda):

```python
data.pivot_table(index='categoría', columns='subcategoría',
                  values='valor', aggfunc='sum').plot(kind='bar')
```

**Heatmap** para matrices de correlación:

```python
sns.heatmap(data.corr(), annot=True, cmap='coolwarm')
```

### 10.3 Proporciones

Similar al caso anterior, pero los valores no dependen "por partes" de la categoría sino que representan el total.

```python
plt.pie(data['valor'], labels=data['categoría'], autopct='%1.1f%%')

plt.bar(data['categoría'], data['valor'])
```

### 10.4 X vs Y

Cuando se quiere graficar la relación entre dos variables numéricas. Si los pares (x, y) pueden diferenciarse por categorías, se puede marcar con colores o formas.

```python
plt.scatter(x, y)

plt.scatter(data['variable_x'], data['variable_y'],
            s=data['tamaño'], alpha=0.5)
```

Variantes: _scatterplot_, _bubble chart_ (tamaño de punto como tercera variable), _paired scatterplot_ (con línea de tendencia), _slopegraph_ (para comparar valores entre dos momentos).

## 11. Resumen rápido — checklist

> [!success] Para tener a mano
> 
> - [ ] Cargar datos: `read_csv`, `read_excel`, `read_sql`
> - [ ] Explorar: `df.head()`, `df.info()`, `df.describe()`, `df.dtypes`
> - [ ] Clasificar atributos: nominal / ordinal / numérico
> - [ ] Tratar nulos: `dropna`, `fillna`, imputación
> - [ ] Codificar categóricos: Label Encoding / One-hot-encoding
> - [ ] Escalar numéricos: Min-Max / Estandarización
> - [ ] Visualizar: distribución → `hist` / `kdeplot` / `violinplot`; categorías → `bar` / `heatmap`; proporciones → `pie`; relación → `scatter`

> [!info] Nota `df.head()`, `df.info()` y `df.describe()` no aparecen explícitamente en las diapositivas originales, pero son los pasos habituales de exploración inicial previos a todo lo cubierto en esta clase — se agregan aquí como referencia práctica.
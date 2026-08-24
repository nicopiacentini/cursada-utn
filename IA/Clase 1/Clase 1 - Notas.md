- Hay 1 solo parcial.
- Cursada mayormente virtual
- mail - inteligenciaartificialutn@gmail.com
- Mandar el grupo al mail
- Para aprobar - los 2 tp aprobados antes de la cursada
- Los tp entregados para rendir el parcial
- Para promocionar - 75% de presentismo, aprobar ambos tp, Aprobar todo junto el parcial con 80% de cada tema.
- Parcial multiple choice - 10 preguntas mas teorico
##### En el parcial
![[Pasted image 20260812192131.png]]

- Los recuperatorios NO son multiple choice
___
# Tipos de Sistemas Inteligentes


---

## Contexto: Ingeniero en Sistemas de Información

- Problemas / Oportunidades → **Ingeniero en Sistemas de Información**
- → Producto Solución → **Procesos** + **Software**
- El Software puede ser:
    - **Software Tradicional**
    - **Sistemas Inteligentes**
- El Producto Solución impacta en la **Organización** y su **Sistema de Información**
El ingeniero en sw ofrece producto-solucion para resolver problemas de la organizacion. El producto esta compuesto por procesos y sw. El sw puede ser tradicional o **sistemas inteligentes**, que aplican tecnologías de la IA.

---

## Sistemas Inteligentes: definición

`Software Tradicional < Sistema Inteligente < Mente Humana`

> «Artefactos que presenten algún tipo de **comportamiento inteligente**»

- ✔ Pueden tomar decisiones consistentes con su objetivo → son **Racionales**
- ✔ No poseen todos los conocimientos ni todos los datos → **no son Omniscientes**
- ✔ No siempre son exitosos → **no son Infalibles**
- ✔ Soportan cambios del dominio → son **Flexibles y Robustos**

**Sistema Inteligente = Conocimientos + Tecnología**
Se van a analizar desde:
- Los conocimientos que requieren
- Las tecnologías que requieren - IA como ciencia
Para esto se aplican procesos ingenieriles

---

## Fuentes de Conocimientos

- **Fuentes Públicas** → Sistema Inteligente
	- Tambien son conocidas como explícitas. 
	- Son conocimientos ya formalizados en videos, imagenes, audio, etc.
	- Son mas fáciles de extraer para el sistema inteligente
	- No implica que sea gratuito
- **Fuentes Privadas** (Experto) -> Sistema inteligente
	- Es conocimiento que tienen personas en la mente, no esta escrito o computarizado como tal
	- El mas interesante de estos es el *conocimiento experto* pues sirve para alimentar **sistemas expertos**.
	- Es mas dificil de obtener

### Sistema Experto (SE)

> «Sistema cuyas prestaciones intentan emular parte del comportamiento de un experto humano para resolver ciertas tareas en un dominio determinado»

(El SE es un subconjunto dentro del universo de **Sistemas Inteligentes**)

---

## Familias de Tecnologías

- ➤ **IA Tradicional** (_Good Old-Fashioned Artificial Intelligence_)
- ➤ **Inteligencia Computacional & Machine Learning**

---

## IA Tradicional

La **Inteligencia Artificial Tradicional** propone la implementación de Sistemas Inteligentes basados en **Reglas, Métodos Heurísticos y Lógica**.

Sus prestaciones dependen más de la presencia **explícita** de un **cuerpo de conocimientos** que de la posesión de ingeniosos procedimientos computacionales.

Ejemplo de regla: `SI (...) ENTONCES ...`

Se posee un componente conocido como **base de conocimientos** que guarda todo el conocimiento de la IA. Generalmente se guarda en reglas o *if*s. Osea que los conocimientos estan en forma declarativa con inferencias.

### Sistema Basado en Conocimientos (SBC)

Componentes/Arquitectura:

- Base de Conocimientos (con reglas SI...ENTONCES)
	- Las reglas se obtienen solo de fuentes publicas
- Motor de Inferencias (con Métodos de Búsqueda)
- Interface de Entrada / Salida - Interactua con usuario u otro sistema
Diferencia donde se guardan los conocimientos sobre donde se infieren

### Sistema Experto Tradicional (SET)

Componentes (más completo que el SBC)/Arquitectura:

- Base de Conocimientos - Tambien tiene reglas declarativas pero pueden venir de fuentes publicas o de fuentes privadas.
- Base de Datos - Es donde se guarda la informacion sobre el problema puntual que quiero resolver. Se guardan datos de ingreso de usuario
- Memoria de Trabajo - Resultados de motor de inferencia. Funciona como memoria, donde se procesan datos viejos y nuevos para llegar a un resultado final
- Motor de Inferencias (con Métodos de Búsqueda) - Utiliza reglas de base de conocimientos y parametros de usuario de la base de datos
- Trazador de Explicaciones - Lugar donde usuario puede pedir explicación al motor de inferencias.
- Trazador de Consultas - Presenta al usuario interfaz para datos faltantes para el motor
- Manejador de Comunicaciones - Interfaz de IO para que usuario ingrese datos o sea consultado

---

## Inteligencia Computacional

**Inteligencia Computacional** es un término que engloba numerosas tecnologías de la IA y algoritmos, mayoritariamente de **inspiración biológica**, presentadas en contraposición a las basadas en el razonamiento simbólico clásico. Osea que se inspira en las redes neuronales cerebrales para el aprendizaje y la **evolucion** (Inteligencia computacional evolutiva).

> Estos sistemas NO tienen base de conocimientos o set de reglas. Las reglas no son explicitas sino que el conocimiento se guarda de otra forma

> Esta basado en redes neuronales. Forman parte de la **inteligencia computacional**

Incluye diferentes arquitecturas, tales como:

- Redes Neuronales Artificiales
- Computación Evolutiva
- Inteligencia de Enjambre
- Sistemas Inmunológicos Artificiales

---

## Machine Learning - Aprendizaje automático

**Machine Learning** (Aprendizaje Automático) es un subcampo de la Informática que busca definir, aplicar y estudiar algoritmos capaces de **generalizar comportamientos a partir de información suministrada en forma de ejemplos**. 
- Son algoritmos que pueden aprender a partir de ejemplos
- Con los ejemplos se puede generar modelos
- Con los modelos se puede generar información

Está estrechamente relacionado con la estadística y tiene fuertes lazos con la optimización matemática, pero se diferencia de éstas en que se centra más en el estudio de la **complejidad computacional** de los problemas y sus soluciones.

**Datos → Algoritmo → Modelo**
- El modelo es dinamico, es decir, se puede ejecutar en una computadora y emular el comportamiento de los datos.
- El algoritmo entrena al modelo, no lo genera. Entrenar busca determinar valores correctos para construir un modelo que represente al conjunto de ejemplos o datos disponibles
- El modelo pueden ser reglas, formulas matematicas, etc.
##### Algoritmos
Componen el proceso de **aprendizaje** y **entrenamiento** de los modelos

### Analogía (Pedro Domingos, _The Master Algorithm_)

> Machine Learning ≈ cultivar una planta

- Datos = agua
- Algoritmo = maceta y semilla
- Modelo = planta (= Sistema Inteligente)

### Flujo general

Fuentes Públicas + Fuentes Privadas → **Datos** (BD, documentos, imágenes, audio) → **Algoritmo ML** (Entrenar) → **Modelo** = Sistema Inteligente

##### Entrenamiento

> Entrenar: proceso que busca determinar (aprender) los valores correctos para construir un Modelo que representa un conjunto de Datos Disponibles (ejemplos)

 Segun el algoritmo puede realizarce una o muchas veces para mejorar el modelo

### Estrategias de Aprendizaje


- **Aprendizaje Supervisado** - Yo debo indicar cual es el resultado correcto para que contraste el modelo. Una vez que aprende debería devolver el resultado correcto
- **Aprendizaje No Supervisado** - El modelo solo recibe datos de entrada, no recibe datos de salida o de correccion. El modelo solo aprende caracteristicas de datos
- **Aprendizaje por refuerzo** - El modelo aprende mientras esta en produccion recibiendo feedback de usuario para mejorar.

#### Ejemplo — Aprendizaje Supervisado: Clasificación de Flores Iris

- Entrada (atributos): Largo Pétalo, Ancho Pétalo, Largo Sépalo, Ancho Sépalo
- Salida (clase/etiqueta): Setosa, Versicolor, Virginica

#### Ejemplo — Aprendizaje Supervisado: Predicción del Clima

- Entrada: Velocidad del Viento, Dirección del Viento
- Salida: Temperatura en AMBA

#### Ejemplo — Aprendizaje No Supervisado: Agrupación de Vestidos

- Entrada: Estilo, Precio, Rating, Talle, Temporada, Escote, Manga, Cintura, Material, Tela, Decoración, Patrón, Recomendado, Venta
- Salida: Grupo 1, Grupo 2, Grupo 3 (clusters, sin etiquetas previas)

### Tipos de Entrenamiento

- **Entrenamiento OFFLINE (o Estático)**: Fase de Entrenamiento → Instalación → Fase de Operación (el conocimiento no cambia tras la instalación)
	- Al poner el modelo en produccion, no aprende mas
- **Entrenamiento ONLINE (o Dinámico)**: Fase de Entrenamiento → Instalación → Fase de Operación (el modelo sigue aprendiendo/actualizándose durante la operación)
	- Cuando el modelo esta en produccion sigue aprendiendo
	- Puede llevar a que el modelo tienda a fallar
	- 

### Algoritmos (relacionados con el Teorema de "No Free Lunch")

> **No free lunch** ->No existe un algoritmo óptimo universal para todos los tipos de problema; cada algoritmo rinde mejor en ciertos dominios y peor en otros.

Tipos de algoritmos de ML:

- Algoritmos de Inducción
- Algoritmos de Regresión
- Algoritmos de Clustering
- Algoritmos basados en Bayes
- Redes Neuronales Artificiales
- …

---

## Sistemas Inteligentes: técnicas más comunes

- Algoritmos de Inducción y Regresión
- Sistemas Basados en Conocimientos
- Sistemas Expertos Tradicionales
- Algoritmos Genéticos
- Redes Neuronales Artificiales
- Lógica Difusa

---

## Clasificación de Sistemas Inteligentes

### Según la Tecnología

- **IA Tradicional**: Lógica Difusa, Sistemas Expertos Tradicionales, Sistemas Basados en Conocimientos
- **Machine Learning**: puente entre IA Tradicional e Inteligencia Computacional (algoritmos de inducción y regresión)
- **Inteligencia Computacional**: Redes Neuronales Artificiales, Algoritmos Genéticos

### Según los Conocimientos

- Fuentes Privadas + Fuentes Públicas → **Sistema Experto (SE)**
- El SE puede construirse tanto con técnicas de SBC/SET como con técnicas de Inteligencia Computacional (Lógica Difusa, Algoritmos Genéticos, Machine Learning, Redes Neuronales)

### Diagrama de Venn

- **SBC** (Sistemas Basados en Conocimientos) y **SE** (Sistemas Expertos) se **superponen** parcialmente
- Ambos están contenidos dentro del conjunto mayor: **Sistemas Inteligentes**
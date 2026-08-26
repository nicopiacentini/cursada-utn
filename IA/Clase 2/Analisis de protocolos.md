# Análisis de Protocolos

> [!abstract] Ubicación en el tema Técnica de **educción de conocimiento** (conocimiento _privado_, no documentado), dentro del proceso general de **Adquisición de Conocimientos**.

## Mapa del proceso de Adquisición de Conocimientos

- **Extracción de Conocimientos** → Conocimiento Público
    - Análisis de Documentación
    - Análisis de Datos
- **Educción de Conocimientos** → Conocimiento Privado
    - Entrevistas
    - Cuestionarios
    - Observación y Análisis de Tareas Habituales
    - Tormenta de Ideas
    - Clasificación de Conceptos
    - **Análisis de Protocolos** ⭐
    - Emparrillado

## ¿Qué es?

> [!quote] Definición Técnica para revelar lo que saben los expertos en un dominio: se le pide al experto que **piense en voz alta** mientras resuelve una tarea, obteniendo un protocolo verbal grabado.

- **Origen:** procedimiento definido por **Ericsson y Simon (1993)** sobre protocolos verbales.
- **Objetivo:** obtener información sobre los procedimientos que el experto usa para resolver problemas, pero que **no puede verbalizar de forma consciente** (conocimiento tácito).

## Etapas del Análisis de Protocolos

```mermaid
flowchart LR
    A[Grabación del Protocolo] --> B[Transcripción]
    B --> C[Codificación]
    C --> D[Interpretación]
```

### 1️⃣ Grabación del Protocolo

Tres pasos del Ingeniero del Conocimiento (IC) con el experto:

1. **El IC explica lo que espera del experto**
    - Objetivo de la técnica
    - Informar todo lo que piensa en el momento de la resolución
    - Instrucciones sobre qué debe hacer
2. **Puesta en situación**
    - Proponer pequeños ejercicios
    - Objetivo: darle confianza al experto
3. **Registro del Protocolo**
    - Se graba al experto resolviendo el caso real

> [!example] Caso de ejemplo usado en la presentación Diagnóstico médico en voz alta sobre un paciente con fiebre, dolor de garganta, tos y dolores musculares → se plantean dos hipótesis: **COVID-19** y **Gripe clase A (H1N1)**.

### 2️⃣ Transcripción

- El IC escucha la grabación y **transcribe el protocolo segmentándolo** en líneas numeradas.
- Se anotan también elementos no verbales:
    - `[acción del experto]`
    - `[x segundos]` (pausas/tiempos)

|Línea|Texto|
|---|---|
|1|El paciente|
|2|presenta fiebre superior a 38,|
|3|manifiesta un fuerte dolor de garganta y|
|4|tos seca. `[acción del experto]`|
|...|...|
|17|El análisis de laboratorio `[x segundos]`|

### 3️⃣ Codificación

Se identifican, línea por línea, los elementos del protocolo:

- **Conceptos**
- **Características**
- **Valores**
- **Relaciones**
- **Operadores**

#### a) Conceptos, características, valores y relaciones

|Texto|Tipo|
|---|---|
|paciente|Concepto|
|presenta|Relación|
|fiebre|Característica|
|superior a 38°|Valor|
|manifiesta|Relación|
|dolor de garganta|Característica|
|que estamos ante un|**Operador**|
|coronavirus COVID-19|Concepto/Valor|
|concluimos que se trata de una|**Operador**|
|gripe clase A|Concepto/Valor|

> [!tip] Tabla resumen Concepto–Característica–Valor Se puede armar una tabla consolidada. Existen dos criterios posibles para tratar los **diagnósticos** (COVID-19 / Gripe A):
> 
> - **Como Conceptos** → relaciones implícitas tipo `paciente TIENE coronavirus COVID-19`
> - **Como Valores** → característica `(diagnóstico)` del concepto `paciente`

#### b) Identificación de la búsqueda

Se arma un mapa/árbol del razonamiento:

- **Diagnóstico?**
    - _"que estamos ante un"_ → **Coronavirus COVID-19**
        - fiebre superior a 38°, dolor de garganta fuerte, tos seca, frecuencia respiratoria muy elevada, dolores musculares intensos
    - _"concluimos que se trata de una"_ → **Gripe Clase A**
        - dolor de cabeza persistente, mareo repentino, mareo de larga duración, análisis de laboratorio positivo al virus H1N1

#### c) Sinónimos, metacomentarios e incertidumbres

- **Sinónimos:** `paciente` ≈ `persona`
    - ⚠️ **No existen relaciones entre sinónimos** (`paciente ES UNA persona` / `persona ES UN paciente` → inválido)
- **Metacomentarios:** frases que no aportan conocimiento del dominio sino contexto del razonamiento
    - _"el paciente debe permanecer aislado por precaución dado lo contagioso del virus"_ → referencia a lo contagioso del COVID-19
    - _"en una segunda observación"_ → indica subetapas del razonamiento
- **Incertidumbre:** _"podríamos pensar"_ (línea 7) → marca un cambio de estado / duda del experto

### 4️⃣ Interpretación

Se traduce todo lo codificado en **reglas de razonamiento del experto**, con formato:

```
SI (condiciones)
...
ENTONCES (acciones)
```

donde cada condición tiene la forma `concepto.característica = valor`.

**Reglas obtenidas del ejemplo:**

```
SI (paciente.fiebre = superior a 38°) y
   (paciente.dolor_de_garganta = fuerte) y
   (paciente.tos = seca) y
   (paciente.frecuencia_respiratoria = muy elevada) y
   (paciente.dolores_musculares = intensos)
ENTONCES asignar (diagnóstico, coronavirus COVID-19)
```

```
SI (paciente.dolor_de_cabeza = persistente) y
   (mareo.tipo = repentino) y
   (mareo.duración = larga) y
   (análisis_de_laboratorio.resultado = positivo al virus H1N1)
ENTONCES asignar (diagnóstico, gripe clase A)
```

## Tipos de conocimiento que se obtienen

> [!info] Clasificación final El Análisis de Protocolos permite obtener **Conocimiento Privado**, tanto declarativo como procedimental.

- **Conocimiento Declarativo** → el "**qué**"
    - Identificación de Conceptos, Características, Valores y Relaciones
    - Identificación de Sinónimos, Metacomentarios e Incertidumbres
- **Conocimiento Procedimental** → el "**cómo**"
    - Identificación de la Búsqueda (incluidos los Operadores)
    - Interpretación (reglas SI-ENTONCES)

---

## Ver también

- [[Metodos-de-Busqueda]]
- #ingenieria-del-conocimiento
- #sistemas-expertos
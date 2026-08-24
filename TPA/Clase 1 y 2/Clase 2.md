# Clase 1 — Introducción a los Sistemas de Control y Modelado Matemático

> [!abstract] Idea central de la clase Un sistema de control **mide su propia salida, la compara con una referencia y corrige el error**. Esa idea — la realimentación — es anterior a la electrónica y a la computación, y es el hilo que conecta el regulador de Watt (1788) con un PLC moderno.

## 1. Por qué esto le importa a Sistemas de Información

La automatización es el punto exacto donde las **leyes físicas continuas** se encuentran con el **procesamiento lógico discreto**. Todo lo que sigue en la materia parte de esa frontera.

---

## 2. Perspectiva histórica (resumen)

|Época|Hito|Comentario|
|---|---|---|
|Antigüedad — Herón de Alejandría|Puertas automáticas de templos, dosificadores por flotador|Automatismos **sin modelo matemático**|
|1788 — Watt|Regulador centrífugo de vapor|Primer lazo de control realimentado industrial|
|1930-1950 — Nyquist, Bode, Evans|Teoría clásica de control|Nace el análisis en el dominio de la frecuencia: se puede calcular la estabilidad **antes** de construir el sistema. Clave para telefonía de larga distancia y aeronáutica|
|1960 en adelante|Microprocesadores y PLC|El controlador deja de ser un mecanismo y pasa a ser un **algoritmo** que corre en tiempo real|

> [!example]- Caso histórico: el regulador de Watt (primer lazo industrial) Es un controlador proporcional hecho enteramente de piezas mecánicas.
> 
> - **Variable controlada:** velocidad de giro del eje.
> - **Variable manipulada:** apertura de la válvula de vapor.
> - **Sensor:** las masas centrífugas, que "miden" la velocidad por la fuerza que sienten.
> - **Referencia:** longitud de las varillas y peso de las masas.
> 
> Lógica: _más velocidad → las masas suben → se cierra la válvula → menos velocidad._
> 
> ⚠️ **Error frecuente:** no regula por inercia. El volante suaviza el par, pero quien controla es la **geometría del varillaje**. Es la prueba de que un lazo de control no necesita electrónica.

---

## 3. Vocabulario esencial (según K. Ogata)

> [!info] Las dos variables que se confunden
> 
> - **Variable controlada** → la _salida_ del sistema; lo que se mide y se quiere regular (temperatura, velocidad, nivel, posición).
> - **Variable manipulada (señal de control)** → lo que el controlador _modifica_ para influir sobre la controlada (caudal de combustible, corriente al motor).
> 
> Regla mnemotécnica: **lo que se corrige es la controlada; la manipulada es el medio, no el fin.**

- **Planta (o proceso):** el equipo físico sobre el que se actúa (horno, tanque, brazo robótico, habitación).
- **Perturbación:** señal indeseada ajena al control que desvía la variable controlada.
    - _Externa:_ viento, apertura de una ventana, cambio de carga.
    - _Interna:_ fricción, envejecimiento, deriva térmica.
- La automatización existe precisamente para **compensar perturbaciones sin intervención humana**.

---

## 4. Lazo abierto vs. lazo cerrado

Es la distinción estructural que organiza toda la materia.

### Lazo abierto

- La salida **no** influye sobre la acción de control (no hay camino de retorno).
- Bajo costo, calibración manual, diseño simple.
- **No compensa perturbaciones.**
- _Caso:_ un temporizador con 555 monoestable que enciende un relé por un tiempo fijo `R·C`. Si el foco está quemado, el sistema no se entera.

### Lazo cerrado (realimentado)

- La salida se mide, se compara con la referencia, y de ahí nace la **señal de error**.
- Rechaza perturbaciones, pero exige analizar estabilidad.
- _Caso:_ brazo robótico con cámara — mide posición real, calcula error, acciona motores hasta que el error llega a cero.

---

## 5. Anatomía de un lazo cerrado

```
referencia r(t) →(+/−)→ [error e(t)] → Gc(s) → Ga(s) → Gp(s) → salida (variable controlada)
                    ↑                                              │
                    └──────────────── H(s) ← sensor/transductor ───┘
```

- **Error:** `e(t) = r(t) − b(t)`
- **Controlador `Gc(s)`:** decide la acción a partir del error (PID, PLC, software embebido).
- **Actuador `Ga(s)`:** aporta la potencia física. _No decide, ejecuta._
- **Planta `Gp(s)`:** el sistema a gobernar; su salida es la variable controlada.
- **Rama de realimentación `H(s)`:** el sensor mide la salida y el transductor la convierte en señal utilizable (ej. temperatura → 4-20 mA).

> [!tip] Trampa conceptual: el tanque con flotante Suele presentarse como "una planta simple de primer orden en lazo abierto". Es un **error**: el flotante mide el nivel (sensor), lo compara contra la varilla (referencia) y acciona la válvula (control) simultáneamente. Es en realidad **un lazo cerrado mecánico y autónomo** — el mismo principio que el regulador de Watt.

---

## 6. Modelado matemático

Un **modelo matemático** es una descripción cuantitativa del comportamiento de un sistema, deducida de leyes de conservación (Newton, Kirchhoff, balance de masa y energía).

- **Sistemas LTI** (lineales e invariantes en el tiempo): se describen con ecuaciones diferenciales ordinarias de coeficientes constantes. Son los únicos que la materia sabe tratar con las herramientas del curso.
- **Linealidad implica:**
    - _Homogeneidad:_ escalar la entrada escala la salida.
    - _Aditividad:_ la respuesta a una suma es la suma de las respuestas.
- **El problema:** casi ningún sistema real es lineal (saturación, fricción estática, histéresis, juego mecánico).

> [!note] Linealización Se elige un **punto de operación** y se aproxima la curva real por su recta tangente (primer término del desarrollo de Taylor). El modelo lineal solo vale en un entorno cercano a ese punto.

---

## 7. Primer orden vs. segundo orden

|-|Primer orden|Segundo orden|
|---|---|---|
|Derivadas|Una sola|Aparece la derivada segunda|
|¿Oscila?|Nunca — exponencial que se acerca al valor final|Puede oscilar según el amortiguamiento|
|Parámetro clave|Constante de tiempo `τ`|Amortiguamiento|
|Ejemplos|Transitorio térmico, nivel de tanque, carga de un capacitor|Circuito RLC, masa-resorte-amortiguador, casi cualquier lazo realimentado|

Respuestas posibles de un sistema de segundo orden:

- **Sobreamortiguada:** lenta, sin sobrepico.
- **Crítica:** la más rápida posible sin pasarse del valor final.
- **Subamortiguada:** rápida, pero con oscilación y sobrepico.

Los dos casos que se modelan en esta clase: **tanque con flotante** (1er orden) y **RLC serie** (2do orden).

---

## 8. Caso 1 — Tanque de agua con flotante (1er orden)

**Ecuación diferencial:** la variación del nivel es proporcional a lo que falta para llegar a la consigna.

$$\frac{dh(t)}{dt} = K \cdot (h_{ref} - h(t))$$

**Solución** (partiendo del tanque vacío, `h(0) = 0`):

$$h(t) = h_{ref} \cdot (1 - e^{-K t})$$

- El factor `1/K` fija la velocidad del transitorio: a mayor `K`, más rápido se llena.
- En `t = 3/K` el nivel alcanza ≈95 % del valor final — la firma típica de un sistema de primer orden (y del RLC sobreamortiguado, más adelante).
- Analogía cotidiana: el tanque del inodoro, que sube rápido al principio y se demora en los últimos centímetros.

---

## 9. Caso 2 — Circuito RLC serie (2do orden)

**Ley de tensiones de Kirchhoff:**

$$v_i(t) = v_R(t) + v_L(t) + v_C(t)$$

**Relaciones constitutivas:**

$$v_R = R,i(t) \qquad v_L = L,\frac{di(t)}{dt} \qquad i(t) = C,\frac{dv_C(t)}{dt}$$

**Sustituyendo todo en función de la salida `v_C(t)`:**

$$v_i = L C \frac{d^2 v_C}{dt^2} + R C \frac{d v_C}{dt} + v_C$$

Es una ecuación diferencial ordinaria de **segundo orden**. Resolverla en el tiempo para cada tipo de entrada (escalón, rampa, senoidal) es engorroso, y peor si se acoplan más mallas → esto motiva pasar al dominio de Laplace.

---

## 10. El dominio de Laplace (el "puente")

La transformada traslada una función del dominio del tiempo `t` al dominio complejo `s = σ + jω`:

$$\mathcal{L}{f(t)} = F(s) = \int_0^\infty f(t),e^{-st},dt$$

> En esta cátedra **no se demuestran** las transformadas — el objetivo es usarlas de forma operativa.

**Diccionario de traducción** (con condiciones iniciales nulas, es decir, el sistema parte del reposo: tanque vacío, capacitor descargado, resorte sin deformar):

|Operación en el tiempo|Operación en `s`|
|---|---|
|`a·f(t) + b·g(t)`|`a·F(s) + b·G(s)` (linealidad)|
|`df(t)/dt`|`s·F(s)` (si `f(0)=0`)|
|`d²f(t)/dt²`|`s²·F(s)`|
|`∫ f(t) dt`|`F(s)/s`|

**Derivar = multiplicar por `s`. Integrar = dividir por `s`.** Así, ecuaciones diferenciales se convierten en álgebra de polinomios.

---

## 11. Función de transferencia

$$G(s) = \frac{Y(s)}{X(s)} \qquad \Rightarrow \qquad Y(s) = G(s) \cdot X(s)$$

Cociente entre la transformada de la salida y la de la entrada, **bajo condiciones iniciales estrictamente nulas**.

- Es una **propiedad del sistema**: depende de la física y los parámetros, no de la entrada aplicada.
- Solo se aplica a sistemas **LTI**.
- Describe la relación entrada-salida, pero **no** el estado interno.
- No sirve si las condiciones iniciales no son nulas.

> [!tip] Analogía para Sistemas de Información La función de transferencia es como la **API de un sistema**: una caja negra con una entrada, una salida, y un contrato bien definido entre ambas. No importa la implementación interna.

**Convención de nomenclatura de la cátedra** (importante para la Clase 2):

- `G(s)` → plantas, controladores y ramas directas.
- `H(s)` → **exclusivamente** el bloque de realimentación.

---

## 12. Deducción analítica: función de transferencia del RLC serie

Partiendo de la ecuación diferencial (sección 9) y aplicando la transformada con condiciones iniciales nulas:

$$V_i(s) = LCs^2 V_C(s) + RCs,V_C(s) + V_C(s) = \left[LCs^2 + RCs + 1\right]V_C(s)$$

$$G(s) = \frac{V_C(s)}{V_i(s)} = \frac{1}{LCs^2 + RCs + 1}$$

Forma canónica de un sistema de segundo orden. Nótese que la corriente `i(t)` desaparece del resultado: la dinámica depende únicamente de `R`, `L` y `C` — es una propiedad del circuito, no de la señal aplicada.

---

## 13. Polos, ceros y estabilidad

**Criterio de estabilidad:** el sistema es estable si **todos sus polos tienen parte real negativa** (semiplano izquierdo del plano complejo `s = σ + jω`).

- **Ceros:** raíces del numerador → modifican la forma del transitorio.
- **Polos:** raíces del denominador → determinan estabilidad y tipo de respuesta.

### Ejemplo numérico

Con `R = 20 Ω`, `L = 10 H`, `C = 0,1 F`:

$$LC = 1 \qquad RC = 2$$ $$G(s) = \frac{1}{s^2 + 2s + 1} = \frac{1}{(s+1)^2}$$

- **Ceros:** ninguno (numerador constante).
- **Polos:** uno doble, real, en `s = −1`.
- Al estar en el semiplano izquierdo → **sistema estable**.
- Polo doble real → respuesta **críticamente amortiguada** (el retorno más rápido posible sin sobrepico).

> [!question] Para practicar Si se baja `R`, los polos se vuelven complejos conjugados y la respuesta empieza a oscilar (subamortiguada). Relacionar con la sección 7.

---

## 14. Síntesis — los 4 ejes de la clase

1. **La realimentación es la idea central:** medir la salida, compararla con la referencia y corregir el error permite automatizar con inmunidad a perturbaciones. Watt ya lo hacía con hierro.
2. **La física se escribe como ecuaciones diferenciales:** todo sistema dinámico se modela desde leyes de conservación.
3. **Laplace es el puente:** convierte cálculo diferencial en álgebra de polinomios.
4. **Los polos hablan:** su ubicación dice de inmediato si el sistema es estable y qué tipo de transitorio va a tener.

---

## 15. Lo que viene — Clase 2: Diagramas de bloques

- Representación gráfica de un sistema completo.
- Álgebra para combinar bloques en serie, paralelo y realimentación.
- Cómo mover puntos suma y bifurcaciones para desenredar lazos cruzados.
- Teorema de superposición y efecto de las perturbaciones.
- Taller: reducir un diagrama complejo a un único bloque equivalente.

> [!todo] Para preparar Repasar el apunte de cátedra y rehacer el ejemplo del RLC cambiando `R`, `L` y `C` para ver cómo se mueven los polos y cómo cambia la forma de la respuesta.

---

## Glosario rápido

|Término|Símbolo|Significado|
|---|---|---|
|Variable controlada|—|Salida que se desea regular|
|Variable manipulada|—|Entrada que el controlador ajusta|
|Planta|`Gp(s)`|Sistema físico a controlar|
|Controlador|`Gc(s)`|Decide la acción a partir del error|
|Actuador|`Ga(s)`|Aporta la potencia física|
|Sensor/transductor|`H(s)`|Mide la salida y la convierte en señal utilizable|
|Error|`e(t)`|`r(t) − b(t)`|
|Función de transferencia|`G(s)`|`Y(s)/X(s)`, con condiciones iniciales nulas|
# Modulación

La **modulación** es el proceso de insertar una señal digital o analógica en una portadora, de modo que esta se convierta en la **señal modulada**.

---

## Modulación en Amplitud (AM)

**Señal moduladora analógica**:
- Modifico la **amplitud** (A), pero **no** la frecuencia ni la fase.
- Se varía el **nivel** de la onda portadora (sube y baja la amplitud).
- La **frecuencia de la moduladora** debe ser menor que la de la portadora.
- La señal moduladora actúa como **envolvente** de la modulada.

**Señal moduladora digital**:
- Tengo **n amplitudes distintas** para representar los **n estados** posibles.
- En este caso se puede **suprimir una de las partes de la onda portadora**.
- Esto se conoce como **Modulación ASK** (por supresión de amplitud).

---

## Modulación en Frecuencia (FM)

- La **amplitud** y la **fase** permanecen constantes.
- Lo que varía es la **frecuencia** de la portadora.

**Moduladora analógica**:
- La señal modulada varía su frecuencia en **valores continuos**.
- Si baja la intensidad de la moduladora, **disminuye** la frecuencia de la modulada.

**Moduladora digital**:
- La señal modulada tiene tantas **frecuencias distintas** como niveles tenga la señal digital original.

---

## Modulación en Fase (PM)

- Se modifica la **fase**, mientras que la **frecuencia** y la **amplitud** quedan constantes.

### Tipos:

- **PSK convencional**:
  - Las variaciones de fase se refieren a la fase de la **portadora sin modular**.
  - Fase distinta para 0 y 1.

- **PSK diferencial (DPSK)**:
  - Las variaciones de fase se dan **solo al encontrar un 1**.
  - Si el bit es 0, **no hay cambio de fase**.

- **M-PSK**:
  - Se asigna una fase a cada nivel de la señal.
  - Se usa el **código de Gray** (o espejo) para minimizar errores.
  - Fórmula: `θ = 2π / cantidadDeNiveles` → define la distancia angular entre fases.

#### Variantes:
- **OQPSK (Offset QPSK)**:
  - Variante compensada que evita fluctuaciones mayores a 180° partiendo el cambio de fase en dos.

- **DPSK con bit de paridad**:
  - Agrega un **bit de paridad** a cada uno de los estados.

---

## Modulación QAM (Quadrature Amplitude Modulation)

- Modifica **simultáneamente** la **fase** y la **amplitud**.
- La **frecuencia** permanece constante.

**Características**:
- El número de niveles = cantidad de **amplitudes × fases**.
- Se requiere que la cantidad de niveles de la moduladora sea igual al producto anterior.
- Como la **distancia angular** entre fases es mayor que en modulación por fase, se cometen **menos errores**.
- Se pueden **combinar portadoras** para lograr este efecto.

**TCM (Trellis Coded Modulation)**:
- Combinación de **M-QAM y PSK**.

---

## Modulación por Pulsos

> La portadora es **digital**, un tren de pulsos.  
> Se modifican parámetros como: **amplitud**, **ancho del pulso** o **posición del pulso**.

### Ventajas
- La potencia se transmite en **ráfagas cortas**.
- **Permite multiplexión**.
- **Mayor calidad** que otras modulaciones.

### Desventajas
- Requiere **digitalizar señales analógicas**.
- **Mayor ancho de banda** necesario.
- Necesita **sincronización** entre transmisor y receptor.

---

## Modulación por Pulsos Analógica

> La señal modulada puede tomar **valores infinitos**.

- **PAM (Pulse Amplitude Modulation)**:
  - Se varía la **amplitud** según la señal moduladora.
  - La duración y posición del pulso no cambian.

- **PDM (Pulse Duration Modulation)**:
  - Se varía la **duración** de cada pulso según la moduladora.
  - No cambia amplitud ni posición.
  - Requiere mayor ancho de banda.

- **PPM (Pulse Position Modulation)**:
  - Se varía la **posición** del pulso según la moduladora.
  - No cambia amplitud ni duración.

---

## Modulación por Pulsos Digital

> La señal modulada toma **valores discretos**.

### Proceso de Digitalización

1. **Muestreo**:
   - Se toman muestras de la señal continua.
   - Según el **teorema de Nyquist**, se necesitan al menos el **doble de la frecuencia máxima** de la señal.

2. **Cuantificación**:
   - Convierte niveles de amplitud **continuos** en niveles **discretos** (potencias de 2).
   - Puede ser:
     - **Uniforme**: niveles cuánticos iguales.
     - **No uniforme**: más densos cerca de 0.

3. **Codificación**:
   - Se convierten los pulsos cuantificados en un grupo de **pulsos binarios** de amplitud constante.

---

### PCM (Pulse Code Modulation) o MIC

- Fases: **Muestrear, codificar, regenerar**.
- **Velocidad de transmisión**:
  - Se toma la frecuencia de muestreo por Nyquist.
  - Se calcula:  
    `Vm * log2(n)`  
    - `n = 128` para sistemas americanos  
    - `n = 256` para sistemas europeos

---

## Modulación Delta

- Se genera una **onda escalonada** que sigue las variaciones de la señal.
- Se usan impulsos:
  - De **igual polaridad** si la señal **crece**.
  - De **polaridad contraria** si la señal **disminuye**.

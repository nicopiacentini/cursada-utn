# Simulación Dinámica – Dinámica de Sistemas

Sirve para analizar sistemas continuos
##### Diferenia entre sistemas discretos y continuos
Hace que los resultados sean distintos. Para sistemas discretos los eventos se analizan uno por uno y no se intersecan. Para el otro los eventos fluyen en una cantidad de tiempo.

---

## ¿Qué es la Dinámica de Sistemas?

Metodología para entender el cambio utilizando **ecuaciones diferenciales**. El objetivo es construir un modelo matemático mediante un sistema dinámico que permita explicar el comportamiento a lo largo del tiempo.
Las variables estan relacionadas de tal forma que si se escribe la relacion entre ellas queda una **ecuacion diferencial**. Esto es asi porque las variables no incluyen el tiempo pero al agregarselo llega a un *sistema de ecuaciones diferenciales*. Son sistemas de ecuaciones  diferenciales para simulaciones **dinamicas y continuas**(ya que obtienen todas las variables en una iteracion)

- No puede hacer fors
- no sirve para EaE

#### Metodo continuo
- Metodo de euler
- Metodo de Runge-Kutta de 2 orden
- Metodo de Runge-Kutta de 4to orden
#### Metodo discreto
Grafico el sistema de ecuaciones. Agarro los vertices hasta encontrar la solucion optima. Luego itero por cada vertice hasta llegar al resultado optimo.

### Pasos

1. Dibujar el **Diagrama de Bloques** (también llamado _Diagrama de Forrester_), opcionalmente precedido por un _Diagrama Causal_. Es la relacion *grafica* entre ellas.
2. Escribir la relación matemática entre las variables → sistema de ecuaciones diferenciales (SED).
3. Resolver el SED con un método continuo: Euler, Runge-Kutta 2° o 4° orden. Aca estoy efectuando la simulacion.
4. Explotar los resultados con gráficos y/o tablas.

> [!note] Siempre para **Δt constante**

---

## Elementos del Diagrama de Bloques

| Elemento                          | Símbolo          | Descripción                                                                                                                                                                         |
| --------------------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Variable de Almacenamiento**    | Rectángulo       | Varía en la línea de tiempo. **Es la unica que** Tiene valor inicial. Acumulador. Representa una ecuación diferencial. Suele ser para *A = A +*.                                    |
| **Variable de Flujo**             | Válvula con nube | Mete o saca valores de la variable de almacenamiento / nube. Puede ser _positiva_ (ENTRA) o _negativa_ (SALE). Debe tener ecuación. **suma o resta una variable de almacenamiento** |
| **Función o Constante/converter** | Círculo          | Valores constantes a lo largo de la corrida, o funciones. Debe tener ecuación o valor. Variables de control (cte)                                                                   |
| **Conector**                      | Flecha           | Indica relacion de dependencia de un bloque respecto de otro.                                                                                                                       |
| **Nube**                          | Nube             | Es algo que excede mi sistema y no me interesa revisar del todo sino que solo quiero evidenciar que existe.                                                                         |

> **Conector:** si B depende de A y C, las flechas van de A y C hacia B, y en la ecuación de B deben aparecer A y C y solamente las letras A y C.

> Cuando tengo un almacenamiento pongo flujos segun cuantas entradas y salidas tenga.

---

## Ejercicio 13.a – Modelo de Stock (ventas concretadas que se pierden)
![[Pasted image 20260610191946.png]]
### Variables

|Tipo|Nombre|Descripción|
|---|---|---|
|Estado|`ST`|Stock|
|Estado|`FLL`|Fecha límite de llegada|
|Estado|`CAL`|Costo acumulado de llegada|
|Estado|`CVP`|Costo de ventas perdidas|
|Estado|`CEP`|Costo de espera de pedido|
|Dato (f.d.p.)|`VD`|Ventas diarias|
|Dato (f.d.p.)|`DE`|Demora de entrega|
|Control|`TP`|Tasa de pedido (100)|
|Control|`SR`|Stock de reposición (30)|
|Resultado|`CT`|Costo total|
#### Diagrama
- Stock *almacenamiento*
- entraST variable de flujo
- Sale ST variable de flujo
- nube => entraST Stock
- nube <= saleST stock
- almacenamiento FLL. Esto es porque debe tener valor inicial.
- converter TP
- TP -> Stock
- FLL -> Stock
- EntraFLL variable de flujo
- nube => entraFLL Stock
- StockReposicion constante/converter
- entraFLL -> Stock
- StockReposicion -> entraFLL
- ST -> entra
- FLL -> entraFLL
- DE converter
- DE -> entraFLL
- VD funcion
- VD -> saleST
- CAL almacenamiento
- CEP almacenamiento
- CVP almacenamiento
- ECAL variable de flujo => CAL
- ECVP variable de flujo => CVP
- ECEP variable de flujo => CEP
- Stock -> ECAL
- VD -> ECVP
- Stock -> ECVP
- Stock -> ECEP
- StockReposicion -> ECEP
- FLL -> ECEP
- CT converter
- CAL -> CT
- CVP -> CT
- CEP -> CT
### Ecuaciones

```
ST(t) = ST(t-Δt) + (ENTRA_ST – SALE_ST) * δt
  INIT ST = 0
  INFLOWS:  ENTRA_ST = IF (FLL = TIME) THEN TP ELSE 0
  OUTFLOWS: SALE_ST  = IF ST >= VD THEN VD ELSE ST
  
El ST actual es igual al ST del dt anterior mas todo lo que entra menos todo lo que sale por diferencial de t, es decir en todos los DT.

FLL(t) = FLL(t-Δt) + ENTRA_FLL * δt
  INIT FLL = 1
  INFLOWS:  ENTRA_FLL = IF (ST < SR AND FLL < TIME) THEN (TIME + DE – FLL) ELSE 0

Resto FLL para anular la entrada del sw que es obligatoria para la ecuacion diferencial.

CAL(t) = CAL(t-Δt) + ENTRA_CAL * δt
  INIT CAL = 0
  INFLOWS:  ENTRA_CAL = ST * 5

CVP(t) = CVP(t-Δt) + ENTRA_CVP * δt
  INIT CVP = 0
  INFLOWS:  ENTRA_CVP = IF (ST < VD) THEN (VD – ST) * 4 ELSE 0

CEP(t) = CEP(t-Δt) + ENTRA_CEP * δt
  INIT CEP = 0
  INFLOWS:  ENTRA_CEP = IF (ST <= SR AND FLL < TIME) THEN 50 ELSE 0
```

### Variables auxiliares (círculos)

```
VD  = ROUND(RANDOM(10; 40))
DE  = INT(RANDOM(2; 6))
TP  = 100        ← variable de control
SR  = 30         ← variable de control
CT  = CAL + CEP + CVP
```

> [!tip] Funciones útiles
> 
> - `RANDOM(x; y)` → número aleatorio equiprobable entre x e y
> - `ROUND(x)` → entero más cercano a x
> - `INT(x)` → parte entera de x

### Opción A – CT con stocks separados (CAL, CVP, CEP individuales)

CT es una **función** (círculo) que recibe flechas de CAL, CEP y CVP.

### Opción B – CT como variable de almacenamiento con un solo flujo

```
CT(t) = CT(t-Δt) + ENTRA_CT * δt
  INIT CT = 0
  INFLOWS:
    ENTRA_CT = (ST * 5)
             + IF (VD > ST) THEN (VD – ST) * 4 ELSE 0
             + IF (ST < SR AND FLL < TIME) THEN 50 ELSE 0
               ↑ CAL          ↑ CVP                   ↑ CEP
```

---

## Ejercicio – Teléfonos Públicos (Nomecomunico S.A.)

> Estudio de pérdidas en teléfonos públicos de Rosario. Δt = 1 hora.

### Variables

| Tipo          | Nombre    | Descripción                                 |
| ------------- | --------- | ------------------------------------------- |
| Dato (f.d.p.) | `CLLAM`   | Cantidad de llamadas por hora               |
| Dato (f.d.p.) | `ROBO`    | Monedas robadas por el técnico (U[150,300]) |
| Control       | `N`       | Período de visita del técnico (días)        |
| Estado        | `MONEDAS` | Cantidad de monedas en el teléfono          |
|               |           |                                             |
| Resultado     | `REC`     | Recaudación mensual del teléfono            |

### Ecuaciones

```
MONEDAS(t) = MONEDAS(t-dt) + (EM – SM) * dt
  INIT MONEDAS = 0
  INFLOWS:  EM = ROUND(CLLAM * 0.75)
  OUTFLOWS: SM = IF (MOD(TIME, 24*N) = 0) THEN MONEDAS ELSE 0

REC$(t) = REC$(t-dt) + (EREC) * dt
  INIT REC$ = 0
  INFLOWS:  EREC = IF (MOD(TIME, 24*N) = 0) THEN (MONEDAS – ROBO) ELSE 0

CLLAM = ROUND(SQRT(100 + 800 * RANDOM(0; 1)))
N     = 10
REC   = REC$ / TIME * 24 * 30
ROBO  = ROUND(RANDOM(150, 300))
```

> Eventos propios: _Entran monedas por llamadas_ / _Se vacía el teléfono por la visita del técnico_

---

## Ejercicio – Línea B de Subte (extensión Alem–Los Incas)

> Reprogramar FREC y FORM para minimizar acumulación en andén. Δt = 1 minuto.

### Variables

|Tipo|Nombre|Descripción|
|---|---|---|
|Dato (f.d.p.)|`FLLP`|Personas que llegan al andén por minuto (lineal, f(40)=2·f(20))|
|Control|`FREC`|Intervalo de arribo de cada tren|
|Control|`FORM`|Cantidad de vagones por tren|
|Estado|`CPANDEN`|Cantidad de personas en el andén|
|Estado|`CPE`|Contador de personas que esperaron|
|Estado|`MAY`|Mayor cantidad de personas en el andén|
|Resultado|`PPE`|% personas que esperaron (CPE / TIME)|
|Resultado|`MAY`|Mayor cantidad de personas en andén|

### Ecuaciones

```
CPANDEN(t) = CPANDEN(t-dt) + (LLEGA_PAS – LLEGA_TREN) * dt
  INIT CPANDEN = 0
  INFLOWS:  LLEGA_PAS  = FLLP
  OUTFLOWS: LLEGA_TREN = IF (MOD(TIME, FREC) = 0) THEN (FORM * 50) ELSE 0

CPE(t) = CPE(t-dt) + (E) * dt
  INIT CPE = 0
  INFLOWS: E = CPANDEN

MAY(t) = MAY(t-dt) + (EM) * dt
  INIT MAY = -1
  INFLOWS: EM = IF (CPANDEN > MAY) THEN (CPANDEN – MAY) ELSE 0

FLLP = ROUND(SQRT((RANDOM(0;1) * 1200 + 400)))
FORM = 2
FREC = 2
PPE  = CPE / TIME
```

> Eventos propios: _Llegan personas al andén_ / _Llega el tren_

---

## Notas metodológicas clave

- **Variable de almacenamiento:** siempre tiene INIT; el software genera automáticamente `X(t) = X(t-Δt) + flujos * δt`.
- **Flujo de entrada:** nube → válvula → rectángulo.
- **Flujo de salida:** rectángulo → válvula → nube.
- Marcar variable de almacenamiento como **"no negativa"** evita valores negativos sin necesidad de IF.
- `TIME` es una **palabra reservada** que lleva el tiempo del sistema.
- `MOD(TIME, k) = 0` dispara eventos cada _k_ unidades de tiempo.
- Las **variables de control** (círculos) se asignan antes de correr la simulación con valores fijos coherentes dentro del intervalo de la f.d.p.
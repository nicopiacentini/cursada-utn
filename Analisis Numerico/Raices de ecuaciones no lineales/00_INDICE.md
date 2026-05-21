# 📐 Raíces de Ecuaciones No Lineales — Índice

> Vault de estudio basado en el apunte de **Métodos Numéricos**.  
> Todos los métodos generan sucesiones ${x_i} \to \alpha$, donde $\alpha$ es la raíz buscada de $f(x)=0$.

---

## 🗺️ Mapa del vault

```
00_INDICE  ←  estás aquí
│
├── 01_Conceptos_Previos          ← errores, redondeo, Bolzano, criterios de paro
├── 02_Biseccion                  ★ ÉNFASIS
├── 03_Regula_Falsi
├── 04_Newton_Raphson             ★ ÉNFASIS
├── 05_Punto_Fijo                 ★ ÉNFASIS
├── 06_Raices_Multiples
└── 07_Comparacion_de_Metodos
```

---

## 📚 Notas

|Nota|Tema|Orden p|Radio R|
|---|---|---|---|
|[[01_Conceptos_Previos]]|Errores, Bolzano, criterios de paro|—|—|
|[[02_Biseccion]]|Método de bisección / búsqueda binaria|1 (lineal)|1/2|
|[[03_Regula_Falsi]]|Falsa posición / secantes entre extremos|1 (lineal)|depende de f|
|[[04_Newton_Raphson]]|Tangentes, Von Mises, Secantes|**2 (cuadrático)**|$\|f''/2f'\|$|
|[[05_Punto_Fijo]]|$x = g(x)$, convergencia en espiral/escalera|1 (lineal)|$\|g'(\alpha)\|$|
|[[06_Raices_Multiples]]|NR adaptado, orden de multiplicidad|2|—|
|[[07_Comparacion_de_Metodos]]|Tabla resumen y cuándo usar cada uno|—|—|

---

## ⚡ Regla de oro para elegir método

```
¿Puedo calcular f'(x)?
   SÍ → Newton-Raphson  (más rápido, p=2)
   NO → ¿Necesito garantía de convergencia?
           SÍ → Bisección  (siempre converge si cumple Bolzano)
           NO → Secantes o Regula Falsi
```

---

_Tags: #métodos-numéricos #raíces #cálculo-numérico_
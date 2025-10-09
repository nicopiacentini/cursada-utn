### Sistemas simetricos
Se abren y encriptan con la misma clase
#### Problema de la gestion y distribucion de las claves
cuando las cambio, hay mas de una por dispositivo, tengo que llevarlas a todos los que deben conocerla.
### Solucion
![[Pasted image 20251008192828.png]]
##### Propiedades de grupo
- Se cumple ley de composicion interna
- Asosiativa
- Existe unicidad y neutro(uno)
- Para cada elemento tiene un simetrico
- Este grupo es abeliano
- Es ciclico
#### Comunicacion diffie-helman
Elijen un primo para armar un grupo y uno de sus generadores. Por ejemplo **13** primo P y **6** generador G. Luego ambos generan una clave privada cada uno. Luego se selecciona una clave publica a partir de la privada de la forma:
`(G^clavePrivada) Mod P`
Luego se envian estas claves publicas entre ellos.
Cuando reciven la clave privada cada uno utiliza sus claves privadas propias para obtener la clave compartida de la forma
`(clavePublica^clavePrivada) Mod P`
Ahora es imposible operativamente de descifrar porque es un logaritmo con modulo.
#### Eleccion del primo
- Debe ser muy grande(al menos 4096 bits)
- Debe estar lejos de una potencia de 2
- (p-1) un numero par anterior, deberia tener un divisor q muy grande p = 2q + 1
- Los exponentes (claves privadas) aleatorias se deben elegir entre 1 y q-1
Para negociarlo entre computadoras, IPsec tiene modos de trabajo para que no se tome muccho en elegir
#### Problema
suceptible a man in the middle. No se quien es el otro. Entonces la idea para solucionarlo es Usando una clave publica y otra privada. La privada se conoce por diff-helman y la publica es conocida por todos. De esta forma Se con quien me comunico porque sino no me entiende el mensaje. 
Esta tiene un problema y es que es muy dificil de implementar ya que necesita mucho computo.
### RSA
#### Generación de Claves RSA

  

#### 1. Elegir dos números primos grandes `p` y `q`

Hoy en día se recomienda que sean de **al menos 1024 bits**.

  

> Nota: se sugiere que sean “primos fuertes”, aunque investigaciones posteriores indicaron que no era estrictamente necesario.

  

**Ejemplo:**

```

p = 3  

q = 11

```

  

---

  

#### 2. Calcular `N = p * q`

A este valor se lo llama **Módulo Público**.

  

**Ejemplo:**

```

N = 3 * 11  

N = 33

```

  

---

  

#### 3. Calcular φ(N) — *Función Phi de Euler*

```

φ(N) = (p - 1) * (q - 1)

φ(N) = (3 - 1) * (11 - 1)

φ(N) = 2 * 10 = 20

```

  

---

  

#### 4. Elegir `e` y `d` tales que sean inversos modulares entre sí  

Deben pertenecer al grupo multiplicativo `(φ(N), X)` y cumplir que:

```

(e * d) ≡ 1 (mod φ(N))

```

  

**Ejemplo:**

```

e = 3  

d = 7  

3 * 7 = 21 ≡ 1 (mod 20)

```

  

---

  

#### Claves resultantes

- **Clave pública:** `(e, N)` → `(3, 33)`  

- **Clave privada:** `(d, N)` → `(7, 33)` (debe conservarse secreta y segura)

#### Cifrado
# Introducción a Python

> [!summary] Objetivo  
> Esta clase introduce los fundamentos de Python necesarios para escribir programas simples: tipos de datos, variables, operadores, estructuras de control, colecciones, funciones, módulos/librerías y programación orientada a objetos.

---

## 1. ¿Por qué Python?

Python es un lenguaje conocido por su **legibilidad y simplicidad**, con un ecosistema amplio de bibliotecas y frameworks.

Sus principales características incluyen:

- **Open Source**
    
- Gran ecosistema de bibliotecas y frameworks.
    
- Comunidad activa y soporte.
    
- **Multiplataforma**.
    
- Uso en múltiples áreas:
    
    - Aplicaciones con interfaz gráfica.
        
    - Análisis y ciencia de datos.
        
    - Simulación numérica.
        
    - Desarrollo web e Internet.
        
    - Automatización de tareas.
        

---

## 2. Formas de ejecutar Python

### Scripts `.py`

Un script es un archivo de texto que contiene código Python que normalmente se ejecuta de principio a fin, de manera secuencial.

```python
print("Hola")
print("Esto se ejecuta después")
```

### Notebooks `.ipynb`

Los notebooks permiten combinar:

- Código.
    
- Texto.
    
- Gráficos.
    
- Visualizaciones.
    

Son especialmente útiles para análisis y ciencia de datos porque permiten ejecutar el código por partes.

---

# 3. Sintaxis básica

Python ejecuta las instrucciones **secuencialmente**, de arriba hacia abajo.

``` python
x = 5
y = 2 ** x

print(x)
print(y)

x = "Un texto"

print(x)
print(y)
```

Salida:

```bash
5
32
Un texto
32
```

La reasignación de `x` no modifica el valor que ya había sido calculado para `y`.

## Comentarios

Todo lo que aparece después de `#` en una línea es un comentario.

```
# Esto es un comentario
edad = 23
```

Los comentarios sirven para explicar el código, pero no deberían utilizarse excesivamente.

---

# 4. Tipos de datos

Python asocia diferentes comportamientos a distintos tipos de objetos.

|Tipo|Nombre|Ejemplo|
|---|---|---|
|Entero|`int`|`42`|
|Real|`float`|`3.14`|
|Texto|`str`|`"Hola"`|
|Booleano|`bool`|`True` / `False`|

Podemos consultar el tipo de un objeto utilizando `type()`:

```python
print(type(42))
print(type(3.14))
print(type("Hola"))
print(type(True))
```

Salida:

```
<class 'int'>
<class 'float'>
<class 'str'>
<class 'bool'>
```

---

# 5. Operaciones

## Operadores aritméticos

|   |   |   |   |
|---|---|---|---|
|Operador|Operación|Ejemplo|Resultado|
|`+`|Suma|`3 + 2`|`5`|
|`-`|Resta|`3 - 2`|`1`|
|`*`|Multiplicación|`3 * 2`|`6`|
|`/`|División|`8 / 2`|`4.0`|
|`//`|División entera|`10 // 8`|`1`|
|`**`|Potencia|`2 ** 3`|`8`|
|`%`|Resto|`10 % 8`|`2`|

Un detalle importante es que `/` devuelve un `float`, incluso cuando la división es exacta:

```
8 / 2
# 4.0
```

## Precedencia de operadores

Python respeta las reglas habituales de precedencia.

```
3 + 3 * 2
# 9
```

La multiplicación se realiza antes que la suma.

Podemos utilizar paréntesis para cambiar explícitamente el orden:

```
(3 + 3) * 2
# 12
```

> [!tip] Buena práctica  
> Utilizar paréntesis cuando el orden de evaluación pueda resultar ambiguo mejora la legibilidad del código.

---

# 6. Strings

Los textos se representan mediante `str` y se escriben entre comillas simples o dobles.

```python
nombre = "Nicolas"
saludo = 'Hola'
```

El operador `+` puede concatenar strings:

```python
"Hola " + "mundo"
# "Hola mundo"
```

Python determina qué operación corresponde según los tipos de los objetos.

---

## f-strings

Los **f-strings** permiten insertar expresiones dentro de un string.

Se coloca una `f` delante del texto y las expresiones se escriben entre `{}`.

``` python
nombre = "Nicolas"
edad = 23

print(f"Mi nombre es {nombre} y tengo {edad} años.")
```

También se pueden evaluar expresiones:

```
print(f"2 + 3 es igual a {2 + 3}")
```

Resultado:

```
2 + 3 es igual a 5
```

---

# 7. Variables

Una variable es un nombre asociado a un valor que puede reutilizarse durante la ejecución del programa.

```
edad = 23
altura = 1.82
nombre = "Nicolas"
```

Las variables pueden contener distintos tipos de datos.

### Reglas básicas para nombres

- Deben comenzar con una letra o `_`.
    
- No pueden comenzar con un número.
    
- No pueden contener espacios.
    
- Python distingue mayúsculas de minúsculas.
    

Por ejemplo:

```
variable = 10
Variable = 20

print(variable)  # 10
print(Variable)  # 20
```

### Nombres descriptivos

Preferir:

```
edad = 23
altura = 1.82
```

sobre:

```
e = 23
a = 1.82
```

Los nombres descriptivos hacen que el código sea más fácil de entender.

---

# 8. PEP 8 y estilo de código

**PEP 8** es la guía de estilo de Python. Su objetivo es que el código sea consistente, legible y fácil de mantener.

Algunas reglas importantes:

- Usar **4 espacios** por nivel de indentación.
    
- Dejar espacios alrededor de operadores.
    
- Utilizar nombres claros en minúscula separados por `_`.
    
- Evitar líneas excesivamente largas.
    
- Utilizar comentarios cuando aporten información útil.
    

Ejemplo:

```
precio = 15
porcentaje_impuesto = 21
porcentaje_descuento = 30

impuesto = precio * (porcentaje_impuesto / 100)
descuento = precio * (porcentaje_descuento / 100)

precio_total = precio + impuesto - descuento

print(precio_total)
```

Es preferible esto a concentrar toda la lógica en una única expresión difícil de leer.

## Linters

Un **linter** analiza el código y puede detectar:

- Errores sintácticos.
    
- Problemas de estilo.
    
- Código potencialmente problemático.
    
- Variables sin utilizar o mal definidas.
    

Algunos linters mencionados en la clase:

- `Pylint`
    
- `Flake8`
    
- `Pyflakes`
    

---

# 9. Booleanos y comparaciones

Un booleano solo puede tener dos valores:

```
True
False
```

Las expresiones de comparación producen valores booleanos.

```
print(3 > 4)
# False

print(3 ** 2 != 2 ** 3)
# True
```

## Operadores de comparación

|   |   |
|---|---|
|Operador|Significado|
|`>`|Mayor que|
|`<`|Menor que|
|`>=`|Mayor o igual|
|`<=`|Menor o igual|
|`==`|Igual|
|`!=`|Distinto|

> [!warning] `=` vs `==`  
> `=` se utiliza para **asignar** un valor.
> 
> `==` se utiliza para **comparar** valores.

```
edad = 20       # asignación

edad == 20      # comparación
```

## Operador `in`

Permite verificar si un elemento pertenece a una secuencia.

```
"o" in "Euler"
# True
```

---

# 10. Condicionales

Los condicionales permiten ejecutar código dependiendo de una condición.

## `if`

```
llueve = True

if llueve:
    print("No te olvides el paraguas")
```

La condición debe terminar con `:` y el bloque debe estar indentado.

## `if / else`

```
numero = -42

if numero > 0:
    print("El número es positivo")
else:
    print("El número es cero o negativo")
```

`else` se ejecuta cuando la condición del `if` es falsa.

## `if / elif / else`

Cuando existen varios escenarios excluyentes:

```
saldo = 450
pasaje = 400

if saldo >= 2 * pasaje:
    print("Alcanza para dos viajes.")
elif saldo >= pasaje:
    print("Alcanza para un solo viaje.")
else:
    print("No alcanza para un viaje.")
```

`elif` significa esencialmente **"si la condición anterior fue falsa, probar esta otra condición"**.

## Operadores lógicos

Las condiciones pueden combinarse con:

- `and` → ambas condiciones deben ser verdaderas.
    
- `or` → al menos una condición debe ser verdadera.
    
- `not` → niega una condición.
    

```
num = 20

if num > 0 and not (num > 42):
    print("Es positivo y no es mayor a 42.")
```

---

# 11. Listas

Una lista permite agrupar múltiples elementos.

Se define utilizando `[]`:

```
verduras = ["Zanahoria", "Lechuga", "Cebolla", "Papa"]
```

Las listas:

- Mantienen un orden.
    
- Pueden modificarse.
    
- Pueden contener diferentes tipos de datos.
    
- Utilizan índices empezando desde `0`.
    

## Acceso por índice

```
print(verduras[0])
# Zanahoria

print(verduras[3])
# Papa

print(verduras[-1])
# Papa
```

Los índices negativos permiten acceder desde el final.

---

## Slicing

La sintaxis:

```
lista[inicio:fin]
```

permite obtener una porción de una lista.

El límite `fin` **no se incluye**.

```
lista = [1, 2, 3, 4, 5]

print(lista[:3])
# [1, 2, 3]

print(lista[1:3])
# [2, 3]
```

---

## Operaciones y métodos útiles

### `len()`

Obtiene la cantidad de elementos:

```
lista = [1, 2, 3, 4]

len(lista)
# 4
```

### `in`

```
2 in [1, 2, 3]
# True
```

### Concatenación

```
[1, 2] + [3, 4]
# [1, 2, 3, 4]
```

### Repetición

```
[1, 2, 3] * 2
# [1, 2, 3, 1, 2, 3]
```

### `append()`

Agrega un elemento al final:

```
lista = [1, 2, 3]

lista.append(4)

print(lista)
# [1, 2, 3, 4]
```

`append()` agrega el elemento como una única unidad. Por eso:

```
lista.append([4, 5, 6])
```

produce:

```
[1, 2, 3, [4, 5, 6]]
```

### Otros métodos

```
lista.remove(2)   # elimina la primera aparición de 2
lista.index(3)    # índice de la primera aparición de 3
lista.count(3)    # cantidad de apariciones de 3
lista.sort()      # ordena la lista
```

---

# 12. Ciclo `for`

El `for` permite repetir código recorriendo elementos de una colección o una secuencia.

En lugar de:

```
print(verduras[0])
print(verduras[1])
print(verduras[2])
print(verduras[3])
```

podemos hacer:

```
for elemento in verduras:
    print(elemento)
```

Esta es normalmente la forma más clara de recorrer una lista cuando no necesitamos el índice.

---

## `range()`

`range()` genera una secuencia de números.

```
for n in range(0, 4):
    print(n)
```

Produce:

```
0
1
2
3
```

El límite superior no se incluye.

También podemos combinar `range()` con `len()`:

```
for n in range(len(verduras)):
    print(verduras[n])
```

---

## `enumerate()`

Cuando necesitamos tanto el índice como el valor:

```
for indice, valor in enumerate(verduras):
    print(f"Índice: {indice}, Valor: {valor}")
```

Ejemplo:

```
Índice: 0, Valor: Zanahoria
Índice: 1, Valor: Lechuga
Índice: 2, Valor: Cebolla
Índice: 3, Valor: Papa
```

---

## `zip()`

Permite recorrer simultáneamente varias secuencias:

```
nombres = ["Ana", "Luis", "Pedro"]
edades = [23, 34, 19]

for nombre, edad in zip(nombres, edades):
    print(f"{nombre} tiene {edad} años")
```

Resultado:

```
Ana tiene 23 años
Luis tiene 34 años
Pedro tiene 19 años
```

---

# 13. Ciclo `while`

`while` ejecuta un bloque mientras una condición sea verdadera.

A diferencia del `for`, el `while` requiere que nosotros controlemos la condición y, normalmente, el estado que hace avanzar el ciclo.

```
indice = 0

while indice < len(verduras):
    print(verduras[indice])
    indice += 1
```

### `for` vs `while`

`**for**` es apropiado cuando queremos recorrer una colección o una secuencia.

```
for elemento in lista:
    print(elemento)
```

`**while**` es apropiado cuando queremos repetir una operación mientras se cumpla una condición.

```
while saldo > 0:
    saldo -= 10
```

> [!warning] Evitar ciclos infinitos  
> Si la condición de un `while` nunca pasa a ser falsa, el ciclo continúa indefinidamente.

---

# 14. Tuplas

Una tupla es similar a una lista, pero es **inmutable**.

```
tupla = (1, 2, 3)
```

Podemos acceder mediante índices:

```
print(tupla[1])
# 2
```

Y utilizar algunos métodos:

```
tupla.index(2)
# 1
```

## ¿Cuándo usar una tupla?

Son útiles para:

- Datos que no deberían modificarse.
    
- Claves de diccionarios.
    
- Retornar múltiples valores desde una función.
    

## Desempaquetado

```
tupla = (1, 2, 3)

a, b, c = tupla

print(a, b, c)
# 1 2 3
```

---

# 15. Diccionarios

Un diccionario almacena información como pares:

```
clave → valor
```

Se define utilizando `{}`:

```
usuario = {
    "nombre": "Juan",
    "edad": 30,
    "ciudad": "Buenos Aires"
}
```

Las claves deben ser **únicas e inmutables**.

---

## Acceder a valores

Mediante `[]`:

```
print(usuario["nombre"])
# Juan
```

O mediante `get()`:

```
print(usuario.get("profesion", "No disponible"))
# No disponible
```

`get()` es útil cuando una clave puede no existir.

---

## Modificar y agregar datos

Modificar:

```
usuario["edad"] = 31
```

Agregar:

```
usuario["profesion"] = "Ingeniero"
```

---

## Métodos útiles

```
usuario.keys()
usuario.values()
usuario.items()
```

Por ejemplo:

```
for clave, valor in usuario.items():
    print(f"{clave}: {valor}")
```

También:

```
usuario.pop("edad")        # elimina una clave y devuelve su valor
usuario.update({"edad": 32})
usuario.clear()            # elimina todos los elementos
```

---

# 16. Sets

Un `set` es una colección:

- Sin orden fijo.
    
- Sin elementos duplicados.
    
- Mutable.
    

```
conjunto = {1, 2, 3, 4}
```

También podemos eliminar duplicados:

```
numeros = [1, 2, 2, 3, 3, 3, 4]

sin_duplicados = set(numeros)

print(sin_duplicados)
# {1, 2, 3, 4}
```

No podemos acceder a un set mediante índices:

```
# No corresponde:
conjunto[0]
```

## Operaciones comunes

```
a = {1, 2, 3}
b = {3, 4, 5}

a.union(b)
# {1, 2, 3, 4, 5}

a.intersection(b)
# {3}

a.difference(b)
# {1, 2}
```

Métodos importantes:

```
conjunto.add(5)
conjunto.remove(5)
conjunto.discard(5)
conjunto.clear()
```

`remove()` genera un error si el elemento no existe, mientras que `discard()` no.

---

# 17. Funciones

Una función es un bloque de código reutilizable que realiza una tarea específica.

Se define mediante `def`:

```
def saludar():
    print("Hola, bienvenido a Python!")

saludar()
```

Las funciones ayudan a:

- Reutilizar código.
    
- Dividir un problema grande en partes.
    
- Mejorar la legibilidad.
    
- Reducir duplicación.
    

---

## Parámetros

Una función puede recibir información:

```
def saludar_persona(nombre):
    print(f"Hola, {nombre}!")

saludar_persona("Nicolas")
```

También podemos utilizar argumentos nombrados:

```
saludar_persona(nombre="Nicolas")
```

---

## Parámetros por defecto

Podemos establecer un valor predeterminado:

```
def saludar_persona(nombre="Nicolas"):
    print(f"Hola, {nombre}!")

saludar_persona()
saludar_persona("Facundo")
```

---

## `return`

Una función puede devolver un valor:

```
def sumar(a, b):
    return a + b

resultado = sumar(5, 3)

print(resultado)
# 8
```

`return` termina la ejecución de la función y entrega el valor al código que la llamó.

---

# 18. Variables locales y globales

Una variable definida dentro de una función tiene alcance local.

```
def duplicar(x):
    return 2 * x

x = 1

print(duplicar(x))
# 2

print(x)
# 1
```

El `x` utilizado dentro de la función es un parámetro local; no modifica automáticamente la variable global.

Python permite acceder explícitamente a una variable global mediante `global`, aunque generalmente conviene evitar depender de estado global cuando puede resolverse pasando parámetros y retornando valores.

---

## Objetos mutables e inmutables

Al trabajar con funciones es importante distinguir entre objetos que pueden modificarse y objetos que no.

Ejemplo con una lista:

```
def agregar_cuatro(lista):
    lista.append(4)

mi_lista = [1, 2, 3]

agregar_cuatro(mi_lista)

print(mi_lista)
# [1, 2, 3, 4]
```

La lista fue modificada porque es mutable.

Entre los objetos mencionados:

**Mutables:**

- Listas.
    
- Diccionarios.
    
- Sets.
    

**Inmutables:**

- Enteros.
    
- Strings.
    
- Tuplas.
    

---

# 19. Type hints y documentación

Python permite indicar los tipos esperados de los parámetros y del retorno.

```
def calcular_precio(precio: float, impuesto: float = 0.21) -> float:
    return precio * (1 + impuesto)
```

Esto se conoce como **type hinting**.

No obliga por sí mismo a Python a utilizar esos tipos, pero facilita:

- Comprender qué espera una función.
    
- Detectar problemas mediante herramientas de análisis.
    
- Trabajar mejor con IDEs.
    
- Documentar APIs y funciones.
    

También podemos documentar una función mediante un **docstring**:

```
def calcular_precio(precio: float, impuesto: float = 0.21) -> float:
    """
    Calcula el precio final aplicando un impuesto.

    Args:
        precio: Precio original.
        impuesto: Porcentaje de impuesto expresado como decimal.

    Returns:
        Precio final.
    """
    return precio * (1 + impuesto)
```

---

# 20. Librerías y módulos

Una librería es código reutilizable que proporciona funcionalidades que podemos incorporar a nuestros programas.

Para utilizar un módulo se utiliza `import`.

Por ejemplo, `math`:

```
import math

print(math.sqrt(16))
# 4.0
```

También podemos importar directamente una función:

```
from math import sqrt

print(sqrt(16))
```

Podemos utilizar un alias:

```
import math as m

print(m.sqrt(16))
```

También existe:

```
from math import *
```

aunque generalmente es preferible importar explícitamente lo que necesitamos para evitar ambigüedades.

## Librerías mencionadas

Algunos módulos de la biblioteca estándar:

- `math`
    
- `datetime`
    
- `re`
    
- `random`
    
- `os`
    
- `sys`
    

Algunas librerías utilizadas en ciencia de datos que requieren instalación:

- `numpy`
    
- `pandas`
    
- `matplotlib`
    
- `scikit-learn`
    

---

# 21. Programación Orientada a Objetos

La **Programación Orientada a Objetos (POO)** organiza el código alrededor de objetos.

Un objeto puede representar una entidad con:

- **Atributos** → datos o características.
    
- **Métodos** → comportamientos o acciones.
    

La POO ayuda a:

- Reutilizar código.
    
- Organizar programas.
    
- Mejorar legibilidad.
    
- Facilitar mantenimiento.
    

---

## Clase

Una **clase** es un molde o plantilla para crear objetos.

```
class Perro:
    pass
```

La clase define qué estructura y comportamiento tendrán sus instancias.

## Objeto

Un **objeto** es una instancia de una clase.

```
mi_perro = Perro()
```

Podemos crear múltiples objetos de la misma clase:

```
perro_1 = Perro()
perro_2 = Perro()
```

Cada instancia representa un objeto independiente.

---

## Atributos

Los atributos representan características del objeto.

```
class Perro:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad
```

En este caso:

- `nombre` es un atributo.
    
- `edad` es un atributo.
    
- `self` representa la instancia actual.
    

---

## Métodos

Los métodos son funciones definidas dentro de una clase y representan comportamientos.

```
class Perro:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def ladrar(self):
        print(f"{self.nombre} está ladrando.")
```

Podemos crear una instancia y utilizar su método:

```
mi_perro = Perro("Max", 6)

mi_perro.ladrar()
```

Salida:

```
Max está ladrando.
```

---

# 22. `__init__` y `self`

`__init__` es un método especial que se ejecuta automáticamente al crear una instancia.

Se utiliza principalmente para inicializar sus atributos.

```
class Usuario:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad
```

Al crear el objeto:

```
usuario = Usuario("Ana", 23)
```

Python ejecuta el `__init__` y establece:

```
usuario.nombre == "Ana"
usuario.edad == 23
```

`self` representa la instancia concreta sobre la que se está trabajando.

---

# 23. Otros métodos especiales (_dunder methods_)

Los métodos con nombres como `__init__` o `__str__` se conocen informalmente como **dunder methods** (_double underscore methods_).

Por ejemplo, `__str__` permite definir la representación textual de un objeto:

```
class Perro:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def __str__(self):
        return f"Nombre: {self.nombre}. Edad: {self.edad}"
```

Ahora:

```
mi_perro = Perro("Max", 6)

print(mi_perro)
```

Produce:

```
Nombre: Max. Edad: 6
```

---

# 24. Composición

La **composición** permite que un objeto contenga otro objeto como atributo.

Por ejemplo, un estudiante puede tener asociado un curso:

```
class Curso:
    def __init__(self, nombre, duracion):
        self.nombre = nombre
        self.duracion = duracion

    def detalle_curso(self):
        return f"Curso: {self.nombre}, Duración: {self.duracion} horas."


class Estudiante:
    def __init__(self, nombre, curso):
        self.nombre = nombre
        self.curso = curso

    def mostrar_detalles(self):
        print(f"Estudiante: {self.nombre}")
        print(self.curso.detalle_curso())
```

Creamos los objetos:

```
curso_python = Curso("Python", 3)

estudiante = Estudiante(
    "Ana",
    curso_python
)

estudiante.mostrar_detalles()
```

Resultado:

```
Estudiante: Ana
Curso: Python, Duración: 3 horas.
```

La relación puede entenderse como:

```
Estudiante
 ├── nombre
 └── curso ───────► Curso
                     ├── nombre
                     └── duracion
```

---

# 25. Ejercicios integradores

Los ejercicios de la clase combinan los conceptos anteriores.

## Par o impar

Utiliza `%` para determinar si un número es divisible por 2:

```
num = int(input("Ingresa un número: "))

if num % 2 == 0:
    print("El número es par")
else:
    print("El número es impar")
```

## Sumar números hasta ingresar `0`

Este ejercicio combina `while`, `input`, conversión de tipos, variables y acumulación:

```
suma = 0
num = 1

while num != 0:
    num = int(input("Ingrese un número: "))
    suma += num

print(f"El resultado final es: {suma}")
```

## Comprobar si un número es primo

Una implementación básica consiste en buscar divisores entre `2` y `num - 1`:

```
def es_primo(num: int) -> bool:
    for i in range(2, num):
        if num % i == 0:
            return False

    return True
```

## Eliminar vocales de un string

```
def cadena_sin_vocales(cadena: str) -> str:
    resultado = ""

    for letra in cadena:
        if letra not in ["a", "e", "i", "o", "u"]:
            resultado += letra

    return resultado
```

Ejemplo:

```
print(cadena_sin_vocales("Hola buenos dias"))
```

Resultado:

```
Hl bns ds
```

> [!note]  
> Esta implementación, tal como fue planteada en el ejercicio, contempla las vocales minúsculas.

## Jeringoso

El ejercicio de jeringoso combina listas, ciclos anidados, strings, `if` y `append()`.

La idea es recorrer cada palabra y, dentro de ella, recorrer cada letra:

```
lista_palabras = ["Hola", "Cierre", "DICCIONARIO", "Gato", "Perro"]
vocales = ["a", "e", "i", "o", "u"]

resultado = []

for palabra in lista_palabras:
    palabra = palabra.lower()
    palabra_final = ""

    for letra in palabra:
        if letra not in vocales:
            palabra_final += letra
        else:
            palabra_final += letra + "p" + letra

    resultado.append(palabra_final)

print(resultado)
```

Por ejemplo:

```
gato → gapatopo
```

---

# 26. Ejemplo de POO: Rectángulo

Una clase puede encapsular tanto los datos como las operaciones relacionadas:

```
class Rectangulo:
    def __init__(self, ancho, alto):
        self.ancho = ancho
        self.alto = alto

    def calcular_area(self):
        return self.ancho * self.alto

    def calcular_perimetro(self):
        return 2 * (self.ancho + self.alto)
```

Uso:

```
rectangulo = Rectangulo(ancho=5, alto=10)

print(rectangulo.calcular_area())
# 50

print(rectangulo.calcular_perimetro())
# 30
```

La ventaja es que las reglas relacionadas con un rectángulo quedan agrupadas dentro de la clase.

---

# 27. Mapa mental de los conceptos

```
Python
│
├── Sintaxis básica
│   ├── Variables
│   ├── Comentarios
│   ├── Tipos
│   └── Operadores
│
├── Control de flujo
│   ├── if
│   ├── elif
│   ├── else
│   ├── for
│   └── while
│
├── Estructuras de datos
│   ├── list
│   ├── tuple
│   ├── dict
│   └── set
│
├── Funciones
│   ├── Parámetros
│   ├── Valores por defecto
│   ├── return
│   ├── Variables locales/globales
│   └── Type hints
│
├── Módulos y librerías
│   └── import
│
└── Programación Orientada a Objetos
    ├── Clase
    ├── Objeto
    ├── Atributo
    ├── Método
    ├── __init__
    ├── __str__
    └── Composición
```

---

# 28. Ideas clave para recordar

> [!important] Conceptos fundamentales
> 
> - Python ejecuta las instrucciones secuencialmente.
>     
> - Las variables son nombres asociados a objetos/valores.
>     
> - `=` asigna; `==` compara.
>     
> - La indentación forma parte de la sintaxis de Python.
>     
> - `if / elif / else` permite tomar decisiones.
>     
> - `for` es especialmente útil para recorrer colecciones.
>     
> - `while` repite mientras una condición sea verdadera.
>     
> - Las listas son mutables; las tuplas son inmutables.
>     
> - Los diccionarios almacenan pares clave-valor.
>     
> - Los sets almacenan elementos únicos.
>     
> - Las funciones permiten reutilizar y organizar código.
>     
> - Los módulos permiten reutilizar código escrito en otros archivos/librerías.
>     
> - Una clase define una estructura; un objeto es una instancia de esa clase.
>     
> - Los atributos representan datos y los métodos representan comportamientos.
>     
> - `__init__` inicializa una instancia.
>     
> - La composición permite construir objetos utilizando otros objetos.
>
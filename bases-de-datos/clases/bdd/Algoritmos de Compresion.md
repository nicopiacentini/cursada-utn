# Algoritmos de Compresión

## Tipos de algoritmos

- **Con pérdida**:  
  Se pierde algo de información durante la compresión.  
  Se utiliza principalmente para archivos multimedia.

- **Sin pérdida**:  
  Se comprimen archivos sin perder información, por lo tanto son reversibles.

---

## ¿Por qué es posible comprimir un archivo?

- En el código ASCII existen unos **200 símbolos útiles**, pero también hay **56 caracteres inútiles**.
- El alfabeto tiene **longitud fija** (todos los caracteres ocupan lo mismo).
- Como **algunos caracteres se usan más que otros**, Huffman propone cambiar el alfabeto para que la representación sea más eficiente.

---

## Algoritmo de Huffman

### Problema que resuelve

- Se da el mismo espacio a caracteres muy usados y a los que se usan poco.
- Huffman propone que **mientras más se repita un carácter, menos espacio ocupe**.

### Proceso de compresión

1. **Identificar el universo**:  
   Recorrer todo el archivo para:
   - Detectar todos los caracteres utilizados.
   - Contar cuántas veces aparece cada uno.
   - Agrupar los datos en un vector.

2. **Ordenar el vector** de caracteres de mayor a menor frecuencia.

3. **Construir el árbol binario**:  
   - Agrupar caracteres en ramas equilibradas por cantidad de apariciones.
   - Repetir el proceso hasta llegar a nodos con un único carácter.

4. **Asignar códigos binarios**:  
   - Izquierda: `0`  
   - Derecha: `1`  
   - Recorrer el árbol y generar el código binario de **tamaño variable** para cada carácter.

5. **Codificar el archivo**:  
   - Reemplazar cada carácter con su código.
   - Separar con `:` cada símbolo.

6. **Agrupar en bytes**:  
   - Juntar de a 8 bits (ignorando los `:`).
   - Completar con `0`s y `1`s si el último byte queda incompleto.

> Cuanto más desbalanceado esté el árbol, **menos bits ocupan los caracteres más frecuentes**.

---

## Proceso de descompresión

1. Seguir el árbol binario según el contenido comprimido:
   - `0` → izquierda  
   - `1` → derecha  
   - Al llegar a una **hoja**, se decodifica un carácter.

2. Finaliza cuando se recupera la **cantidad total de caracteres** original.

### Elementos necesarios para descomprimir

- **Vector de caracteres y sus frecuencias** (ordenado).
- **Array de bytes codificados**.
- **Cantidad total de caracteres**.
- **No es necesario guardar el árbol**, se puede reconstruir a partir del vector.

---

## Consideraciones

- Si el archivo es muy pequeño, **la compresión puede ocupar más que el original**.
  - Por eso, **no se comprime nada menor a 1500 bytes**.

- **Comprimir tarda más que descomprimir**, porque:
  - Se necesitan **mínimo dos lecturas a disco** para crear el árbol.
  - Se requiere una tercera para grabar el archivo comprimido (`.zip`).

---

## Compresión multimedia

> _(Sección sin desarrollar en el texto original. Podés completarla con detalles sobre JPEG, MP3, MPEG, etc.)_

---


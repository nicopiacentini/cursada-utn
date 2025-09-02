# Guía de uso de `curl`

`curl` es una herramienta de línea de comandos utilizada para transferir datos desde o hacia un servidor.  
Su uso más común es realizar peticiones **HTTP/HTTPS** para probar o consumir APIs.

---

## Uso básico

```bash
curl <URL>
```

Ejemplo:

```bash
curl https://jsonplaceholder.typicode.com/posts/1
```

Esto realiza una petición **GET** y muestra el contenido en pantalla.

---

## Principales flags

### `-v`
- **Uso:** Modo detallado. Muestra headers enviados, recibidos y detalles de la conexión.  
- **Parámetros:** No recibe parámetros adicionales.  
- **Ejemplo:**  
  ```bash
  curl -v https://example.com
  ```

### `-i`
- **Uso:** Incluye los headers de la respuesta junto con el cuerpo.  
- **Parámetros:** No recibe parámetros adicionales.  
- **Ejemplo:**  
  ```bash
  curl -i https://example.com
  ```

### `-s`
- **Uso:** Modo silencioso. Oculta barra de progreso y mensajes de error.  
- **Parámetros:** No recibe parámetros adicionales.  
- **Ejemplo:**  
  ```bash
  curl -s https://example.com
  ```

### `-o <archivo>`
- **Uso:** Guarda la salida en un archivo.  
- **Parámetros:** Nombre del archivo de destino.  
- **Ejemplo:**  
  ```bash
  curl -o salida.html https://example.com
  ```

### `-O`
- **Uso:** Descarga y guarda el archivo con el nombre original del servidor.  
- **Parámetros:** No recibe parámetros adicionales.  
- **Ejemplo:**  
  ```bash
  curl -O https://example.com/archivo.pdf
  ```

### `-L`
- **Uso:** Sigue redirecciones automáticas (3xx).  
- **Parámetros:** No recibe parámetros adicionales.  
- **Ejemplo:**  
  ```bash
  curl -L http://short.url
  ```

### `-H <header>`
- **Uso:** Agrega un header personalizado a la petición.  
- **Parámetros:** Cadena con formato `Header: valor`.  
- **Ejemplo:**  
  ```bash
  curl -H "Authorization: Bearer TOKEN" https://api.com
  ```

### `-d <datos>`
- **Uso:** Envía datos en el cuerpo de la petición (por defecto usa POST).  
- **Parámetros:** Cadena con datos (ej. `campo=valor`).  
- **Ejemplo:**  
  ```bash
  curl -d "user=juan&pass=123" https://api.com/login
  ```

### `-X <verbo>`
- **Uso:** Especifica el verbo HTTP a utilizar (GET, POST, PUT, PATCH, DELETE).  
- **Parámetros:** Verbo HTTP en mayúsculas.  
- **Ejemplo:**  
  ```bash
  curl -X DELETE https://api.com/recurso/1
  ```

### `-u <usuario:password>`
- **Uso:** Autenticación básica (username y password).  
- **Parámetros:** Cadena en formato `usuario:password`.  
- **Ejemplo:**  
  ```bash
  curl -u admin:1234 https://api.com
  ```

### `--json <json>`
- **Uso:** Envía datos en formato JSON (atajo para `-H "Content-Type: application/json" -d`).  
- **Parámetros:** Objeto JSON válido.  
- **Ejemplo:**  
  ```bash
  curl --json '{"name":"Juan"}' https://api.com/users
  ```

---

## Uso con verbos HTTP

### GET (por defecto)
```bash
curl https://api.com/users
```

### POST
```bash
curl -X POST https://api.com/users      -H "Content-Type: application/json"      -d '{"name":"Juan","age":30}'
```

### PUT
```bash
curl -X PUT https://api.com/users/1      -H "Content-Type: application/json"      -d '{"name":"Juan","age":31}'
```

### PATCH
```bash
curl -X PATCH https://api.com/users/1      -H "Content-Type: application/json"      -d '{"age":32}'
```

### DELETE
```bash
curl -X DELETE https://api.com/users/1
```

---

## Ejemplo completo

```bash
curl -X POST https://jsonplaceholder.typicode.com/posts      
-H "Content-Type: application/json"      
-d '{"title":"Nuevo post","body":"Contenido","userId":1}'      
-v
```

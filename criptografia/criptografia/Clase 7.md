## HASH
Da integridad al mensaje. Es decir, me da control detectivo. Ojo no evita que el mensaje sea alterado, solo permite detectar que se cambio el mensaje.
El ruido es una fuente aleatoria y por ende modifica el mensaje de forma aleatoria. Entonces se puede determinar a simple vista si el mensaje esta alterado. Esto pasa en ocaciones, no siempre. Con texto, no se puede determinar el mensaje que si se puede corregir con una imagen.
El hash es una forma de redundancia(bits que se mandan de mas y no aportan info. solo detectan cambios)
El hash entonces es un resumen del mensaje, se envian con este. Del otro lado se calcula lo mismo y se comparan ambos hashes. Si son iguales entonces el mensaje no tiene errores.
![[Pasted image 20251015195517.png]]
### No criptograficos
Orientados a riudo. Sirven para cosas no adrede o no maliciosas
### Criptograficos
Estan orientados a responder a malicies
#### KDF
Especificos para proteger accesos de usuarios
### MAC
Es un hash con clave.


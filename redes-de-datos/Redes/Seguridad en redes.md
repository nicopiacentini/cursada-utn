## Criptografia
Lee y escribe mensajes codificados. Garantiza:
- Autenticacion
- Integridad
- Confidencialidad
### Paso a paso
Es un algoritmo que cifra el mensaje con una clave de un largo determinado. Se usan 2 tecnicas
#### Simetrica
Usa una misma clave simetrica comun se usa para encriptar y desencriptar. El punto debil de este mecanismo esta en la distribucion de las claves sin comprometer el mecanismo. Los mas conocidos:
- DES
- 3DES
- AES
#### Asimetrica
Es la encripcion de clave publica. Se usa el mismo algoritmo y existen 2 valores de clave, la publica y la privada por extremo. Solo se divulgan las claves publicas y obtengo la clave privada del otro a partir de mis claves y su clave publica. Agrega la idea de NO repudio.
- Integridad
- Confidencialidad
- No repudio
- Autenticacion
![[Pasted image 20251031203812.png]]
Luego de establecer la comunicacion se suele usar una clave simetrica por comprometer menos a los computadores computacionalmente.
##### Doble encripcion
Ademas de usar clave publica, bob puede usar su propia clave privada que se desencripta con su clave publica. Asi alice sabe de quien es el mensaje.
#### HASH
Toma una entrada de longitud arbitraria y escupe una salida constante de longitud constante. Caracteristicas:
- Consistencia: una entrada, siempre la misma salida
- Aleatoriedad -> no puedo obtener el mensaje original.
- Unicidad: una entrada -> una salida
- One way: no puedo obtener la entrada desde la salida
### Firma digital
![[Pasted image 20251031204214.png]]
Es un digesto o hash encriptado que:
- Garantiza integridad
- Confirma la entidad del emisor
El emisor cifra con su clave privada al hash y el receptor descifra con la clave publica del emisor

# TLS
Es una capa de encripcion simetrica y asimetrica. Agrega seguridad a http
## Handshake
![[Pasted image 20251106232330.png]]
##### ClientHello
Es un mensaje de TLS que inicia el intercambio para cifrar la comunicacion. Se mandan estos parametros:
- KeyExchangeAlgorithm: Intercambio de claves asimetricas
- AuthenticationAlgorithm: como se autentica
- BulkEncriptionAlgorithm: con que algoritmo simetrico se usa luego del asimetrico
- MAC: Para garantizar integridad
##### ServerHello, certificate, ServerHelloDone
El servidor responde al cliente indicando su certificado que dice ser quien es. A veces le pide al cliente la certificacion
##### ClientKeyExchange, ChangeCipherSpec, Finished
El cliente indica sus capacidades de encripcion y las claves que soporta
##### ChangeCipherSpec, Finished
El servidor responde con sus capacidades de encripcion y con como se van a manejar para encriptar, segun necesidades de ambos. 

### Certificado
![[Pasted image 20251106232918.png]]
El servidor garantiza quien dice ser.
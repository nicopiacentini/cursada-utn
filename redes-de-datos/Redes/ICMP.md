Internet control message protocol. Comunica errores a nivel red, informa de eventos inesperados, informa acerca de la red en respuesta consultas. Solo informa del error no la accion corregida.
### Datagrama
![[Pasted image 20250919204838.png]]
### Mensajes ICMP
Pueden ser reportes de error o consulta/respuesta
#### Reporte de error
mensajes de error
##### Destino inalcanzable
Antes de matar un datagrama, si no puede mandarlo, envia este mensaje IP antes. Los motivos pueden ser varios pero algunos son:
- Red/host inalcanzable
- Protocolo TCP/IP no encendido
- Puerto no dispuesto a servicio
- Fragmentacion necesaria pero imposible por bit DF
##### Tiempo de espera agotado
Que el TTL del datagrama IP llegue a 0, se envia este mensaje de error.

#### Consulta respuesta
Entre los router
##### Echo Request/Reply (lo usa Ping)
Son los mensajes que se envian entre los router para y por envio de 
- RoundTrip time -> tiempo que tarda en ir y volver el ping
El ping cuando lo mando estoy mandando un request y el reply es enviado por el otro dispositivo.
- Traceroute -> dice por donde pasa el mensaje que envio. Lo que hace es enviar reiterados echo request con TTL = 1, 2, etc hasta donde debe llegar cosa que me informe el reporte de error por donde paso y por donde murio mi paquete.
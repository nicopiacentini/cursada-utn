Ocurre en capa 3. Para que un router envie un datagrama al siguiente *hop* (router) hace lo siguiente:
- Elegir el camino mas corto
- Conmutar el datagrama -> lee el datagrama IP que le llego del datagrama de capa 2 y rearma otra PDU de capa 2 para enviar al siguiente router con el datagrama iP correspondiente. Entonces cambia la direccion destino del datagrama
En cada uno de los *hop* cada router determina el mejor camino
#### Tabla de routeo
Cada elemento de red (pc, router) lo tiene y lista las redes a las que puede acceder, mediante que interfaces y que mascaras de red manejan. Cuando un router aprende las redes llena esta tabla. Existe tambien la ruta de *last resourt* que es la IP a la que va si no encuentra coincidencias. Es el default gateway al que se va al no encontrar la IP buscada y hay que ir a internet. Generalmente el default gateway es la interfaz del router que conoce el dispositivo.
### Router aprende redes que conoce
Normalmente conoce a las redes classful y con que interfaz se accede. Ademas puede aprender de forma manual con ip route `ip` `mascara` `ip`
##### Funcionamiento
Cuando al router le piden enviar un paquete se fija en su tabla de routeo a ver si tiene la direccion ip que le piden o cual tiene la coincidencia mas larga. Entonces rearma la PDU de capa 2 enviando el datagrama con mac destino de la ip que le indico la tabla de routeo. 
#### Plano de control
Es un plano administrativo -> Son aplicaciones que reciben y analizan informacion y actualizan el plano de datos
#### Plano de datos
Es la tabla de datos -> la instruccion de que hacer con los paquetes**
# Protocolos de routeo
Objetivos
- Flexible -> que se adapte rapido a los cambios en topologia
- Optimo -> que encuentre el mejor camino para llegar al destino. Se maneja con la metrica
- Rapida convergencia -> Se pide que la convergencia sea rapida y que evite routing loops
	- Convergencia -> es que todos los routers conozcan lo ultimo acerca de las interfaces y conexiones de la red
- Robustez
- Simplicidad -> que la informacion administrativa que se envian los router sea lo mas simple y ocupe lo menos posible al medio
#### Clasificacion
- Estatico/Dinamico -> estatico es a mano y dinamico es como RiP
- Single-Path/Multi-Path -> que pueda hacer balanceo de cargas o no. Es decir, mandar datagramas por varios enlaces o por uno solo.
- Plano/jerarquico -> Plano es que todos los router se conocen en el mismo nivel. Los jerarquicos escalan armando zonas.
- Interiores/Exteriores -> interior es disenado para correr en mi propia red y los exteriores son para uso entre empresas y cambia que tanto quiero que conozcan de mi empresa
- VectorDistancia/LinkState -> VectorDistancia cuenta saltos como metrica y los estado de enlace hace un analisis mas complejo considerando otras variables ademas de la distancia
![[Pasted image 20250919201348.png]]

## RIP
Protocolo de routeo. Es una aplicacion que corre en los routers y se encarga de propagar la informacion de routeo. Es decir, cada router que lo maneja le informa a los demas que rutas conoce y los demas tambien le dice que conocen. De esta forma llenan sus tablas de routeo. Cuando configuro RIP, debo informar *que redes classfull* quiere conocer. Asi escucha por la configuracion de interfaces y asi llega a donde debe llegar.
Es Classless -> cada router informa que parte de red conoce, no la red classfull entera.
Lo que hace es tomar el contenido de su tabla de routeo y lo manda a todas las interfaces que conoce. Una vez que recibe informacion nueva compara con su tabla:
- Si hay algo nuevo lo escribe
- Si hay algo repetido compara y sobreescribe si es mejor y deja si es peor.
Ante cambios en la topologia automaticamente los router recalculan cuales son las mejores rutas y encuentran el mejor destino.

#### Caracreristicas
- Split horizon -> lo que  le informa un router a otro no vuelve, es decir, se considera que el primero ya sabe por haberlo contado originalmente. 
- Tiene un limite de 16 saltos como maximo (la metrica)
- Rip Timers -> cada 30 segundos en cada interfaz donde se activa RIP se escupe el mensaje con tabla de routeo para que los demas aprendan. La confiabilidad se basa en recibir del vecino la actualizacion de la tabla de routeo. Si deja de escucharlo, debo rearmar mi tabla de routeo e informarlo. Si pasados 180 segundos no escucho la actualizacion, la marco como inalcanzable. 
- Por esto ultimo tarda mucho la informacion en transmitirse y tiene muy malos tiempos de convergencia.
##### Tabla RIP
`Dir IP que conoce` `cantidadDeSaltos/Metric`
##### Eleccion de camino
Se elige aquel que tenga la menor cantidad de saltos.

## OSPF
Open (abierto) shortest path first. Usa el algoritmo de Dijktsra para encontrar el camino mas rapido.
### Caracteristicas
Como es _link state_ se fija que ancho de banda tiene un canal para elegir caminos. Ademas, Realiza Flooding, es decir, avisa a todos los miembros de la red de los cambios en vez de solo a los que estan al lado. Es jerarquico y se maneja con areas:
##### Area
Los routers en una misma se comunican entre si y eligen a uno para salir del area. Este debe tener la mayor capacidad. Al salir de mi sistema autonomo y tener que hablar con muchos partners debo usar otro protocolo exterior como el (BGTP)
#### Ventajas 
Converge mas rapido que RIP e intercambia menos informacion que RIP ya que solo envia un keepAlive para mantener la conexion y vigencia con vecinos y mensajes SOLO CUANDO HAY CAMBIO EN TOPOLOGIA
## BGP
Intercambia casi un millon de rutas. Se usa en internet entre routers de distintos ISP.
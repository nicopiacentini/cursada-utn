 - Parcial > 8 para promoccion
	 - Complemento en recuperatorio
	 - Si nota es 6 hay parcial complementario
- 2 parciales
	- Recuperatorio pisa nota
- 2 tps
	- tp de PLC
	- tp de investigación tipo monografía sobre tecnología de la industria 4.0
		- Es la teoría para segundo parcial
- Partes de materia
	- Teoria de control
	- Industria 4.0
____
# El control
#### Que es el control?
Es la inteligencia oculta detrás de la tecnología moderna
#### Historia
- Siglo XVIII: Regulador centrifugo
- Siglo XX: Estabilidad matemática y frecuencia
- Años 60: Revolución digital con microprocesadores y hardware
#### Que es un sistema de control?
Es un conjunto de elementos interrelacionados con el objetivo de que al menos una variable este dentro de ciertos márgenes definidos por su diseño.
#### Anatomía de control
- **Variable controlada**: Que se mide
- **Planta**: Espacio donde se trabaja aquello a controlar
- **Variable manipulada**: Que se corrige
- **Perturbacion**: Señal externa que perturba la variable a controlar
#### Contol a lazo abierto vs cerrado
##### Control a lazo abierto
Las definiciones que le damos al sistema para controlar una variable estan dadas por el conocimiento sobre el sistema y el conocimiento propio:
- Estructura: Sin via de realimentacion. Accion directa y ciega
- La salida no influye en la accion de control
- Incapaz de detectar fallos internos o medir realidad
- Altamente vulnerable a perturbaciones
>[!example]
>Una estufa o radiador donde se controla calor con perilla donde:
>  - Planta: Espacio
>  - Variable controlable: El calor
>  - Variable manipulada: La perilla
>  - Perturbacion: Aire, corriente, etc.

La realimentacion aparecería cuando hay un componente que indique al sistema acciones para corregir comportamiento

![[Pasted image 20260814195728.png]]

###### Otro ejemplo
- **Entrada**: Pulso manual
- **Controlador**: microcontrolador
- **Actuador**: Rele
- **Planta**: Foco encandecente
Quiero controlar una luz encandecente. El problema es que esta **ciego ante realidad**, es decir, el controlador no sabe si el foco esta quemado y el foco no puede decirle nada.
##### Control a lazo cerrado
- Estructura: **Feedback control**. La salida retorna a la entrada
- Se mide la salida constantemente (Feedback)
- Compara el estado real con la referencia
- Se auto corrige automaticamente ante cualquier alteracion (Controlador)
![[Pasted image 20260814195738.png]]
- El sensor sensa la planta y se lo manda al comparador
- El comparador *corrige* la entrada
- El sensor sensa de forma discreta o cada cierto tiempo
- Cuando se llega a un **set-point** se para el circuito
#### Anatomia de lazo cerrado
![[Pasted image 20260814205850.png]]
Buscamos ver como los cuadros o **elementos fisicos** se comportan en el tiempo. Entonces se tratan como **ecuaciones diferenciales** bajo el dominio de laplace.
La realimentacion es negativa implica que es un sistema de control. Si la realimentacion es positiva el sistema se descontrola (por ejemplo acercar un microfono a un parlante)
###### Caso de estudio lazo cerrado - Brazo robotico con camara
La camara dice a donde moverse y como moverse
- Actuador: Servomotores que ajustan articulaciones
- Controlador: Microprocesador que calcule distancia y determina error
- Sensor: Camara de vision que mide posicion
- Sistema: El conjunto de camara, microprocesador y brazo
- Proceso: Movimiento dinamico y progresivo del brazo en un espacio fisico
- Control de realimentado: Consulta la realidad o sensor para corregir trayectoria si un objeto se mueve

##### Ejemplo pava electrica
#### Pava sin sensor
Componentes:
- Resistencia a 220v
- Bimetal: Mecanismo de senso que se abre solo cuando la temperatura llega a cierto nivel. Al abrirse pasa el agua y para la corriente o se apaga la resistencia.
#### Pava con sensor electronico
Componentes:
- Resistencia a 220v
- Sensor: Sensa temperatura y corta corriente o prende corriente para la resistencia
### Rele
Se basa en la idea de circuitos de baja y alta potencia. El de baja sensa y si lo necesita llama al de alta potencia. Funcionamiento:
- Hay una bobina que genera un campo magnetico con un nuclo ferroso en el medio para llevarlo. Ahi tenemos un **electroiman**. Es un circuito de **baja potencia** como 5v
- Cerca del iman hay 2 chapitas de las cuales una sufre del electroiman. Entonces se mueve y hace contacto con la otra chapita
- Ambas chapitas estan conectadas a un circuito electrico de **alta potencia** que activa una resistencia de una pava por ejemplo
Para el caso de la pava con sensor, hay un componente electronico con sensor que prende con 5v o apaga el bobinado para conectar el circuito de alta potencia de prender la resistencia.
Es importante que los circuitos estan aislados electricamente

##### Ejemplo 
Hay una bateria 12v conectada a bobinado y accionable con una palanca. Luego en otro lado esta el circuito de las chapitas que alimentan los focos o luces de un auto. Dicho circuito tambien tiene su propia bateria de 12v
Cuando una persona acciona la palanquita, prende el bobinado y por ende se prenden los **focos**.
#### Ejemplo tanque - Deposito de inodoro con mochila
Tiene 2 sistemas de control:
- **El sistema de control de desagote** que sella la salida y al accionar con palancas libera la salida y fluye el agua hacia el indodoro. Este es un sistema de control de **lazo abierto**.
- **El sistema de control de llenado**: Tiene un flotador que sube a medida que sube el agua, dicho flotador esta conectado por palancas con la entrada de agua. Cuando el flotador llega a un cierto nivel *tapa la entrada de agua*. Este es un sistema de control de **lazo cerrado**. Este tipo de control es de tiempo continuo
#### Tipos de sistemas de control
- Tiempo continuo: Mide continuamente
- Tiempo discreto/muestreado: Muestrea y mide cada cierto tiempo
- On-off: Como los interruptores de la luz.
#### Ejemplo calefon
El agua fria entra por un tubo de metal que es calentado por una llama. Dicha llama es controlada por una perilla. La llama calienta siempre lo mismo y le suma la misma temperatura al agua. Entonces si la entrada es baja y la llama tambien, no sube tanto la temperatura. Por ende es un sistema de **lazo abierto**.
# Observabilidad
Revisa que el sistema este y ande bien mientras este en produccion
- Defecto: manifestacion de la falla. Aparece cuando alguien interactua con el sistema
- Falla: error en el codigo
- Equivocacion: tiene que ver con el humano introduciendo la falla.
La idea del defecto impulsando la revision de la falla desde la accion del usuario tiene un problema cuando el sistema realiza acciones con cuestiones que no requieren interaccion con el usuario. Entonces no se puede esperar a que alguien se queje. Observar la realidad del sistema nos puede dar esto.
##### Impacto
Una vez ocurrido el defecto, quiero volver al estado anterior y recuperar al sistema como estaba.
## Definicion
La capacidad del sistema para informar un error y guardar la informacion del error.
### Logs
Hace un trackeo de operaciones que fueron realizadas. Indica que paso, cual fue el error, etc. Son registros cronologicos de eventos generados por la aplicacion o los componentes. Pueden reconstruir lo que ocurrió y entender el contexto. Son detallados pero verbosos.
Suelen ser persistidos en bases de datos y tienen un componente visualizador
Hay herramientas que no lo permiten y hay que manejar esos casos especiales
### Metricas
Refieren a:
- Cantidad de recursos utilizados actualmente
- Cuanto tarda el servicio particular en recuperar una solicitud
- Cuantos usuarios acceden a la aplicacion en el mometo
**GQM (goal question metrics)** -> tengo metricas objetivo que quiero alcanzar. De ahi salen las preguntas que me permiten verificar si los cumplo
#### Persistencia de metricas
Suelen usar bases de datos noSQL. Generalmente bases de datos de series temporales como prometheus.
#### Señales importantes de metricas
- Trafico
- Errores
- Latencia
- Saturacion
- Utilizacion
### Trazas
Da el recorrido de una operacion a lo largo del sistema. En la practica, se relacionan los request de distintas app a traves de un identificador.
### Alarmas
A partir de esas matricas, trazas, etc puedo establecer alarmas o alertas, indicando donde hay un punto de fallo o posible punto de fallo.
|**Tipo de alarma**|**Qué detecta**|**Ejemplo típico**|
|---|---|---|
|**Por umbral estático**|Se dispara cuando una métrica supera o baja de un valor fijo.|"CPU > 90% durante 5 min" o "Error rate > 2%"|
|**Por tendencia / anomalía**|Detecta cambios inusuales respecto al comportamiento histórico.|"Latencia aumentó 50% respecto a la media de la última hora"|
|**Basada en SLO/SLA**|Se activa cuando el servicio no cumple su objetivo de nivel de servicio.|"Error budget consumido > 80% este mes"|
|**De ausencia de datos (silencio)**|Detecta la falta de métricas o logs esperados.|"No se reciben métricas del servicio X en los últimos 10 minutos"|


# Seguridad en sistemas
Estado de la persona cuando esta fuera de peligro. Resguardo de sistemas, redes y datos frente a cyberataques, accesos no autorizados o perdida de informacion. Tengo que diseñar orientado a la seguridad.
- ¿Cómo se gestiona la **identidad y los permisos** de cada tipo de usuario?
    
    - _(Concepto relacionado: Gestión de Identidades y Accesos - IAM)_
        
- ¿Dónde y cómo se guardan las **contraseñas**? ¿Están **hasheadas**?
    
    - _(Concepto clave: Hashing de contraseñas con funciones robustas como Argon2 o Bcrypt)_
        
- ¿Qué pasa si un atacante intenta **múltiples accesos seguidos**? ¿Hay **mecanismos de bloqueo**?
    
    - _(Concepto relacionado: Rate limiting, bloqueo de cuentas o IP)_
        
- ¿Se mantiene un **historial de cambios y acciones (auditoría)**?
    
    - _(Concepto clave: Logs de auditoría)_
        
- ¿Qué pasa si un componente **falla o es atacado**?
    
    - _(Conceptos relacionados: Resiliencia, tolerancia a fallos, plan de respuesta a incidentes)_
        
- ¿Qué **dependencias de terceros** usa el sistema y cómo se **actualizan**?
    
    - _(Concepto clave: Gestión de vulnerabilidades, Software Composition Analysis - SCA)_
        
- ¿Dónde se **almacenan los datos**? ¿Cómo se **protegen**?
    
    - _(Conceptos relacionados: Cifrado en reposo (at rest), copias de seguridad, política de retención)_
### Consecuencias de mal diseño de seguridad
...
#### Principios que sigue la seguridad de informacion
- Confidencialidad
- Integridad 
- Disponibilidad
Los datos de mas impacto requieren mas monitoreo.

## Desarrollo seguro
El desarrollo seguro es la práctica de **diseñar, codificar, probar y mantener** software con el objetivo de **minimizar vulnerabilidades y prevenir ataques**, aplicando principios de seguridad desde las **primeras etapas** del ciclo de vida del desarrollo.
- **Security by Design:** pensar la seguridad desde la **etapa de diseño**.
    
    - _(Anticipar amenazas en la fase de planeación, no como una solución tardía.)_
        
- **Validación de entradas y salidas en profundidad:** para prevenir **inyecciones** y **errores lógicos**.
    
    - _(Esto es crucial contra ataques como SQL Injection o Cross-Site Scripting - XSS)._
        
- **Gestión segura de errores y excepciones:** **sin exponer información interna**.
    
    - _(Mostrar solo mensajes genéricos al usuario final para no revelar rutas de archivos, versiones de bases de datos, etc., que podrían ayudar a un atacante.)_
        
- **Uso seguro de criptografía:** evitar algoritmos **débiles o mal implementados**.
    
    - _(Asegurar que el cifrado y el hashing se realicen con estándares modernos y de forma correcta, por ejemplo, para proteger las contraseñas y las comunicaciones.)_
        
- **Control de versiones y dependencias:** evitar **bibliotecas vulnerables**.
    
    - _(Mantener el software de terceros (librerías, frameworks) actualizado y auditarlo regularmente para detectar vulnerabilidades conocidas.)_

- **Autenticación y autorización robusta:** con políticas de acceso claras.
    
    - _(Asegurar que los usuarios sean quienes dicen ser (autenticación) y que solo puedan acceder a los recursos que les corresponden (autorización). Esto incluye el uso de la **autenticación multifactor (MFA)**.)_
        
- **Auditoría y trazabilidad:** registrar eventos y cambios críticos.
    
    - _(Mantener logs detallados que permitan reconstruir la cadena de eventos si ocurre un incidente de seguridad.)_
        
- **Principio de menor privilegio (Least Privilege):** dar solo los accesos necesarios.
    
    - _(Tanto a usuarios como a sistemas y microservicios; cada entidad solo debe tener los permisos indispensables para realizar su tarea, reduciendo el riesgo si la cuenta es comprometida.)_
        
- **Revisión de código y pruebas de seguridad (estáticas y dinámicas).**
    
    - _(Implica el uso de herramientas **SAST** (Static Analysis Security Testing) para revisar el código fuente y **DAST** (Dynamic Analysis Security Testing) para probar la aplicación en ejecución.)_
## Mecanismos de seguridad
#### Preventivos
Encontrar el riesgo antes de la amenaza. No existen agentes no deseados.
- Cifrado. Protege la confidencialidad. Se aplica a datos en reposo y en movimiento
- Hashing. Toma una entrada y calcula su salida conocida como hash
- Autenticacion: Validar quien es quien esta del otro lado
	- - MFA -> autenticacion de muchos factores. La contraseña + otros datos (token, tarjeta, etc).
- Autorizacion para acceder a recursos.
	- Modelos de control de acceso -> solo los usuarios autorizados pueden acceder a los recursos segun roles que tienen.
- Json web token.
#### Detectivos
Detectar la amenaza antes de que me ataque
#### Correctivos
Corregir el error de seguridad

## OWASP
Detalla los 10 principales riesgos de las aplicaciones web.
1. Pérdida de control de acceso: permitir a usuarios acceder a recursos o funciones fuera de sus permisos. 
2. Fallos criptográficos: uso incorrecto o ausencia de mecanismos de cifrado, lo cual termina exponiendo datos sensibles. 
3. Inyección: Inyección de código malicioso (como SQL, OS o LDAP) a través de entradas que no contienen validaciones. 
4. Diseño inseguro: incluye una serie de vulnerabilidades que se pueden integrar en la arquitectura de una aplicación, como la falta de validación o separación de funciones. 
5. Mala configuración de seguridad: como servidores mal configurados o información sensible expuesta.
6. Componentes vulnerables y obsoletos: uso de bibliotecas, frameworks o software con vulnerabilidades conocidas o sin actualizar. 
7. Fallos de identificación y autenticación: como contraseñas débiles o sesiones inseguras. 
8. Fallos de integridad de software y datos: falta de validación de la integridad de código y datos, permitiendo manipulaciones. 
9. Fallos de registro y supervisión de seguridad: ausencia de registros y monitoreo, impidiendo detectar y responder ante ataques. 
10. Falsificación de solicitudes del lado del servidor: permite que un atacante haga que el servidor realice solicitudes no autorizadas a otros servicios internos o externos.
## SSO
- Mejora la experiencia del cliente
- Aumenta la seguridad
- De facil implementacion
## IDM
Identity management. Son politicas y tecnologias que manejan quien accede a que recurso
## Firewalls
Filtran, monitorean y bloquean trafico http/s malicioso entre usuario y la aplicacion.
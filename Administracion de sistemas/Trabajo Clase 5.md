### Posibilidades
##### Proceso
Proceso comercial de cotización de proyecto para un cliente específico
##### Flujo de entrada y de salida
El proceso se inicia con la solicitud de un cliente y sigue con el relevamiento realizado por el analista de sistemas que se encarga de definir y consensuar los requerimientos del proyecto. Se le asigna dicho proyecto a un equipo tecnico para que realize un orden de magnitud para presentar al cliente. Si el cliente lo rechaza, se termina el flujo. Si el cliente lo acepta, se prosigue y el mismo equipo tecnico realiza una estimación de esfuerzo. Luego se pasa esta información a un equipo comercial para que haga la cotización. Dicha cotización se duplica para generar y procesar datos para generar mejores futuras **cotizaciones**. Luego dicho equipo formaliza la propuesta para ser presentada al cliente. 
##### Actores
-  equipo técnico
-  equipo comercial
-  Analista de sistemas
- Cliente 
##### Desiciones
- **Arq. de negocio** -> Define el paso a paso para realizar este proceso. Analiza brechas y problemas durante el procedimiento y se encarga del analisis de riesgos del proyecto.
- **Arq. de datos** -> En este proceso decide la forma de persistir y el modelo de datos los datos que puedan aparecer en el proyecto. Tambien tomo la desicion de persistir cotizaciones para futuras estimaciones mas precisas
Al analizar/mantener un sistema se encuentran aspectos de diseño *que hacen ruido*, es decir, son poco modificables o muy complejas. Entonces la calidad del diseño es *maximizar la habitabilidad del espacio software*. Las cualidades de diseño hacen a la callidad del mismo, *imponiendo criterios para determinar un buen diseño y podiendo identificar que uno es mejor o peor que otro, tomar desiciones sobre ellos y comunicar razonamientos al respecto*.
##### Limitaciones
Son heuristicas, no reglas. Si, sirven para contrastar diseños pero tambien participan otros aspectos como experiencia y conocimiento.
#### Uso de las cualidades de diseño 
Imponen criterios para determinar un buen diseño y podiendo identificar que uno es mejor o peor que otro, toman desiciones sobre ellos y comunican razonamientos al respecto. Nos dan mas alternativas respecto a posibles desiciones de diseño.
Requieren de tener un ***diseño alternativo*** para contrastar y darse cuenta de cual es la mejor. Para hacer este contraste se requiere de un ***contexto*** para comparar.
#### Cualidades incompatibles
A veces pasa que al favorecer una cualidad de diseño perjudicamos a otra. Esto no siempre es asi pero suele ser un caso bastante comun.

## Cualidades independientes de la tecnologia
Son aquellas que podemos evaluar para comparar dos diseños sin introucirse ni conocer acerca de la tecnologia de implementacion
### Simplicidad
Busca la idea de mantener al diseño simple, es decir que cumpla con lo que necesite hacer y no sobrediseñe.
###### KISS
*keep it simple stupid*. Busca evitar abstracciones innecesarias que no surgen de la logica/negocio. **Evita complegidades innecesarias**
###### YAGNI
*you aren't gonna need it*. No agregar funcionalidad nueva que no apunte a la problematica actual. No diseñar pensado en requerimientos futuros.
#### Razones de la simplicidad
- Factor econoimco: agregar cosas innecesarias saca tiempo de hacer lo que si es necesario. Ademas puede llevar al retrabajo o a agregar funcionalidad que no se usara
- Por complejidad: agreagar elementos no solicitados aumenta la complejidad.
Ante mas abstracciones, mas complejo es el sistema y su diseño. Sin embargo, la mayoria de los diseños buenos son los simples. Por ende:
- Se busca evitar la complejidad accidental del diseño
- La complejidad intrinseca del problema debe ser simplificada lo mas posible.
### Flexibilidad: Extensibilidad-Mantenibilidad
Se entiende por *flexibilidad* a la medida a la que el software puede adaptarse a cambios de parametros de diseño con facilidad. A partir de ahi surgen dos ejes ciertamente opuestos 
- Extensibilidad: la capacidad de agregar nuevas funcionalidades/caracteristicas con poco impacto
- Mantenibilidad: capacidad de modificar las caracteristicas actuales con el menor impacto posible en demas componentes
### Robustez - Explicabilidad - Transparencia
La robustez no busca evitar fallos, sino manejar situaciones excepcionales de forma consistente y clara.  
Un sistema robusto debe:
- No generar información o comportamiento errático
- Reportar errores y volver a un estado consistente
- Facilitar la detección de la causa del problema  

###### Fail Fast
*Fallar rápido*. Ante un comportamiento incorrecto, abortar ordenadamente y reportar el error, evitando inconsistencias y facilitando la detección de la causa.

###### Interpretaciones
- Tranquilidad del usuario: robustez también depende de la calidad de implementación, tecnologías, pruebas y percepciones de usuarios.
- Consistencia y previsibilidad: reportar adecuadamente qué falló y por qué.

###### Explicabilidad
Capacidad del sistema de justificar sus decisiones y predecir resultados para una entrada dada.

###### Transparencia
Grado en que las reglas de negocio están disponibles para ser monitoreadas, revisadas o criticadas. El software libre ayuda, aunque no garantiza transparencia.

---

### (Des)acoplamiento
El acoplamiento mide la dependencia entre componentes.  
Cuanto mayor el acoplamiento, más se propagan los errores y más difícil es el mantenimiento.  

###### Beneficios de minimizarlo
- Mejor mantenibilidad  
- Mayor reutilización  
- Menor propagación de errores  
- Menor necesidad de modificar múltiples módulos por un solo cambio  

---

### Validación - Facilidad de prueba - Rendición de cuentas
La validación asegura que el software funciona correctamente mediante pruebas.  
La facilidad de prueba indica qué tan sencillo es agregar y actualizar pruebas a medida que evoluciona el negocio.

###### Importancia
- Probar con rigurosidad es un deber ético y profesional  
- La cobertura no basta si mantener las pruebas es imposible  

###### Rendición de cuentas (Accountability)
La responsabilidad no es solo individual, también del proceso de diseño: todas las partes deben participar en decisiones, garantizando necesidades éticas y de usuarios.

---

### Cohesión
Un módulo cohesivo concentra todos sus elementos en un mismo problema.  
Menos responsabilidades → mayor cohesión.  
Ejemplo: métodos de una clase que resuelven tareas diferentes indican baja cohesión.  

---

### Abstracción - Reusabilidad - Genericidad - Humanización
La abstracción puede evaluarse por **calidad** y **cantidad**.

###### Calidad
Abstracciones claras y consistentes con modelos mentales → facilitan reusabilidad y genericidad.  
Ejemplo: pila con *push* y *pop*. Agregar *insert* rompe la metáfora.

###### Cantidad
Debe haber tantas abstracciones como las fundamentales del negocio. Evitar tanto perder como añadir innecesarias.

###### Tensiones con simplicidad
La clave está en identificar cuáles abstracciones son esenciales y cuáles son complejidad accidental.

###### Humanización
Las abstracciones sobre personas no deben deshumanizar. Hay que evitar reducirlas a "recursos" o "mercancías". Siempre recordar que detrás de cada dato hay personas.

---

### Consistencia
Un diseño consistente aplica criterios uniformes a problemas similares.  
Esto lo hace más predecible, entendible y fácil de mantener.  

---

### Redundancia mínima
La redundancia ocurre cuando la misma lógica o información se repite.  
Problemas:
- Lógica duplicada: más difícil de mantener y más propensa a errores  
- Información duplicada: riesgo de inconsistencias  

###### Principios asociados
- **DRY** (*Don’t repeat yourself*)  
- **Normalización** de datos  

---

### Almacenamiento mínimo - Contradatos
No se debe almacenar información irrelevante, protegiendo espacio, privacidad y seguridad.  
Sin embargo, en algunos casos es valioso recopilar *contradatos* (género, raza, etc.) con fines estadísticos y sociales, no identificatorios.  

---

### Mutaciones controladas
Menos cambios de estado → sistema más fácil de razonar y menos propenso a errores.

###### Principios
- **Inmutabilidad**: diseñar componentes que no cambien estado interno cuando sea posible.  
- **Minimizar mutabilidad**: permitir mutaciones solo si son estrictamente necesarias y justificadas en los requerimientos.  


## Cualidades de diseño que requieren conocimiento de la tecnologia a trabajar
Son cualidades relativas a la tecnologia a utilizar y guian al diseño por ese lado.
### Seguridad - Protección de datos personales - Soberanía
Un sistema seguro debe impedir accesos indebidos:
- Evitar que agentes no autorizados ejecuten acciones.
- Evitar que agentes autorizados hagan acciones no permitidas.

La seguridad en diseño depende del contexto tecnológico: un exploit no se manifiesta igual en C, Java o Ruby.  
Ejemplo: **Heartbleed** en OpenSSL (C), un bug de desbordamiento de búfer que permitió el robo de claves privadas. El problema no fue solo técnico, sino de diseño deficiente que no preveía mecanismos adecuados para esa tecnología.

###### Más allá de la seguridad técnica
La seguridad no es suficiente si:
- El propio sistema comparte información sin consentimiento.
- Se niega arbitrariamente el acceso a ciertos usuarios o colectivos.
- Los datos quedan almacenados sin posibilidad de eliminación.
- Se obliga a usar plataformas o dispositivos externos para acceder al sistema.

###### Cualidades complementarias
- **Protección de datos personales**: garantizar control total de usuaries sobre sus datos (consultar, modificar, eliminar permanentemente).
- **Soberanía tecnológica**: minimizar dependencia de infraestructuras extranjeras fuera de la jurisdicción local.
- **Prevención del extractivismo de datos**: evitar “premios gratuitos” a cambio de datos personales; promover modelos sostenibles que no obliguen a entregar información a corporaciones.

---

### Escalabilidad
Capacidad de un sistema para adaptarse a cargas crecientes de trabajo sin perder calidad ni disponibilidad.

###### Ejemplo
Tras la compra de WhatsApp por Facebook, la aplicación colapsó unas horas. Miles migraron a Telegram, que también cayó porque no estaba preparada para absorber semejante carga inesperada.  

La escalabilidad no es solo técnica, sino estratégica: diseñar pensando en escenarios de crecimiento repentino.

---

### Eficiencia (Performance) - Sustentabilidad
La eficiencia mide el uso óptimo de los recursos disponibles en tres niveles:
1. **Recursos humanos de construcción**: horas invertidas en desarrollo.  
2. **Recursos humanos de ejecución**: tiempo que usuaries requieren para operar el sistema.  
3. **Recursos hardware**: CPU, memoria, almacenamiento, red.  

Tradicionalmente, la eficiencia se enfocó en el hardware. Con su abaratamiento, el interés migró hacia la **escalabilidad**. Sin embargo, esto trae consecuencias.

###### Problema actual
El software moderno consume cada vez más recursos:
- Demanda creciente de cómputo → dependencia de grandes proveedores extranjeros.
- Alto consumo energético → impacto geopolítico y ambiental.

###### Sustentabilidad
- Diseñar software eficiente es una **responsabilidad ecológica** en un mundo atravesado por cambio climático.  
- La **obsolescencia programada** (forzar actualizaciones y dejar sin soporte dispositivos aún útiles) genera residuos electrónicos y presión productiva innecesaria.  
- Extender la vida útil del software es parte de la sustentabilidad del diseño.  

---

### Trazabilidad
Capacidad de rastrear decisiones y acciones a lo largo del ciclo de vida del sistema.

###### Dos dimensiones
- **Diseño**: seguimiento de decisiones y cambios, desde requerimientos hasta implementación.  
- **Ejecución**: rastreo de operaciones (qué, cuándo, quién, dónde, por qué).  

La trazabilidad facilita:
- Depuración (debugging).  
- Auditoría externa.  
- Transparencia: identificar claramente responsables y administradores de un sistema.  

---

### Usabilidad - Accesibilidad - Inclusión
La **usabilidad** mide qué tan fácil es para les usuaries aprender y usar el sistema.  

###### Usabilidad no es universal
Cada persona tiene diferentes capacidades, contextos y experiencias. De ahí la importancia de la **accesibilidad**, que busca derribar barreras técnicas, cognitivas y físicas.

###### Más allá de lo técnico
El software puede ser excluyente por **sesgos culturales de quienes lo diseñan**, generando racismo, sexismo o binarismo.  
Ejemplos:
- 2021: el recorte automático de imágenes en Twitter tendía a excluir personas negras.  
- 2018: el sistema de reclutamiento de Amazon discriminaba contra mujeres en tecnología.  

###### Exclusión interseccional
La discriminación se agrava cuando convergen múltiples estigmas (ej. mujeres negras en reconocimiento facial, con peores resultados que hombres blancos).  

###### Inclusión
- Requiere equipos diversos y conscientes de sus sesgos.  
- Implica rendición de cuentas hacia todas las partes afectadas.  
- Asegura que el software sea verdaderamente plural y no excluyente.  






















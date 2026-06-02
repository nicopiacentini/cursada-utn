# CI/CD & DevOps

## Integración Continua (CI)

Práctica de integrar código **al menos una vez por día** para minimizar problemas de integración.

### Buenas prácticas

- Repositorio de código único
- Automatizar el proceso de build con scritps
- Hacer el build testeable automáticamente
- Todo commit debe ser construido por una herramienta de integración (no por el dev)
- El build debe ser **rápido**
- Probar en un clon de producción
- Se debe poder obtener fácilmente la última versión ejecutable
- Todos deben poder ver lo que pasa con el proceso de integración
- Automatizar el proceso de despliegue
### Responsabilidades del equipo
- Hacer check-in del codigo diariamente
- No subir codigo roto
- No subir codigo no testeado
- No subir codigo cuando el build no pasa
- No irse a casa hasta que el build central compile
#### Ventajas de integracion continua
- Deteccion temprana y mejorada de errores y metricas que permiten abordar errores a tiempo
- Progreso continuo para mejorar feedback
- Mejor colaboración de equipo
- Integración mejorada del sistema
- Menor numero de errores durante pruebas del sistema
- Sistemas actualizados constantemente

## Entrega y Despliegue Continuo (CD)

Conjunto de prácticas que aseguran que el software puede desplegarse en producción rápidamente y en cualquier momento. Cada cambio llega a un entorno de **staging** donde se corren pruebas exhaustivas.
![[Pasted image 20260602200758.png]]

> - **Continuous Delivery** → el despliegue a producción lo aprueba y ejecuta una persona
> - **Continuous Deployment** → el despliegue a producción es completamente automático (siguiente paso al Delivery)

### Basic deployment
Todos los nodos de la aplicación son actualizados en el mismo momento con la nueva versión. 
- Es facil de usar. 
- Riesgo de que salga todo mal y mucho downtime
### Blue green Deployment
Ponemos 2 o mas ambientes que sean bastante similares. El despliegue se realiza en uno de ellos y el otro contiene la version anterior. El usuario accede a un ambiente segun un load-balancer. 
- Es facil de implementar
- En organizaciones grandes es costoso
### Rolling Deployment
Los nodos de un ambiente son actualizados 1 a 1 o en lotes on la nueva version
- El rollout es gradual con un incremento de tráfico controlado
- La app o bd necesitan no morir
### Canary Deployment
Es similar al rolling pero actualizas por grupos de nodos y controlas segun region/tipo etc
- El despliegue es en pequeñas fases y si hay fallas sse quitan los nodos que se incorporaron. Solo hay un ambiente de produccion
- Es complejo de testear producción
### Definiciones
- **versiones**. Instancia de un sistema funcionalmente distinta en algun aspecto de otras instancias
- **variante**. Una instancia de un sistema que es funcionalmente igual a otras instancias, pero diferente a niveles no funcionales. Por ejemplo, mismo producto para linux y windows
- **Release**. Es la distribucion de software fuera del entorno de desarrollo. En algunas herramientas se usa el concepto *tag*.
### Consideraciones para release mgmt
Una vez generada la versión o release debemos buscar el mecanismo más efectivo para hacer
despliegue -deploy- controlado a los distintos usuarios.
- A estos mecanismos se los denomina Deployment Strategies
Aspectos a evaluar para realizar un release:
- Qué usuarios deberán recibir los cambios (geográfico, premium, por segmento)
- En qué forma se deberá hacer el despliegue
- Entornos por los que deberá pasar (testing, staging, producción, otros)
- Procesos de Roll Forward -> Es un **punto de no retorno** y una vez que se hace no se vuelve para atras. Puede no ocurrir siempre pero debe ser considerado 
- Procesos de Rollback
- Validación de despliegue correcto / incorrecto
- Riesgos del despliegue y cómo se minimizan
- Aprobación por el negocio y/o área de QA
- Quienes realizarán el deployment de la versión definida

### Metricas de deployment
- **Frecuencia de deployment**. Cada cuanto tiempo una organización despliega software a Producción satisfactoriamente. Indica cada cuanto agrego valor al cliente
- **Change failure rate**. Porcentaje de despliegues a produccion que salieron mal. Incrementa la satisfacción de los clientes al reducir downtimes
- **Lead time for changes**. Cuanto tarda un Commit en llegar a producción. Indica la productividad del desarrollo
- **MTTR (Mean time to recovery)**. El tiempo que demora la organización en recuperarse post incidente. 

---

## DevOps

> Conjunto de prácticas destinadas a reducir el tiempo entre el cambio en un sistema y su pasaje a producción, garantizando calidad y minimizando el esfuerzo. No es una metodología sino que es una forma de trabajo

Acerca el entorno de desarrollo con el entorno de infraestructura que soporta a las aplicaciones de software.
- Termina con la cultura de separación entre developers y operations
- Combina desarrollo y operaciones, normalmente en un mismo equipo

### Ciclo de prácticas

1. Planificación del Cambio
2. Coding & Building
3. Testing
4. Release & Deployment
5. Operation & Monitoring

### Filosofía CALMS

| Letra | Concepto       | Descripción                                                            |
| ----- | -------------- | ---------------------------------------------------------------------- |
| **C** | Cultura        | Ser dueños del cambio para mejorar la colaboración y comunicación      |
| **A** | Automatización | Eliminar trabajo manual y repetitivo; reducir el error humano          |
| **L** | Lean           | Remover la burocracia para tener ciclos más cortos y menos desperdicio |
| **M** | Métricas       | Medir todo, usar datos para refinar los ciclos                         |
| **S** | Sharing        | Compartir experiencias de éxito y falla para que otros aprendan        |

---

## Relación con SCM

CI/CD es la implementación práctica del [[SW Building]] y [[SW development & pipelines]] dentro de un pipeline automatizado. Las [[Estrategias de Branching]] determinan cómo fluye el código a través del pipeline.
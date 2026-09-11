# Contexto del Proyecto — Sistema de Turnos García Peluquerías

> Documento de referencia para mantener la consistencia del acta de proyecto a lo largo de todas sus entregas. Ante cualquier duda sobre datos, nombres, decisiones o alcance, este archivo es la fuente de verdad.

Durante 

---

## 1. Datos del Cliente

| Campo                  | Valor                         |
| ---------------------- | ----------------------------- |
| Nombre del negocio     | Taller Barbershop             |
| Dueño / Sponsor        | elias Lezcano                 |
| Cantidad de sucursales | 4                             |
| Zona de operación      | Gran Buenos Aires (GBA)       |
| Rubro                  | Peluquería y estética capilar |
| Antigüedad del negocio | 12 años                       |
| Contacto del cliente   | elezcano@gmail.com            |

### Sucursales

| N°  | Nombre / Ubicación | Peluqueros | Horario de atención |
| --- | ------------------ | ---------- | ------------------- |
| 1   | Lanús Centro       | 4          | Lun–Sáb 9:00–20:00  |
| 2   | Lanús Oeste        | 3          | Lun–Sáb 9:00–20:00  |
| 3   | Lomas de Zamora    | 4          | Lun–Sáb 9:00–20:00  |
| 4   | Banfield           | 3          | Mar–Sáb 9:00–20:00  |

---

## 2. Situación Actual (Problema)

- Las sucursales **no cuentan con ningún sistema de gestión de turnos**.
- Los clientes llegan de forma espontánea y sin reserva previa.
- Se generan **picos de demanda** en ciertos horarios (principalmente mediodía y tarde), provocando largas esperas.
- No existe forma de anticipar la carga de trabajo del personal.
- No hay registro histórico de clientes ni de atenciones realizadas.
- La comunicación con los clientes es únicamente presencial o por llamado directo al local.

---

## 3. Datos del Proyecto

| Campo                    | Valor                                                                        |
| ------------------------ | ---------------------------------------------------------------------------- |
| Nombre del proyecto      | Implementación de un Sistema web de Gestión de Turnos para Taller barbershop |
| Director del proyecto    | yo                                                                           |
| Fecha de inicio estimada | 01/08/2025                                                                   |
| Fecha de fin estimada    | 31/01/2026                                                                   |
| Duración total estimada  | 24 semanas                                                                   |
| Plataforma del sistema   | web                                                                          |

---

## 4. Objetivos

### Objetivo del Proyecto

Desarrollar e implementar un sistema web de gestión de turnos para las sucursales de García Peluquerías en un plazo de 6 meses, logrando que el 100% de las sucursales operen con el sistema activo y que se reduzca en al menos un 60% la cantidad de clientes en espera sin turno asignado durante el primer trimestre posterior a la puesta en marcha.

### Objetivo del Producto

Desarrollar un sistema web de gestión de turnos que, una vez implementado, permita a los clientes de García Peluquerías reservar su atención con antelación y al personal administrar la agenda de cada sucursal de forma ordenada y eficiente.

---

## 5. Alcance

### Dentro del alcance

- Relevamiento de procesos operativos en las 4 sucursales
- Diseño de arquitectura, base de datos y flujos de usuario
- Desarrollo de los siguientes módulos:
    - Registro y autenticación de usuarios (clientes y administradores)
    - Reserva de turnos con selección de sucursal, servicio y horario
    - Gestión de agenda diaria por sucursal
    - Notificaciones automáticas de confirmación y recordatorio
    - Panel de administración por sucursal
    - Historial de turnos por cliente y por sucursal
- Pruebas y validación en al menos 2 sucursales piloto (Lanús Centro y Lomas de Zamora)
- Capacitación al personal de las 4 sucursales
- Implementación en la totalidad de las sucursales
- Documentación técnica y manuales de usuario y administración

### Fuera del alcance

- Integración con sistemas de facturación, contabilidad o gestión de stock
- Gestión de pagos online o cobro anticipado de turnos
- Mantenimiento y soporte técnico posterior a la entrega del sistema
- Adquisición de hardware o infraestructura de red en las sucursales
- Gestión de redes sociales o canales de comunicación externos

---

## 6. Fases del Proyecto (WBS Macro)

|N°|Fase|Duración estimada|
|---|---|---|
|1|Relevamiento|3 semanas|
|2|Diseño|4 semanas|
|3|Desarrollo|10 semanas|
|4|Validación y Testing|3 semanas|
|5|Capacitación|2 semanas|
|6|Implementación y Cierre|2 semanas|

---

## 7. Entregables Principales

1. Informe de relevamiento de procesos operativos y necesidades del cliente
2. Documento de requerimientos funcionales y no funcionales del sistema
3. Diseño de arquitectura, modelo de datos y flujos de usuario
4. Mockups y prototipos de interfaz validados por el cliente
5. Sistema web de gestión de turnos con la totalidad de sus módulos
6. Informe de pruebas y resultados de la validación en sucursales piloto
7. Manual de usuario para clientes
8. Manual de administración para encargados de sucursal
9. Documentación técnica final del sistema
10. Acta de conformidad y cierre del proyecto

---

## 8. Stakeholders

|Rol|Nombre / Descripción|
|---|---|
|Cliente / Sponsor|Martín García (dueño de García Peluquerías)|
|Encargados de sucursal|Un encargado por sucursal (nombres a relevar en Fase 1)|
|Peluqueros|Personal de cada sucursal, usuarios del sistema|
|Clientes finales|Clientes habituales y nuevos que reservarán turnos online|
|Equipo de desarrollo|Equipo del proyecto (definido por la cátedra)|

---

## 9. Beneficios de Negocio

- Reducción de tiempos de espera de los clientes en las sucursales
- Incremento de la satisfacción del cliente
- Optimización de la carga de trabajo del personal
- Aumento de la capacidad de atención efectiva por sucursal
- Mejora de la imagen y posicionamiento de García Peluquerías
- Fidelización de la clientela mediante notificaciones automáticas
- Disponibilidad de información operativa para la toma de decisiones
- Reducción de ausencias sin aviso gracias al sistema de recordatorios

---

## 10. Supuestos

- Las 4 sucursales cuentan con acceso a internet estable.
- Los clientes disponen de un dispositivo con acceso a internet (smartphone o computadora).
- El cliente (Martín García) estará disponible para validar entregables en cada fase.
- El personal de las sucursales tiene conocimientos básicos de uso de dispositivos digitales.
- Los horarios de atención relevados en este documento son estables y no cambiarán durante el proyecto.

---

## 11. Restricciones

- El presupuesto del proyecto es limitado y será definido formalmente en la próxima entrega.
- El plazo máximo de entrega del sistema es de 6 meses desde el inicio del proyecto.
- Las tecnologías a utilizar pueden estar condicionadas por los requerimientos de la cátedra.
- No se puede interrumpir la operación de las sucursales durante la implementación.

---

## 12. Riesgos Identificados

|Riesgo|Probabilidad|Impacto|
|---|---|---|
|Resistencia al cambio por parte del personal|Media|Alto|
|Falta de disponibilidad del cliente para validar avances|Media|Alto|
|Cambios de alcance a mitad del proyecto|Baja|Alto|
|Problemas de conectividad en alguna sucursal|Baja|Medio|
|Subestimación del tiempo de desarrollo|Media|Alto|

---

## 13. Decisiones Tomadas y Pendientes

### Tomadas

- El sistema se desarrolla específicamente para García Peluquerías (no es un producto genérico).
- Las sucursales piloto para la fase de testing son **Lanús Centro** y **Lomas de Zamora**.
- El acta se redactó de forma neutral respecto a la plataforma (web o app móvil).
- El sistema no incluirá gestión de pagos en esta versión.

### Pendientes

- Definir el stack tecnológico a utilizar.
- Definir el presupuesto formal del proyecto.
- Relevar los nombres de los encargados de cada sucursal.

---

## 14. Servicios Ofrecidos por García Peluquerías

> Dato relevante para el módulo de reserva de turnos, donde el cliente seleccionará el servicio al sacar turno.

- Corte de cabello (hombre / mujer / niño)
- Coloración y mechas
- Alisado y keratina
- Barba y afeitado
- Tratamientos capilares
- Peinados especiales

---


```
@startwbs
* Implementación de un Sistema Web de Gestión de Turnos para Taller Barber Shop
** Fase 0 Gestion del Proyecto
*** 0.1 Acta de proyectos elaborada
*** 0.2 Matriz de gestión de riesgos elaborada
*** 0.3 Estructura de desglose del trabajo (EDT) elaborada
*** 0.4 Matriz de roles y responsabilidades elaborada
*** 0.5 Matriz de habilidades y competencias elaborada
*** 0.6 Matriz de interesados elaborada
*** 0.7 Matriz de comunicaciones elaborada
*** 0.8 Bitacora de cambios elaborada
*** 0.9 Cronograma del proyecto elaborado
** Fase 1 Relevamiento
*** 1.1 Entrevistas con peluqueros y encargados realizadas y documentadadas
*** 1.2 Flujo de procesos documentado
*** 1.3 Requisitos del sistema documentados
*** 1.4 Casos de uso elaborados
*** 1.5 Acta de aprobación de relevamiento y requisitos elaborada y firmada
** Fase 2 Diseño
*** 2.1 Evaluacion de alternativas de infraestructura tecnologica realizada 
*** 2.2 Diagrama de arquitectura del sistema confeccionado
*** 2.3 Evaluacion de alternativas de bases de datos realizada 
*** 2.4 Diagrama de relaciones entre datos confeccionado
*** 2.5 Mockups de interfaz realizados y validados 
*** 2.6 Normas de programacion y buenas practicas de trabajo en equipo definidas 
*** 2.7 Distribucion y delimitacion de modulos por dev documentado
*** 2.8 Criterios de aceptación de calidad del sistema definidos y acordados con el Sponsor 
*** 2.9 Acta de aprobación de diseño elaborada y firmada
** Fase 3 Desarrollo
*** 3.1 Herramientas y entorno de trabajo del equipo configurados
*** 3.2 Modulo de reserva de turnos desarrollado
*** 3.3 Modulo de gestion de agenda desarrollado
*** 3.4 Modulo de notificaciones desarrollado
*** 3.5 Panel de administracion desarrollado
*** 3.6 Historial de turnos desarrollado
*** 3.7 Integracion de todos los modulos y validacion en entorno de pruebas realizada
** Fase 4 Validacion y Testing
*** 4.1 Plan de pruebas elaborado y validado con el Sponsor
*** 4.2 Casos de prueba definidos y ejecutados
*** 4.3 Prueba piloto realizada y documentada
**** 4.3.1 Plan de prueba piloto elaborado
**** 4.3.2 Prueba piloto ejecutada en 2 sucursales
**** 4.3.3 Informe de resultados de prueba elaborado
*** 4.4 Relevamiento de errores confeccionado
*** 4.5 Correccion de errores realizada 
*** 4.6 Verificacion de cumplimiento de criterios de aceptacion de calidad realizada
*** 4.7 Acta de aceptación del sistema elaborada y firmada
** Fase 5 Capacitacion
*** 5.1 Manual de usuario redactado y entregado
*** 5.2 Manual de administracion redactado y entregado 
*** 5.3 Capacitacion al personal realizada
** Fase 6 Despliegue
*** 6.1 Despliegue de la aplicación en la infraestructura elegida realizado
*** 6.2 Documentacion tecnica final elaborada y entregada
** Fase 7 Cierre del Proyecto
*** 7.1 Lecciones aprendidas documentadas
*** 7.2 Informe de cierre del proyecto redactado
*** 7.3 Firma del acta de conformidad realizada
@endwbs
```
### 15. Contexto de mi empresa

### Contexto de NovaSoft Solutions

|Campo|Valor|
|---|---|
|Nombre de la empresa|NovaSoft Solutions S.R.L.|
|Rubro|Desarrollo de software a medida para terceros|
|Fundación|2018|
|Sede|Lanús, Buenos Aires, Argentina|
|Tamaño|Empresa pequeña (8 empleados en total)|
|Clientes típicos|PYMEs del área metropolitana de Buenos Aires|

**Equipo asignado al proyecto:**

| Rol                      | Nombre             | Perfil                                                                                                    |
| ------------------------ | ------------------ | --------------------------------------------------------------------------------------------------------- |
| Project Manager          | Nicolas Piacentini | Responsable de la planificación, seguimiento y comunicación con el cliente.                               |
| Desarrollador Semisénior | Tomás Villanueva   | 3 años de experiencia. Responsable de la arquitectura del sistema, módulos core y decisiones técnicas.    |
| Desarrollador Junior     | Valentina Ríos     | 1 año de experiencia. Responsable del desarrollo de módulos secundarios, testing y documentación técnica. |

**Superior al que se presenta este documento:**

|Campo|Valor|
|---|---|
|Nombre|Ing. Roberto Sandoval|
|Cargo|Director de Operaciones, NovaSoft Solutions|
|Rol en el proyecto|Sponsor interno. Aprueba el inicio del proyecto y supervisa el desempeño del equipo asignado.|

### Roles

| Orden | Rol                                                  | Seniority     | ¿Por qué?                                                                                                                                                 |
| ----- | ---------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1     | **Sponsor (Martín García)**                          | Ejecutivo     | Es quien financia el proyecto, toma las decisiones importantes y aprueba los entregables principales.                                                     |
| 2     | **Project Manager (Nicolás Piacentini)**             | Semi Senior   | Planifica el proyecto, coordina al equipo, administra riesgos, cronograma y comunicación con el cliente. Está presente durante todo el proyecto.          |
| 3     | **Analista Funcional**                               | Semi Senior   | Se encarga de entrevistar al cliente, entender cómo funciona actualmente la barbería y transformar esas necesidades en requerimientos claros.             |
| 5     | **Arquitecto de Software**                           | Senior        | Define la arquitectura del sistema, las tecnologías que se utilizarán y la estructura general de la solución.                                             |
| 6     | **Administrador / Diseñador de Base de Datos (DBA)** | Semi Senior   | Analiza alternativas de motores de bases de datos, diseña el modelo entidad-relación y la estructura física de la base.                                   |
| 7     | **Diseñador UX/UI**                                  | Semi Senior   | Diseña la experiencia del usuario, los mockups y los flujos de navegación para que el sistema sea intuitivo.                                              |
| 8     | **Desarrollador Backend**                            | Semi Senior   | Implementa toda la lógica del negocio: autenticación, turnos, agenda, historial, notificaciones y acceso a la base de datos.                              |
| 10    | **Desarrollador Frontend**                           | Semi Senior   | Desarrolla las pantallas que utilizarán los administradores, barberos y clientes. Integra la interfaz con el backend.                                     |
| 12    | **QA / Tester**                                      | Semi Senior   | Diseña los casos de prueba, ejecuta pruebas funcionales, registra errores y verifica que las correcciones realmente solucionen los problemas.             |
| 13    | **DevOps / Especialista en Infraestructura**         | Semi Senior   | Configura los ambientes de desarrollo, testing y producción, realiza el despliegue y verifica que el sistema funcione correctamente en las sucursales.    |
| 14    | **Especialista en Documentación y Capacitación**     | Junior        | Redacta los manuales técnicos y de usuario, organiza las capacitaciones y brinda soporte durante la adopción del sistema.                                 |
| 15    | **Cliente / Representante de la Barbería**           | Usuario Clave | Aunque no forme parte del equipo de desarrollo, participa constantemente validando relevamientos, diseños, pruebas piloto y aprobando el producto final.  |
# Lista completa de Actividades por Entregable con Duración Estimada

_(Duraciones en días hábiles, estimadas para un equipo de 6 personas — PM, Analista Funcional, Líder Técnico, Dev SSR, Dev Jr, Tester)_

## Fase 0 — Gestión del Proyecto

| Entregable                               | Actividad                                       | Duración |
| ---------------------------------------- | ----------------------------------------------- | -------- |
| 0.1 Acta de proyecto                     | Redactar acta de proyecto                       | 2 días   |
| 0.2 Matriz de riesgos                    | Documentar matriz de riesgos                    | 1 día    |
| 0.3 EDT                                  | Confeccionar diagrama de WBS                    | 2 días   |
| 0.4 Matriz de roles y responsabilidades  | IDocumentar matriz de roles y responsabilidades | 1 día    |
| 0.5 Matriz de habilidades y competencias | Documentar matriz de habilidades y competencias | 1 día    |
| 0.6 Matriz de interesados                | Documentar matriz de interesados                | 1 día    |
| 0.7 Matriz de comunicaciones             | Documentar matriz de comunicaciones             | 1 día    |
| 0.8 Bitácora de cambios                  | Diseñar formato/plantilla de la bitácora        | 1 día    |
| 0.9 Plan de gestión de calidad           | Documentar plan de gestión de calidad           | 2 días   |
| 0.10 Cronograma del proyecto             | Confeccionar cronograma del proyecto            |          |


## Fase 1 — Relevamiento

| Entregable                                | Actividad                             | Duración |
| ----------------------------------------- | ------------------------------------- | -------- |
| 1.1 Entrevistas realizadas y documentadas | Coordinar agenda de entrevistas       | 2 días   |
|                                           | Realizar entrevistas                  | 3 días   |
|                                           | Documentar resultados de entrevistas  | 2 días   |
| 1.2 Flujo de procesos documentado         | Relevar flujo de procesos actual      | 2 días   |
|                                           | Documentar flujo de procesos          | 2 días   |
| 1.3 Requisitos del sistema documentados   | Identificar requisitos funcionales    | 2 días   |
|                                           | Identificar requisitos no funcionales | 1 día    |
|                                           | Documentar requisitos del sistema     | 2 días   |
| 1.4 Casos de uso elaborados               | Redactar casos de uso                 | 1 día    |
| 1.5 Acta de aprobación de relevamiento    | Redactar acta de aprobación           | 1 día    |
|                                           | Obtener firma de aprobación           | 1 día    |

## Fase 2 — Diseño

| Entregable                             | Actividad                                        | Duración |
| -------------------------------------- | ------------------------------------------------ | -------- |
| 2.1 Evaluación de infraestructura      | Identificar alternativas de infraestructura      | 1 día    |
|                                        | Comparar alternativas                            | 1 día    |
|                                        | Documentar evaluación y selección                | 1 día    |
| 2.2 Tecnologías seleccionadas          | Identificar alternativas de lenguajes/frameworks | 1 día    |
|                                        | Comparar alternativas                            | 1 día    |
|                                        | Documentar selección de tecnologías              | 1 día    |
| 2.3 Diagrama de arquitectura           | Definir componentes y capas                      | 2 días   |
|                                        | Confeccionar diagrama de arquitectura            | 1 día    |
| 2.4 Evaluación de bases de datos       | Identificar alternativas de motores de BD        | 1 día    |
|                                        | Comparar alternativas                            | 1 día    |
|                                        | Documentar evaluación y selección                | 1 día    |
| 2.5 Diagrama de relaciones entre datos | Identificar entidades y atributos                | 1 día    |
|                                        | Confeccionar diagrama de relaciones              | 1 día    |
| 2.6 Mockups de interfaz                | Diseñar mockups de pantallas principales         | 3 días   |
|                                        | Presentar mockups al Sponsor                     | 1 día    |
|                                        | Ajustar mockups según feedback                   | 2 días   |
|                                        | Validar mockups con el Sponsor                   | 1 día    |
| 2.7 Normas de programación             | Definir estándares de codificación               | 1 día    |
|                                        | Definir buenas prácticas de trabajo en equipo    | 1 día    |
|                                        | Documentar normas y buenas prácticas             | 1 día    |
| 2.8 Distribución de módulos            | Identificar módulos a desarrollar                | 1 día    |
|                                        | Asignar módulos a cada desarrollador             | 1 día    |
|                                        | Estimar esfuerzo por módulo                      | 1 día    |
|                                        | Documentar distribución de módulos               | 1 día    |
| 2.9 Criterios de aceptación de calidad | Definir criterios de aceptación de calidad       | 1 día    |
|                                        | Presentar criterios al Sponsor                   | 1 día    |
|                                        | Obtener acuerdo del Sponsor                      | 1 día    |
| 2.10 Acta de aprobación de diseño      | Redactar acta de aprobación de diseño            | 1 día    |
|                                        | Presentar documentación de diseño al Sponsor     | 1 día    |
|                                        | Obtener firma de aprobación                      | 1 día    |

## Fase 3 — Desarrollo

| Entregable                         | Actividad                                             | Duración |
| ---------------------------------- | ----------------------------------------------------- | -------- |
| 3.1 Entorno de trabajo configurado | Configurar repositorio y control de versiones         | 1 día    |
|                                    | Configurar entorno de desarrollo local                | 1 día    |
| 3.2 Módulo de reserva de turnos    | Desarrollar funcionalidad de reserva de turnos        | 8 días   |
|                                    | Realizar testing unitario del módulo                  | 2 días   |
|                                    | Realizar code review del módulo                       | 1 día    |
| 3.3 Módulo de gestión de agenda    | Desarrollar funcionalidad de gestión de agenda        | 8 días   |
|                                    | Realizar testing unitario del módulo                  | 2 días   |
|                                    | Realizar code review del módulo                       | 1 día    |
| 3.4 Módulo de notificaciones       | Desarrollar funcionalidad de notificaciones           | 5 días   |
|                                    | Realizar testing unitario del módulo                  | 1 día    |
|                                    | Realizar code review del módulo                       | 1 día    |
| 3.5 Panel de administración        | Desarrollar funcionalidad del panel de administración | 6 días   |
|                                    | Realizar testing unitario del módulo                  | 2 días   |
|                                    | Realizar code review del módulo                       | 1 día    |
| 3.6 Historial de turnos            | Desarrollar funcionalidad de historial de turnos      | 4 días   |
|                                    | Realizar testing unitario del módulo                  | 1 día    |
|                                    | Realizar code review del módulo                       | 1 día    |
| 3.7 Integración de módulos         | Integrar todos los módulos desarrollados              | 3 días   |
|                                    | Realizar test de integración entre módulos            | 3 días   |
|                                    | Validar funcionamiento del sistema integrado          | 2 días   |

## Fase 4 — Validación y Testing

| Entregable                                 | Actividad                                     | Duración |
| ------------------------------------------ | --------------------------------------------- | -------- |
| 4.1 Plan de pruebas                        | Definir alcance y estrategia de testing       | 2 días   |
|                                            | Redactar plan de pruebas                      | 1 día    |
|                                            | Obtener validación del Sponsor                | 1 día    |
| 4.2 Casos de prueba definidos y ejecutados | Definir casos de prueba no funcionales        | 2 días   |
|                                            | Ejecutar casos de prueba                      | 3 días   |
|                                            | Registrar resultados de la ejecución          | 1 día    |
| 4.3.1 Plan de prueba piloto                | Seleccionar sucursales para el piloto         | 1 día    |
|                                            | Definir duración y criterios de éxito         | 1 día    |
|                                            | Redactar plan de prueba piloto                | 1 día    |
| 4.3.2 Prueba piloto ejecutada              | Desplegar el sistema en las sucursales        | 1 día    |
|                                            | Ejecutar la prueba piloto con usuarios reales | 5 días   |
|                                            | Registrar incidencias durante la ejecución    | 5 días   |
| 4.3.3 Informe de resultados de prueba      | Consolidar resultados del piloto              | 1 día    |
|                                            | Redactar informe de resultados                | 1 día    |
| 4.4 Relevamiento de errores                | Recopilar errores detectados                  | 1 día    |
|                                            | Clasificar errores según severidad            | 1 día    |
|                                            | Documentar relevamiento de errores            | 1 día    |
| 4.5 Corrección de errores                  | Corregir errores relevados                    | 4 días   |
|                                            | Re-testear funcionalidades corregidas         | 2 días   |
| 4.6 Verificación de criterios de calidad   | Verificar cumplimiento de cada criterio       | 2 días   |
|                                            | Documentar resultado de la verificación       | 1 día    |
| 4.7 Acta de aceptación del sistema         | Redactar acta de aceptación                   | 1 día    |
|                                            | Obtener firma de aceptación                   | 1 día    |

## Fase 5 — Capacitación

| Entregable                   | Actividad                                    | Duración |
| ---------------------------- | -------------------------------------------- | -------- |
| 5.1 Manual de usuario        | Redactar manual de usuario                   | 3 días   |
|                              | Entregar manual de usuario al Cliente        | 1 día    |
| 5.2 Manual de administración | Redactar manual de administración            | 3 días   |
|                              | Entregar manual de administración al Cliente | 1 día    |
| 5.3 Capacitación al personal | Coordinar horarios de capacitación           | 2 días   |
|                              | Dictar capacitación al personal              | 2 días   |

## Fase 6 — Despliegue

| Entregable                        | Actividad                                 | Duración |
| --------------------------------- | ----------------------------------------- | -------- |
| 6.1 Despliegue en infraestructura | Configurar infraestructura de producción  | 2 días   |
|                                   | Desplegar la aplicación en producción     | 1 día    |
| 6.2 Documentación técnica final   | Redactar documentación técnica final      | 2 días   |
|                                   | Entregar documentación técnica al Cliente | 1 día    |

## Fase 7 — Cierre del Proyecto

| Entregable               | Actividad                                    | Duración |
| ------------------------ | -------------------------------------------- | -------- |
| 7.1 Lecciones aprendidas | Recopilar lecciones aprendidas con el equipo | 1 día    |
|                          | Documentar lecciones aprendidas              | 1 día    |
| 7.2 Informe de cierre    | Consolidar información del proyecto          | 1 día    |
|                          | Redactar informe de cierre                   | 1 día    |
| 7.3 Acta de conformidad  | Redactar acta de conformidad                 | 1 día    |
|                          | Obtener firma del acta de conformidad        | 1 día    |


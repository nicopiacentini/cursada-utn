# The Three Aspects of Software Quality: Functional, Structural, and Process

Nuestra civilización depende del software, por lo que su calidad es fundamental. A diferencia de la manufactura, donde la calidad busca minimizar defectos en procesos repetibles, el desarrollo de software requiere innovación constante y no es un proceso exactamente repetible. Por ello, la calidad debe medirse como el valor que aporta a tres grupos interesados: **Sponsors**, **Usuarios** y el **Equipo de Desarrollo**.

## Definiendo calidad de software: 3 partes
La calidad del software se divide en tres dimensiones interconectadas que requieren diferentes enfoques y herramientas:
#### Functional Quality o Calidad Funcional
Se refiere a que el software realice correctamente las tareas para las que fue diseñado. Sus atributos principales son:
- **Cumplimiento de requisitos:** Satisfacer las necesidades especificadas por sponsors y usuarios, adaptándose a sus cambios.
- **Baja densidad de defectos:** Minimizar bugs que afecten la confiabilidad, seguridad o funcionalidad.
- **Rendimiento adecuado:** Velocidad de respuesta satisfactoria desde la perspectiva del usuario.
- **Usabilidad:** Facilidad de aprendizaje y uso a través de una interfaz y flujo de trabajo efectivos.
- **Aseguramiento:** Se garantiza principalmente mediante pruebas (testing) de software.

#### Structural Quality o Calidad estructural
Se centra en que el código interno esté bien construido, algo difícil de evaluar solo con pruebas de funcionamiento. Incluye:
- **Testabilidad**: El codigo es facil de probar con pruebas funcionales 
-  **Mantenibilidad:** Facilidad para organizar, añadir o cambiar código sin introducir errores.
- **Comprensibilidad:** Claridad y legibilidad del código para nuevos desarrolladores.
- **Eficiencia y Seguridad:** Uso óptimo de recursos y resistencia ante vulnerabilidades técnicas.
#### Process Quality o calidad de proceso
Evalúa el valor del proceso de desarrollo en sí mismo para todos los interesados. Sus indicadores son:
- **Cumplimiento de fechas y presupuestos:** Entrega en los tiempos y costos acordados.
- **Repetibilidad y consistencia:** Capacidad de entregar resultados de calidad de un proyecto a otro sin desgastar al equipo.
### Intereses de grupos y trade-offs
Cada grupo involucrado prioriza los aspectos que impactan directamente su labor:
- **Usuarios:** Se enfocan en la **calidad funcional** (lo que ven) y ciertos aspectos de la **calidad de proceso**, como la fecha de entrega. Suelen ignorar la calidad estructural.
- **Equipo de Desarrollo:** Priorizan la **calidad estructural**, ya que sufren los problemas de un código deficiente. También valoran la **calidad de proceso** por las métricas de medición y la **calidad funcional**, aunque pueden preferir recortar funciones para facilitar el desarrollo.
- **Sponsors:** Se interesan por las **tres dimensiones**. Buscan crear valor de negocio y deben equilibrar la calidad con el riesgo y los objetivos contrapuestos.
### Herramientas para mejorar calidad del sw
La mejora de la calidad requiere herramientas específicas para cada dimensión:
- **Para Calidad Funcional:** Herramientas de pruebas manuales, automatizadas (unit testing), de carga y de rendimiento.
- **Para Calidad Estructural:** Herramientas de refactorización, análisis estático de código (seguridad), análisis dinámico (profiling) y métricas de complejidad.
- **Para Calidad de Proceso:** Software de gestión y monitoreo para rastrear requisitos, progreso, "code churn" y salud general del proyecto. Estas herramientas deben ser accesibles para patrocinadores y usuarios mediante interfaces no técnicas.

Conclusion

No existe una única visión de la calidad. Este desglose tripartito permite equilibrar los intereses de usuarios (funcionalidad), desarrolladores (estructura) y sponsors (proceso), facilitando la toma de decisiones y los trade-offs necesarios en cada proyecto.
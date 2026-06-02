# Software Building

Parte del [[Unidad 5#5. Administración de Distribución y Despliegue|paso 5 de SCM]].

## Requisitos de un Build

- ✅ Debe ser **automático**
- ✅ Debe generar **reportes** de estado

## Beneficios de la automatización

- Reducen la cantidad de defectos
- Mejoran la reproducción de problemas y la trazabilidad
- Mejoran la performance del equipo

## Tipos de Build

|Tipo|Descripción|
|---|---|
|**Local**|El developer lo hace localmente y corre pruebas unitarias|
|**Integration**|Genera el entorno completo para pruebas de integración|
|**Nightly**|Construcción diaria con reportes automáticos|
|**Release**|Cuando se decide crear una nueva versión a liberar|

→ Ver también [[CI&CD and devOps]]
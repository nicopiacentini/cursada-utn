# Software Deployment & Pipelines

Parte del [[Unidad 5#5. Administración de Distribución y Despliegue|paso 5 de SCM]].

## Modelo de Deployment

Para definirlo se debe evaluar:

- Qué usuarios recibirán los cambios
- En qué forma se hará el despliegue
- Riesgos del despliegue y cómo minimizarlos
- Aprobación por el negocio y/o área de QA
- Quiénes realizarán el deployment

## Build & Deployment Pipelines

> Manifestación automatizada del proceso para llevar el software desde la aprobación del cambio de SCM hasta que llega a los usuarios.

- Incluye compilación, construcción y progreso a través de etapas de testing y deployment
- Requiere colaboración entre individuos y equipos

**Gated Commits:** buena práctica que valida el cambio _antes_ de hacer merge, manteniendo master en estado íntegro.

→ Ver [[CI&CD and devOps]]
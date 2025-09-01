# Patrones Arquitectónicos Físicos

Los **patrones arquitectónicos físicos** se enfocan en **cómo se despliegan y comunican los componentes del sistema en nodos, servidores o redes físicas**. Mientras los patrones lógicos definen la estructura conceptual, los físicos muestran **la distribución real en hardware**.

---

## 1. Monolito
- **Descripción:**  
  - Todo el sistema corre en **una sola máquina o proceso**.  
  - No hay separación física de componentes; todos los módulos están empaquetados juntos.
- **Ventajas:**  
  - Simplicidad de despliegue y administración.  
  - Comunicación interna muy rápida (no hay red).  
- **Desventajas:**  
  - Difícil de escalar de forma selectiva.  
  - Cambios o fallas afectan a todo el sistema.  
- **Ejemplo:**  
  - Aplicaciones de escritorio tradicionales.  
  - Sitios web simples alojados en un único servidor.

---

## 2. Cliente-Servidor
- **Descripción:**  
  - Sistema dividido en **clientes** que consumen servicios y **servidores** que los proveen.  
  - Comunicación a través de red (TCP/IP, HTTP, etc.).
- **Ventajas:**  
  - Desacopla responsabilidades entre consumidores y proveedores de servicios.  
  - Permite escalar servidores sin cambiar clientes.
- **Desventajas:**  
  - El servidor puede convertirse en un **punto de fallo o cuello de botella**.  
  - Dependencia de la red para la comunicación.
- **Ejemplo:**  
  - Navegador web ↔ Servidor web.  
  - Clientes de correo ↔ Servidor de correo.

---

## 3. Capas Distribuidas / N-tier
- **Descripción:**  
  - Separación física de capas funcionales: presentación, lógica de negocio y acceso a datos.  
  - Cada capa puede ejecutarse en **un nodo o servidor distinto**.
- **Ventajas:**  
  - Escalabilidad selectiva (por capa).  
  - Mantenimiento más sencillo gracias a la separación de responsabilidades.  
- **Desventajas:**  
  - Comunicación entre capas introduce latencia.  
  - Mayor complejidad de despliegue.
- **Ejemplo:**  
  - Aplicación web con:  
    - Servidor web (capa de presentación)  
    - Servidor de aplicaciones (lógica de negocio)  
    - Servidor de base de datos (capa de datos)

---

## 4. Microservicios Distribuidos
- **Descripción:**  
  - Sistema compuesto por **servicios pequeños, independientes y desplegables individualmente**.  
  - Cada servicio puede ejecutarse en contenedores o nodos distintos.  
  - Comunicación vía APIs ligeras (REST, gRPC, mensajería).
- **Ventajas:**  
  - Escalabilidad y resiliencia individual por servicio.  
  - Despliegue y actualización independiente.
- **Desventajas:**  
  - Complejidad operativa: orquestación, monitoreo, gestión de fallos.  
  - Mayor latencia debido a la comunicación entre servicios.
- **Ejemplo:**  
  - Arquitectura de Netflix, Amazon, Uber, sistemas cloud nativos.

---

## 5. Peer-to-Peer (P2P)
- **Descripción:**  
  - No hay servidor central; **todos los nodos son equivalentes** y se comunican directamente entre sí.  
  - Cada nodo puede actuar como cliente y servidor a la vez.
- **Ventajas:**  
  - Descentralización, sin punto único de fallo.  
  - Distribución de carga y almacenamiento entre nodos.
- **Desventajas:**  
  - Dificultad para mantener consistencia y coordinación.  
  - Seguridad más compleja de gestionar.
- **Ejemplo:**  
  - Redes BitTorrent.  
  - Blockchain y sistemas descentralizados.

---

## 6. Brokered Messaging / Colas de Mensajes
- **Descripción:**  
  - Los componentes se comunican a través de **un middleware de mensajería distribuido** (broker).  
  - Permite desacoplar productores y consumidores de mensajes.
- **Ventajas:**  
  - Desacoplamiento fuerte y tolerancia a fallos.  
  - Escalabilidad y flexibilidad en la comunicación.
- **Desventajas:**  
  - Dependencia del middleware (punto de fallo).  
  - Complejidad en configuración y monitoreo.
- **Ejemplo:**  
  - RabbitMQ, Kafka, ActiveMQ.

---

## 7. Arquitectura en la nube / Cloud-native
- **Descripción:**  
  - Extensión de microservicios físicos, donde los componentes se despliegan en **infraestructura cloud** usando contenedores y orquestadores (Docker, Kubernetes).  
  - Aprovecha servicios gestionados (storage, bases de datos, colas).
- **Ventajas:**  
  - Escalabilidad automática y alta disponibilidad.  
  - Despliegue y gestión simplificados.
- **Desventajas:**  
  - Dependencia de proveedores cloud.  
  - Posible complejidad en costos y seguridad.
- **Ejemplo:**  
  - Aplicaciones desplegadas en AWS, GCP o Azure usando Kubernetes y servicios gestionados.

---

> **Nota:**  
- Los **patrones físicos** muestran cómo se organiza el sistema en nodos y redes reales.  
- Algunos patrones como **Cliente-Servidor** también existen como **patrón lógico**, pero aquí se enfoca en su **distribución física** y cómo los componentes interactúan en hardware.

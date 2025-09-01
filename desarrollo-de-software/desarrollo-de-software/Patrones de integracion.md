# Patrones Arquitectónicos de Integración

Los **patrones de integración** se centran en **cómo los diferentes sistemas, aplicaciones o componentes se comunican y cooperan** para intercambiar información y coordinar procesos. Son especialmente útiles en **entornos heterogéneos o distribuidos**.

---

## 1. Point-to-Point (Conexión Directa)
- **Descripción:**  
  - Cada sistema se conecta directamente con los demás mediante interfaces dedicadas.  
  - Comunicación uno a uno, sin intermediarios.
- **Ventajas:**  
  - Simple de implementar para pocos sistemas.  
  - Comunicación rápida, directa y sin intermediarios.
- **Desventajas:**  
  - Escalabilidad limitada: cada nuevo sistema requiere nuevas conexiones.  
  - Mantenimiento complejo cuando los sistemas cambian.
- **Ejemplo:**  
  - Integración entre dos aplicaciones internas de una empresa mediante llamadas API directas.

---

## 2. Broker / Middleware
- **Descripción:**  
  - Un **intermediario central** recibe, enruta y transforma mensajes entre sistemas.  
  - Los sistemas se comunican solo con el broker, no entre ellos directamente.
- **Ventajas:**  
  - Desacopla los sistemas emisores y receptores.  
  - Facilita transformación de datos y monitoreo centralizado.
- **Desventajas:**  
  - El broker puede ser un **punto único de fallo**.  
  - Puede introducir latencia en la comunicación.
- **Ejemplo:**  
  - Enterprise Service Bus (ESB), RabbitMQ, IBM MQ.

---

## 3. Publish-Subscribe (Pub-Sub)
- **Descripción:**  
  - Los sistemas **publican eventos** y los interesados se **suscriben** a ellos.  
  - Comunicación **asíncrona y desacoplada**.
- **Ventajas:**  
  - Escalabilidad y flexibilidad.  
  - Los productores no necesitan conocer a los consumidores.
- **Desventajas:**  
  - Complejidad en el seguimiento de eventos.  
  - Posibles problemas de consistencia si hay muchos consumidores.
- **Ejemplo:**  
  - Sistemas de notificaciones en tiempo real, Kafka, Google Pub/Sub.

---

## 4. Shared Database / Repositorio Compartido
- **Descripción:**  
  - Los sistemas integrados acceden a **una base de datos común** como medio de intercambio.  
  - La base de datos funciona como **punto central de integración**.
- **Ventajas:**  
  - Fácil de implementar si los sistemas usan la misma tecnología de datos.  
  - Consistencia centralizada.
- **Desventajas:**  
  - Acoplamiento fuerte entre sistemas.  
  - Puede ser un cuello de botella o punto único de fallo.
- **Ejemplo:**  
  - Aplicaciones empresariales que comparten una base de datos centralizada (ERP, CRM).

---

## 5. File Transfer / Batch Integration
- **Descripción:**  
  - Los sistemas intercambian datos mediante **archivos** que se copian, leen o procesan periódicamente.  
  - Integración en **lotes (batch)**.
- **Ventajas:**  
  - Simple y compatible con sistemas antiguos.  
  - No requiere conexión permanente.
- **Desventajas:**  
  - No es en tiempo real; latencia alta.  
  - Posible inconsistencia si ocurre un fallo durante la transferencia.
- **Ejemplo:**  
  - Exportación/importación de CSV entre sistemas financieros.

---

## 6. API / Service-Oriented Integration
- **Descripción:**  
  - Sistemas se integran mediante **APIs o servicios web**, usando REST, SOAP o gRPC.  
  - Comunicación **en tiempo real y estandarizada**.
- **Ventajas:**  
  - Flexibilidad y compatibilidad con múltiples plataformas.  
  - Fácil de versionar y mantener.
- **Desventajas:**  
  - Requiere diseño cuidadoso de las interfaces.  
  - Posible sobrecarga si los servicios son muy granulares.
- **Ejemplo:**  
  - Servicios web de Google Maps, Stripe, PayPal integrados en otras aplicaciones.

---

## 7. Event-Driven Architecture (EDA)
- **Descripción:**  
  - Evolución del pub-sub: los sistemas reaccionan **a eventos** que ocurren en otros sistemas.  
  - Integración **asíncrona y altamente desacoplada**.
- **Ventajas:**  
  - Escalable, flexible y resiliente.  
  - Facilita sistemas reactivos en tiempo real.
- **Desventajas:**  
  - Complejidad en monitoreo y depuración.  
  - Manejo de consistencia distribuida.
- **Ejemplo:**  
  - Sistemas de comercio electrónico donde el pago dispara la preparación de envío, notificación y actualización de inventario.

---

> **Nota:**  
- Los patrones de integración son cruciales para **coordinación entre sistemas heterogéneos**.  
- Algunos patrones físicos (broker, colas) y lógicos (event-driven) se superponen con la integración, pero aquí se enfocan en **intercambio de información entre sistemas**.

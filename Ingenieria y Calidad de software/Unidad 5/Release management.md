>[!definition]
>Asegura la construcción existosa del paquete de sw, basada en los ICs requeridos para la funcionalidad a entregar para luego liberarlo en forma controlada a otros entornos, ya sea pruebas, producción, usuario final, etc. 

**Se divide en 2 partes:**
- SW building 
- Release management
	- Se envia a los servidores o a la app store
#### Build
El codigo ya esta, se prepara el entregable. Es todo lo que se toca para que funcione.
	- Se obtienen el codigo, modelos y scritps
	- Se juntan y compilan con dependencias y archivos necesarios
	- Se obtiene el software
##### Tipos de build
- Local -> El developer lo realiza localmente en su entorno y corre pruebas unitarias
- Integration builds -> genera el entorno completo para pruebas de integración
- Nightly builds -> Es la construccion de un sw operativo de forma diarias y genera reportes sobre estabilidad, tiempos, etc.
- Release build -> Es el definitivo que se manda a producción.
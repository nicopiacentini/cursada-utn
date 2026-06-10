### Eventos propios
- Venta
- Llegada de pedido
Suman a mi stock
# Colas
#### Lo que permanece
- Ns/pendientes de atencion
#### Lo que entra - Que hace que aumente
- Llegada - fdp
#### Lo que sale - Que hace que disminuya
- Salida - fdp - Influenciado con V. control por cantidad de puestos de atención.
### Estos 2 son Eventos propios
1. Fijo condiciones iniciales
2. Avanzo el tiempo
3. Genero lo que entra
	1. FPD de llegadas
4. Genero y calculo lo que sale
	1. Es un for
5. Sumo y resto a variable de estado
6. Hago control de minima para que NS > 0
	1. Si da negativo hubo ocio.
7. Realizo calculos que no hice con los controles
# Modelo hidráulico
- **permanece** -> Volumen de agua
- **entrada** -> agua de un río. fdp caudal de rio
- **entrada** -> Entra agua por lluvia. fdp
- **Salida de agua** -> Consumo de agua.  
Hay al menos un evento que hace crecer y minimo otro que lo hace decrecer.
# Poblacional
- Permanece cantidad de individuos. Individuos vestado
- crecimiento es por nacimiento. evento nacimiento. Tasa de natalidad
- crecimiento por inmigracion
- decrecimiento es por muerte. evento muerte. Tasa de mortalidad con control. El control es la dosis a dar para aumentar las muertes
- decrecimiento por migracion. 
#### Paso a paso

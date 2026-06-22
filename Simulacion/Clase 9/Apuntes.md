### Stock
- Debe tener un valor inicial
- Son acumuladores
- *Varia el valor que almacenan*
- **Son variables de estado**
### FLOW
- Puede ser positivo o negativo segun sume o reste a un *stock*
- tien una ecuacion asociada
### Operadores
- Son constantes, fdp, variables de control
## Delta T constante otros casos
**Enunciado**
>**Enunciado**

Un proveedor desea acordar con el cliente la cantidad de leche que le suministrará **cada día**. Para satisfacer la demanda acordada, el proveedor posee **100 vacas**, las cuales producen **entre 300 y 400 litros de leche por día** (corresponde a una fdp).

Por cada litro de leche entregado, el proveedor recibe un **beneficio de $5**.

Por cada litro de leche faltante para satisfacer lo acordado, tiene una **pérdida de $3**.

Por cada litro de leche sobrante tiene una **pérdida de $2** debido a que la leche es derrochada.

Se desea conocer cuál es la **cantidad de litros de leche** que el proveedor puede ofrecer a su cliente para obtener el **máximo beneficio**.

- Dato -> LVAC -> cantidad leche producida en un dia
- Estado -> Leche-> cantidad de leche
- Resultado -> beneficio (mensual/anual/diario)
- Control -> Acord -> cantidad de leche acordada
#### Problema con estado
Toda la leche se tira al final del dia -> la variable de estado se reinicia todos los dias y no puede ser la variable de estado. Entonces uso el *Beneficio* como variable de estado. Caso contrario como delta t = 1 dia me da siempre 0 porque se reinicia. 
##### En otro delta T distinto de un dia
En este caso la leche no se resetea en cada delta t y entonces *podria usarse como variable de estado*

### Analisis previo actualizado
- Dato -> LVAC -> cantidad leche producida en un dia
- Control -> Acord -> cantidad de leche acordada
- Resultado -> beneficio (mensual/anual/diario)
- - Estado -> Beneficio -> cantidad de leche

  **VENTA** -> **BENEFICIO** -> **DERROCHE**
					-> **MULTA**

Eventos propios -> entra dinero por venta
				Sale dinero por desperdicio
				 Sale dinero por multa
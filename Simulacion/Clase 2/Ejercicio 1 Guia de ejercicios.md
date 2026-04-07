### Enunciado
**Sistema con un puesto de atención, con su correspondiente cola.**

Los clientes llegan al sistema con una frecuencia que responde a una función de densidad de probabilidad (f.d.p.) uniforme entre 0 y 10 minutos.
El tiempo de atención que varía según el trámite entre 10 y 20 minutos, se conoce recién cuando el cliente comienza a ser atendido y responde a una f.d.p. lineal donde f(20)=2*f(10).
Aquellos clientes que al llegar encuentran hasta 4 personas en la cola se quedan, si encuentran hasta 8 se queda sólo el 40% y si encuentran más de 8 se retiran todos.

Se pide:
a) Análisis completo: Metodología.
Tabla de eventos independientes o clasificación de eventos. Tabla de eventos futuros.
Clasificación de variables.
b)     Diagrama de flujo.
c)      Fijar las condiciones iniciales tal que el sistema comience a funcionar vacío y en ese momento llegue el primer cliente.
d)     Resolver las f.d.p. por el método más conveniente.
e)     Obtener los siguientes resultados:
1.      Promedio de permanencia en el sistema
2.      Promedio de espera en cola
3.      Porcentaje de tiempo ocioso del puesto de atención.
4.      Porcentaje de personas que se retiraron porque encontraron a 5 personas en la cola con respecto a todas las arrepentidas.

### Analisis previo
#### Datos
- IA -> Intervalo entre arrivos
- TA -> Tiempo de atencion
#### Control
Esta implicito porque es una unica simulacion
#### Estado
- Ns -> Numero de personas en el sistema
#### Resultado
1.      PPS -> Promedio de permanencia en el sistema
2.      PEC -> Promedio de espera en cola
3.      PTO -> Porcentaje de tiempo ocioso del puesto de atención.
4.      PPR -> Porcentaje de personas que se retiraron porque encontraron a 5 personas en la cola con 

#### TEI

| Evento  | EFNOC   | EFC    | Condicion |
| ------- | ------- | ------ | --------- |
| Llegada | Llegada | Salida | Ns == 1   |
| Salida  | -       | Salida | Ns > 0    |
#### TEF
- TPLL -> Tiempo proxima llegada
- TPS -> Tiempo proxima salida

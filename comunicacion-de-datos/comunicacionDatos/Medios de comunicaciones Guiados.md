Son aquellos por los que los datos van guiados por cable

Las señales de datos se estudian en un circuito electrico equivalente

#### Propiedades primarias
- Resistencia de carga en serie
- Inductancia 'L' en serie
- Capacitancia en paralelo
- Conductancia 'G' en paralelo
- Resistencia de fuga 'Rs'
#### Propiedades secundarias
- Impedancia caracteristica para transferencia maxima 'Z'
- % de velocidad de propagacion respecto de la luz

### Cables de cobre
Tiene variantes
- lineas de cobre desnudo -> viajan al costado de la ruta. No tienen proteccion y generan induccion electromagnetica entre si (transposicion). Tiene diafonia
- par trenzados
- coaxiles
- multipares
- submarinos de cobre
#### Cable par trenzado
Son 2 alambres con una vaina aislante que se trenzan entre si. Las interfaces externas se cancelan entre 2 hilos. Es el que se usa para instalaciones LAN. 
Tipos de cable
- UTP no blindado
- FTP -> blinda a los 4 pares con un solo foil 
- STP -> blinda a cada par por separado
##### Uso para datos


#### Cable multipar
Son vairos pares que se reunen en conjuntos para formar un cable con elementos que soportan traccion y una cubierta para proteger del medio. Se usa para telefonía.

##### Cable telefonico
Son multipares que responden bien a banda local.
Tienen alambre entre 1mm y 0,3mm de diametro

### Cable coaxil
Son 2 conductores concentricos. Un conductor interno (por donde va la informacion), un dielectrico, conductor externo que lo rodea y una vaina protectora.
Se usan para: 
- Conectar un transmisor con su antena
- Distribuir señales de transmision por cable

Tienen distintos tipos de conectores segun la frecuencia con la que trabajo.

##### Codificacion de coaxiles


**Tiempo de crecimiento** -> es el tiempo que tarda el pulso de pasar del 10% al 90% para señales digitales

**Tiempo de decrecimiento** -> es el tiempo que tarda el pulso de pasar del 90% al 10% para señales digitales

Ambas son curvas, no lineas.

##### Velocidad de propagacion
Dependen de la velocidad de la luz y del dielectrico que uso

### Guia de onda
Conecta la antena con el transmisor. Son tubos de laton con aire adentro que es por donde viajan las ondas electromagneticas.

### Cables submarinos de cobre
Ahora se usa la FO.

### Fibra optica
Tiene mucha mayor capacidad que un cable de cobre. Tiene mucha menos atenuacion. Al mismo tiempo es mucho mas liviana. Se usa en tendidos aereos, subterraneos y submarinos. Hoy en dia se usan en fibra hasta el hogar y asta el puesto de trabajo.
#### Detalle constructivo
Tiene un nucleo que es por donde viaja la luz, un revestimiento protector y un recubrimiento protector de la humedad. Para que la luz viaje, rebota entre las paredes del nucleo usando la **ley de snell**
- n = C/Vp, donde n = indice de refraccion del medio, C = velocidad de propagacion en el vacio, Vp = velocidad de propagacion en el medio.
- Si no pasa por snell, entra por cono de aceptacion.
#### Modos
##### Monomodo
Viaja una sola señal por el nucleo, es decir, un solo modo de propagacion pero con menos dispersion. 

##### Multimodo 
Viajan muchas señales por el nucleo, es decir, existen varios modos de propagacion y hay mas dispersion. Cambio el inidce de refraccion agregandole impurezas al material a medida que paso por el cable
- Indice escalon -> de forma abrupta y escalonada 
- Indice gradual -> de forma gradual

#### Parametros de Fibra
- Atenuacion
- Dispersion cromatica -> La luz se genera con leds o con lasers. Los leds tienen mas longitud de onda.
- Dispercion por modos de propagacion (muchas formas de propagacion en multimodo)
- Ancho de banda

##### Ancho de banda
Disminuye a medida que nos alejamos de la fuente. Esto esta limitado por la dispersion de la luz.
##### Atenuacion
La atenuacion se da por ventantas segun la longitud de onda manejada.

##### Perdidas
- Dispersion modal
- Dispersion cromatica
- Absorsion y radiacion -> por impurezas que hay en el silicio para cambiar el indice de refraccion.
- Acoplamiento -> por conectores y empalmes
- Dispersion de Rayleigh -> Por irregularidades al solidificarse el estado plastico. Las irregularidades difractan a la luz.

#### Componentes optoelectricos
Son los transmisores y detectores que pasan de electrico a optico estandarizados para las ventanas 1, 2 y 3.

#### Receptores de luz
Diodo, avalancha, fotoreceptores. Miden
- Eficiencia cuantica -> 
- Corriente de perdida
- Potencia de ruido equivalente
- Ruido cuantico
- Tiempo de crecimiento/decrecimiento
##### Empalme
- Por fusion -> unir y calentar las fibras hasta que se fusionan.
- Mecanicos
##### Conectores

##### Acopladores


#### Cables submarinos con fibra optica
Tiene nucleo con muchas fibras, capa de polietileno, tubo de cobre, etc..
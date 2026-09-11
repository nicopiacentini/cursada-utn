Dada la siguiente grabación, realizada a partir de un experto al que se le ha solicitado reconocer un tipo de alga, efectuar el análisis de protocolos completo. Se presenta a continuación, la transcripción del protocolo, para facilitar su análisis: 

| N° | Texto |
|----|-------|
| 1  | En este alga, |
| 2  | podemos observar |
| 3  | sus ramas ligeramente rígidas |
| 4  | de tonos verdes y amarillos. |
| 5  | Sus ramas |
| 6  | están formadas por |
| 7  | pequeños filamentos |
| 8  | que miden 3 mm de ancho. |
| 9  | Deduzco que se podría tratar |
| 10 | de una cualidad del |
| 11 | Alga Corallina. |
| 12 | Asimismo, |
| 13 | en esta planta, |
| 14 | podemos distinguir |
| 15 | que sus paredes celulares son planas y |
| 16 | contienen celulosa. |
| 17 | Concluimos que se trata del |
| 18 | Alga Nostoc. |


| Elemento                           | Clasificacion                       |
| ---------------------------------- | ----------------------------------- |
| alga                               | concepto                            |
| podemos observar                   | relacion                            |
| ramas                              | concepto                            |
| rigida                             | caracteristica                      |
| ligeramente                        | valor                               |
| tonos                              | caracteristica                      |
| valor                              | verde y amarillo                    |
| estan formadas por                 | relacion                            |
| filamentos<br>\[tamaño]<br>pequeño | concepto<br>caracteristica<br>valor |
| ancho                              | caracteristica                      |
| 3cm                                | valor                               |
| De una cualidad de                 | operador                            |
| alga corallina                     | concepto                            |
| Asimismo                           | relacion                            |
| planta                             | concepto                            |
| podemos distinguir                 | relacion                            |
| paredes celulares                  | concepto                            |
| \[estructura]                      | caracteristica                      |
| plana                              | valor                               |
| \[contenido]                       | caracteristica                      |
| celulosa                           | valor                               |
| concluimos que...                  | relacion                            |
| alga nostoc                        | concepto                            |

| Conceptos         | Caracteristicas              | valores                         |
| ----------------- | ---------------------------- | ------------------------------- |
| alga              |                              |                                 |
| ramas             | rigidas<br>tono              | ligeramente<br>verde y amarillo |
| filamento         | \[tamaño]<br>anchura         | pequeño<br>3cm                  |
| alga corallina    |                              |                                 |
| planta            |                              |                                 |
| paredes celulares | \[estructura]<br>\[contiene] | plana<br>celulosa               |
| alga nostoc       |                              |                                 |
Alga nostoc y alga corallina son **estados**

alga -> es una -> alga corallina
alga -> es una -> alga nostoc
alga -> tiene -> ramas
alga -> tiene -> filamento
planta -> tiene -> paredes celulares
rama -> formada por -> filamento

Identificacion de busqueda:

Clasificacion  -> deduzco que se podria tratar de una cualidad de -> alga corallina
- Rigidez ligera
- tono verde y amarillo
- tamaño pequeño
- anchura 3cm
Clasificacion -> Concluimos que se trata de -> alga nostoc
- Paredes celulares planas
- paredes celulares contienen celulosa
Metacomentarios:
subetapas

**Sinonimos**
Alga y planta

**Incertidumbre**
Se podria tratar de...
deduzco que se podria tratar de 

si (rama.rigidez = ligera) y
   (rama.tono = verde y amarillo) y
   (filamento.tamaño = pequeño) y 
   (filamento.anchura = 3cm)
ENTONCES asignar (clasificacion, alga corallina)

si (paredCelular.estructura = plana) y
   (paredCelular.contiene = celulosa)
ENTONCES asignar(clasificacion, alga nostoc)

#### Ejercicio metodos de busqueda
![[Pasted image 20260902183410.png]]
Usando A* queda:
> Esta mal tengo que sumar no restar despues de cada paso

| Paso | Nodo actual   | Abiertos                     | Cerrados    |
| ---- | ------------- | ---------------------------- | ----------- |
| 1    | A             | B(7+1), C(6+1)               | A           |
| 2    | C             | B(7+1), F(10),G(11),H(12)    | A,C         |
| 3    | B             | F(7),G(8),H(6), D(1), E(2)   | A,C,B       |
| 4    | D             | F(7),G(8),H(6), E(2)         | A,B,C,D     |
| 5    | E             | F(7),G(8),H(6), J(-3), I(-2) | A,B,C,D,E   |
| 6    | J -> SOLUCION | F(7),G(8),H(6), I(-2)        | A,B,C,D,E,J |
| 7    |               |                              |             |
#### Notas
	- La desicion de por que hago algo NO ES EL ESTADO.  

### Ejercicio 2 araña
A partir de la siguiente transcripción, de un protocolo grabado a partir de un experto al que se le ha pedido reconocer un tipo de araña, efectuar el análisis de protocolos completo.
#### Transcripcion

| N.º | Texto |
|---:|---|
| 1 | Observando la forma de esta araña |
| 2 | vemos que es araneomorfa, |
| 3 | de apariencia esbelta y elegante, |
| 4 | con abdomen de forma globosa. |
| 5 | Esto nos da la pauta |
| 6 | que se trata de una araña Terídios. |
| 7 | Continuando con el análisis, |
| 8 | de este arácnido |
| 9 | vemos que tiene dientes quelicerales |
| 10 | y que su abdomen |
| 11 | es de forma más ovalada. |
| 12 | Todas estas características indican |
| 13 | que este insecto es Steatoda. |
| 14 | El tono de su cuerpo |
| 15 | es negro y marrón, |
| 16 | y su picadura es venenosa. |
| 17 | Esto podría indicar |
| 18 | que se trata de una falsa viuda negra. |
| 19 | Este tipo de araña |
| 20 | las podemos encontrar |
| 21 | en los rincones más oscuros |
| 22 | de nuestra casa. 

#### Identificacion de conceptos, caracteristicas, valores, relaciones y operadores

| texto                                       | elemento                   |                        |
| ------------------------------------------- | -------------------------- | ---------------------- |
| araña                                       | concepto                   | observando -> relacion |
| forma                                       | caracteristica             | vemos que -> relacion  |
| araneomorfa                                 | valor                      |                        |
| apariencia (caracteristica)                 | esbelta y elegante (valor) |                        |
| abdomen                                     | concepto                   |                        |
| forma                                       | caracteristica             |                        |
| valor                                       | globosa                    |                        |
| esto nos da la pauta<br>que se trata de una | operador                   |                        |
| araña Terídidos                             | concepto                   |                        |
| contiunando                                 | relacion                   |                        |
| arácnido                                    | concepto                   |                        |
| vemos que                                   | relacion                   |                        |
| dientes                                     | concepto                   |                        |
| \[tipo]                                     | quelicerales               |                        |
| abdomen                                     | concepto                   |                        |
| forma                                       | caracteristica             |                        |
| ovalada                                     | valor                      |                        |
| Todas estas caractericticas <br>indican que | operador                   | insecto -> concepto    |
| steatoda                                    | concepto                   |                        |
| tono                                        | caracteristica             | cuerpo -> concepto     |
| negro y marron                              | valor                      |                        |
| picadura                                    | caracteristica             |                        |
| venenosa                                    | valor                      |                        |
| que se trata de una                         | operador                   |                        |
| falsa viuda negra                           | concepto                   |                        |

#### Conceptos caracteristicas y valores

| Concepto          | Caracteristica                      | Valor                                             |
| ----------------- | ----------------------------------- | ------------------------------------------------- |
| araña             | forma<br>apariencia<br><br>picadura | araneomorfa<br>esbelta y elegante<br><br>venenosa |
| Abdomen           | forma                               | globosa<br>ovalada                                |
| araña terídidos   |                                     |                                                   |
| arácnido          |                                     |                                                   |
| dientes           | \[tipo]                             | quelicerales                                      |
| steatoda          |                                     |                                                   |
| Falsa viuda negra |                                     |                                                   |
| insecto           |                                     |                                                   |
| cuerpo            | tono                                | negro y marron                                    |

#### Relaciones implicitas (entre conceptos)
Araña tiene abdomen
Araña tiene dientes
araña tiene cuerpo
Araña es una Araña terídidos
Araña es una steatoda
Araña es una Falsa viuda negra

#### Identificacion de la busqueda (los ifs)
Clasificacion
	Araña terídidos *Esto nos da la pauta que se trata de una*
	- forma araneomorfa
	- apariencia esbelta y elegante
	- abdomen de forma globosa
	Steatoda: *Todas las caracteristicas indican que*
	- dientes quelicerales
	- Abdomen ovalado
	Falsa viuda negra: *Que se trata de una*
	- tono negro y marron
	- picadura venenosa

#### Sinonimos, metacomentarios e incertidumbres
Metacomentario: Este tipo de arañas generalmente las podemos encontrar en los rincones mas oscuros de nuestra casa. Donde se encuentran las arañas
Continuando con el analisis. Subetapa

Araña, arácnido, insecto

Incertidumbres: esto podria indicar.
#### Reglas de razonamiento

Si 
	- forma araneomorfa
	- apariencia esbelta y elegante
	- abdomen de forma globosa
	entonces asignar(clasificacion, araña terídidos)
Si
    - dientes quelicerales
	- Abdomen ovalado
	entonces asignar(clasificacion, steatoda)
Si 
    - tono negro y marron
	- picadura venenosa
    entonces asignar(clasificacion, falsa viuda negra)
Emparrillado:

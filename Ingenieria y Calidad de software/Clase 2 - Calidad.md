
## Definiciones
>[!IMPORTANT] ALGUNAS DEFINICIONES
>- La calidad es cumplir con los requerimientos. Es cumplir exactamente con lo especificado
>- Cumple con los requisitos de alguna persona. Agrega valor para una persona. 
>- Adecuacion al uso o *fit for use*. Satisface al cliente y no tiene errores
>- La totalidad de aspectos y caracteristicas de un producto o servicio que se sustentan en su cpacidad de cumplir las necesidades especificadas o implicitas

## Fundamentos de calidad
- La calidad debe ser tenida en cuenta al trabajar en proyectos software
- La calidad es una *ecuacion entre costo-beneficio* (trade-off)
- Exxiste un costo de calidad (debe ser previsto y medido) contra un costo de no calidad (fallas que afectan al cliente y al desarrollo)
- Los requerimientos de calidad se deben establecer con los requerimientos del proyecto. Mas alla de esto la clidad se discute en cada paso del proyecto: Arquitectura/construcción/pruebas/aceptación
### Costos de no calidad
Que pasa si ahorramos en calidad? Tambien son costos para amendar la falta de calidad

![[Pasted image 20260407205054.png]]

- **Costos de prevencion** -> Son costos para llegar a la calidad deseada en requerimientos
- **Costos de fallas internas** -> Son post construccion y corrigen software para mejorar calidad
- **Costos en fallas externas** -> No se detectaron fallas en pruebas y tengo que volver a atras para garantizar la calidad
##### Esto causa
- Baja motivacion en equipos de trabajo y duplicacion de esfuerzo
- Over-time constante y retrabajo constante
- Desgaste en el equipo de trabajo
- Imagen negativa en el cliente
#### A nivel numeros
Mientras mas aumento los costos de **prevencion** *mayor* es el nivel de calidad. Mientras En cambio mientras menos costos de prevencion tengo, me aumentan los costos por **fallo** y me terminan aumentando mas los costos generales.
>[!IMPORTANT]
>La clave esta en poner o gastar lo suficiente en prevencion para bajar costos por fallos pero al mismo tiempo no excederse con costos de prevencion pues puede ser demaciado. Se busca un equilibrio entre costos de prevencion y por fallas

1. **Los errores son mas costosos mientras mas tarde**
	- Corregir un error en produccion puede costar de 10 a 100 veces mas que corregirlo en desarrollo
	- Esto se relaciona con costos de fallos
2. **La prevencion es una practica ingenieril**: Invertir en calidad del inicio reduce fallos
	- Pruebas unitarias, de integracion, Analisis estatico de codigo, revisiones de codigo
3.  **Existe el nivel optimo de calidad**
	 - Escribir demasiadas pruebas o sobreingenieria realientiza el desarrollo innecesariamente.
	 - Escribir pocas rpuebas conduce sistemas inestables
#### Iceberg de no calidad
Existen sintomas visibles de calidad que son creados o generados por sintomas invisibles de calidad. Es decir, el sintoma visible es consecuencia del sintoma invisible de falta de calidad.
#### Piramide de calidad
Similar a la piramide de mazlow, hay aspectos de calidad que son mucho mas importantes que otros. Por ejemplo, cumplir requisitos por sobre interfaz linda. La piramide va asi:
					1. Disfrutable
					2. Adaptado a lo que usa el usuario
					3. Usable
					4. Disponible y confiable
					5. Cumple los requisitos
Los primeros 3 Causan satisfaccion mientras que el 5 y 4 **Al faltar causan insatisfaccion**.
### Visiones de calidad
La calidad puede ser percibida desde 5 perspectivas, con mayor o menor grado de
- **vision trascendental**: La calidad se puede reconocer pero no definir. Es subjetiva
- **vision de usuario**: La calidad es adecuacion al proposito. Se adecua a lo que necesita o no. *Por ejemplo, al comprar un auto para hacer de taxi, un corsa, no un ferrari*
- **vision de manufactura**: La calidad es conformidad con especificacion. *Si establezco correctamente los requerimientos y los sigo correctamente entonces mi producto es de buena calidad*. Es cumplir con los requerimientos
- **vision de producto**: La calidad esta vinculada a las caracteristicas inherentes del producto
- **vision basada en valor**: La calidad depende de la cantidad de dinero que el usuario este dispuesto a pagar por el producto
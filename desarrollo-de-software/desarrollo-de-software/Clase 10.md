# UX, UI, Accesabilidad y usabilidad
Son elementos interrelacionados y codependientes.
___
## UI
Cuando una UI es moderna, agradable, estetica o BUENA? Es algo que solo depende de la UI, no de la accesibilidad, usbilidad o UX.
### Caracteristicas de una UI buena

- Buena paleta de colores, que no choquen los botones
- Contrastes, que sea legible
- Coherencia entre el mensaje de la pagina y las desiciones que toma (tipografias, colores, etc)
- Disposicion de los componentes
- Que este claro que produce una accion y cual no 
- Que el contenido sea valioso, correcto / chequeado
- Maximizar el acceso a la informacion minimizando scrolls
- Que las formas se complementen. O son redondeados o son cuadrados
#### Diferencia con usabilidad
Si la modificacion que hago no es necesaria para mejorar la usabilidad entonces es de UI
## Usabilidad
La usabilidad dice que las acciones del sistema puedes ser utilizadas de forma efectiva y eficiente
## Caracteristicas de una buena Usabilidad
- Que no requiera muchos clicks para ejecutar una accion
- Minimizar el esfuerzo cognitivo que implica realizar una accion
- Que sea sencillo encontrar y disparar acciones que quiero ejecutar
- Buen redireccionamiento. Saber donde estoy, a donde voy y como puedo **volver**
- Que los componentes informen lo que hacen
- Disposicion correcta de los componentes
- Que se nos informe que algo ocurrio despues de apretar un boton
- No sobrecargar la interfaz
## UX
Es como la usabilidad pero mas acercado al usuario
### Caracteristicas de una buena usabilidad
- Que el cliente puede hacer algo que le aporte mas valor. El valor es subjetivo, puede ser para el cliente o para el sitio.
- Calidad de contenido. Que es lo que cree el sitio valioso como para mostrar
- Coherencia entre el mensaje de la pagina y las desiciones que toma (tipografias, colores, etc)
- Sitio alineado al modelo de negocio
- Que comparta informacion con el servidor cuando sea necesario
## Accesibilidad
### Caracteristicas de la accesibilidad
- Hacer que todo mundo pueda usar el sistema
- Buena paleta de colores que no genere confusion
- Contrastes y paletas adaptables con daltonismo
- Lectura de textos o talkback para personas con vision limitada
#### Las bases
 1. Buen etiquetado
 2. Alt en imagenes
 3. Etiquetas aria

### Parte Testing E2E
Consiste en programar un robot que pagina por pagina la va navegando y ejecuta codigo con tal. Por ejemplo, ingresar a la pagina, completar con tal input, completar con otro input, apretar otro boton, que pase algo. Las herramientas que se usan son:
- Cypress
- Selenium
- Playwright
Estan un paso arriba de los test de integracion. Son mas pesados de escribir y ejecutar(1 minuto o mas)
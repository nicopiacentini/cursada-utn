Validaciones con Zod -> solo en controller
___

# Testing
Busca encontrar fallas en el producto. Quiere hacerlo lo mas rapido y barato posible. Busca encontrar la mayor cantidad de fallas. Los tipos de test son:
### Unitarios
Son test automatizados que se enfocan en unidades claramente definidas de codigo, es decir, una clase, un metodo, una funcion.
- Son sencillas de hacer
- Tienen menos tiempo de ejecucion
#### Estructura
Debe definir las condiciones del test(datos a preparar, clases, objetos y funciones), ejecutar las condiciones de prueba y probar con expect.
```js
// declaraciones
describe("descuentoFijo descuenta valor", () => {

    test("devuelve el valor fijo pasado por constructor", () => {

        const descuento = new DescuentoFijo(100);

        expect(descuento.valorDescontado(0,0)).toBe(100);

    })

    test("no se pueden instanciar descuentos con valor negativo", () => {

        expect(() => new DescuentoFijo(-1)).toThrow()

    })

})
```
Hay algunos de estos que dependen de la base de datos y que no este rompiendola ademas de que se encuentre en el estado esperado. Entonces usamos _mocking_
##### Mocking
Son objetos o funciones que simulan la interfaz del real a fin de testear una parte mas especifica del codigo. Cada mock nos da el *resultado feliz* es decir, expone la interfaz que expondria el objeto que mockea si funcionase bien.
```js
const mockRepository = {

        findByPage: jest.fn(),

        contarTodos: jest.fn()

    }

    const alojamientoService = new AlojamientoService(mockRepository)

    test("estructura de paginacion default", async () => {

        const sampleData = [

            new Alojamiento("Hotel1", 100, Categoria.Hotel),

            new Alojamiento("Hotel1", 100, Categoria.Hotel),

            new Alojamiento("Hotel1", 100, Categoria.Hotel)

        ]

        mockRepository.findByPage.mockResolvedValue(sampleData)

        mockRepository.contarTodos.mockResolvedValue(10);

  

        const resultado = await alojamientoService.buscarTodos(2,3,{})

  

        expect(mockRepository.findByPage).toHaveBeenCalledWith(2,3,{})

        expect(mockRepository.contarTodos).toHaveBeenCalled()

  

        expect(resultado).toEqual({

            pagina: 2,

            perPage: 3,

            total: 10,

            totalPaginas: Math.ceil(10/3),

            data: sampleData

        })

    })
```
### Integracion
Son test que buscan fallas en como distintas partes del codigo interactuan entre ellos. Estan en un nivel medio.  Vamos a usar la dependencia `supertest` para simular requests a los endpoints.
```js
describe("POST /alojamientos", () => {

    test("caso exitoso", async () => {

        const alojamiento = new Alojamiento("Hotel1", 100, Categoria.Hotel)

        alojamiento.id =   1

        mockRepository.crear = jest.fn().mockResolvedValue(alojamiento)

  

        const res = await (await request(server.app).post("/alojamientos")).send({

            nombre: "cabaña",

            categoria : "Hotel",

            precioPorNoche: 100

        }).set("Content-Type", "application/json")

        expect(res.status).toBe(201);

    })

})
```

##### Postman
Tambien puedo testear con postman sobre la respuesta que recibo.
```js
pm.test("hola soy un test", function(){
	pm.expect(pm.response.to.have.status(200))
})
```
### End to End o de sistemas
Es un test punta a punta de todo el sistema. Generalmente son manuales y los hacen los analistas de calidad.
- Suelen ser dificiles de mantener
- Tienen mas tiempo de ejecucion y son mas costosos
# Documentacion de APIs
Es como documentar e informar acerca de la api. Son archivos estructurados y faciles de publicar a traves de nuestro servidor. Si quiero exponer la documentacion, debo hacer una ruta para publicar y probar la documentacion.

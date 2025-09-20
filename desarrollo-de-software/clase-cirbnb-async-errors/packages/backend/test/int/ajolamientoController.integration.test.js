import request from "supertest"
import { buildTestServer } from "./utils/buildTestServer.js"
import { AlojamientoService } from "../../services/alojamientoService.js"
import {AlojamientoController} from "../../controllers/alojamientoController.js"
import alojamientoRoutes from "../../routes/alojamientoRoutes.js"
import { describe } from "@jest/globals"
import {jest} from "@jest/globals"
import { Alojamiento } from "../../models/entities/alojamiento.js"
import { Categoria } from "../../models/entities/categoria.js"
const mockRepository = {
        findByPage: jest.fn(),
        contarTodos: jest.fn()
}
const alojamientoService = new AlojamientoService(mockRepository)
const alojamientoController = new AlojamientoController(alojamientoService)

const server = buildTestServer()
server.addRoute(alojamientoRoutes)
server.setController(AlojamientoController, alojamientoController)
server.configureRoutes()

describe("GET /alojamientos", () => {
  test("caso exitoso", async () => {
    const sampleData = [
      new Alojamiento("Hotel1", 100, Categoria.Hotel),
      new Alojamiento("Hotel2", 100, Categoria.Hotel),
      new Alojamiento("Hotel3", 100, Categoria.Hotel),
    ];

    mockRepository.findByPage.mockResolvedValue(sampleData);

    mockRepository.contarTodos.mockResolvedValue(500);

    const res = await request(server.app).get("/alojamientos?page=1&limit=3");

    expect(res.status).toBe(200);
    expect(res.body.pagina).toBe(1);
    expect(res.body.perPage).toBe(3);
    expect(res.body.total).toBe(500);
    expect(res.body.totalPaginas).toBe(Math.ceil(500 / 3));
    expect(res.body.data).toHaveLength(3);
  });
});
describe("POST /alojamientos", () => {
    test("caso exitoso", async () => {
        const alojamiento = new Alojamiento("Hotel1", 100, Categoria.Hotel)
        alojamiento.id =   1
        mockRepository.crear = jest.fn().mockResolvedValue(alojamiento)
        

        const res = await request(server.app)
            .post("/alojamientos")
            .send({nombre: "cabaña", categoria : "Hotel", precioPorNoche: 100})
            .set("Content-Type", "application/json")
        expect(res.status).toBe(201);
    })
})

import { Alojamiento } from "../../models/entities/alojamiento";
import { Categoria } from "../../models/entities/categoria.js";
import { AlojamientoService } from "../../services/alojamientoService.js";
import {jest} from "@jest/globals"

describe("alojamiento service busca todos", () => {
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
    test("estructura de paginacion default pero con parametros string funciona", async () => {
        const sampleData = [
            new Alojamiento("Hotel1", 100, Categoria.Hotel),
            new Alojamiento("Hotel1", 100, Categoria.Hotel),
            new Alojamiento("Hotel1", 100, Categoria.Hotel)
        ]
        mockRepository.findByPage.mockResolvedValue(sampleData)
        mockRepository.contarTodos.mockResolvedValue(10);

        const resultado = await alojamientoService.buscarTodos("2","3",{})

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
    test("estructura de paginacion default", async () => {
        const sampleData = [
            new Alojamiento("Hotel1", 100, Categoria.Hotel),
            new Alojamiento("Hotel1", 100, Categoria.Hotel),
            new Alojamiento("Hotel1", 100, Categoria.Hotel)
        ]
        mockRepository.findByPage.mockResolvedValue(sampleData)
        mockRepository.contarTodos.mockResolvedValue(500);

        const resultado = await alojamientoService.buscarTodos(-1,600,{})

        expect(mockRepository.findByPage).toHaveBeenCalledWith(1,100,{})
        expect(mockRepository.contarTodos).toHaveBeenCalled()

        expect(resultado).toEqual({
            pagina: 1,
            perPage: 100,
            total: 500,
            totalPaginas: Math.ceil(500/100),
            data: sampleData
        })
    })
})
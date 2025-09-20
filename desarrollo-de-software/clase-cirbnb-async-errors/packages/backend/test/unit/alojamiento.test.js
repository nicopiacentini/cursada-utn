import {Alojamiento} from "../../models/entities/alojamiento.js"
import {Reserva} from "../../models/entities/reserva.js"
import {Categoria} from "../../models/entities/categoria.js"

describe("Alojamiento.tieneConflictoConFechas", () => {
    const alojamientoBase = () => {
        return new Alojamiento("Hotel", 100, Categoria.Hotel)
    }
    test("sin reservas retorna false", () => {
        const a = alojamientoBase()
        expect(a.tieneConflictoConFechas(new Date("2025-09-22"), new Date("2025-10-22"))).toBe(false);
    })
    test("reserva previa no hay conflicto", () =>{
        const a = alojamientoBase()
        const r = new Reserva(a, new Date("2025-09-22"), new Date("2025-10-22"))
        a.agregarReserva(r)
        expect(a.tieneConflictoConFechas(new Date("2025-11-22"), new Date("2025-11-23"))).toBe(false)
    })
    test(" fecha inicio de nueva reserva es previa a fecha de fin de una nueva reserva", () =>{
        const a = alojamientoBase()
        const r = new Reserva(a, new Date("2025-09-22"), new Date("2025-10-22"))
        a.agregarReserva(r)
        expect(a.tieneConflictoConFechas(new Date("2025-09-25"), new Date("2025-11-23"))).toBe(true)
    })
})
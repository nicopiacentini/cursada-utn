import { ValorNegativoError } from "../../errors/ValorNegativoError.js";
import {DescuentoFijo} from "../../models/entities/descuentos/descuentoFijo.js"


describe("descuentoFijo descuenta valor", () => {
    test("devuelve el valor fijo pasado por constructor", () => {
        const descuento = new DescuentoFijo(100);
        expect(descuento.valorDescontado(0,0)).toBe(100);
    })
    test("no se pueden instanciar descuentos con valor negativo", () => {
        expect(() => new DescuentoFijo(-1)).toThrow(ValorNegativoError)
    })
    test("Se deben poder instanciar descuentos con valor 0", () => {
        const descuento = new DescuentoFijo(0);
        expect(descuento.valorDescontado(0,0)).toBe(0);
    })
})
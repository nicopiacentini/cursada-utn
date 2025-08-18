//aca se acostumbra a poner el main de la aplicacion

const { Alojamiento, Reserva, Categoria,DescuentoFijo,DescuentoPorcentaje, DescuentoPorNoches } = require ('./domain.js');
const { aumentarPrecioDiario, alojamientoMasCaro, alojamientosMasBaratosQue, obtenerTotalReservas } = require('./funciones.js');

const alojamiento1 = new Alojamiento("Hotel Sol", 120, Categoria.HOTEL);
console.log(alojamiento1.getDescripcion());

const reserva = new Reserva(alojamiento1, new Date("2023-10-01"), new Date("2023-10-05"));
reserva.agregarDescuento(new DescuentoFijo(20));
reserva.agregarDescuento(new DescuentoFijo(60));
reserva.agregarDescuento(new DescuentoPorcentaje(10));
reserva.agregarDescuento(new DescuentoPorNoches(2, 15));
console.log(`Cantidad de noches: ${reserva.cantidadNoches()}`);
console.log(`Precio base: $${reserva.precioBase()}`);
console.log(`Precio final: $${reserva.precioFinal()}`);


// implementacion de funciones

let alojamientos = [alojamiento1, 
    new Alojamiento("Cabaña Luna", 80, Categoria.CABAÑA), 
    new Alojamiento("Hostel Estrella", 50, Categoria.HOSTEL)];
/*console.log("antes aumento:", alojamientos);
aumentarPrecioDiario(alojamientos, 10);
console.log("despues aumento:", alojamientos);
const alojamientoCaro = alojamientoMasCaro(alojamientos)
console.log("el mas caro: ",  alojamientoCaro)
*/
//prueba alojamientosBaratos
//console.log("mas baratos que 80: ", alojamientosMasBaratosQue(alojamientos, 90));

//suma de reservas
const reservas = [
  new Reserva(alojamiento1, new Date("2025-05-01"), new Date("2025-05-10")),
  new Reserva(alojamiento1, new Date("2025-05-01"), new Date("2025-05-7")),
  new Reserva(alojamiento1, new Date("2025-05-01"), new Date("2025-05-8")),
];
const total = obtenerTotalReservas(reservas);
console.log("El total de reservas es de:", total);
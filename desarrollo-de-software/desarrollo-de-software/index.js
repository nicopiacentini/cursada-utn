//aca se acostumbra a poner el main de la aplicacion

const { Alojamiento, Reserva, Categoria,DescuentoFijo,DescuentoPorcentaje, DescuentoPorNoches, Caracteristica } = require ('./domain.js');
const { aumentarPrecioDiario, alojamientoMasCaro, obtenerAlojamientosPorCaracteristica } = require('./funciones.js');

const alojamiento1 = new Alojamiento("Hotel Sol", 120, Categoria.HOTEL);
console.log(alojamiento1.getDescripcion());

const reserva = new Reserva(alojamiento1, new Date("2023-10-01"), new Date("2023-10-05"));
reserva.agregarDescuento(new DescuentoFijo(20));
reserva.agregarDescuento(new DescuentoFijo(60));
reserva.agregarDescuento(new DescuentoPorcentaje(10));
reserva.agregarDescuento(new DescuentoPorNoches(2, 15));
//console.log(`Cantidad de noches: ${reserva.cantidadNoches()}`);
//console.log(`Precio base: $${reserva.precioBase()}`);
//console.log(`Precio final: $${reserva.precioFinal()}`);


// implementacion de funciones

let alojamientos = [alojamiento1, new Alojamiento("Cabaña Luna", 80, Categoria.CABAÑA), new Alojamiento("Hostel Estrella", 50, Categoria.HOSTEL)];
//console.log("antes aumento:", alojamientos);
aumentarPrecioDiario(alojamientos, 10);
//console.log("despues aumento:", alojamientos);
//const alojamientoCaro = alojamientoMasCaro(alojamientos)
//console.log("el mas caro: ",  alojamientoCaro)

//const reservaQueDeberiaFallar = new Reserva(alojamiento1, new Date("2023-10-02"), new Date("2023-10-04"))


const otrosAlojamientos = [
  new Alojamiento("Hotel Sol", 120, Categoria.HOTEL, [Caracteristica.WIFI, Caracteristica.DESAYUNO]),
  new Alojamiento("Cabaña Luna", 80, Categoria.CABANA, [Caracteristica.MASCOTAS, Caracteristica.PILETA]),
  new Alojamiento("Hostel Estrella", 50, Categoria.HOTEL, [Caracteristica.WIFI]),
  new Alojamiento("Apart Verde", 90, Categoria.APART, []),
];

const conDesayuno = obtenerAlojamientosPorCaracteristica(otrosAlojamientos, Caracteristica.DESAYUNO);
console.log("con desayuno", conDesayuno);

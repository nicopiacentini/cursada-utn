function aumentarPrecioDiario(alojamientos, aumento){
    alojamientos.forEach(alojamiento => {
        alojamiento.precioPorNoche += aumento;
    });
}

function alojamientoMasCaro(alojamientos){
    const precios = alojamientos.map(alojamiento => {return alojamiento.precioPorNoche});
    const precioMaximo = Math.max(...precios) // desarmar la lista en conjunto de objetos como parametro

    const alojamiento = alojamientos.find(alojamiento => {return alojamiento.precioPorNoche == precioMaximo})

    return alojamiento;
}

function alojamientosMasBaratosQue(alojamientos, monto){
    return alojamientos.filter(alojamiento => {return alojamiento.precioPorNoche < monto});
}

function obtenerTotalReservas(reservas){
    return reservas.reduce((previo,reserva) => {return previo + reserva.precioFinal()}, 0);

}
module.exports = {
    aumentarPrecioDiario,
    alojamientoMasCaro,
    alojamientosMasBaratosQue,
    obtenerTotalReservas
}
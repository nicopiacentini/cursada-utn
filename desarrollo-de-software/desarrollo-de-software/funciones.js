function aumentarPrecioDiario(alojamientos, aumento){
    alojamientos.forEach(alojamiento => {
        alojamiento.precioPorNoche += aumento;
    });
}

function alojamietoMasCaro(alojamientos){
    const precios = alojamientos.map(alojamiento => {return alojamiento.precioPorNoche});
    const precioMaximo = Math.max(...precios) // desarmar la lista en conjunto de objetos como parametro

    const alojamiento = alojamientos.find(alojamiento => {return alojamiento.precioPorNoche == precioMaximo})

    return alojamiento;
}

module.exports = {
    aumentarPrecioDiario,
    alojamietoMasCaro
}
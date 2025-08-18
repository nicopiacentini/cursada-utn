console.log("holaa");

const Categoria = Object.freeze({
    HOTEL: "hotel",
    DEPARTAMENTO: "departamento",
    CABANA: "cabaña",
    APART: "apart"
});


class Alojamiento{
    constructor(nombre, precioPorNoche, categoria){
        this.nombre = nombre;
        this.precioPorNoche = precioPorNoche;
        this.categoria = categoria;
    }

    getDescripcion(){
        return `${this.nombre} - ${this.categoria} - $${this.precioPorNoche}`;
    }

}

class Reserva{
    constructor(alojamiento, fechaInicio, fechaFin){
        if(!(fechaInicio instanceof Date) || !(fechaFin instanceof Date)){
            throw new Error("Las fechas deben ser instancias de Date");
        }
        if(fechaInicio >= fechaFin){
            throw new Error("La fecha de inicio debe ser anterior a la fecha de fin");
        }
        this.alojamiento = alojamiento;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.descuentos = [];
    }
    cantidadNoches(){
        const MILISEGUNDOS_POR_DIA = 1000 * 60 * 60 * 24;
        return Math.ceil((this.fechaFin - this.fechaInicio)/ MILISEGUNDOS_POR_DIA);
        //la diferencia entre dos fechas en milisegundos, dividido por el numero de milisegundos en un dia
    }
    precioBase(){
        const dias = this.cantidadNoches();
        return this.alojamiento.precioPorNoche * dias;
    }
    precioFinal(){
        let precio = this.precioBase();
        let totalDescontado = 0;
        for (const descuento of this.descuentos) {
            totalDescontado += descuento.valorDescontado(precio, this.cantidadNoches());
        }
        return Math.max(precio - totalDescontado, 0);
    }
    agregarDescuento(descuento){
        this.descuentos.push(descuento);
    }
}

class DescuentoFijo{
    constructor(valor){
        this.valor = valor;
    }
    valorDescontado(precioBase,cantidad){
        return this.valor;
    }
}

class DescuentoPorcentaje{
    constructor(porcentaje){
        this.porcentaje = porcentaje;
    }
    valorDescontado(precioBase, cantidad){
        return (precioBase * this.porcentaje) / 100;
    }
}
class DescuentoPorNoches{
    constructor(cantidadMinima, porcentaje){
        this.cantidadMinima = cantidadMinima;
        this.porcentaje = porcentaje;
    }
    valorDescontado(precioBase, cantidad){

        const vecesRepetido = Math.floor(cantidad / this.cantidadMinima);
        let valorDescontado = 0;
        if (vecesRepetido >= 1)
            valorDescontado = vecesRepetido * (precioBase * this.porcentaje) / 100;
        return valorDescontado;
    }
}



// aca se usa esto para exportar las clases y constantes
module.exports = {
    Alojamiento,
    Reserva,
    Categoria, 
    DescuentoFijo,
    DescuentoPorcentaje,
    DescuentoPorNoches
}

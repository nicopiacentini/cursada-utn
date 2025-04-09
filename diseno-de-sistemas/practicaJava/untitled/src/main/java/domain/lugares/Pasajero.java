package domain.lugares;

import java.util.List;

public class Pasajero extends Persona{
    private List<Vuelo> vuelos;
    private int nroPasaporte;
    private Pais nacionalidad;

    public int cantidadDeVuelosTotales(){
        return vuelos.size();
    }
    public int cantidadDeVecesQueVisitoCiudad(Ciudad ciudad){
        return vuelos.stream().filter(vuelo -> vuelo.destino(ciudad)).toList().size();
    }

}

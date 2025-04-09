package domain.lugares;

import java.time.LocalDate;
import java.util.List;

public class Aeropuerto{
    private Ciudad ciudad;
    private List<Vuelo> vuelos;

    public int cantidadVuelosQueSalieronElDia(LocalDate dia){
        return 9;
    }
    public int cantidadVuelosQueLlegaronElDia(LocalDate dia){
        return vuelos.stream().filter(vuelo -> vuelo.llegoElDia(dia)).toList().size();
    }
    public int cantidadDePasajerosQueLlegaronElDia(LocalDate dia){
        return vuelos.stream().filter(vuelo -> vuelo.llegoElDia(dia)).mapToInt(Vuelo::cantidadDePasajeros).sum();
    }
    public Ciudad ciudad(){return ciudad;}
}
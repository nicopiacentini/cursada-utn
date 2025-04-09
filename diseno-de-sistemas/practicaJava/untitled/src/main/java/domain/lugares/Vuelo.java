package domain.lugares;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class Vuelo {
    private Aeropuerto origen;
    private Aeropuerto destino;
    private LocalDate fecha;
    private Double duracion;
    private int cantidadDeAsientosOfrecidos;
    private Avion avion;
    private List<Pasajero> pasajeros;
    private Tripulacion tripulacion;

    public boolean llegoElDia(LocalDate dia){
        return dia == fecha;
    }
    public Double duracionEnMins() {
        return duracion / 60;
    }
    public Double capacidadOcupadaPorPasajeros(){
        return (double) pasajeros.size() / cantidadDeAsientosOfrecidos;
    }
    public int cantidadDePasajeros(){
        return pasajeros.size();
    }
    public boolean destino(Ciudad ciudad){
        return ciudad == destino.ciudad();
    }

    public double duracion(){
        return duracion;
    }

    public boolean entre(LocalDateTime fechaInicio, LocalDateTime fechaFin){
        return fecha.isAfter(fechaInicio.toLocalDate()) && fecha.isBefore(fechaFin.toLocalDate());
    }

}

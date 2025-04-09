package domain.lugares;

import java.time.LocalDateTime;
import java.util.List;

public class Viaje {
    private List<Vuelo> vuelos;
    private List<Escala> escalas;
    private LocalDateTime fecha;
    private Aerolinea aerolinea;

    public int cantidadDePasajerosTotales(){
        return vuelos.stream().mapToInt(vuelo -> vuelo.cantidadDePasajeros()).sum();
    }
    public double duracionTotalEnMinutos(){
        return vuelos.stream().mapToDouble(vuelo -> vuelo.duracion()).sum() + escalas.stream().mapToDouble(escala-> escala.duracion()).sum();
    }
    public boolean enMes(int mes){
        return fecha.getMonthValue() == mes;
    }
}

package domain.lugares;

import java.util.List;

public class Aerolinea {
    private List<Avion> aviones;
    private String nombre;
    private List<Viaje> viajes;

    public int cantidadDePasajerosTotalesEn(int mes){
        return viajes.stream().filter(viaje -> viaje.enMes(mes)).mapToInt(viaje -> viaje.cantidadDePasajerosTotales()).sum();
    }
}

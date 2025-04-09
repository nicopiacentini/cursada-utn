package domain.lugares;

import java.time.LocalDate;
import java.util.List;

public class Ciudad {
    private String nombre;
    private Pais pais;
    private List<Aeropuerto> aeropuertos;

    public int cantidadDeAeropuertos(){
        return aeropuertos.size();
    }

    public int cantidadDepPasajerosQueLlegaronElDia(LocalDate dia){
        return aeropuertos.stream().mapToInt(aeropuerto -> aeropuerto.cantidadDePasajerosQueLlegaronElDia(dia)).sum();
    }
}

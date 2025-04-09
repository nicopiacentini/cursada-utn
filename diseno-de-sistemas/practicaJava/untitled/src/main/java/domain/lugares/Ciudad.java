package domain.lugares;

import lombok.Getter;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Ciudad {
    private String nombre;
    private Pais pais;
    private List<Aeropuerto> aeropuertos;

    public Ciudad(String nombre){
        this.nombre = nombre;
        this.aeropuertos = new ArrayList<>();
    }


    public int cantidadDeAeropuertos(){
        return aeropuertos.size();
    }

    public int cantidadDepPasajerosQueLlegaronElDia(LocalDate dia) {
        return aeropuertos.stream().mapToInt(aeropuerto -> aeropuerto.cantidadDePasajerosQueLlegaronElDia(dia)).sum();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

}
//TODO
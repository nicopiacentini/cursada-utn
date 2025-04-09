package domain.lugares;

import java.util.List;

public class Pais {
    private String nombre;
    private Continente continente;
    public List<Ciudad> ciudades;

    public String nombre(){
        return nombre;
    }
}

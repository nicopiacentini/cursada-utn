package domain.lugares;

import java.time.LocalDateTime;
import java.util.List;

public class Tripulacion {
    private String nombre;
    private List<Empleado> empleados;
    private List<Vuelo> vuelos;

    public void agregarEmpleado(Empleado empleado){
        empleados.add(empleado);
    }

    public int cantidadDeVuelosEntre(LocalDateTime fechaInicio, LocalDateTime fechaFin){
        return vuelos.stream().filter(vuelo -> vuelo.entre(fechaInicio,fechaFin)).sum();
    }
}

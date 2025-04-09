package domain.lugares;

public class Escala {
    private Aeropuerto aeropuerto;
    private double Duracion;

    public Double duracionEnMinutos() {
        return this.Duracion / 60;
    }
    public double duracion(){
        return Duracion;
    }
}

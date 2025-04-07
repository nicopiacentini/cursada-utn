public class Holamundo {

}

class Pajaro{
    int energia;
    String nombre;
    String color;

    Pajaro(String nombre, String color, int energia){
        this.nombre = nombre;
        this.color = color;
        this.energia = energia;
    }
    void volar(int distancia){
        if(energia > 0){
            System.out.println(nombre + " vuela " + distancia + " metros.");
            perderEnergia(distancia);
        }else{
            System.out.println(nombre + " no tiene energia para volar.");
        }
    }
    private void perderEnergia (int energiaPerdida){
        energia -= energiaPerdida;
        if(energia < 0){
            energia = 0;
        }
    }
    void comer(int comida){
        energia += comida;
    }

}

class Loro extends Pajaro{
    String idioma;
    Loro(String nombre, String color, int energia, String idioma){
        super(nombre, color, energia);
        this.idioma = idioma;
    }
    void hablar(){
        System.out.println(nombre + " habla en " + idioma + ".");
    }
    void volar (int distancia){
        if (distancia <= 10) {
            super.volar(distancia);
            
        } else if (distancia > 10 && distancia <= 20) {
            System.out.println(nombre + " vuela " + distancia + " metros, pero se cansa.");
        } else  {
            System.out.println(nombre + " no puede volar más de 20 metros.");
        }
    }
}
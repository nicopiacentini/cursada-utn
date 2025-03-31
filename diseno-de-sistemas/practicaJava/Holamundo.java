public class Holamundo {
    public static void main(String[] args) {
        byte edad;
        System.out.println("Ingrese su edad:");
        edad = Byte.parseByte(System.console().readLine());
        System.out.println("Su edad es: " + edad);
        System.out.println("¡Hola, mundo!");
    }
}
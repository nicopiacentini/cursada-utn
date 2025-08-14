case class Caracteristicas(val velocidadActual : Int,
                      val fuerzaActual : Int,
                      val energiaActual : Int,
                      val velocidadMaxima : Int,
                      val fuerzaMaxima : Int,
                      val energiaMaxima : Int,
                           val experiencia : Int) {
  require(energiaMaxima > energiaActual)
  def reducirEnergia(cantidad: Int): Caracteristicas = {
    if (cantidad < 0) throw new IllegalArgumentException("La cantidad a reducir no puede ser negativa")
    if (cantidad > energiaActual) throw new IllegalArgumentException("No se puede reducir más energía de la que tiene")
    this.copy(energiaActual = energiaActual - cantidad)
  }
  def aumentarEnergia(cantidad: Int): Caracteristicas = {
    if (cantidad < 0) throw new IllegalArgumentException("La cantidad a aumentar no puede ser negativa")
    if (energiaActual + cantidad > energiaMaxima) throw new IllegalArgumentException("No se puede aumentar más energía de la que tiene")
    this.copy(energiaActual = energiaActual + cantidad)
  }
  def reducirFuerza(cantidad: Int): Caracteristicas = {
    if (cantidad < 0) throw new IllegalArgumentException("La cantidad a reducir no puede ser negativa")
    if (cantidad > fuerzaActual) throw new IllegalArgumentException("No se puede reducir más fuerza de la que tiene")
    this.copy(fuerzaActual = fuerzaActual - cantidad)
  }
  def aumentarFuerza(cantidad: Int): Caracteristicas = {
    if (cantidad < 0) throw new IllegalArgumentException("La cantidad a aumentar no puede ser negativa")
    if (fuerzaActual + cantidad > fuerzaMaxima) throw new IllegalArgumentException("No se puede aumentar más fuerza de la que tiene")
    this.copy(fuerzaActual = fuerzaActual + cantidad)
  }
  def reducirVelocidad(cantidad: Int): Caracteristicas = {
    if (cantidad < 0) throw new IllegalArgumentException("La cantidad a reducir no puede ser negativa")
    if (cantidad > velocidadActual) throw new IllegalArgumentException("No se puede reducir más velocidad de la que tiene")
    this.copy(velocidadActual = velocidadActual - cantidad)
  }
  def aumentarVelocidad(cantidad: Int): Caracteristicas = {
    if (cantidad < 0) throw new IllegalArgumentException("La cantidad a aumentar no puede ser negativa")
    if (velocidadActual + cantidad > velocidadMaxima) throw new IllegalArgumentException("No se puede aumentar más velocidad de la que tiene")
    this.copy(velocidadActual = velocidadActual + cantidad)
  }
}


case class Pokemon(val caracteristicas: Caracteristicas, especie: Especie) {
  def maxearEnergia(): Pokemon = {
    this.copy(caracteristicas.copy(energiaActual = caracteristicas.energiaMaxima))
  }
  def perderEnergia(cantidad: Int): Pokemon = {
    this.copy(caracteristicas = caracteristicas.reducirEnergia(cantidad))
  }
  def ganarXp(cantidad: Int): Pokemon = {
    this.copy(caracteristicas = caracteristicas.copy(experiencia = caracteristicas.experiencia + cantidad))
  }
  
  def ganarVelocidad(cantidad: Int): Pokemon = {
    this.copy(caracteristicas = caracteristicas.aumentarVelocidad(cantidad))
  }
}


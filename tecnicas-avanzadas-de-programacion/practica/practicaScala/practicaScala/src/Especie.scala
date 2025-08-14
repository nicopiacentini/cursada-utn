class Especie(val tipoPrincipal: Tipo, val tipoSecundario: Option[Tipo]) {
  def apply(pokemon: Pokemon): Pokemon = {
    pokemon
  }
  def tieneTipo(tipo: Tipo): Boolean = {
    tipo == tipoPrincipal || tipoSecundario.contains(tipo)
  }
  def unapply()
}

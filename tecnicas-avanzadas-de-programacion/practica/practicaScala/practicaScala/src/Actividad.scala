
abstract class Actividad {
  def apply(pokemon : Pokemon) : Pokemon
}

object Descansar extends Actividad {
  override def apply(pokemon: Pokemon): Pokemon = {
    // Implementación de la actividad de descansar
    pokemon.maxearEnergia()
  }
}

class Nadar(val minutos: Int) extends Actividad {
  override def apply(pokemon: Pokemon): Pokemon = {
    pokemon.perderEnergia(minutos).ganarXp(20)
    pokemon match{
      case Pokemon(_,Especie(TipoAgua, _)) =>
        pokemon.ganarVelocidad(10 * minutos / 60)
      case _ =>
        pokemon
    }
  }
}
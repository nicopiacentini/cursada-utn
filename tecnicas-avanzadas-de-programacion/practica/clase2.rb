  module Atacante

    attr_accessor :potencial_ofensivo
  #def metodo (parametro)/
  #codigo/
  #end/
    def potencial_ofensivo(potencial_ofensivo)    #setter/
        @potencial_ofensivo = potencial_ofensivo
    end
    #@ es como se definen las variables de instancia, es para definir una variable/
    def potencial_ofensivo #gettter/
        @potencial_ofensivo
    end

    def atacar(un_defensor)
      if self.potencial_ofensivo > un_defensor.potencial_defensivo
        danio = self.potencial_ofensivo - un_defensor.potencial_defensivo
        un_defensor.sufri_danio(danio)
      end
      @descansado = false
    end
    def descansar #sumar uno de potencial ofensivo en el proximo ataque
        if @descansado
            @potencial_ofensivo +1
        else
            @potencial_defensivo
        end
    end
  
  end
  
  module Defensor
  
    attr_accessor :potencial_defensivo, :energia
  
    def sufri_danio(danio)
      self.energia= self.energia - danio
    end
    def descansar
        self.energia += 10
    end
  
  end
  
  class Guerrero #quiero que sepa descansar como atacante y como guerrero
    include Atacante #todo lo que compartan atacante y defensor, va a tener prioridad defensor/
    alias_method :descansar_defensor, :descansar
    include Defensor
    alias_method :descansar_atacante, :descansar
  
    def initialize(potencial_ofensivo=20, energia=100, potencial_defensivo=10) /metodo constructor/
      self.potencial_ofensivo = potencial_ofensivo
      self.energia = energia
      self.potencial_defensivo = potencial_defensivo
    end
    def descansar
        self.descansar_atacante
        self.descansar_defensor
    end                
    
  end
  class Espadachin < Guerrero
  
    attr_accessor :espada
  
    #constructor
    def initialize(espada)
      super(20, 100, 2)
      self.espada= espada
    end
  
    def potencial_ofensivo
      super() + self.espada.potencial_ofensivo
    end
  end
  
  class Espada
    attr_accessor :potencial_ofensivo
  
    def initialize(potencial_ofensivo)
      self.potencial_ofensivo= potencial_ofensivo
    end
  end

  class Misil
    include Atacante
  
    def initialize(potencial_ofensivo=200)
      self.potencial_ofensivo = potencial_ofensivo
    end
  
  end
  
  class Muralla
    include Defensor
  
    def initialize(potencial_defensivo= 50, energia = 200)
      self.potencial_defensivo = potencial_defensivo
      self.energia = energia
    end
  
  end
#requerimiento nuevo, surgen los kamikases. Se comportan igual que los guerreros pero luego de atacar se mueren

class Kamikase < Guerrero
    #si quiero que los cambios de guerrero apliquen, me conviene esta opcion
    def atacar(un_defensor)
        super(un_defensor) #solo lo uso cuando quiero sobreescribir un metodo declarado mas arriba en la herencia
        explotar()
    end
    def explotar
        self.energia = 0
    end
end
#ahora quiero que las unidades descancen. Para los defensores es sumar 10 de energia y para los atacantes sumar 10 de potencial ofensivo en el proximo ataque
class OtroKamikase #sin heredar guerrero 
    #si cambia algo en guerrero y no quiero que cambie aca esta me conviene
    include Defensor
    include Atacante #en este orden, cuando descanse el kamikase lo hace como atacante
    def atacar(un_defensor)
        super(un_defensor) #solo lo uso cuando quiero sobreescribir un metodo declarado mas arriba en la herencia
        explotar()
    end
    def explotar
        self.energia = 0
    end
end
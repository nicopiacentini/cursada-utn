require_relative 'miClase'
describe '' do
  it '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 100)
    expect(guerrero.energia).to eq(100)
  end
  it '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 100)
    guerrero.set_method(:saludar, proc{'onaa'})
    atila = PrototypedObject.new
    atila.set_prototype(guerrero)
    #expect(atila.saludar).to eq('onaa')
    atila.set_method(:saludar, proc{'adios'})
    expect(atila.saludar).to eq('adios')

  end

  it '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 100)
    atila = PrototypedObject.new
    atila.set_prototype(guerrero)
    expect(atila.energia).to eq 100
  end

  it '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 100)
    Guerrero = PrototypedConstructor.new(guerrero, proc {
      |guerrero_nuevo, una_energia|
      guerrero_nuevo.energia = una_energia
    })
    un_guerrero = Guerrero.new(200)
    expect(un_guerrero.energia).to eq(200)
  end
  it '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 100)
    Guerrero = PrototypedConstructor.new(guerrero)

    un_guerrero = Guerrero.new({energia: 200})
    expect(un_guerrero.energia).to eq(200)
  end
  it '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 200)
    guerrero.set_property(:@potencial_defensivo, 40)
    guerrero.set_property(:@potencial_ofensivo, 50)
    Guerrero = PrototypedConstructor.new(guerrero)
    un_guerrero = Guerrero.new(
      {energia: 100, potencial_ofensivo: 30, potencial_defensivo: 10}
    )
    #Guerrero es la primer variante de constructores, que recibe 3 parametros
    Espadachin = Guerrero.extended {
      |espadachin, habilidad, potencial_espada|
      espadachin.set_property(:@habilidad, habilidad)
      espadachin.set_property(:@potencial_espada, potencial_espada)
      espadachin.set_method(:@potencial_ofensivo, proc {
        @potencial_ofensivo + self.potencial_espada * self.habilidad
      })
    }
    espadachin = Espadachin.new(100, 30, 10, 0.5, 30)
    expect(espadachin.potencial_ofensivo).to eq(45)
  end
  xit '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 200)
    guerrero.set_property(:@potencial_defensivo, 10)
    guerrero.set_property(:@potencial_ofensivo, 50)
    Guerrero = PrototypedConstructor.copy(guerrero)
    un_guerrero = Guerrero.new
    expect(un_guerrero.potencial_defensivo).to eq(10)
  end

end
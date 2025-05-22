require_relative 'miClase'
describe '' do
  it '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 100)
    expect(guerrero.get_property(:@energia)).to eq(100)
  end
  it '' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:@energia, 100)
    guerrero.set_method(:saluar, proc{'onaa'})
    atila = PrototypedObject.new
    atila.set_prototype(guerrero)
    expect(atila.saludar).to eq('onaa')
    atila.set_method(:saluar, proc{'adios'})
    expect(atila.saludar).to eq('adios')

  end
end
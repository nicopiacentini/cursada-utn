class PrototypedObject
    private
    def initialize(prototype = nil)
    @prototypedMethods = {}
    @prototype = prototype
    end
    #quiero poder instanciar este objeto
    #lo que voy a hacer es un PrototypedObject.new
    
    #set property -> buscamos que el objeto pueda crear atributos de instancia
    #quiero poder pedir y settear atributos
    #pero cada instancia de PrototypedObject debe poder tener sus propios atributos
    
    def set_property(nombreAtributo, valor)
        instance_variable_set(nombreAtributo.to_attribute_name, valor)
    end
    def get_property(nombreAtributo)
        instance_variable_get(nombreAtributo.to_attribute_name)
    end

    def get_prototyped_method(name)
        @prototypedMethods[name] || (@prototype && @prototype.get_prototyped_method(name))
    end

    def method_missing(methodName, *args) #meter response_to_missing, respond_to, etc, etc...
        prototyped_mehod = get_prototyped_method(name)
        if prototyped_mehod
            @prototypedMethods[methodName].instance_exec(self, *args)
        elsif self.instance_variable_defined? methodName.to_attribute_name && args.length == 0
            self.get_property(methodName)
        elsif name.to_s.end_with "=" && args.length == 0
            self.set_property(methodName.to_s.chomp("=".to_sym), args[0])
        else
            super
        end

    end
    public
    #quiero poder agregarle logica a este objeto, una operacion o un metodo



    def define(nombreMetodo, implementacionAsProc = nil, &implementacionAsBlock)
        implementacion = implementacionAsProc || implementacionAsBlock || proc{raise "invalid call to abstract method"}#aca si la implementacionAsProc es nil, te pone implementacionAsBlock. Mismo con el otro proc
        @prototypedMethods[nombreMetodo] = implementacion #lleno el diccionario como nombreMetodo = procAsociado
    end

    #quiero poder tener una referencia a este objeto principal, del que todos van a clonarse.
    
    def copy
        new_object = PrototypedObject.new(slef)
        self.instance_variables.each do |variablnile|
            new_object.instance_variable_set(variable, self.instance_variable_get(var))
        end
    end

        

end

class Symbol
    def to_attribute_name(symbol)
        ("@" + symbol.to_s).to_sym
    end
end

  class PrototypedObject

    def initialize (prototype = nil)
      @prototype = prototype
      @methods = {}
    end
    def set_property(propertyName, value)
      instance_variable_set(propertyName, value)
    end

    def set_method(method_name, method)
      @methods[method_name] = method
    end

    def get_property(propertyName)
      instance_variable_get(propertyName)
    end

    def set_prototype(prototype = nil)
      @prototype = prototype
    end

    def metodos
      @methods
    end
    def get_prototype_method(methodName)
      @methods[methodName] || (@prototype && @prototype.get_prototype_method(methodName))
    end
    private def method_missing(methodName, *args)
      method = get_prototype_method(methodName)
      if method
        instance_exec(*args, &method)
      elsif instance_variable_defined?(:"@#{methodName}")
        self.get_property(:"@#{methodName}")
      elsif methodName.to_s.end_with?('=')
        self.set_property(methodName, args[0])
      else
        super
      end
    end

    def methods
      @methods.keys + @prototype.methods
      super
    end

    end

  class PrototypedConstructor
    def self.new(objetoPrototipado, procInicializador = nil)
      miclase = Class.new do
        define_singleton_method(:new)do
          if procInicializador.nil?
            instance_exec(procInicializador)
          else

          end
        end

      end
      objetoPrototipado.instance_variables.each do |var|
        miclase.instance_variable_set(var, objetoPrototipado.instance_variable_get(var))
      end
      objetoPrototipado..each do |var|
        miclase.instance_variable_set(var, objetoPrototipado.instance_variable_get(var))
      end

    end
  end
  class Symbol
    def to_attribute_name(symbol)
      ("@" + symbol.to_s).to_sym
    end
  end
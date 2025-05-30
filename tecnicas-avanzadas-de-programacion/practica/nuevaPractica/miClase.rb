  class PrototypedObject

    def initialize (prototype = nil)
      @prototype = prototype
      @methods = {}
      unless prototype.nil?
        set_instance_variables(prototype)
      end
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
      set_instance_variables(prototype)
    end

    def set_instance_variables(prototype)
      prototype.instance_variables.each do |var|
        instance_variable_set(var, prototype.instance_variable_get(var))
      end
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
      elsif methodName.to_s.end_with?('=')
        nombre = methodName.to_s.chomp('=')
        nombre = "@#{nombre}" unless nombre.start_with?('@')
        self.set_property(nombre.to_sym, args[0])
      elsif instance_variable_defined?(:"@#{methodName}")
        self.get_property(:"@#{methodName}")
      else
        super
      end
    end


    end

  class PrototypedConstructor
    def self.new(objetoPrototipado, procInicializador = nil)
      miclase = Class.new do
        define_singleton_method(:new) do |*args|
          nuevoObjeto = PrototypedObject.new(objetoPrototipado)
          if procInicializador
            if args[0].is_a?(Hash)
              args.first.each do |arg, valorDeArg|
                nuevoObjeto.instance_variable_set("@#{arg}".to_sym, valorDeArg)
              end
              argumentosRestantes = args.drop(1)
            else
              argumentosRestantes = args
            end
            nuevoObjeto.instance_exec(nuevoObjeto,*argumentosRestantes, &procInicializador)
          else
            # aca args.first es un hash donde la clave son variables de instancia y los valores son el valor que deberian tomar
            args.first.each do |arg, valorDeArg|
              nuevoObjeto.instance_variable_set("@#{arg}".to_sym, valorDeArg)
            end
          end
          nuevoObjeto
        end

        define_singleton_method(:extended) do |proc|
          otroObjeto = PrototypedObject.new(objetoPrototipado)

          nuevoProc = if procInicializador
                        proc do |objeto, *argumentos|
                          objeto.instance_exec(objeto, *argumentos, &procInicializador)
                          objeto.instance_exec(objeto, *argumentos.drop(procInicializador.arity - 1), &proc)
                        end
                      else
                        proc do |objeto, *argumentos|
                          objeto.instance_exec(objeto, *argumentos, &proc)
                        end
                      end
          otraClase = PrototypedConstructor(otroObjeto, nuevoProc)
          otraClase
        end
      miclase
      end
    end

    def self.copy(objetoPrototipado)
      miclase = Class.new do
        define_singleton_method(:new) do
          PrototypedObject.new(objetoPrototipado)
        end
      end
      miclase
    end
  end



  class Symbol
    def to_attribute_name(symbol)
      ("@" + symbol.to_s).to_sym
    end
  end
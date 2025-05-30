class PrototypedObject

  def initialize (prototype = nil, &bloqueInizializador)
    @prototype = prototype
    @methods = {}
    unless prototype.nil?
      set_instance_variables(prototype)
    end
    instance_eval(&bloqueInizializador) if block_given?
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
    method_name_str = methodName.to_s

    if method_name_str.end_with?('=')
      # Asignación: puede ser un método o una propiedad
      nombre = method_name_str.chomp('=').to_sym
      valor = args.first

      if valor.is_a?(Proc)
        set_method(nombre, valor) # Guardar como método sin el '='
      else
        set_property(:"@#{nombre}", valor) # Guardar como variable de instancia
      end
    else
      # Primero buscamos en métodos propios o heredados
      metodo = get_prototype_method(methodName)

      if metodo
        instance_exec(*args, &metodo)
      elsif instance_variable_defined?(:"@#{methodName}")
        get_property(:"@#{methodName}")
      else
        super
      end
    end
  end



end

class PrototypedConstructor
  def self.new(objetoPrototipado, procInicializador = nil)
    miclase = Class.new do
      @prototype_object = objetoPrototipado
      @initializer_proc = procInicializador

      define_singleton_method(:new) do |*args|
        nuevoObjeto = PrototypedObject.new(@prototype_object)

        if @initializer_proc
          nuevoObjeto.instance_exec(nuevoObjeto, *args, &@initializer_proc)
        else
          # Este es el caso del constructor inicial basado en hash
          if args.first.is_a?(Hash)
            args.first.each do |arg, valorDeArg|
              nuevoObjeto.set_property( "@#{arg}".to_sym, valorDeArg)
            end
          end
        nuevoObjeto
        end
      end

      define_singleton_method(:extended) do |&block_to_add|
        parent_initializer_proc = @initializer_proc

        new_combined_initializer_proc = proc do |current_object, *all_args|
          if parent_initializer_proc
            parent_arity = parent_initializer_proc.arity - 1
            args_for_parent = all_args.take(parent_arity)
            remaining_args = all_args.drop(parent_arity)

            current_object.instance_exec(current_object, *args_for_parent, &parent_initializer_proc)
            current_object.instance_exec(current_object, *remaining_args, &block_to_add) if block_to_add
          else
            if all_args.first.is_a?(Hash)
              parent_hash_args = all_args.first
              parent_hash_args.each do |prop, value|
                current_object.set_property( "@#{prop}".to_sym, value)
              end
              # Los argumentos restantes son para el 'block_to_add'.
              remaining_args_for_extension = all_args.drop(1)
            else
              # Si el primer argumento no es un hash, y no hay proc inicializador,
              # se vuelve ambiguo. Podríamos asumir que todos son para la extensión.
              remaining_args_for_extension = all_args
            end

            # Luego, ejecuta la lógica de inicialización del nuevo bloque de extensión.
            current_object.instance_exec(current_object, *remaining_args_for_extension, &block_to_add)
          end
        end

        PrototypedConstructor.new(@prototype_object, new_combined_initializer_proc)
      end
    end
    miclase
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
class CircuitBuilder
  attr_accessor :components

  def build
    yield self
    @circuit
  end

  def initialize(component_factory, circuit_factory)
    @circuit = Circuit.new
    @component_factory = component_factory
    @circuit_factory = circuit_factory
    @components = {}
  end

  # link the components to eachother
  
  def add_name(name)
    @circuit.name = name
  end

  def add_connection(start_comp, end_comps)
    end_comps.each do |end_comp|
      @components[end_comp].add_input(@components[start_comp])
    end
  end

  # add components to the circuit

  def add_circuit(name, type)
    circuit = @circuit_factory.get_circuit(type)
    circuit.name = name
    @components[name] = circuit
  end

  def add_component(name, type)
    if type.start_with? 'CIRCUIT_'
      add_circuit(name, type)
      return
    end

    component = @component_factory.get_component(type)
    component.name = name

    if type.start_with? 'INPUT_'
      @circuit.add_node(component)
    elsif type.eql? 'PROBE'
      @circuit.add_probe(component)
    end

    @components[name] = component
  end
end

class CircuitBuilder
  attr_accessor :components
  attr_accessor :circuit

  def self.build(component_factory)
    builder = new(component_factory)
    yield builder
    builder.circuit
  end

  def initialize(component_factory)
    @circuit = Circuit.new
    @component_factory = component_factory
    @components = {}
  end

  def add_name(name)
    @circuit.name = name
  end

  # link the components to eachother

  def add_connection(start_comp, end_comps)
    end_comps.each do |end_comp|
      @components[end_comp].add_input(@components[start_comp])
    end
  end

  # add components to the circuit

  def add_components(components)
    components.each(&method(:add_component))
  end

  def add_component(name, type)
    component = @component_factory.get_component(type)

    if type.start_with? 'INPUT'
      @circuit.inputs[name] = component
    elsif type.eql? 'PROBE'
      @circuit.probes[name] = component
    end

    @components[name] = component
  end
end

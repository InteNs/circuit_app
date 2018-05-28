class CircuitBuilder
  attr_accessor :components

  def self.build
    builder = new
    yield builder
    builder.circuit
  end

  def initialize(component_factory)
    @circuit = Circuit.new
    @component_factory = component_factory
    @components = {}
  end

  # link the nodes together

  def add_connection(input, outputs)
    conn = Connection.new(nil)
    @Components[input].add_output(conn)
    outputs.each do |output|
      @components[output].add_input(conn)
    end
  end

  def add_input(name, state)
    @circuit.inputs[name] = @component_factory.get_component(state)
  end

  # add all the nodes

  def add_components(components)
    components.each(&method(:add_component))
  end

  def add_component(name, type)
    @components[name] = @component_factory.get_component(type)
  end
end

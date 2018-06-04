class StateImport < State
  def initialize(nodes: [], connections: [])
    @nodes = nodes
    @connections = connections
  end

  def go_next(context)
    name = ImportView.new.show

    builder = CircuitBuilder.new(
      context.component_factory,
      context.circuit_factory
    )

    circuit = builder.build do |c|
      c.add_name(name)

      @nodes.each do |node_name, type|
        c.add_component(node_name, type)
      end

      @connections.each do |input, outputs|
        c.add_connection(input, outputs)
      end
    end

    valid = CircuitValidator.new(circuit).validate

    ValidateCircuitView.new(valid: valid).show

    if valid
      context.circuit = circuit
      context.state = StateLoaded.new
    else
      context.circuit = nil
      context.state = StateDefault.new
    end
  end
end

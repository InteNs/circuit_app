class StateImport < State
  def initialize(nodes: [], conns: [])
    @nodes = nodes
    @connections = conns
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

    context.circuit = circuit
    context.state = StateLoaded.new
  end
end

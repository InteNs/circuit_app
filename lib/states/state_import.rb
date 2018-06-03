class StateImport < State
  def go_next(context)
    name = cli.ask("circuit name?  ")
    file = cli.ask("file path?  ")

    nodes, connections = FileParser.new(file).parse

    builder = CircuitBuilder.new(
      context.component_factory,
      context.circuit_factory
    )

    circuit = builder.build do |c|
      c.add_name(name)

      nodes.each do |node_name, type|
        c.add_component(node_name, type)
      end

      connections.each do |input, outputs|
        c.add_connection(input, outputs)
      end
    end

    cli.say "succesfully parsed the circuit!"

    cli.choose do |menu|
      menu.prompt = "do you want to save or load the circuit?"
      menu.choice(:save) do
        context.circuit_factory.register_prototype(name, circuit)
        context.state = StateDefault.new
      end
      menu.choice(:load) do
        context.circuit = circuit
        context.state = StateLoaded.new
      end
    end
  end
end

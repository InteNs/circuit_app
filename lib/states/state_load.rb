class StateLoad < State
  def go_next(context)
    cli.choose do |menu|
      menu.prompt = "what circuit do you want to load?"
      context.circuit_factory.available_circuits.each do |name|
        menu.choice(name) do
          context.circuit = context.circuit_factory.get_circuit(name)
          context.state = StateLoaded.new
        end
      end
    end
  end
end

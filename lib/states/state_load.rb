class StateLoad < State
  def go_next(context)
    circuit_names = context.circuit_factory.available_circuits

    view = LoadView.new(count: circuit_names.count)
    view.show
    if circuit_names.count.zero?
      context.state = StateDefault.new
    end

    view.menu("what circuit do you want to load?") do |menu|
      circuit_names.each do |name|
        menu.choice(name) do
          context.circuit = context.circuit_factory.get_circuit(name)
          context.state = StateLoaded.new
        end
      end
    end
  end
end

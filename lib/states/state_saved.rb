class StateSaved < State
  def go_next(context)
    context.circuit_factory.register_prototype(
      context.circuit.name,
      context.circuit
    )
    SavedView.new(name: context.circuit.name).show
    context.circuit = nil
    context.state = StateDefault.new
  end
end

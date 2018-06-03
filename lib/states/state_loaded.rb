class StateLoaded < State
  def go_next(context)
    cli.say "circuit #{context.circuit.name} has been loaded"
  end
end

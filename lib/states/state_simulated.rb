class StateSimulated < State
  def go_next(context)
    SimulateView.new(
      circuit: context.circuit,
      formatter: TreePrinter.new
    ).show

    context.state = StateLoaded.new
  end
end

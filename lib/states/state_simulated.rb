class StateSimulated < State
  def go_next(context)
    tp = TreePrinter.new
    cli.say tp.format(context.circuit)

    context.state = StateLoaded.new
  end
end

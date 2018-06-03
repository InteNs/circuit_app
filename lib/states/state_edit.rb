class StateEdit < State
  def go_next(context)
    cli.say "not implemented yet"
    context.state = StateLoaded.new
  end
end

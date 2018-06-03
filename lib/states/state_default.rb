class StateDefault < State
  def print
    'Please enter a circuit file to be parsed'
  end

  def go_next(context)
    context.state = StateParsed.new
  end

end

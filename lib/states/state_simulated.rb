class StateSimulated < State
  def print
    'simulation info here'
  end

  def go_next(context)
    context.state = StateDefault.new
  end
end

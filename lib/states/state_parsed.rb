class StateParsed < State
  def print
    'parsing info here'
  end

  def go_next(context)
    context.state = StateSimulated.new
  end
end

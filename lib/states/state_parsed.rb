class StateParsed < State
  def print
    'The file has been parsed as the following circuit'
  end

  def go_next(context)
    context.state = StateSimulated.new
  end
end

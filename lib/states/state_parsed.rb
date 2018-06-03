class StateParsed < State
  def prompt
    
  end

  def go_next(context)
    context.state = StateSimulated.new
  end
end

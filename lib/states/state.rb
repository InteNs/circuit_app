class State
  def self.print
    raise 'implement in subclass'
  end

  def go_next(context)
    raise 'implement in subclass'
  end
end
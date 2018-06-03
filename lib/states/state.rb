class State
  attr_accessor :cli
  def initialize
    @cli = HighLine.new
  end

  def go_next(_context)
    raise 'implement in subclass'
  end
end

class Context
  attr_accessor :state
  attr_accessor :circuit

  def initialize(state)
    self.state = state
  end

  def get_input
    gets
  end

  def print
    puts state.print
  end
end
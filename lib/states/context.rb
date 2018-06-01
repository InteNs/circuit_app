class Context
  attr_accessor :state
  attr_accessor :circuit

  def print
    puts state.print
  end
end
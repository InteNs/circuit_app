class Node < Component
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def update
    # TODO: for now just the first input
    @state = inputs.first.state
  end
end

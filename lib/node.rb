class Node < Component
  attr_accessor :state

  def initialize(state)
    @state = state
    super()
  end

  def signal(_requester = nil)
    @state
  end
end

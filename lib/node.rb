class Node < Component
  attr_accessor :state

  def initialize(state)
    @state = state
    super()
  end

  def update
    super
    # TODO: for now just read the first input if present
    inputs.first && @state = inputs.first.state
    outputs.each { |conn| conn.state = @state }
  end
end

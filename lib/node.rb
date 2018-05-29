class Node < Component
  attr_accessor :state

  def initialize(state = nil)
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

NodeHigh = Class.new(Node) do
  def initialize
    super(true)
  end
end

NodeLow = Class.new(Node) do
  def initialize
    super(false)
  end
end

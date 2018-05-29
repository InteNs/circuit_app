class Circuit
  attr_accessor :inputs
  attr_accessor :probes
  attr_accessor :name

  def initialize
    @inputs = {}
    @probes = {}
  end

  def update
    raise 'invalid' if inputs.any? { |_name, conn| conn.state.nil? }
    inputs.each_value(&:update)
  end
end

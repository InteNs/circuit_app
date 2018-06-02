class Circuit
  attr_accessor :inputs
  attr_accessor :probes
  attr_accessor :name

  def initialize
    @inputs = {}
    @probes = {}
  end
end

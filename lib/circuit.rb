class Circuit
  attr_accessor :inputs
  attr_accessor :probes

  def initialize
    @inputs = {}
    @probes = {}
  end

  def print
    puts 'circuit printed'
  end
end

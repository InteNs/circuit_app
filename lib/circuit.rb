require_rel 'component'

class Circuit < Component
  attr_accessor :probes
  attr_accessor :nodes

  def initialize
    @nodes = Connection.new
    @probes = Connection.new
    super
  end

  def add_input(component)
    return if inputs.include? component
    first_empty_input&.add_input(component) || inputs << component
  end

  def add_probe(component)
    return if probes.include? component
    probes << component
  end

  def add_node(component)
    return if nodes.include? component
    nodes << component
  end

  def signal(requester, index = nil)
    probes.map(&:signal)[index || outputs.index(requester)]
  end

  def first_empty_input
    inputs.find { |i| i.inputs.empty? }
  end
end

class Circuit < Component
  attr_accessor :probes
  attr_accessor :nodes

  def initialize
    super
    @nodes = Connection.new
    @probes = Connection.new
  end

  def add_input(component)
    return if inputs.include? component
    first_empty_node&.add_input(component)
    inputs << component
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

  def first_empty_node
    nodes.find { |i| i.inputs.empty? }
  end

  def to_s
    "#{super} #{probes.map { |p| "#{p.name}: #{p.signal}" }}"
  end

  def children
    if inputs.any?
      inputs
    else
      probes
    end
  end
end

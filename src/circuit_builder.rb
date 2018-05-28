class CircuitBuilder
  attr_accessor :nodes
  attr_accessor :node_factory

  def initialize(*args)
    super(args)
    self.nodes = {}
  end

  def build_node(name, type)
    nodes[name] = node_factory.get_node(type)
  end
end

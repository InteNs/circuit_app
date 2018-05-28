class CircuitBuilder
  attr_accessor :nodes

  def self.build
    builder = new
    yield builder
    builder.circuit
  end

  def initialize(node_factory)
    @circuit = Circuit.new
    @node_factory = node_factory
    @nodes = {}
  end

  # link the nodes together

  def add_connection(input_name, output_names)
    # TODO: implement
  end

  # add all the nodes

  def insert_nodes(nodes)
    nodes.each(&method(:insert_node))
  end

  def insert_node(name, type)
    @nodes[name] = @node_factory.get_node(type)
  end
end

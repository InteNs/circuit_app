class ParseView < View
  def initialize(nodes: [], conns: [])
    super
    @node_count = nodes.count
    @conn_count = conns.flat_map { |_, names| names }.count
  end

  def show
    success "file has been succesfully parsed"
    info "found #{@node_count} nodes and #{@conn_count} connections"
  end
end

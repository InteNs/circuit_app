class StateParsed < State
  def go_next(context)
    path = FileView.new.show

    nodes, connections = FileParser.new(path).parse

    ParseView.new(nodes: nodes, conns: connections).show
    context.state = StateImport.new(nodes: nodes, conns: connections)
  end
end

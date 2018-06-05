class StateParsed < State
  def go_next(context)
    path = FileView.new.show

    context.state = StateDefault.new if path.nil?

    nodes, connections = FileParser.new(path).parse

    ParseView.new(nodes: nodes, conns: connections).show
    context.state = StateValidate.new(nodes: nodes, connections: connections)
  end
end

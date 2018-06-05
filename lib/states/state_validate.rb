class StateValidate < State

  def initialize(nodes: [], connections: [])
    @nodes = nodes
    @connections = connections
  end

  def go_next(context)
    validator = GraphValidator.new(@connections)
    valid = validator.validate

    ValidateGraphView.new(valid: valid).show

    if valid
      context.state = StateImport.new(nodes: @nodes, connections: @connections)
    else
      context.state = StateDefault.new
    end
  end
end

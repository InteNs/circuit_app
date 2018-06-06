class StateValidate < State

  def initialize(nodes: [], connections: [])
    @nodes = nodes
    @connections = connections
  end

  def go_next(context)
    validator = GraphValidator.new(@connections)
    valid = validator.validate

    ValidateGraphView.new(valid: valid).show

    rejected_comps = ComponentValidator.new(@nodes).validate
    if rejected_comps.any?
      valid = false
    end

    ValidateComponentView.new(not_found: rejected_comps).show

    if valid
      context.state = StateImport.new(nodes: @nodes, connections: @connections)
    else
      context.state = StateDefault.new
    end
  end
end

class Context
  attr_accessor :state
  attr_accessor :circuit
  attr_accessor :component_factory
  attr_accessor :circuit_factory

  def initialize(state)
    self.component_factory = ComponentFactory.instance
    self.circuit_factory = CircuitFactory.instance
    @state = state
  end

  def go_next
    state.go_next(self)
  end

  def state=(state)
    @state = state
    go_next
  end
end

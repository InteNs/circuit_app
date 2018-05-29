class ComponentFactory
  attr_accessor :component_registry
  attr_accessor :state_registry

  def initialize
    @component_registry = {}

    register_component('INPUT_LOW', NodeLow)
    register_component('INPUT_HIGH', NodeHigh)
    register_component('PROBE', Node)
    register_component('OR', GateOr)
  end

  def get_component(type)
    @component_registry[type].new
  end

  def register_component(name, type)
    @component_registry[name] = type
  end
end

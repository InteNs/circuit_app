require 'singleton'

class ComponentFactory
  include Singleton

  def initialize
    @component_registry = {}
  end

  def available_components
    @component_registry.keys
  end

  def get_component(type)
    @component_registry.fetch(type).new
  end

  def register_component(name, type)
    @component_registry[name] = type
  end
end

class ComponentValidator
  def initialize(components)
    @components = components
  end

  def validate
    @components.all? { |comp| in_factory?(comp) }
  end

  def in_factory?(name)
    ComponentFactory.instance.available_components.include?(name) ||
      CircuitFactory.instance.available_circuits.include?(name)
  end
end

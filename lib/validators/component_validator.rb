class ComponentValidator
  def initialize(components)
    @components = components
  end

  def validate
    invalid = @components.reject { |name, type| in_factory?(type) }
  end

  def in_factory?(type)
    ComponentFactory.instance.available_components.include?(type) ||
      CircuitFactory.instance.available_circuits.include?(type)
  end
end

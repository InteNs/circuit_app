class Probe < Node
  ComponentFactory.instance.register_component('PROBE', self)

  def initialize
    super(nil)
  end

  def valid?
    inputs.any?
  end
end

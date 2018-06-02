class Probe < Node
  ComponentFactory.instance.register_component('PROBE', self)

  def initialize
    super(nil)
  end
end

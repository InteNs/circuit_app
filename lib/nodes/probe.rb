class Probe < Node
  ComponentFactory.instance.register_component('PROBE', self)

  def initialize
    super(nil)
  end

  def signal(_requester = nil)
    inputs.first.signal(self)
  end
end

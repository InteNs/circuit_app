class Node < Component
  ComponentFactory.instance.register_component('INPUT', self)
  attr_accessor :signal

  def initialize(signal)
    @signal = signal
    super()
  end

  def signal(_requester = nil)
    inputs.first &.signal(self) || @signal
  end

  def add_input(component)
    return if inputs.include? component
    remove_input(inputs.first) if inputs.any?
    super(component)
  end
end

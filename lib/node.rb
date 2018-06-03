require 'colorize'

class Node < Component
  ComponentFactory.instance.register_component('INPUT', self)
  attr_accessor :signal

  def initialize(signal)
    @signal = signal
    super()
  end

  def signal(_requester = nil)
    if inputs.empty?
      @signal
    else
      inputs.first&.signal(self)
    end
  end

  def add_input(component)
    return if inputs.include? component
    remove_input(inputs.first) if inputs.any?
    super(component)
  end

  def to_s
    if signal
      super.green
    else
      super.red
    end
  end
end

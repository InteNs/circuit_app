class Component
  attr_accessor :inputs
  attr_accessor :outputs

  def initialize
    @inputs = []
    @outputs = []
    @delay_in_ns = 15
  end

  def add_input(component)
    return if inputs.include? component
    inputs << component
    component.add_output(self)
  end

  def add_output(component)
    return if outputs.include? component
    outputs << component
    component.add_input(self)
  end

  def signal(_requester); end
end

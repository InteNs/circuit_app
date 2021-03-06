class Component
  attr_accessor :inputs
  attr_accessor :outputs
  attr_accessor :name
  attr_accessor :delay_in_ns

  def initialize
    @inputs = Connection.new
    @outputs = Connection.new
    @delay_in_ns = 0
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

  def remove_input(component)
    return unless inputs.include? component
    inputs.delete(component)
    component.remove_output(self)
  end

  def remove_output(component)
    return unless outputs.include? component
    outputs.delete(component)
    component.remove_input(self)
  end

  def propagation_delay
    children.uniq.sum(&:propagation_delay) + @delay_in_ns
  end

  def signal(_requester); end

  def to_s
    "#{name}<#{self.class}>"
  end

  def valid?
    true
  end

  def children
    inputs
  end
end

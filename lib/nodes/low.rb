class NodeLow < Node
  ComponentFactory.instance.register_component('INPUT_LOW', self)

  def initialize
    super(false)
  end
end

class NodeHigh < Node
  ComponentFactory.instance.register_component('INPUT_HIGH', self)
  def initialize
    super(true)
  end
end

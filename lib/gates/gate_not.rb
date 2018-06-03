class GateNot < Gate
  ComponentFactory.instance.register_component('NOT', self)

  def initialize
    super(
      [false] => [true],
      [true]  => [false]
    )
  end
end

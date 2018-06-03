class GateXor < Gate
  ComponentFactory.instance.register_component('XOR', self)

  def initialize
    super(
      [false, false] => [false],
      [false, true]  => [true],
      [true,  false] => [true],
      [true,  true]  => [false]
    )
  end
end

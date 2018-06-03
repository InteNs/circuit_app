class GateNand < Gate
  ComponentFactory.instance.register_component('NAND', self)

  def initialize
    super(
      [false, false] => [true],
      [false, true]  => [true],
      [true,  false] => [true],
      [true,  true]  => [false]
    )
  end
end

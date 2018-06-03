class GateNor < Gate
  ComponentFactory.instance.register_component('NOR', self)

  def initialize
    super(
      [false, false] => [true],
      [false, true]  => [false],
      [true,  false] => [false],
      [true,  true]  => [false]
    )
  end
end

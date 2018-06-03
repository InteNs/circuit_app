class GateAnd < Gate
  ComponentFactory.instance.register_component('AND', self)

  def initialize
    super(
      [false, false] => [false],
      [false, true]  => [false],
      [true,  false] => [false],
      [true,  true]  => [true]
    )
  end
end

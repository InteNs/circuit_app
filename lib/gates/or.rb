class GateOr < Gate
  ComponentFactory.instance.register_component('OR', self)

  def initialize
    super(
      [false, false] => [false],
      [false, true]  => [true],
      [true,  false] => [true],
      [true,  true]  => [true]
    )
  end
end

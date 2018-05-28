class ComponentFactory
  def initialize
    @tables = {
      'OR' => {
        [false, false] => [false],
        [false, true]  => [true],
        [true,  false] => [true],
        [true,  true]  => [true]
      }
    }
  end

  def get_component(type)
    case type
    when 'INPUT_LOW'
      Node.new(ConnectionStateLow)
    when 'INPUT_HIGH'
      Node.new(ConnectionStateHigh)
    when 'PROBE'
      Node.new(nil)
    else
      Gate.new(@tables.fetch(type))
    end
  end
end

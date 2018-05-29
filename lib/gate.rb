class Gate < Component
  attr_accessor :truth_table

  def initialize(truth_table)
    @truth_table = truth_table
    super()
  end

  def update
    # stop if any input is nil
    return if inputs.any? { |conn| conn.state.nil? }
    # convert input list to boolean list
    result = @truth_table.fetch(inputs.map(&:state))
    # match the ouputs to the matching truth_table entry
    outputs.each_with_index do |conn, i|
      conn.state = result[i]
    end
  end
end

GateOr = Class.new(Gate) do
  ComponentFactory.get_instance.register_component('OR', self)

  def initialize
    super(
      [false, false] => [false],
      [false, true]  => [true],
      [true,  false] => [true],
      [true,  true]  => [true]
    )
  end
end

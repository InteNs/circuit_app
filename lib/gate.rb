class Gate < Component
  attr_accessor :truth_table

  def initialize(truth_table)
    @truth_table = truth_table
    super()
  end

  def update
    puts 'updating gate'
    input = inputs.map { |conn| conn.state.to_bool }
    result = @truth_table.fetch(input)
    outputs.each_with_index do |conn, i|
      conn.state = ConnectionState.from_bool(result[i])
    end
  end
end

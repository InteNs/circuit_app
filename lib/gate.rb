class Gate < Component
  attr_accessor :truth_table

  def initialize(truth_table)
    @truth_table = truth_table
    super()
  end

  def signal(requester)
    signals = @truth_table.fetch(inputs.map(&:signal))
    signals[outputs.index(requester)]
  end
end

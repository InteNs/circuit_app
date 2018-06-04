class Gate < Component
  attr_accessor :truth_table

  def initialize(truth_table)
    @truth_table = truth_table
    super()
  end

  def signal(requester)
    input_signals = inputs.map { |i| i.signal(self) }
    signals = @truth_table.fetch(input_signals)

    index = outputs.index(requester)

    if index + 1 > signals.count
      signals.first
    else
      signals[index]
    end
  end

  def valid?
    inputs.count == @truth_table.keys.first.count
  end

  def to_s
    if signal(outputs.first)
      super.green
    else
      super.red
    end
  end
end

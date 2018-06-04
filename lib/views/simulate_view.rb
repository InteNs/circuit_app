class SimulateView < View
  def initialize(circuit:, formatter:)
    @circuit = circuit
    @formatter = formatter
    super
  end

  def show
    say @formatter.format(@circuit)
  end
end

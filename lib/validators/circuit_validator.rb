class CircuitValidator
  def initialize(circuit)
    @circuit = circuit
  end

  def validate
    @circuit.probes.all?(&method(:valid?))
  end

  def valid?(component)
    component.valid? && component.children.all?(&method(:valid?))
  end
end
